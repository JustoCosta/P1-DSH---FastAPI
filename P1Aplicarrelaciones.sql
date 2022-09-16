use p1api;

-- DEFINIR RELACIONES 

-- PRIMARY KEYS 

alter table circuits add primary key(circuitId); 
alter table constructors add primary key(constructorId);
alter table drivers add primary key(driverId);
alter table qualifying add primary key(qualifyId);
alter table races add primary key(raceId);
alter table results add primary key(resultId);

-- FOREIGN KEYS 

alter table races add constraint circuits_fk_races foreign key (circuitId) references circuits (circuitId) on delete restrict on update restrict; 

alter table results add constraint results_fk_races foreign key (raceId) references races (raceId) on delete restrict on update restrict; 
alter table results add constraint results_fk_drivers foreign key (driverId) references drivers (driverId);
alter table results add constraint results_fk_constructors foreign key (constructorId) references constructors (constructorId) on delete restrict on update restrict;

alter table qualifying add constraint qualifying_fk_races foreign key (raceId) references races (raceId) on delete restrict on update restrict; 
alter table qualifying add constraint qualifying_fk_drivers foreign key (driverId) references drivers (driverId) on delete restrict on update restrict; 
alter table qualifying add constraint qualifying_fk_constructors foreign key (constructorId) references constructors (constructorId) on delete restrict on update restrict;

alter table pitstops add constraint pitstops_fk_drivers foreign key (driverId) references drivers (driverId) on delete restrict on update restrict;

alter table laptimes add constraint laptimes_fk_drivers foreign key (driverId) references drivers (driverId) on delete restrict on update restrict;

