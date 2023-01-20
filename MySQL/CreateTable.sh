#!/usr/bin/bash

# Get the current user's username
user=$(whoami)

# Check if the current user is listed as an admin in the DB_admins.db file
if [[ $(grep "$user" DB_admins.db | wc -l) -eq 1 ]]; 
then
	# Print the list of available databases
	ls "./DataBases"
	read database
	# Check if the current user is the owner of the entered database
	if [[ $(grep $user ./DataBases/$database/owner.txt | wc -l) -eq 1  ]]
	then
		# Prompt the user to enter the table name
		echo "Please, Enter the table name"
		read tablename
		# Prompt the user to enter the number of columns
		echo "Please, Enter columns number"
		read colnum
		# Check if the entered table name already exists
		if [[ $(ls -R | grep -i $tablename.table | wc -l) -eq 1  ]]
		then
			# If the entered table name already exists, print a message
			echo "Sorry, This table is already exists."
		else
			# If the entered table name does not exist, create a new table with the entered name
			touch "./DataBases/$database/$tablename.table"
			# Loop to add the entered number of columns
                        for (( i=1;i<=$colnum;i++ ))
                        do
				# Prompt the user to enter the column name
                               read -p "Please, Enter the column name $i: " column
				# Add the entered column name to the table
                               echo -n $column >> "./DataBases/$database/$tablename.table"
				# Add a comma after each column name except the last column
				if [[ $i -lt $colnum ]]
				then

					echo -n "," >> "DataBases/$database/$tablename.table"
				else
					echo " " >> "DataBases/$database/$tablename.table"
				fi
                        done
		fi
	else
		# If the current user is not the owner of the entered database, print a message
		echo "Sorry, you don't have premission to create table in this DataBase"
	fi
else
	# If the current user is not listed as an admin, print a message
	echo "Sorry, You don't have admin priviliges!"
fi

