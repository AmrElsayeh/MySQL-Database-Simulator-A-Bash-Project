#!/usr/bin/bash

# Get the current user's username
user=$(whoami)

# Check if the current user is listed as an admin in the DB_admins.db file
if [[ $(grep "$user" DB_admins.db | wc -l) -eq 1 ]]; 
then
        # Print the list of available databases
        echo "Please enter the name of the Database you'd like to delete from the following."
	ls "./DataBases"
	read database
	# Check if the entered database exists in the DataBases directory
	if [[ $(ls -R | grep -i /$database.sql | wc -l) -eq 1 ]]
	then
		# Check if the current user is the owner of the entered database
		if [[ $(grep $user ./DataBases/$database/owner.txt | wc -l) -eq 1  ]]
		then
			# Delete the entered database
			rm -r "DataBases/$database"
			echo "The DataBase is Deleted Successfully."
		else 
			# If the current user is not the owner of the entered database, print a message
			echo "Sorry, You don't have premission to delete this DB "
		fi
	else
		# If the entered database does not exist, print a message
		echo "There is no DataBase with the provide name!"
	fi
else
	# If the current user is not listed as an admin, print a message
	echo "Sorry, You don't have admin priviliges!"
fi
