CREATE OR REPLACE PACKAGE package1 AS
    FUNCTION del_medi(mediName Medicine.MedicineName%TYPE)
	RETURN BOOLEAN ;
	PROCEDURE procshow;
	PROCEDURE update_Inventory(mediName1 Medicine.MedicineName%TYPE, quantity integer);
END package1;
/
	
CREATE OR REPLACE PACKAGE BODY package1 AS

	PROCEDURE procshow
	IS
		id Inventory.Iid%TYPE;
		medId Inventory.Miid%TYPE;
		medName Medicine.MedicineName%TYPE;
		stock Inventory.Stock%TYPE;
		exDate Inventory.ExpiryDate%TYPE;
		
	BEGIN
        DBMS_OUTPUT.PUT_LINE('ID'||'	'||'Medicine_ID'||'	'||'Medicine_Name'||'	'||'Stock'||'	'||'Expiry Date');
		for i in (SELECT Iid, Miid, Stock, ExpiryDate FROM Inventory) loop
			id :=i.Iid;
			medId :=i.Miid;
			for j in (SELECT MedicineName FROM Medicine where Miid = medId) loop
				medName := j.MedicineName;
			end loop;
			stock :=i.Stock;
			exDate :=i.ExpiryDate;	
            DBMS_OUTPUT.PUT_LINE(id||'	'||medId||'               '||medName||'     '||stock||'     '||exDate);			
		end loop;
	commit;	
	END procshow;
	
	FUNCTION del_medi(mediName Medicine.MedicineName%TYPE)
	RETURN BOOLEAN
	IS
		meid integer;
		flag integer;
	BEGIN
		flag := 0;
	    select Miid into meid from Medicine where MedicineName = mediName;
		for i in (SELECT Miid  FROM Inventory where Miid=meid) loop
			flag := 1;
			delete from Inventory where Miid=meid;
		end loop;
		if flag = 1 then
			return true;
		else
			return false;
		end if;
	commit;		
	END del_medi;
	
	PROCEDURE update_Inventory(mediName1 Medicine.MedicineName%TYPE, quantity integer)
	IS
		iiid integer;
		nstock integer;
	BEGIN
		iiid := 0;
		select Iid,Stock into iiid,nstock from Inventory where Miid = (select Miid from Medicine where MedicineName = mediName1);  
		nstock := nstock+quantity;
		update Inventory set Stock = nstock where Iid=iiid;
		dbms_output.put_line('Inventory Updated Sucessfullly!!');
		DBMS_OUTPUT.PUT_LINE('Medicine_ID'||'	'||'Total_Stock');
		DBMS_OUTPUT.PUT_LINE(iiid||'	           '||nstock);
	commit;	
	END update_Inventory;
END package1;
/