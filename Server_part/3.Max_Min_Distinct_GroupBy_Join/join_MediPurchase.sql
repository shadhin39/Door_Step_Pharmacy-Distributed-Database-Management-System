clear screen;


SELECT * FROM Medicine 
INNER JOIN Purchase ON Medicine.Miid = Purchase.Miid;

SELECT * FROM Medicine@site1 
INNER JOIN Purchase@site1 ON Medicine.Miid = Purchase.Miid;

commit;