clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;
declare
	selid SellingDetails.sid%TYPE;
	seluid SellingDetails.uiid%TYPE;
	selmid SellingDetails.miid%TYPE;
	selcname SellingDetails.CustomerName%TYPE;
	seldate SellingDetails.SellingDate%TYPE;
	selquantity SellingDetails.Quantity%TYPE;
	seltotalprice SellingDetails.TotalPrice%TYPE;
	choice SellingDetails.CustomerName%TYPE := '&choice';
	c number;

begin
	if(choice='all') then
		dbms_output.put_line('From Both Site and Server:');
		DBMS_OUTPUT.PUT_LINE('SID'||'	'||'UIID'||'	'||'MIID'||'	'||'CustomerName'||'	'||'SellingDate'||'  '||'Quantity'||'	'||'TotalPrice');
		for i in (SELECT distinct Sid,uiid,miid,CustomerName,SellingDate,Quantity,TotalPrice from SellingDetails union SELECT distinct Sid,uiid,miid,CustomerName,SellingDate,Quantity,TotalPrice from SellingDetails@site1) loop
			selid:=i.Sid;
			seluid:=i.uiid;
			selmid:=i.miid;
			selcname:=i.CustomerName;
			seldate:=i.SellingDate;
			selquantity:=i.Quantity;
			seltotalprice:=i.TotalPrice;
			DBMS_OUTPUT.PUT_LINE(selid||'	'||seluid||'	'||selmid||'	'||selcname||'	       '||seldate||'   '||selquantity||'	    '||seltotalprice);
		end loop;
	elsif(choice='server') then
		dbms_output.put_line('From Server Only:');
		DBMS_OUTPUT.PUT_LINE('SID'||'	'||'UIID'||'	'||'MIID'||'	'||'CustomerName'||'	'||'SellingDate'||'  '||'Quantity'||'	'||'TotalPrice');
		for i in (SELECT distinct Sid,uiid,miid,CustomerName,SellingDate,Quantity,TotalPrice from SellingDetails) loop
			selid:=i.Sid;
			seluid:=i.uiid;
			selmid:=i.miid;
			selcname:=i.CustomerName;
			seldate:=i.SellingDate;
			selquantity:=i.Quantity;
			seltotalprice:=i.TotalPrice;
			DBMS_OUTPUT.PUT_LINE(selid||'	'||seluid||'	'||selmid||'	'||selcname||'	       '||seldate||'   '||selquantity||'	    '||seltotalprice);
		end loop;
	elsif(choice='site') then
		dbms_output.put_line('From Site only:');
		DBMS_OUTPUT.PUT_LINE('SID'||'	'||'UIID'||'	'||'MIID'||'	'||'CustomerName'||'	'||'SellingDate'||'  '||'Quantity'||'	'||'TotalPrice');
		for i in (SELECT distinct Sid,uiid,miid,CustomerName,SellingDate,Quantity,TotalPrice from SellingDetails@site1) loop
			selid:=i.Sid;
			seluid:=i.uiid;
			selmid:=i.miid;
			selcname:=i.CustomerName;
			seldate:=i.SellingDate;
			selquantity:=i.Quantity;
			seltotalprice:=i.TotalPrice;
			DBMS_OUTPUT.PUT_LINE(selid||'	'||seluid||'	'||selmid||'	'||selcname||'	       '||seldate||'   '||selquantity||'	    '||seltotalprice);
		end loop;
	end if;
commit;   
end;
/
