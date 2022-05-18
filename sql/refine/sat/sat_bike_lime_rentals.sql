-- refine.sat_bike_lime_rentals definition

-- Drop table

-- DROP TABLE refine.sat_bike_lime_rentals;

--DROP TABLE refine.sat_bike_lime_rentals;
CREATE TABLE IF NOT EXISTS refine.sat_bike_lime_rentals
(
	bike_hash VARCHAR(32)   ENCODE lzo
	,bike_id VARCHAR(256)   ENCODE lzo
	,company VARCHAR(12)   ENCODE lzo
	,lat NUMERIC(8,6)   ENCODE az64
	,lon NUMERIC(9,6)   ENCODE az64
	,is_reserved INTEGER   ENCODE az64
	,is_disabled INTEGER   ENCODE az64
	,vehicle_type VARCHAR(256)   ENCODE lzo
	,rental_uris_android VARCHAR(256)   ENCODE lzo
	,rental_uris_ios VARCHAR(256)   ENCODE lzo
	,last_updated INTEGER   ENCODE az64
	,city VARCHAR(256)   ENCODE lzo
	,hash_full_record VARCHAR(32) NOT NULL  ENCODE lzo
	,load_datetime TIMESTAMP WITHOUT TIME ZONE   ENCODE az64
	,load_end_datetime TIMESTAMP WITHOUT TIME ZONE   ENCODE az64
	,PRIMARY KEY (hash_full_record)
)
DISTSTYLE AUTO
;
ALTER TABLE refine.sat_bike_lime_rentals owner to awsuser;


-- refine.sat_bike_lime_rentals foreign keys

ALTER TABLE refine.sat_bike_lime_rentals ADD CONSTRAINT sat_bike_lime_rentals_bike_hash_fkey FOREIGN KEY (bike_hash) REFERENCES refine.hub_bike(bike_hash);