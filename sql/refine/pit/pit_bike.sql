create view refine.pit_bike as
select 
	hb.bike_hash,
	hb.load_date,
	sbb.load_datetime as bird_load_date,
	sbbb.load_datetime as bird_battery_load_date,
	sbl.load_datetime as lime_load_date,
	sblr.load_datetime as lime_rentals_load_date,
	sbl2.load_datetime as lyft_load_date,
	sbr.load_datetime as razor_load_date,
	sbs.load_datetime as spin_load_date
from 
	refine.hub_bike hb 
left join
	refine.sat_bike_bird sbb on
		hb.bike_hash = sbb.bike_hash and 
		sbb.load_end_datetime = '9999-12-31 00:00:00.000'
left join
	refine.sat_bike_bird_battery sbbb on
		hb.bike_hash = sbbb.bike_hash and 
		sbbb.load_end_datetime = '9999-12-31 00:00:00.000'
left join
	refine.sat_bike_lime sbl on
		hb.bike_hash = sbl.bike_hash and 
		sbl.load_end_datetime = '9999-12-31 00:00:00.000'
left join
	refine.sat_bike_lime_rentals sblr on
		hb.bike_hash = sblr.bike_hash and 
		sblr.load_end_datetime = '9999-12-31 00:00:00.000'
left join
	refine.sat_bike_lyft sbl2 on
		hb.bike_hash = sbl2.bike_hash and 
		sbl2.load_end_datetime = '9999-12-31 00:00:00.000'
left join
	refine.sat_bike_razor sbr on
		hb.bike_hash = sbr.bike_hash and 
		sbr.load_end_datetime = '9999-12-31 00:00:00.000'
left join
	refine.sat_bike_spin sbs on
		hb.bike_hash = sbs.bike_hash and 
		sbs.load_end_datetime = '9999-12-31 00:00:00.000'