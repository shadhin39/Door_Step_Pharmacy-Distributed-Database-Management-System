CLEAR SCREEN;
SET SERVEROUTPUT ON;
SET VERIFY OFF;
@"F:\4.1 All Sheets And Books\DDS Lab\Project\2.Count\capsule_tablet_count.sql";
@"F:\4.1 All Sheets And Books\DDS Lab\Project\2.Count\salesman_manager_count.sql";	
declare
	d Medicine.MedicineType%TYPE:='&Medicine_Type';
	e SystemUser.Role%TYPE := '&Employee_Role';
	n Medicine.Miid%TYPE;

begin
	
	if(d='Tablet') then
		n :=count_cap_tab(d);
		DBMS_OUTPUT.PUT_LINE(d||'  '||'count is: ' ||n);
	elsif(d='Capsule') then
		n :=count_cap_tab(d);
		DBMS_OUTPUT.PUT_LINE(d||'  '||'count is: ' ||n);
	else
		DBMS_OUTPUT.PUT_LINE('Not proper type ' );
	end if;
	
	count_salesman_manager(e);
	
commit;   
end;
/