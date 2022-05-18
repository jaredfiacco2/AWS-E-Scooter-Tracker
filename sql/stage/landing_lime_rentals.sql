-- stage.landing_lime_rentals definition

-- Drop table

-- DROP TABLE stage.landing_lime_rentals;

--DROP TABLE stage.landing_lime_rentals;
CREATE TABLE IF NOT EXISTS stage.landing_lime_rentals
(
	bike_id VARCHAR(256)   ENCODE lzo
	,lat NUMERIC(8,6)   ENCODE az64
	,lon NUMERIC(9,6)   ENCODE az64
	,is_reserved INTEGER   ENCODE az64
	,is_disabled INTEGER   ENCODE az64
	,vehicle_type VARCHAR(256)   ENCODE lzo
	,"rental_uris.android" VARCHAR(256)   ENCODE lzo
	,"rental_uris.ios" VARCHAR(256)   ENCODE lzo
	,last_updated INTEGER   ENCODE az64
	,city VARCHAR(256)   ENCODE lzo
)
DISTSTYLE AUTO
;
ALTER TABLE stage.landing_lime_rentals owner to awsuser;