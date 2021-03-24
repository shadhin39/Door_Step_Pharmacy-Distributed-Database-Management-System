clear screen;
create or replace view MediTypeServer as 
SELECT count(miid) as MedicineType_ID_Count_SERVER FROM Medicine Group By MedicineType;
commit;
select * from MediTypeServer;

create or replace view MediTypeSite as 
SELECT count(miid) as MedicineType_ID_Count_SITE FROM Medicine@site1 Group By MedicineType;
commit;
select * from MediTypeSite;

create or replace view MediCatgoryServer as 
SELECT count(miid) as Medicine_Cat_ID_Count_SERVER FROM Medicine Group By Category;
commit;
select * from MediCatgoryServer;

create or replace view MediCatgorySite as 
SELECT count(miid) as Medicine_Cat_ID_Count_Site FROM Medicine@site1 Group By Category;
commit;
select * from MediCatgorySite;