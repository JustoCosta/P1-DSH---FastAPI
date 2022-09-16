DROP DATABASE P1API;
CREATE DATABASE IF NOT EXISTS P1API; 
USE P1API; 

select @@global.secure_file_priv;
show variables like 'secure_file_priv';

-- Creamos e importamos las tablas 

drop table if exists races;
create table if not exists races (
raceId int,
year int,
round int,
circuitId int,
name varchar(255),
date date,
time time, 
url varchar(255)
) engine=InnoDB default charset=utf8mb4;

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

-----------------------------------------------------

drop table if exists drivers;
create table if not exists drivers (
driverId int,
driverRef varchar(255),
number int,
code varchar(3),
forename varchar(255),
surename varchar(255),
dob date,
nationality varchar(255), 
url varchar(255)
) engine=InnoDB default charset=utf8mb4;

select * from drivers;

