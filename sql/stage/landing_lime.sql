-- stage.landing_lime definition

-- Drop table

-- DROP TABLE stage.landing_lime;

--DROP TABLE stage.landing_lime;
CREATE TABLE IF NOT EXISTS stage.landing_lime
(
	bike_id VARCHAR(256)   ENCODE lzo
	,lat NUMERIC(8,6)   ENCODE az64
	,lon NUMERIC(9,6)   ENCODE az64
	,is_reserved INTEGER   ENCODE az64
	,is_disabled INTEGER   ENCODE az64
	,vehicle_type VARCHAR(256)   ENCODE lzo
	,ttl INTEGER   ENCODE az64
	,last_updated INTEGER   ENCODE az64
	,city VARCHAR(256)   ENCODE lzo
)
DISTSTYLE AUTO
;
ALTER TABLE stage.landing_lime owner to awsuser;