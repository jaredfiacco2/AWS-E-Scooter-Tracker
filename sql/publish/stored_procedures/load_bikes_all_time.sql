CREATE OR REPLACE PROCEDURE publish.load_bikes_all_time()
	LANGUAGE plpgsql
AS $$
	
	
begin
	truncate 	publish.bikes_all_time;
	insert into publish.bikes_all_time
	select * 
	from refine.bv_bikes_all_time;
END



$$
;
