--Still a WIP
create view bv_bikes_all as

SELECT bike_hash, bike_id, company, lat, lon, 			battery_level, 			vehicle_type, is_reserved, is_disabled, null as rental_uris_android, 	null as rental_uris_ios, 		convert(int,null) as ttl, last_updated, city, hash_full_record, load_datetime, load_end_datetime
FROM refine.sat_bike_bird_battery
--union all
--SELECT bike_hash, bike_id, company, lat, lon, 	null as battery_level, 	null as vehicle_type, is_reserved, is_disabled, null as rental_uris_android, 	null as rental_uris_ios, 		convert(int,null) as ttl, last_updated, city, hash_full_record, load_datetime, load_end_datetime
--FROM refine.sat_bike_bird
--union all
--SELECT bike_hash, bike_id, company, lat, lon,	null as battery_level, 			vehicle_type, is_reserved, is_disabled, null as rental_uris_android, 	null as rental_uris_ios, 							ttl, last_updated, city, hash_full_record, load_datetime, load_end_datetime
--FROM refine.sat_bike_lime
--union all
--SELECT bike_hash, bike_id, company, lat, lon,	null as battery_level, 			vehicle_type, is_reserved, is_disabled,   		rental_uris_android, 	 		rental_uris_ios, 		convert(int,null) as ttl, last_updated, city, hash_full_record, load_datetime, load_end_datetime
--FROM refine.sat_bike_lime_rentals
--union all
--SELECT bike_hash, bike_id, company, lat, lon, 	null as battery_level, 				  "type", is_reserved, is_disabled, 	  "rental_uris.android", 		  "rental_uris.ios", 							ttl, last_updated, city, hash_full_record, load_datetime, load_end_datetime
--FROM refine.sat_bike_lyft
--union all
--SELECT bike_hash, bike_id, company, lat, lon, 	null as battery_level, 	null as vehicle_type, is_reserved, is_disabled, null as rental_uris_android, 	null as rental_uris_ios, 							ttl, last_updated, city, hash_full_record, load_datetime, load_end_datetime
--FROM refine.sat_bike_razor
--union all
--SELECT bike_hash, bike_id, company, lat, lon, 	null as battery_level, 			vehicle_type, is_reserved, is_disabled,  null as rental_uris_android, 	null as rental_uris_ios, 							ttl, last_updated, city, hash_full_record, load_datetime, load_end_datetime
--FROM refine.sat_bike_spin
;