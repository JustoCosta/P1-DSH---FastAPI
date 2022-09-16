from fastapi import FastAPI
from config.db import conn



app = FastAPI(title = 'PROYECTO 1', description = 'proyecto numeroo 1 de henry', version= '1.0.2')

### Consultas en formato sql 

Consulta1 = 'SELECT year, COUNT(*) AS number  FROM races  GROUP BY year  ORDER BY number DESC  LIMIT 1'

Consulta2a = 'select driverId, count(driverId) as campeonatos from results where position = 1'
Consulta2b = 'select forename , surename from drivers where driverId = 1'

Consulta3a = 'select circuitId, count(*) as carreras from races group by circuitId order by carreras desc limit 1'
Consulta3b = 'select name from circuits where circuitId = 14'

Consulta4a = 'select driverId , constructorId , sum(points) as suma from results group by driverId order by suma desc limit 1'
Consulta4b = 'select name , nationality from constructors where constructorId = 1'

@app.get('/')
def Home():
    return 'Pagina Principal'

@app.get('/Consulta1')
def C1():
    return  conn.execute(Consulta1).fetchall()

@app.get('/Consulta2')
def C2():
    return conn.execute(Consulta2a).fetchall(),conn.execute(Consulta2b).fetchall()

@app.get('/Consulta3')
def C3():
    return conn.execute(Consulta3a).fetchall() , conn.execute(Consulta3b).fetchall()

@app.get('/Consulta4')
def C4():
    return conn.execute(Consulta4a).fetchall() , conn.execute(Consulta4b).fetchall() 
