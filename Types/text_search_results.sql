-- Type: text_search_results

-- DROP TYPE text_search_results;

CREATE TYPE text_search_results AS
   (stackid character varying,
    featureid character varying,
    name character varying,
    level character varying,
    source character varying,
    country character varying,
    year integer,
    fullname character varying);
ALTER TYPE text_search_results
  OWNER TO postgres;
