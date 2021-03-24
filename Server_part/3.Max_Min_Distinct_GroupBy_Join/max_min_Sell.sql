clear screen;
create or replace view max_sell as 
SELECT MAX(SellingPrice) as maximum_Sell_FROM_SITE FROM Purchase@site1;

select * from max_sell;

create or replace view min_sell as 
SELECT MIN(SellingPrice) as minimum_Sell_FROM_SERVER FROM Purchase;

select * from min_sell;

commit;