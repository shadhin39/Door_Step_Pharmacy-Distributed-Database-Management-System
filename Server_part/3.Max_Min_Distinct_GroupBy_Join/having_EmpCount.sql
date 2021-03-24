clear screen;
SELECT count(uiid) as Emp_Count_Server, Role as Emp_ROLE_Server FROM SystemUser Group By Role 
having count(uiid)>1 order by count(uiid) desc;




SELECT count(uiid) as Emp_Count_Site, Role as Emp_ROLE_Site FROM SystemUser@site1 Group By Role 
having count(uiid)>1 order by count(uiid) desc;