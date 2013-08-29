-- Function: udf_executestrictadminsearchbyname(character varying)

-- DROP FUNCTION udf_executestrictadminsearchbyname(character varying);

CREATE OR REPLACE FUNCTION udf_executestrictadminsearchbyname(inname character varying)
  RETURNS SETOF text_search_results AS
$BODY$
DECLARE
	r text_search_results%rowtype;
BEGIN
	for r in	
	
	SELECT unique_id, id, name, level, source, country, year, fullname
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
ALTER FUNCTION udf_executestrictadminsearchbyname(character varying)
  OWNER TO postgres;
