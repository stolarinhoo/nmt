import psycopg2
import time

start = time.time()
conn = psycopg2.connect(host='localhost', port='5432', dbname='test2', user='postgres', password='alfabet1')
curs = conn.cursor()

curs.execute("CREATE UNLOGGED TABLE nmt_1 (id_1 FLOAT, id_2 FLOAT, id_3 FLOAT);")
curs.execute("COPY nmt_1 FROM 'C:/Users/Public/new2.csv' DELIMITER ' ' CSV;")
curs.execute("SELECT AddGeometryColumn('nmt_1', 'geom', 2180, 'POINTZ', 3);")
curs.execute("UPDATE nmt_1 SET geom = ST_SetSRID(ST_MakePoint(id_1, id_2, id_3), 2180);")
curs.execute("CREATE INDEX nmt_1_index ON nmt_1 USING GIST (geom);")



conn.commit()
end = time.time()
print(end - start)
