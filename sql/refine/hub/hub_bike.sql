--DROP TABLE refine.hub_bike;
CREATE TABLE IF NOT EXISTS refine.hub_bike
(
	bike_hash VARCHAR(32) NOT NULL  ENCODE lzo
	,load_date TIMESTAMP WITHOUT TIME ZONE  DEFAULT getdate() ENCODE az64
	,company VARCHAR(64) NOT NULL  ENCODE lzo
	,bike_id VARCHAR(255) NOT NULL  ENCODE lzo
	,PRIMARY KEY (bike_hash)
)
DISTSTYLE AUTO
 DISTKEY (bike_hash)
;
ALTER TABLE refine.hub_bike owner to awsuser;
