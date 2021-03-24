CREATE OR REPLACE PACKAGE package3 AS
	PROCEDURE pack_server(name SystemUser.UserName%TYPE,mediname Medicine.MedicineName%TYPE,selcname SellingDetails.CustomerName%TYPE,selquantity SellingDetails.Quantity%TYPE,seltotalprice SellingDetails.TotalPrice%TYPE);
END package3;
/
	
CREATE OR REPLACE PACKAGE BODY package3 AS

	PROCEDURE pack_server(name SystemUser.UserName%TYPE,mediname Medicine.MedicineName%TYPE,selcname SellingDetails.CustomerName%TYPE,selquantity SellingDetails.Quantity%TYPE,seltotalprice SellingDetails.TotalPrice%TYPE)
	IS
		selid SellingDetails.sid%TYPE;
		seluid SellingDetails.uiid%TYPE;
		selmid SellingDetails.miid%TYPE;
		iiid Inventory.Iid%TYPE;
		nstock Inventory.Stock%TYPE;
		currstock Inventory.Stock%TYPE;
		c number;
		d number;
		e number;
		no_medicine_found_SS EXCEPTION;
		no_seller_found_SS EXCEPTION;
		stock_out EXCEPTION;
	BEGIN
		c := 0;
		d := 0;
		e := 0;
		dbms_output.put_line(chr(10));
		dbms_output.put_line('Selling Details In Server');
		dbms_output.put_line(chr(10));
		dbms_output.put_line(chr(10));
		DBMS_OUTPUT.PUT_LINE('SellerID'||' '||'SellerName'||' '||'MID'||' '||'MedicineName'||' '||' '||'CustomerName'||' '||'SellingDate'||' '||'Quantity'||' '||'Price');
		for j in (select uiid from SystemUser where UserName = name) loop
			c:=1;
		end loop;
		if c=1 then
			select uiid into seluid from SystemUser where UserName = name;
		
		else 
			raise no_seller_found_SS;
		end if;
		for k in (select miid from Medicine where MedicineName = mediname) loop
			d:=1;
		end loop;
		for l in (select Stock from Inventory where Stock>selquantity) loop
			e:=1;
		end loop;
		if e=0 then
			raise stock_out;
		end if; 
		if d=1 then
			select miid into selmid from Medicine where MedicineName = mediname;
		else 
			raise no_medicine_found_SS;
		end if; 
		if(c=1 and d=1 and e=1) then
			insert into SellingDetails values(Sid.nextval,seluid,selmid,selcname,LOCALTIMESTAMP,selquantity,seltotalprice);
			select Iid,Stock into iiid,nstock from Inventory where Miid = selmid;  
			nstock := nstock-selquantity;
			update Inventory set Stock = nstock where Iid=iiid;
			DBMS_OUTPUT.PUT_LINE(seluid||' '||name||' '||selmid||' '||mediname||' '||selcname||' '||LOCALTIMESTAMP||' '||selquantity||' '||seltotalprice);
		end if;
		exception
			when no_medicine_found_SS then
				dbms_output.put_line('Medicine Not Found');
			when no_seller_found_SS then
				dbms_output.put_line('Unknown seller');
			when stock_out then
				dbms_output.put_line('Not Enough Quantity In stock');	
	commit;	
	END pack_server;
	
	
	
	
END package3;
/