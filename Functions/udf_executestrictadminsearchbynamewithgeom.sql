-- Function: udf_executestrictadminsearchbynamewithgeom(character varying)

-- DROP FUNCTION udf_executestrictadminsearchbynamewithgeom(character varying);

CREATE OR REPLACE FUNCTION udf_executestrictadminsearchbynamewithgeom(inname character varying)
  RETURNS SETOF text_search_results_withgeom AS
$BODY$
DECLARE
	r text_search_results_withgeom%rowtype;
BEGIN
	for r in	
	
	SELECT unique_id, id, name, level, source, country, year, ST_AsGeoJSON(geom)::json, fullname
	FROM text_search
	where name = inname
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
ALTER FUNCTION udf_executestrictadminsearchbynamewithgeom(character varying)
  OWNER TO postgres;
