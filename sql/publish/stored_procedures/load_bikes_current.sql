CREATE OR REPLACE PROCEDURE publish.load_bikes_current()
	LANGUAGE plpgsql
AS $$
	
	
begin
	truncate 	publish.bikes_current;
	insert into publish.bikes_current
	select * 
	from refine.bv_bikes_current;
END



$$
;
