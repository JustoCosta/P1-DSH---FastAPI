-- Consulta 1 

select year, count(*) as number 
from races 
group by year 
order by number desc
limit 1;

-- Consulta 2

select driverId , count(driverId) as campeonatos from results  where position = 1;

select forename , surename from drivers where driverId = 1;

-- Consulta 3

select circuitId, count(*) as carreras from races 
group by circuitId 
order by carreras desc
limit 1; 

select name from circuits where circuitId = 14;

-- Consulta 4

select driverId , constructorId , sum(points) as suma from results group by driverId
order by suma desc limit 1;

select name , nationality from constructors where constructorId = 1;


