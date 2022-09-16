DROP DATABASE P1API;
CREATE DATABASE IF NOT EXISTS P1API; 
USE P1API; 

select @@global.secure_file_priv;
show variables like 'secure_file_priv';

-- Creamos e importamos las tablas 

------------------------------------------
-- TABLA RACES
------------------------------------------ 
drop table if exists races;
create table if not exists races (
raceId integer,
year int,
round int,
circuitId int,
name varchar(255),
date varchar(255),
time varchar(255), 
url varchar(255)
) engine=InnoDB default charset=utf8mb4;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\P1\\races.csv'
INTO TABLE races
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;

select * from races;

------------------------------------------
-- TABLA CIRCUITS
------------------------------------------
drop table if exists circuits;
create table if not exists circuits (
circuitId int,
circuitRef varchar(255),
name varchar(255),
location varchar(255),
country varchar(255),
lat float,
lng float, 
alt int,
url varchar(255)
) engine=InnoDB default charset=utf8mb4;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\P1\\circuits.csv'
INTO TABLE circuits
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

select * from circuits; 

------------------------------------------
-- TABLA DRIVERS
------------------------------------------
drop table if exists drivers;
create table if not exists drivers (
driverId int,
driverRef varchar(255),
number varchar(255),
code varchar(3),
forename varchar(255),
surename varchar(255),
dob date,
nationality varchar(255), 
url varchar(255)
) engine=InnoDB default charset=utf8mb4;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\P1\\drivers.csv'
INTO TABLE drivers
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

select * from drivers;

------------------------------------------
-- TABLA CONSTRUCTOR
------------------------------------------
drop table if exists constructors;
create table if not exists constructors (
constructorId int,
constructorRef text,
name text,
nationality text, 
url text
) engine=InnoDB default charset=utf8mb4;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\P1\\constructors.csv'
INTO TABLE constructors
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;

select * from constructors;


------------------------------------------
-- TABLA RESULTS
------------------------------------------
drop table if exists results;
create table if not exists results (
resultId int,
raceId int,
driverId int,
constructorId int,
number int,
grid varchar(255),
position varchar(255),
positionText varchar(255),
positionOrder varchar(255),
points varchar(255),
laps varchar(255),
time varchar(255),
milliseconds varchar(255),
fastestLap varchar(255),
ranking varchar(255),
fastestLapTime varchar(255),
fastestLapSpeed varchar(255),
statusId int
) engine=InnoDB default charset=utf8mb4;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\P1\\results.csv'
INTO TABLE results
FIELDS TERMINATED BY '|' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

select * from results;

------------------------------------------
-- TABLA LAPTIMES
------------------------------------------
drop table if exists Laptimes;
create table if not exists Laptimes (
raceId int,
driverId int,
Lap int,
position varchar(255),
time varchar(255),
miliseconds varchar(255)
) engine=InnoDB default charset=utf8mb4;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\P1\\Laps.csv'
INTO TABLE Laptimes
FIELDS TERMINATED BY '|' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

select * from Laptimes;


------------------------------------------
-- TABLA QUALIFYING
------------------------------------------
drop table if exists qualifying;
create table if not exists qualifying (
qualifyId int,
raceId int,
driverId int,
constructorId int,
number int,
position int,
q1 varchar(255),
q2 varchar(255),
q3 varchar(255)
) engine=InnoDB default charset=utf8mb4;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\P1\\qual.csv'
INTO TABLE qualifying
FIELDS TERMINATED BY '|' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

select * from qualifying;

------------------------------------------
-- TABLA PITSTOPS
------------------------------------------
drop table if exists pitstops;
create table if not exists pitstops (
raceId int,
driverId int,
stop int,
lap int,
time varchar(255),
duration varchar(255),
miliseconds varchar(255)
) engine=InnoDB default charset=utf8mb4;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\P1\\pit_stops.csv'
INTO TABLE pitstops
FIELDS TERMINATED BY '|' ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

select * from pitstops;
