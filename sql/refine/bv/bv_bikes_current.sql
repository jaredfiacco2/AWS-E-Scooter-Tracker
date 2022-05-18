create view refine.bv_bikes_current as
SELECT bike_hash, bike_id, company, lat, lon, 						 battery_level, 							 vehicle_type, 	case when is_reserved = 'False' then 0 else 1 end as is_reserved, 	case when is_reserved = 'False' then 0 else 1 end as is_disabled,  convert(varchar,null) as rental_uris_android, 	convert(varchar,null) as rental_uris_ios, 	convert(int,null) as ttl, last_updated, city, hash_full_record, load_datetime, load_end_datetime
FROM refine.sat_bike_bird_battery 	where load_end_datetime = '9999-12-31 00:00:00.000'
union all
SELECT bike_hash, bike_id, company, lat, lon, 	convert(int,null) as battery_level, 	convert(varchar,null) as vehicle_type, 														 is_reserved, 							 							 is_disabled,  convert(varchar,null) as rental_uris_android, 	convert(varchar,null) as rental_uris_ios, 	convert(int,null) as ttl, last_updated, city, hash_full_record, load_datetime, load_end_datetime
FROM refine.sat_bike_bird 			where load_end_datetime = '9999-12-31 00:00:00.000'
union all
SELECT bike_hash, bike_id, company, lat, lon,	convert(int,null) as battery_level, 							 vehicle_type, 														 is_reserved, 														 is_disabled,  convert(varchar,null) as rental_uris_android, 	convert(varchar,null) as rental_uris_ios, 						 ttl, last_updated, city, hash_full_record, load_datetime, load_end_datetime
FROM refine.sat_bike_lime 			where load_end_datetime = '9999-12-31 00:00:00.000'
union all
SELECT bike_hash, bike_id, company, lat, lon,	convert(int,null) as battery_level, 							 vehicle_type,  													 is_reserved, 														 is_disabled,   						rental_uris_android, 	 						 rental_uris_ios,	convert(int,null) as ttl, last_updated, city, hash_full_record, load_datetime, load_end_datetime
FROM refine.sat_bike_lime_rentals 	where load_end_datetime = '9999-12-31 00:00:00.000'
union all
SELECT bike_hash, bike_id, company, lat, lon, 	convert(int,null) as battery_level, 				  				   "type",      												 is_reserved, 														 is_disabled,   					  "rental_uris.android", 		  					"rental_uris.ios", 						 ttl, last_updated, city, hash_full_record, load_datetime, load_end_datetime
FROM refine.sat_bike_lyft 			where load_end_datetime = '9999-12-31 00:00:00.000'
union all
SELECT bike_hash, bike_id, company, lat, lon, 	convert(int,null) as battery_level, 	convert(varchar,null) as vehicle_type,	 													 is_reserved, 														 is_disabled,  convert(varchar,null) as rental_uris_android, 	 convert(varchar,null) as rental_uris_ios, 						 ttl, last_updated, city, hash_full_record, load_datetime, load_end_datetime
FROM refine.sat_bike_razor 			where load_end_datetime = '9999-12-31 00:00:00.000'
union all
SELECT bike_hash, bike_id, company, lat, lon, 	convert(int,null) as battery_level, 	 						 vehicle_type, 	 													 is_reserved, 														 is_disabled,  convert(varchar,null) as rental_uris_android, 	convert(varchar,null) as rental_uris_ios, 						 ttl, last_updated, city, hash_full_record, load_datetime, load_end_datetime
FROM refine.sat_bike_spin 			where load_end_datetime = '9999-12-31 00:00:00.000'
;