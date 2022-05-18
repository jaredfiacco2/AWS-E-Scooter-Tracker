-- stage.landing_bird definition

-- Drop table

-- DROP TABLE stage.landing_bird;

--DROP TABLE stage.landing_bird;
CREATE TABLE IF NOT EXISTS stage.landing_bird
(
	bike_id VARCHAR(256)   ENCODE lzo
	,lat NUMERIC(8,6)   ENCODE az64
	,lon NUMERIC(9,6)   ENCODE az64
	,is_disabled INTEGER   ENCODE az64
	,is_reserved INTEGER   ENCODE az64
	,last_updated INTEGER   ENCODE az64
	,city VARCHAR(256)   ENCODE lzo
)
DISTSTYLE AUTO
;
ALTER TABLE stage.landing_bird owner to awsuser;