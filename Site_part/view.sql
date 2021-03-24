
create or replace view myview1(User_ID,User_NAME,User_Password,User_ROLE,User_PHONE,User_Address) as
select uiid, UserName, userPassword, Role, Phone, Address 
from SystemUser U;

create or replace view myview2(Medicine_ID,Medicine_NAME,Medicine_TYPE,Medicine_CATEGORY) as
select Miid, MedicineName, MedicineType,Category
from Medicine M;

create or replace view myview3(Purchase_ID,Medicine_ID,Purchase_Price,Selling_Price,Purchase_Quantity) as
select Pid, Miid, CostPrice,SellingPrice, Quantity
from Purchase P;

create or replace view myview4(Inventory_ID,Medicine_ID,Inventory_Stock,Medicine_Expiry) as
select Iid, Miid, Stock, ExpiryDate
from Inventory I;

create or replace view myview5(Selling_ID, Seller_ID, Medicine_ID, Customer_Name, Selling_Date, Medicine_Quantity, Total_Price) as
select Sid, uiid, Miid, CustomerName, SellingDate, Quantity, TotalPrice
from SellingDetails S;

select * from myview1;
select * from myview2;
select * from myview3;
select * from myview4;
select * from myview5;

commit;