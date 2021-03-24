clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;
@"F:\4.1 All Sheets And Books\DDS Lab\Project\4.CustomerOrder\InsertTrigger.sql"
@"F:\4.1 All Sheets And Books\DDS Lab\Project\4.CustomerOrder\Package_Order.sql"
@"F:\4.1 All Sheets And Books\DDS Lab\Project\4.CustomerOrder\site.sql"
declare
	choice Medicine.MedicineName%TYPE := '&choice';
	name SystemUser.UserName%TYPE := '&SellerName';
	mediname Medicine.MedicineName%TYPE := '&Medicine_Name';
	selcname SellingDetails.CustomerName%TYPE:= '&Customer_Name';
	selquantity SellingDetails.Quantity%TYPE := '&Medicine_Quantity';
	seltotalprice SellingDetails.TotalPrice%TYPE := '&Total_Price';

begin
	if (choice='server')then
		package3.pack_server(name,mediname,selcname,selquantity,seltotalprice);
	elsif (choice='site')then
		pack_site(name,mediname,selcname,selquantity,seltotalprice);
	end if;
commit;   
end;
/
