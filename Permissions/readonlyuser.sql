--ALTER USER boundaryreader set default_transaction_read_only = on;
--GRANT select on text_search to boundaryreader;

-- Grant access to current tables and views
GRANT SELECT ON ALL TABLES IN SCHEMA public TO boundaryreader;
-- Now make sure that's also available on new tables and views by default
ALTER DEFAULT PRIVILEGES
    IN SCHEMA public -- omit this line to make a default across all schemas
    GRANT SELECT
ON TABLES 
TO boundaryreader;

-- Now do the same for sequences
GRANT SELECT, USAGE ON ALL SEQUENCES IN SCHEMA public TO boundaryreader;
ALTER DEFAULT PRIVILEGES
    IN SCHEMA public -- omit this line to make a default across all schemas
    GRANT SELECT, USAGE
ON SEQUENCES 
TO boundaryreader;