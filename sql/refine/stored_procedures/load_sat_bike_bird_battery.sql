CREATE OR REPLACE PROCEDURE refine.load_sat_bike_bird_battery()
	LANGUAGE plpgsql
AS $$
	
	
	
BEGIN
		-- End LOAD_END_DATETIME in Sat when landing hash matches
	UPDATE
		sat
	SET
		[load_end_datetime] = getdate()	
	from 
		refine.sat_bike_bird_battery sat
	where exists
	(
		select 1
		FROM 
			[stage].[landing_bird_battery] source 
		where 
			sat.bike_hash  = md5(ISNULL(RTRIM(CONVERT(NVARCHAR(100),source.bike_id + 'bird')),'NA')+'|' ) and 
			sat.load_end_datetime = '9999-12-31 00:00:00.000'
	);
	
	-- Load Landing to Sat
	insert into refine.sat_bike_bird_battery 
	SELECT 
		main.* 
	FROM (
		select
		    md5(ISNULL(RTRIM(CONVERT(NVARCHAR(100),source.bike_id + 'bird')),'NA')+'|' ) bike_hash, 
			[bike_id], 
			'bird_battery'AS company, 
		  	lat, 
		  	lon, 
		  	battery_level, 
		  	vehicle_type, 
		  	is_reserved, 
		  	is_disabled, 
		  	last_updated, 
		  	city,
			MD5(
			       ISNULL(RTRIM(CONVERT(NVARCHAR(100),[lat])),'NA')+'|' +
			       ISNULL(RTRIM(CONVERT(NVARCHAR(100),[lon])),'NA')+'|' +
			       ISNULL(RTRIM(CONVERT(NVARCHAR(100),[battery_level])),'NA')+'|' +
			       ISNULL(RTRIM(CONVERT(NVARCHAR(100),[vehicle_type])),'NA')+'|' +
			       ISNULL(RTRIM(CONVERT(NVARCHAR(100),[is_reserved])),'NA')+'|' +
			       ISNULL(RTRIM(CONVERT(NVARCHAR(100),[is_disabled])),'NA')+'|' +
			       ISNULL(RTRIM(CONVERT(NVARCHAR(100),[last_updated])),'NA')+'|' +
			       ISNULL(RTRIM(CONVERT(NVARCHAR(100),[city])),'NA')+'|'
			) AS [HASH_FULL_RECORD],
			GETDATE() AS [LOAD_DATETIME],
			convert(datetime, '9999-12-31 00:00:00.000') as [LOAD_END_DATETIME]
		FROM 
			[stage].[landing_bird_battery] source
	) main
	LEFT JOIN 
		refine.sat_bike_bird_battery sat ON 
			sat.[bike_hash] = main.[bike_hash] AND 
			sat.[HASH_FULL_RECORD] = main.[HASH_FULL_RECORD]
	WHERE 
		sat.[bike_hash] IS null;
END




$$
;
