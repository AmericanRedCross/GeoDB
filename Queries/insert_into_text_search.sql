--GADM 0
INSERT INTO text_search (name, level, source, year, unique_id, geom)
(SELECT name_0, '0', 'GADM', 2013, ogc_fid, geom from gadm0)

--GADM 1
INSERT INTO text_search (name, level, source, country, year, unique_id, geom)
(SELECT name_1, '1', 'GADM', name_0, 2013, ogc_fid, geom from gadm1)

--GADM 2
INSERT INTO text_search (name, level, source, country, year, unique_id, geom)
(SELECT name_2, '2', 'GADM', name_0, 2013, ogc_fid, geom from gadm2)

--GADM 3
INSERT INTO text_search (name, level, source, country, year, unique_id, geom)
(SELECT name_3, '3', 'GADM', name_0, 2013, ogc_fid, geom from gadm3)

--GADM 4
INSERT INTO text_search (name, level, source, country, year, unique_id, geom)
(SELECT name_4, '4', 'GADM', name_0, 2013, ogc_fid, geom from gadm4)

--GADM 5
INSERT INTO text_search (name, level, source, country, year, unique_id, geom)
(SELECT name_5, '5', 'GADM', name_0, 2013, ogc_fid, geom from gadm5)


--GAUL 0
INSERT INTO text_search (name, level, source, country, year, unique_id, geom)
(SELECT adm0_name, '0', 'GAUL', adm0_name, 2012, ogc_fid, geom from gaul0)

--GAUL 1
INSERT INTO text_search (name, level, source, country, year, unique_id, geom)
(SELECT adm1_name, '1', 'GAUL', adm0_name, 2012, ogc_fid, geom from gaul1)

--GAUL 2
INSERT INTO text_search (name, level, source, country, year, unique_id, geom)
(SELECT adm2_name, '2', 'GAUL', adm0_name, 2012, ogc_fid, geom from gaul2)


--Get Count
select count(*) from text_search


--Clear table
delete from text_search
where source = 'GAUL'