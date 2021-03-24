# Door_Step_Pharmacy-Distribute-Database-Management-System
* CSE 4126 Distributed Database Systems Lab

# Platform
* Developed In *Notepad++*
* Run In *CLI*

# Language
 * **PL/SQL**

# How to run "Door_Step_Pharmacy-Distribute-Database-Management-System"
> For making the Database as Distributed Distrubed, here "VMWare Workstation" is used as 'site' and Main PC is used as 'Server'
> Make Modification(add ip and port number) according to your pc in 'Listener.ora(C:\oraclexe\app\oracle\product\10.2.0\server\NETWORK\ADMIN\listener.ora) file  which is given in the repository.  
> Modify the conn.sql file(given in the repository) according to your pc and run it in your own system
> Finally Run the project(*Sql Files*)

# Features
- Salesaman and Manager of the Pharmacy can see all the medicine in the *Inventory* by using **show** command
- Salesaman and Manager of the Pharmacy can upadate medicine in the *Inventory* by using **update** command
- Manager of the Pharmacy can delete any medicine from the *Inventory* by using **delete** command(salesman can't delete medicine)
- **Trigger** will be invoked after *Delete*, *Update* and *Insert*
- When customer **order** any medicine it will check whether the medicine is in stock or not, It will also check for valid seller. This Operation can be done from *Site to Server* as well as *Server to Site*
- After Ordering any **Medicine** by the Customer, *Inventory* and *SellingDetails* Table will be Update 
- **Aggregate** function like max,min,count is used, Join, Inner join, UNION, having, group by is also used in project
