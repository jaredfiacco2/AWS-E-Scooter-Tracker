import json, requests,time, boto3
import pandas as pd
from io import StringIO
import psycopg2

#S3 & Redshift Key & Secret
ACCESS_KEY = 'ACCESSKEY'
SECRET_KEY = 'ACCESSKEYSECRET/SECRET'

#Redshift Connection
creds = {
    'host_url'  : 'cluster-name.account.aws-region.redshift.amazonaws.com',
    'dbname'    : 'database-name',
    'port'      : '5439',
    'username'  : 'awsuser',
    'password'  : 'password'
}
conn_string = "dbname='{}' port='{}' user='{}' password='{}' host='{}'"\
    .format(creds['dbname'],creds['port'],creds['username'],creds['password'],creds['host_url'])
con = psycopg2.connect(conn_string)

#S3 Connection
my_bucket = 'my-bucket-name'
s3 = boto3.client(  's3', 
                    aws_access_key_id=ACCESS_KEY,
                    aws_secret_access_key=SECRET_KEY)


#Save JSONs & CSVs to S3 Bucket
def upload(json_path, json_data, csv_path, csv_buffer):
    s3.put_object(Body=json.dumps(json_data), Bucket=my_bucket, Key=json_path, ContentType='application/json')
    s3.put_object(Body=csv_buffer.getvalue(), Bucket=my_bucket, Key=csv_path)
    print('csv uploaded')

#Pull Data From API, Save as JSON & CSV, CSV to Redshift, Delete CSV
def get(city, company, api_url):
    #####################
    # Request - GET API #
    #####################
    request_response = requests.get(api_url)
    json_data = json.loads(request_response.text)
    if "error" in json_data:
        return
    epoch = int(time.time())
    if company in ["spin", "lime", "lyft", "razor"]:
        epoch = json_data['last_updated']
    json_path = company + "/" + city + "_" + str(epoch)
    csv_path = "landing/" + company + "/" + city + "_" + str(epoch) + '.csv'
    ######################
    # Pandas - API to DF #
    ######################
    json_struct = pd.json_normalize(json_data, max_level=1)
    bike_data = pd.json_normalize(json_struct.loc[json_struct.index[0], 'data.bikes'])
    if company in ["spin", "lime", "lyft", "razor"]:
        bike_data['ttl'] = json_struct.loc[json_struct.index[0], 'ttl']
        bike_data['last_updated'] = json_struct.loc[json_struct.index[0], 'last_updated']
    else:
        bike_data['last_updated'] = epoch
    bike_data['city'] = city
    if company in ["bird"]:
        bike_data = bike_data[["bike_id", "lat", "lon", "is_disabled", "is_reserved", "last_updated", "city"]]
    if company in ["bird_battery"]:
        bike_data = bike_data[["bike_id", "lat", "lon", "battery_level", "vehicle_type", "is_reserved", "is_disabled", "last_updated", "city"]]
    if company in ["lyft"]:
        bike_data = bike_data[["is_reserved", "is_disabled", "type", "lat", "lon", "name", "bike_id", "rental_uris.ios", "rental_uris.android", "ttl", "last_updated", "city"]]
    if company in ["lime"]:
        bike_data = bike_data[["bike_id", "lat", "lon", "is_reserved", "is_disabled", "vehicle_type", "ttl", "last_updated", "city"]]
    if company in ["lime_rentals"]:
        bike_data = bike_data[["bike_id", "lat", "lon", "is_reserved", "is_disabled", "vehicle_type", "rental_uris.android", "rental_uris.ios", "last_updated", "city"]]
    if company in ["razor"]:
        bike_data = bike_data[["bike_id", "lat", "lon", "is_reserved", "is_disabled", "ttl", "last_updated", "city"]]
    if company in ["spin"]:
        bike_data = bike_data[["bike_id", "lat", "lon", "vehicle_type", "is_reserved", "is_disabled", "ttl", "last_updated", "city"]]
    csv_buffer = StringIO()
    bike_data.to_csv(csv_buffer, header=True, index=False)
    print(bike_data)
    print(bike_data.info())
    print(csv_path)
    print(my_bucket)
    ############################
    # S3 - Upload JSON and CSV #
    ############################
    upload(json_path, json_data, csv_path, csv_buffer)
    ###########################
    # Redshift - CSV to Stage # 
    ###########################
    query = """ copy \"""" + creds['dbname'] + """\"."stage"."landing_""" + company + """\" from 's3://""" + my_bucket + """/""" + csv_path + """'
    ACCESS_KEY_ID '""" + ACCESS_KEY + """'
    SECRET_ACCESS_KEY '""" + SECRET_KEY + """'
    delimiter ','
    IGNOREHEADER 1
    csv;"""
    print(query)
    cur = con.cursor()
    cur.execute(query)
    cur.execute("commit")
    cur.close()
    #################################
    # S3 -  Delete CSV from Landing # 
    #################################
    s3.delete_object(Bucket=my_bucket, Key=csv_path)
    print('csv deleted')
    return

# MAIN
# Loop Through List of APIs, Load to S3 & Redshift
def lambda_handler(event, context):
    apis = json.load(open('gbfs_free_bike_status_apis.json'))
    for api in apis["apis"]:
        #if api['city'] in ["washington-dc", "baltimore", "arlington"]:
            # get(api['city'],api['company'],api['api_url'])
        get(api['city'],api['company'],api['api_url'])
    cur = con.cursor()
    sp = "call refine.load_hub_bike_all()"
    cur.execute(sp)
    cur.execute("commit")
    cur.close()


