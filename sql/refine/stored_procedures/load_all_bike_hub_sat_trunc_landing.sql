CREATE OR REPLACE PROCEDURE refine.load_all_bike_hub_sat_trunc_landing()
	LANGUAGE plpgsql
AS $$
	
	
	
BEGIN
call refine.load_hub_bike_bird();
call refine.load_sat_bike_bird();
truncate "stage"."landing_bird"; 
call refine.load_hub_bike_bird_battery();
call refine.load_sat_bike_bird_battery();
truncate "stage"."landing_bird_battery";
call refine.load_hub_bike_lime();
call refine.load_sat_bike_lime();
truncate "stage"."landing_lime"; 
call refine.load_hub_bike_lime_rentals();
call refine.load_sat_bike_lime_rentals();
truncate "stage"."landing_lime_rentals";
call refine.load_hub_bike_lyft();
call refine.load_sat_bike_lyft();
truncate "stage"."landing_lyft";
call refine.load_hub_bike_razor();
call refine.load_sat_bike_razor();
truncate "stage"."landing_razor";
call refine.load_hub_bike_spin();
call refine.load_sat_bike_spin();
truncate "stage"."landing_spin";
END



$$
;
