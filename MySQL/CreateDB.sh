#!/usr/bin/bash

# Get the current user's username
user=$(whoami)

# Check if the current user is listed as an admin in the DB_admins.db file
if [[ $(grep "$user" DB_admins.db | wc -l) -eq 1 ]]; 
then
        # Prompt the user to enter the name of the new database they want to create
        echo "Please enter the name of the Database you'd like to create"
	read database
       # Check if the entered database already exists in the DataBases directory
	if [[ $(ls -R | grep -i /$database.sql | wc -l) -eq 1 ]]
	then
		# If the entered database already exists, print a message
		echo "This DataBase is already exists."
	else
		# If the entered database does not exist, create a new directory with the entered name	
		mkdir -p "./DataBases/$database/$database.sql"
		# Give full permissions to the new directory
		chmod 777 "./DataBases/$database"
		
		# Append the current user's name to the owner.txt file in the new directory
		echo $user >> "./DataBases/$database/owner.txt"
		echo "The DataBase is Created Successfully."
	fi
else
	# If the current user is not listed as an admin, print a message
	echo "Sorry, You don't have admin priviliges!"
fi
