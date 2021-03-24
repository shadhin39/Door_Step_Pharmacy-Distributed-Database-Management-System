clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;
@"C:\Users\Fardin\Desktop\Lab\Site to Server\InsertTrigger.sql"
@"C:\Users\Fardin\Desktop\Lab\Site to Server\Package_Order.sql"
@"C:\Users\Fardin\Desktop\Lab\Site to Server\server.sql"
declare
	choice Medicine.MedicineName%TYPE := '&choice';
	name SystemUser.UserName%TYPE := '&SellerName';
	mediname Medicine.MedicineName%TYPE := '&Medicine_Name';
	selcname SellingDetails.CustomerName%TYPE:= '&Customer_Name';
	selquantity SellingDetails.Quantity%TYPE := '&Medicine_Quantity';
	seltotalprice SellingDetails.TotalPrice%TYPE := '&Total_Price';

begin
	if (choice='site')then
		package3.pack_server(name,mediname,selcname,selquantity,seltotalprice);
	elsif (choice='server')then
		pack_site(name,mediname,selcname,selquantity,seltotalprice);
	end if;
commit;   
end;
/
