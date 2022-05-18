-- stage.landing_lyft definition

-- Drop table

-- DROP TABLE stage.landing_lyft;

--DROP TABLE stage.landing_lyft;
CREATE TABLE IF NOT EXISTS stage.landing_lyft
(
	is_reserved INTEGER   ENCODE az64
	,is_disabled INTEGER   ENCODE az64
	,"type" VARCHAR(256)   ENCODE lzo
	,lat NUMERIC(8,6)   ENCODE az64
	,lon NUMERIC(9,6)   ENCODE az64
	,name VARCHAR(256)   ENCODE lzo
	,bike_id VARCHAR(256)   ENCODE lzo
	,"rental_uris.ios" VARCHAR(256)   ENCODE lzo
	,"rental_uris.android" VARCHAR(256)   ENCODE lzo
	,ttl INTEGER   ENCODE az64
	,last_updated INTEGER   ENCODE az64
	,city VARCHAR(256)   ENCODE lzo
)
DISTSTYLE AUTO
;
ALTER TABLE stage.landing_lyft owner to awsuser;