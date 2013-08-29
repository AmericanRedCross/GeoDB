-- Type: text_search_results_withgeom

-- DROP TYPE text_search_results_withgeom;

CREATE TYPE text_search_results_withgeom AS
   (stackid character varying,
    featureid character varying,
    name character varying,
    level character varying,
    source character varying,
    country character varying,
    year integer,
    geom character varying,
    fullname character varying);
ALTER TYPE text_search_results_withgeom
  OWNER TO postgres;
