-- Function: udf_executeadminsearchbyidwithgeom(integer)

-- DROP FUNCTION udf_executeadminsearchbyidwithgeom(integer);

CREATE OR REPLACE FUNCTION udf_executeadminsearchbyidwithgeom(infeatureid integer)
  RETURNS SETOF text_search_results_withgeom AS
$BODY$
DECLARE
	r text_search_results_withgeom%rowtype;
BEGIN
	for r in	
	
	SELECT unique_id, id, name, level, source, country, year, ST_AsGeoJSON(geom)::json, fullname
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
ALTER FUNCTION udf_executeadminsearchbyidwithgeom(integer)
  OWNER TO postgres;
