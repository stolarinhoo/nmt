







create table temp_1 as (select st_delaunaytriangles(st_union(a.geom), 0.0, 0) from nmt_2 a);
-- zwrata plygon z WKT
create table temp_2 as (select st_delaunaytriangles(st_union(a.geom), 0.0, 1) from nmt_2 a);
-- zwraca linie
create table temp_3 as (select st_delaunaytriangles(st_union(a.geom), 0.0, 2) from nmt_2 a);
-- zwraca polaczony poligon 



create table temp_3 as (select ST_ConstrainedDelaunayTriangles(ST_Union(a.geom)) from nmt_1 a);


create table temp_4 as (select st_dump(a.st_delaunaytriangles) as geom from temp_3 a);

-- EXPLAIN SECTION
explain (analyze on, buffers on) select st_delaunaytriangles(st_union(a.geom), 0.0, 2) from nmt_2 a;
explain (analyze on, buffers on) select st_astext(st_delaunaytriangles) from temp_2;






create table tin As
(select tin As geom from (select
ST_DelaunayTriangles(ST_Union(a.geom),0.001,0) As tin from nmt_1 a) as
foo);



--rep6898 - warstwa punktowa

--tin - siatka trójkątów jako jeden obiekt.


create table tin_rep3 As

(select ST_Force2D((ST_Dump(tin)).geom) As geom, 1 as col
  from (select ST_ConstrainedDelaunayTriangles(ST_Union(a.geom)) As tin
from nmt_1 a) as foo);


create table temp_9 as (select st_dump(tin) as geom from (select st_delaunaytriangles(st_union(a.geom),0,1) as tin from nmt_2 a) as foo);



create table temp_13 as (select st_delaunaytriangles(st_union(a.geom),0 ,0) as tin from nmt_2 a);
create table temp_11 as (select st_collectionextract(tin,3) from temp_10);
create table temp_14 as (select (st_dump(tin)).geom as geom from temp_13);


create table temp_15 as (select st_delaunaytriangles(st_union(a.geom),0 ,2) as tin from nmt_2 a);
create table temp_16 as (select (st_dump(tin)).geom as geom from temp_15);
create table temp_17 as (select st_force2d(a.geom) as geom2d, 1 as col from temp_16 a);

--tin_rep3  - siatka trójkątów jako oddzielne obiekty

--ST_Dump - metoda rozbicia obiektów geometrycznych.



create table temp_18 as (select ST_ConstrainedDelaunayTriangles(ST_Union(a.geom)) As tin from nmt_1 a);
create table temp_19 as (select (st_dump(tin)).geom as geom from temp_18);


-- drugi wariant dziala!!!
create table temp_20 as (
select (st_dump(tin)).geom as geom from (
select ST_ConstrainedDelaunayTriangles(ST_Union(a.geom)) 
As tin from nmt_1 a) as foo);

explain (analyze on, buffers on, summary on) select (st_dump(tin)).geom as geom from (
select ST_ConstrainedDelaunayTriangles(ST_Union(a.geom)) 
As tin from nmt_1 a) as foo;




-- wariant 1
create table temp_20 as (
select (st_dump(tin)).geom as geom from (
select ST_DelaunayTriangles(ST_Union(a.geom), 0, 0) 
As tin from nmt_1 a) as foo);

explain (analyze on, buffers on, summary on) select (st_dump(tin)).geom as geom from (
select ST_DelaunayTriangles(ST_Union(a.geom), 0, 0) 
As tin from nmt_1 a) as foo;




--wariant 2
create table temp_20 as (
select (st_dump(tin)).geom as geom from (
select ST_DelaunayTriangles(ST_Union(a.geom), 0, 2) 
As tin from nmt_1 a) as foo);


explain (analyze on, buffers on, summary on) select (st_dump(tin)).geom as geom from (
select ST_DelaunayTriangles(ST_Union(a.geom), 0, 2) 
As tin from nmt_1 a) as foo;







