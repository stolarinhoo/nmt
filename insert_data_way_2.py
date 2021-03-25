import psycopg2
import time

start = time.time()
conn = psycopg2.connect(host='localhost', port='5432', dbname='test2', user='postgres', password='alfabet1')
curs = conn.cursor()
filepath = "C:\\Users\\Jakub\\PycharmProjects\\test2\\testownik9_NMT\\nmpt1m.csv"

curs.execute("CREATE TABLE nmt_8 (id_1 FLOAT, id_2 FLOAT, id_3 FLOAT);")

with open(filepath, 'r') as text:
    curs.copy_from(text, 'nmt_8', sep=" ")

curs.execute("SELECT AddGeometryColumn('nmt_8', 'geom', 0, 'POINTZ', 3);")
curs.execute("CREATE INDEX nmt_8_index ON nmt_8 USING GIST (geom);")
curs.execute("UPDATE nmt_8 SET geom = ST_SetSRID(ST_MakePoint(id_1, id_2, id_3), 0);")

conn.commit()
end = time.time()
print(end - start)
