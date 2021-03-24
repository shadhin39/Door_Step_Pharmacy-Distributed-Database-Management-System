# Door_Step_Pharmacy-Distribute-Database-Management-System
* CSE 4126 Distributed Database Systems Lab

# Platform
* Developed In *Notepad++*
* Run In *CLI*

# Language
 * **PL/SQL**

# How to run "Door_Step_Pharmacy-Distribute-Database-Management-System"
> For making the Database Distrubed, here "VMWare Workstation" is used as 'site' and Main is used as 'Server'
> Make Modification(add ip and port number) according to your pc in 'Listener.ora(C:\oraclexe\app\oracle\product\10.2.0\server\NETWORK\ADMIN\listener.ora)' file  which is given in the repository.  
> Modify the conn.sql file according to your pc and run it in your own system

> Finally Run the sql files 

# Features
- Salesaman and Manager of the Pharmacy can see in the medicine the *Inventory* by using **show** command
- Salesaman and Manager of the Pharmacy can upadate medicine in the *Inventory* by using **update** command
- Manager of the Pharmacy can delete the medicine from the *Inventory* by using **delete** command(salesman can't delete medicine)
- **Trigger** will be invoked after *Delete* and *Update*
- When customer **order** any medicine it will whether the medicine is in stock or not, It will check for valid seller. This Operation can be done from *Site to Server* as well as *Server to Site*
- After Ordering any **Medicine** by the Customer, *Inventory* and *SellingDetails* Table will be Update 
- **Aggregate** function max,min,count is used, Join, Inner join, UNION, having, group by is used
