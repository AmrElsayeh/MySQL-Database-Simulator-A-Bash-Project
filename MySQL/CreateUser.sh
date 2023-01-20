#!/usr/bin/bash

# Get the current user's username
user=$(whoami)

# Check if the current user is listed as an admin in the DB_admins.db file
if [[ $(grep "$user" DB_admins.db | wc -l) -eq 1 ]]; 
then
        # Prompt the user to enter the name of the new user they want to create
        echo "Please enter the name of the user you'd like to create"
	read name 
	# Check if the user already exists in the DB_admins.db file
	if [[ $(grep -w "$name" DB_admins.db| wc -l ) -eq 1 ]]
	then
		# If the user already exists, print a message
		echo "The user is already exists"
	else
		# If the user does not exist, append their name to the DB_admins.db file
		echo "$name" >> ./DB_admins.db
	fi
else
	# If the current user is not listed as an admin, print a message
	echo "Sorry, You don't have admin priviliges!"
fi
