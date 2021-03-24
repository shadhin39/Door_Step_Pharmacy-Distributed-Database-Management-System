clear screen;
set serveroutput on;
set verify off;
@"F:\4.1 All Sheets And Books\DDS Lab\Project\1.Show_update_Delete_view_trigger\package.sql";	
@"F:\4.1 All Sheets And Books\DDS Lab\Project\1.Show_update_Delete_view_trigger\trigger.sql";
@"F:\4.1 All Sheets And Books\DDS Lab\Project\1.Show_update_Delete_view_trigger\trigger1.sql";
declare
	
	name SystemUser.UserName%TYPE := '&username';
	pass SystemUser.userPassword %TYPE := '&password';
	choice SystemUser.UserName%TYPE := '&Choice';
	delMedi Medicine.MedicineName%TYPE := '&delete';
	upInventory Medicine.MedicineName%TYPE := '&Medicine_to_update';
	q integer := &MedicineQunatity_to_update;
	id SystemUser.uiid%TYPE;
	role SystemUser.Role%TYPE;
	phone SystemUser.Phone%TYPE;
	address SystemUser.Address%TYPE;
	flag integer;
	flag1 BOOLEAN;
	
begin
    flag := 0;
    DBMS_OUTPUT.PUT_LINE(chr(10));
	for i in (SELECT  uiid,Role, phone, Address FROM SystemUser where UserName=name and userPassword=pass) loop
			id :=i.uiid;
			role :=i.Role;
			phone :=i.phone;
			address :=i.address;	
			flag := 1;		
	end loop;
		
	if flag=1 then
	    dbms_output.put_line('Logged in!!!');
		DBMS_OUTPUT.PUT_LINE(chr(10));
		dbms_output.put_line('User Details:');
	    DBMS_OUTPUT.PUT_LINE('ID'||'	'||'Name'||'	'||'Role'||'	'||'Phone'||'	'||'Address');
		DBMS_OUTPUT.PUT_LINE(id||'	'||name||'	'||role||'	'||phone||'	'||address);
	    DBMS_OUTPUT.PUT_LINE(chr(10));
		DBMS_OUTPUT.PUT_LINE(chr(10));
		if(choice='show') then
		    dbms_output.put_line('Showing the Details of Medicine Inventory:');
			package1.procshow();
        elsif(choice='delete') then
			if(role = 'Manager') then
				flag1 := package1.del_medi(delMedi);
				if (flag1 = true) then
					dbms_output.put_line('Sucessfullly Deleted!');
				else
					dbms_output.put_line('Not found in inventory!');
				end if;
			else
				dbms_output.put_line('You are not allowed to delete');
			end if;
		elsif(choice='update') then
			package1.update_Inventory(upInventory,q);
		end if;
    else 
		raise no_data_found;
	end if;
	
	exception
		when no_data_found then
			dbms_output.put_line('...Error!!!....Invalid Username, Password or Choice Details');
	 		
end;
/