CREATE OR REPLACE PROCEDURE refine.load_hub_bike_bird()
	LANGUAGE plpgsql
AS $$
	
BEGIN
  insert into [refine].[HUB_BIKE]
  SELECT 
      md5(ISNULL(RTRIM(CONVERT(NVARCHAR(100),source.bike_id + 'bird')),'NA')+'|' ) bike_hash, 
      GETDATE() load_date,
      'bird' company, 
      source.bike_id
  FROM 
      [stage].[landing_bird] as source
  LEFT JOIN
     [refine].[HUB_BIKE] target on 
          md5(ISNULL(RTRIM(CONVERT(NVARCHAR(100),source.bike_id + 'bird')),'NA')+'|' ) = target.bike_hash
  WHERE target.bike_hash IS NULL;
END


$$
;
