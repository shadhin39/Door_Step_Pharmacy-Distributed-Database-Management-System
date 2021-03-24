clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

create or replace procedure pack_site(name SystemUser.UserName%TYPE,mediname Medicine.MedicineName%TYPE,selcname SellingDetails.CustomerName%TYPE,selquantity SellingDetails.Quantity%TYPE,seltotalprice SellingDetails.TotalPrice%TYPE) 
  is
  	lid SellingDetails.sid%TYPE;
	luid SellingDetails.uiid%TYPE;
	lmid SellingDetails.miid%TYPE;
	iid Inventory.Iid%TYPE;
	newstock Inventory.Stock%TYPE;
	curstock Inventory.Stock%TYPE;
	cd number;
	dd number;
	ee number;
	no_medicine_found_site EXCEPTION;
	no_seller_found_site EXCEPTION;
	stock_out_site EXCEPTION;
begin
	cd := 0;
	dd := 0;
	ee := 0;
	dbms_output.put_line(chr(10));
	dbms_output.put_line('Selling Details In Site');
	dbms_output.put_line(chr(10));
	dbms_output.put_line(chr(10));
	DBMS_OUTPUT.PUT_LINE('SellerID'||' '||'SellerName'||' '||'MID'||' '||'MedicineName'||' '||' '||'CustomerName'||' '||'SellingDate'||' '||'Quantity'||' '||'Price');
	for j in (select uiid from SystemUser@site1 where UserName = name) loop
		cd:=1;
	end loop;
	if cd=1 then
		select uiid into luid from SystemUser@site1 where UserName = name;
	
	else 
		raise no_seller_found_site;
	end if;
	for k in (select miid from Medicine@site1 where MedicineName = mediname) loop
		dd:=1;
	end loop;
	for l in (select Stock from Inventory@site1 where Stock>selquantity) loop
		ee:=1;
	end loop;
	if ee=0 then
		raise stock_out_site;
	end if; 
	if dd=1 then
		select miid into lmid from Medicine@site1 where MedicineName = mediname;
	else 
		raise no_medicine_found_site;
	end if; 
	if(cd=1 and dd=1 and ee=1) then
		insert into SellingDetails@site1 values(9,luid,lmid,selcname,LOCALTIMESTAMP,selquantity,seltotalprice);
		select Iid,Stock into iid,newstock from Inventory@site1 where Miid = lmid;  
		newstock := newstock-selquantity;
		update Inventory@site1 set Stock = newstock where Iid=iid;
		DBMS_OUTPUT.PUT_LINE(luid||' '||name||' '||lmid||' '||mediname||' '||selcname||' '||LOCALTIMESTAMP||' '||selquantity||' '||seltotalprice);
	end if;
	exception
		when no_medicine_found_site then
			dbms_output.put_line('Medicine Not Found in site');
		when no_seller_found_site then
			dbms_output.put_line('Unknown seller in site');
		when stock_out_site then
			dbms_output.put_line('Not Enough Quantity In stock in site');
commit;

end pack_site;
/