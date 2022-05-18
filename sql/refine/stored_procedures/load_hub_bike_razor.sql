CREATE OR REPLACE PROCEDURE refine.load_hub_bike_razor()
	LANGUAGE plpgsql
AS $$
	
BEGIN
  insert into [refine].[HUB_BIKE]
  SELECT 
      md5(ISNULL(RTRIM(CONVERT(NVARCHAR(100),source.bike_id + 'razor')),'NA')+'|' ) bike_hash, 
      GETDATE() load_date,
      'razor' company, 
      source.bike_id
  FROM 
      [stage].[landing_razor] as source
  LEFT JOIN
     [refine].[HUB_BIKE] target on 
          md5(ISNULL(RTRIM(CONVERT(NVARCHAR(100),source.bike_id + 'razor')),'NA')+'|' ) = target.bike_hash
  WHERE target.bike_hash IS NULL;
END


$$
;
