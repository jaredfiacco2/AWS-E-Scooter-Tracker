<!-- PROJECT SHIELDS -->
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/jaredfiacco2/AWS-E-Scooter-Tracker">
    <img src="images/scooter.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Use AWS Lambda to pull E-Scooter/Bike Location Data, store in Redshift Data Vault. Serve to Google Data Studio Dashboard.</h3>

  <p align="center">
    This code takes a list of E-Scooter APIs stored in a JSON file and uses AWS Cloudwatch & SNS to run Python in Lambda to GET them, store them in AWS in a S3 Data Lake and a Redshift Data Warehouse using a Data Vault Data Model. Then it serves the data in a Google Data Studio Dashboard.  
    <br />
    <br />
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#prerequisites">Prerequisites/Instructions</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

- Personal mobility devices are changing transportation in major cities. This data is publically available from various companies via APIs if you spend the time and money to collect it. This project collects and tracks scooter data from companies over time using AWS and implementing Data Vault data modeling.

- I take various E-Scooter Scooter APIs, use AWS to pull and store data (Cloud Watch, SNS, Lambda, S3, Redshift) and serve a dashboard using Google Data Studio.  

<img src="images\ProcessMap.png" alt="Process Map"/>

<img src="images\data_studio_plus_redshift.gif" alt="Process Map"/>

### Built With

- Tech
    * [Python](https://python.org)
    * [Pandas](https://pandas.pydata.org/)
    * [AWS Cloud Watch](https://aws.amazon.com/cloudwatch/)
    * [AWS SNS](https://aws.amazon.com/sns/)
    * [AWS Lambda](https://aws.amazon.com/lambda/)
    * [AWS S3](https://aws.amazon.com/s3/)
    * [AWS Redshift](https://aws.amazon.com/redshift/)
    * [GCP Data Studio](https://datastudio.google.com/)
    * [JSON](https://en.wikipedia.org/wiki/JSON)

- E-Scooter/Bike APIs (7 APIs, 56 Locations)
    * [Bird](https://mds.bird.co/gbfs/washington-dc/free_bike_status.json)
     [Bird with Battery Status]()
    * [Lime](https://data.lime.bike/api/partners/v1/gbfs/baltimore/free_bike_status)
    * [Lime (Rentals)](https://data.lime.bike/api/partners/v1/gbfs/washington_dc/free_bike_status)
    * [Lyft](https://s3.amazonaws.com/lyft-lastmile-production-iad/lbs/dca/free_bike_status.json)
    * [Razor](https://razorapi.net/api/v1/gbfs/Tempe/free_bike_status.json)
    * [Spin](https://gbfs.spin.pm/api/gbfs/v1/akron/free_bike_status)

### Prerequisites

1. Create a cluster in Redshift open to public IPs & add the schemas, tables, views, and stored procedures included in the sql folder. The data model will be a data vault model and store each change in the sattelites.
<img src="images\raw_vault.png">

2. Create a lambda function with the lambda_function.py file. Swap out the "ACCESS_KEY", "SECRET_KEY", "creds", and "my_bucket" names. Also add Data wrangler and psycopg layers. Trigger it with the sns topic you'll make in the next step.
<img src="images\lambda.png">
<img src="images\lambda_layers.png">

3. Create an sns topic.

4. Create a cloud watch schedule to run every X minutes (you choose X).
<img src="images\cloudwatch_rule.png"/>

5. Create Data Studio dashboard pulling from Redshift query. Schedule to send to self daily.
<img src="images\data_studio.gif"/>


<!-- CONTACT -->
## Contact

[Jared Fiacco](https://www.linkedin.com/in/jaredfiacco/) - jaredfiacco2@gmail.com

Another GCP Project of Mine: [Pull and Store and Server Clash of Clans API Data](https://github.com/jaredfiacco2/ClashOfClans_API)

A GCP Project of Mine: [Publish Computer Statistics to Pub/Sub, Use Cloud Functions to Store in BigQuery](https://github.com/jaredfiacco2/ComputerMonitoring_IOT)


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/jaredfiacco/