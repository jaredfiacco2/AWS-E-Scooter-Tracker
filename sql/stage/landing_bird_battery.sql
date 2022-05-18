-- stage.landing_bird_battery definition

-- Drop table

-- DROP TABLE stage.landing_bird_battery;

--DROP TABLE stage.landing_bird_battery;
CREATE TABLE IF NOT EXISTS stage.landing_bird_battery
(
	bike_id VARCHAR(256)   ENCODE lzo
	,lat NUMERIC(8,6)   ENCODE az64
	,lon NUMERIC(9,6)   ENCODE az64
	,battery_level INTEGER   ENCODE az64
	,vehicle_type VARCHAR(256)   ENCODE lzo
	,is_reserved VARCHAR(256)   ENCODE lzo
	,is_disabled VARCHAR(256)   ENCODE lzo
	,last_updated INTEGER   ENCODE az64
	,city VARCHAR(256)   ENCODE lzo
)
DISTSTYLE AUTO
;
ALTER TABLE stage.landing_bird_battery owner to awsuser;