#!/usr/bin/bash

# Get the current user's username
user=$(whoami)

# Check if the current user is listed as an admin in the DB_admins.db file
if [[ $(grep "$user" DB_admins.db | wc -l) -eq 1 ]]
then
	echo "Please choose one of the follwoing users to be deleted"
	cat DB_admins.db
	read name
	# Check if the entered user name exist in DB_admins.db
	if [[ $(grep -w "$name" DB_admins.db | wc -l) -eq 1 ]]
	then
		# check if the entered name is oracle, if yes it can not be deleted
		if [[ $name == "oracle" ]]
		then
			echo "This user can not be deleted!"
		else
			# delete the entered name from the DB_admins.db
			sed -i "/\b$name\b/d" "DB_admins.db"
		fi
	else
		# if entered name does not exist in DB_admins.db
		echo "This name is not listed in admins list."
	fi
else
	# If the current user is not listed as an admin, print a message
	echo "Sorry, You don't have admin priviliges!"
fi
