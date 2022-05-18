-- publish.bikes_current definition

-- Drop table

-- DROP TABLE publish.bikes_current;

--DROP TABLE publish.bikes_current;
CREATE TABLE IF NOT EXISTS publish.bikes_current
(
	bike_hash VARCHAR(32)   ENCODE lzo
	,bike_id VARCHAR(256)   ENCODE lzo
	,company VARCHAR(12)   ENCODE lzo
	,lat NUMERIC(8,6)   ENCODE az64
	,lon NUMERIC(9,6)   ENCODE az64
	,battery_level INTEGER   ENCODE az64
	,vehicle_type VARCHAR(256)   ENCODE lzo
	,is_reserved INTEGER   ENCODE az64
	,is_disabled INTEGER   ENCODE az64
	,rental_uris_android VARCHAR(256)   ENCODE lzo
	,rental_uris_ios VARCHAR(256)   ENCODE lzo
	,ttl INTEGER   ENCODE az64
	,last_updated INTEGER   ENCODE az64
	,city VARCHAR(256)   ENCODE lzo
	,hash_full_record VARCHAR(32)   ENCODE lzo
	,load_datetime TIMESTAMP WITHOUT TIME ZONE   ENCODE az64
	,load_end_datetime TIMESTAMP WITHOUT TIME ZONE   ENCODE az64
)
DISTSTYLE AUTO
 DISTKEY (hash_full_record)
;
ALTER TABLE publish.bikes_current owner to awsuser;