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


#### The Main script:
This script uses the 'select' command to present the user with a list of options from the 'option.txt' file. The select command allows the user to select one of the options listed in the option.txt file. The script then checks which option the user selected and runs the corresponding script. for example if the user selected "CreateUser" the script runs the CreateUser.sh script. The script continues to prompt the user to select an option until the user selects the "Exit" option, at which point the script exits.

#### The Create User script: 
This script checks if the current user is listed as an admin in the DB_admins.db file, and if they are, prompts them to enter the name of a new user they want to create. It then checks if the user already exists in the DB_admins.db file, and if they do, prints a message to that effect, otherwise it appends their name to the file. If the current user is not listed as an admin in the DB_admins.db file, the script prints a message indicating that the user does not have admin privileges.

#### The Delete User script:
This script checks if the current user is listed as an admin in the DB_admins.db file, if they are, it prints the list of users from the DB_admins.db file and prompts the user to choose a user to be deleted. Then it checks if the entered user name exists in the DB_admins.db and if it does, it checks if the entered name is "oracle" (which is protected and can not be deleted), if it's not it's deleted from DB_admins.db. If the entered name does not exist in the DB_admins.db, the script prints a message indicating that this name is not listed in the admins list. If the current user is not listed as an admin in the DB_admins.db file, the script prints a message indicating that the user does not have admin privileges.

#### The Create DataBase script:
This script checks if the current user is listed as an admin in the DB_admins.db file, and if they are, prompts them to enter the name of a new database they want to create. It then checks if the entered database already exists in the DataBases directory and if it does, prints a message to that effect. If it doesn't exist, it creates a new directory with the entered name and give full permissions to the new directory and also append the current user's name to the owner.txt file in the new directory. If the current user is not listed as an admin in the DB_admins.db file, the script prints a message indicating that the user does not have admin privileges.

#### The Delete DataBase script:
This script checks if the current user is listed as an admin in the DB_admins.db file and if they are, it prints a list of available databases and prompts the user to enter the name of a database they want to delete from the list. It then checks if the entered database exists in the DataBases directory and if it does, it checks if the current user is the owner of the entered database. If the current user is the owner of the entered database, it deletes the entered database and prints a message indicating that the database has been deleted successfully. If the current user is not the owner of the entered database, it prints a message indicating that the user does not have permission to delete this database. If the entered database does not exist, it prints a message indicating that there is no database with the provided name. If the current user is not listed as an admin in the DB_admins.db file, the script prints a message indicating that the user does not have admin privileges.

#### The Create Table script:

#### The Insert Into Table script:
This script is used to insert a new row of data into a table in a specific database. The script first checks if the current user is listed as an admin in the DB_admins.db file. If the user is an admin, the script prompts the user to select a database and a table from a list of available databases and tables. It then checks if the user is the owner of the selected database. If the user is the owner, the script prompts the user to enter data for each column in the selected table. The script then checks if the entered ID value already exists in the table, and if so, it prompts the user to enter a unique value. After all the data is entered, the script appends the data to the selected table. If the user is not an admin or not the owner of the selected database, the script displays an error message.

#### The Select from DataBase script:
This script is used to display the contents of a table in a specific database. The script first prompts the user to select a database from a list of available databases. It then checks if the selected database exists in the DataBases directory. If the selected database exists, the script prompts the user to select a table from a list of available tables in the selected database. The script then checks if the selected table exists in the selected database directory. If the selected table exists, the script displays the contents of the selected table. If the selected database or table does not exist, the script does not display any data.
