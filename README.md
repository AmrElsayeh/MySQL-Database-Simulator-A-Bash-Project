# MySQL-Database-Simulator-A-Bash-Project
This project is a simulation of a MySQL database using Bash scripting. It allows users to perform various operations such as creating and deleting database users, creating and deleting databases, creating and modifying tables, inserting data into tables, and querying data from tables.

![Imagine a DataBase](virtual_simulation_world_fb.jpg)

### This project contains 7 scripts
1. Create User 
2. Delete User
3. Create DataBase
4. Delete DataBase
5. Create Table
6. Insert Into Table
7. Select from DataBase

#### The Create User script: 
This script checks if the current user is listed as an admin in the DB_admins.db file, and if they are, prompts them to enter the name of a new user they want to create. It then checks if the user already exists in the DB_admins.db file, and if they do, prints a message to that effect, otherwise it appends their name to the file. If the current user is not listed as an admin in the DB_admins.db file, the script prints a message indicating that the user does not have admin privileges.

#### The Delete User script:
This script checks if the current user is listed as an admin in the DB_admins.db file, if they are, it prints the list of users from the DB_admins.db file and prompts the user to choose a user to be deleted. Then it checks if the entered user name exists in the DB_admins.db and if it does, it checks if the entered name is "oracle" (which is protected and can not be deleted), if it's not it's deleted from DB_admins.db. If the entered name does not exist in the DB_admins.db, the script prints a message indicating that this name is not listed in the admins list. If the current user is not listed as an admin in the DB_admins.db file, the script prints a message indicating that the user does not have admin privileges.

#### The Create DataBase script:
This script checks if the current user is listed as an admin in the DB_admins.db file, and if they are, prompts them to enter the name of a new database they want to create. It then checks if the entered database already exists in the DataBases directory and if it does, prints a message to that effect. If it doesn't exist, it creates a new directory with the entered name and give full permissions to the new directory and also append the current user's name to the owner.txt file in the new directory. If the current user is not listed as an admin in the DB_admins.db file, the script prints a message indicating that the user does not have admin privileges.

#### The Delete DataBase script:
This script checks if the current user is listed as an admin in the DB_admins.db file and if they are, it prints a list of available databases and prompts the user to enter the name of a database they want to delete from the list. It then checks if the entered database exists in the DataBases directory and if it does, it checks if the current user is the owner of the entered database. If the current user is the owner of the entered database, it deletes the entered database and prints a message indicating that the database has been deleted successfully. If the current user is not the owner of the entered database, it prints a message indicating that the user does not have permission to delete this database. If the entered database does not exist, it prints a message indicating that there is no database with the provided name. If the current user is not listed as an admin in the DB_admins.db file, the script prints a message indicating that the user does not have admin privileges.
