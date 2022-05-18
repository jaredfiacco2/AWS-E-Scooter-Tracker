-- refine.sat_bike_bird_battery definition

-- Drop table

-- DROP TABLE refine.sat_bike_bird_battery;

--DROP TABLE refine.sat_bike_bird_battery;
CREATE TABLE IF NOT EXISTS refine.sat_bike_bird_battery
(
	bike_hash VARCHAR(32)   ENCODE lzo
	,bike_id VARCHAR(256)   ENCODE lzo
	,company VARCHAR(12)   ENCODE lzo
	,lat NUMERIC(8,6)   ENCODE az64
	,lon NUMERIC(9,6)   ENCODE az64
	,battery_level INTEGER   ENCODE az64
	,vehicle_type VARCHAR(256)   ENCODE lzo
	,is_reserved VARCHAR(256)   ENCODE lzo
	,is_disabled VARCHAR(256)   ENCODE lzo
	,last_updated INTEGER   ENCODE az64
	,city VARCHAR(256)   ENCODE lzo
	,hash_full_record VARCHAR(32) NOT NULL  ENCODE lzo
	,load_datetime TIMESTAMP WITHOUT TIME ZONE   ENCODE az64
	,load_end_datetime TIMESTAMP WITHOUT TIME ZONE   ENCODE az64
	,PRIMARY KEY (hash_full_record)
)
DISTSTYLE AUTO
;
ALTER TABLE refine.sat_bike_bird_battery owner to awsuser;



-- refine.sat_bike_bird_battery foreign keys

ALTER TABLE refine.sat_bike_bird_battery ADD CONSTRAINT sat_bike_bird_battery_bike_hash_fkey FOREIGN KEY (bike_hash) REFERENCES refine.hub_bike(bike_hash);