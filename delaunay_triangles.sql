-- 1
-- CONSTRAINED DELAUNAY TRIANGLES
-- dump to (triangle z)
create table temp_1 as (
select (st_dump(tin)).geom as geom from (
select ST_ConstrainedDelaunayTriangles(ST_Union(a.geom)) 
As tin from nmt_1 a) as foo);

explain (analyze on, buffers on, summary on) select (st_dump(tin)).geom as geom from (
select ST_ConstrainedDelaunayTriangles(ST_Union(a.geom)) 
As tin from nmt_1 a) as foo;

select st_astext(geom) from temp_1 limit 5;


-- 2
-- DELAUNAY TRIANGLES
-- creating geometry collection (polygon z)
-- dump to (polygon z)
create table temp_2 as (
select (st_dump(tin)).geom as geom from (
select ST_DelaunayTriangles(ST_Union(a.geom), 0, 0) 
As tin from nmt_1 a) as foo);

explain (analyze on, buffers on, summary on) select (st_dump(tin)).geom as geom from (
select ST_DelaunayTriangles(ST_Union(a.geom), 0, 0) 
As tin from nmt_1 a) as foo;

select st_astext(geom) from temp_2 limit 5;


--3 
-- DELAUNAY TRIANGLES
-- creating tin
-- dump to (triangle z)
create table temp_3 as (
select (st_dump(tin)).geom as geom from (
select ST_DelaunayTriangles(ST_Union(a.geom), 0, 2) 
As tin from nmt_1 a) as foo);


explain (analyze on, buffers on, summary on) select (st_dump(tin)).geom as geom from (
select ST_DelaunayTriangles(ST_Union(a.geom), 0, 2) 
As tin from nmt_1 a) as foo;

select st_astext(geom) from temp_3 limit 5;





