create or replace procedure count_salesman_manager(eRole in SystemUser.Role%TYPE)
  is
  n SystemUser.uiid%TYPE:=0;

begin
	select count(Role) into n from SystemUser where SystemUser.Role= eRole;
	DBMS_OUTPUT.PUT_LINE(eRole||'  '||'count is: ' ||n);
commit;

end count_salesman_manager;
/
