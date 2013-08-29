-- Function: udf_executeadminsearchbyid(integer)

-- DROP FUNCTION udf_executeadminsearchbyid(integer);

CREATE OR REPLACE FUNCTION udf_executeadminsearchbyid(infeatureid integer)
  RETURNS SETOF text_search_results AS
$BODY$
DECLARE
	r text_search_results%rowtype;
BEGIN
	for r in	
	
	SELECT unique_id, id, name, level, source, country, year, fullname
	FROM text_search
	where id = infeatureid
	ORDER BY name, source
	loop
        return next r;
    end loop;
    return;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION udf_executeadminsearchbyid(integer)
  OWNER TO postgres;
