clear screen;

drop table SystemUser cascade constraints;
drop table Medicine cascade constraints;
drop table Purchase cascade constraints;
drop table Inventory cascade constraints;
drop table SellingDetails cascade constraints;



drop sequence uiid;
drop sequence Miid;
drop sequence Pid;
drop sequence Iid;
drop sequence Sid;

CREATE TABLE SystemUser
(
uiid integer,
UserName varchar2(20),
userPassword varchar2(100),
Role varchar2(10),
Phone varchar2(15),
Address varchar2(100),
PRIMARY KEY (uiid)
);
create sequence uiid minvalue 1 start with 1 CACHE 10;



CREATE TABLE Medicine
(
Miid integer,
MedicineName varchar2(20),
MedicineType varchar2(50),
Category varchar2(100),
PRIMARY KEY(Miid)
);
create sequence Miid minvalue 1 start with 1 CACHE 10;

CREATE TABLE Purchase
(
Pid integer,
Miid integer,
CostPrice float,
SellingPrice float,
Quantity integer,
FOREIGN KEY(Miid) REFERENCES Medicine(Miid),
PRIMARY KEY(Pid)
);
create sequence Pid minvalue 1 start with 1 CACHE 10;

CREATE TABLE Inventory
(
Iid integer,
Miid integer,
Stock integer,
ExpiryDate varchar2(200),
FOREIGN KEY(Miid) REFERENCES Medicine(Miid),
PRIMARY KEY(Iid)
);
create sequence Iid minvalue 1 start with 1 CACHE 10;

CREATE TABLE SellingDetails
(
Sid integer,
uiid integer,
Miid integer,
CustomerName varchar2(200),
SellingDate TIMESTAMP,
Quantity integer,
TotalPrice float,
FOREIGN KEY(uiid) REFERENCES SystemUser(uiid),
FOREIGN KEY(Miid) REFERENCES Medicine(Miid),
PRIMARY KEY(Sid)
);
create sequence Sid minvalue 1 start with 1 CACHE 10;



--Inserting data in system user table
insert into SystemUser VALUES(uiid.nextval,'admin','admin','Manager','123456789','AUST,Tejgaon,Dhaka');
insert into SystemUser VALUES(uiid.nextval,'shadhin','1211','Manager','123456789','Tejgaon,Dhaka');
insert into SystemUser VALUES(uiid.nextval,'fardin','12345','Salesman','123456789','AUST,Dhaka');
insert into SystemUser VALUES(uiid.nextval,'shakib','admin','Salesman','123456789','Dhaka,Bangladesh');

--Inserting data in Medicine table
insert into Medicine VALUES(miid.nextval,'Napa Extra-500mg','Tablet','Non-Prescribed');
insert into Medicine VALUES(miid.nextval,'Tenocab-25mg','Tablet','Prescribed');
insert into Medicine VALUES(miid.nextval,'Nexus MUPS-20mg','Capsule','Prescribed');
insert into Medicine VALUES(miid.nextval,'Afixime-400mg','Capsule','Prescribed');

--Inserting data in Purchase table
insert into Purchase VALUES(Pid.nextval,4,400.0,420.5,10);
insert into Purchase VALUES(Pid.nextval,3,500.0,550.5,10);
insert into Purchase VALUES(Pid.nextval,2,600.0,575.9,10);
insert into Purchase VALUES(Pid.nextval,1,10.0,15.5,1);

--Inserting data in Inventory table
insert into Inventory VALUES(Iid.nextval,1,1300,'25 May,2029');
insert into Inventory VALUES(Iid.nextval,2,2900,'3 April,2026');
insert into Inventory VALUES(Iid.nextval,3,600,'31 March,2021');
insert into Inventory VALUES(Iid.nextval,4,980,'9 February,2022');

--Inserting data in Selling Details table
insert into SellingDetails VALUES(Sid.nextval,3,2,'Rahim',LOCALTIMESTAMP,5,287.95);
insert into SellingDetails VALUES(Sid.nextval,4,4,'Karim',LOCALTIMESTAMP,5,210.5);
insert into SellingDetails VALUES(Sid.nextval,3,1,'Jamal',LOCALTIMESTAMP,10,150.5);
insert into SellingDetails VALUES(Sid.nextval,4,3,'Pattric',LOCALTIMESTAMP,10,550.5);
insert into SellingDetails VALUES(Sid.nextval,2,4,'Royce',LOCALTIMESTAMP,100,5500.5);
commit;

@"F:\4.1 All Sheets And Books\DDS Lab\Project\1.Show_update_Delete_view_trigger\view.sql";


