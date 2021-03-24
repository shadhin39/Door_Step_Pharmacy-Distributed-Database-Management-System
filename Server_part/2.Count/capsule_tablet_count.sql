create or replace function count_cap_tab(mediType in Medicine.MedicineType%TYPE)
  return Medicine.Miid%TYPE
  is
  n Medicine.Miid%TYPE:=0;

begin
	select count(MedicineType) into n from Medicine where Medicine.MedicineType=mediType ;
	return n;
commit;

end count_cap_tab;
/
