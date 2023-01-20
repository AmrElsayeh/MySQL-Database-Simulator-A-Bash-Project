#!/usr/bin/bash

# Get the current user's username
user=$(whoami)

# Check if the current user is listed as an admin in the DB_admins.db file
if [[ $(grep "$user" DB_admins.db | wc -l) -eq 1 ]]; 
then
	# Print the list of available databases
	echo $(ls "./DataBases")
	read database
	# Check if the current user is the owner of the entered database
	if [[ $(grep $user ./DataBases/$database/owner.txt | wc -l) -eq 1  ]]
	then
		# Print the list of tables in the selected database
		echo "Please select one table from the following."
		echo $(ls DataBases/$database/ | grep .table)
		read tablename
		# Check if the entered table name exists
		if [[ $(ls -R | grep $tablename.table | wc -l) -eq 1 ]]
		then
			# remove empty lines from the table file
			sed -i '/^$/d' ./DataBases/$database/$tablename.table
			#Get the table's header
			header=($(head -n 1 ./DataBases/$database/$tablename.table | awk -F "," '{for(i=1;i<=NF;i++) print $i}' ))
			echo "Enter the data for the following columns."
			# Loop to insert data for each column
			for column in "${header[@]}"
			do
				# Prompt the user to enter data for each column
				read -p "$column: " data
				# Check if the entered ID value already exists in the table 
				if [[ $(grep -w "$data" ./DataBases/$database/$tablename.table | wc -l) -eq 1 ]] && [[ $column == "Id" ]]
		       		then
		       		#remove empty lines from the table file
		       		sed -i '/^$/d' ./DataBases/$database/$tablename.table
    					echo "This Id already exists in the table, please enter a unique value."
    					break
				fi
				# Add the entered data for each column to a variable
                    		column_data+="$data,"
                	done
			# remove the trailing comma from the variable
			column_data=${column_data%,}
			# append the data for each column to the table
			echo "$column_data" >> ./DataBases/$database/$tablename.table
		else
			echo "Sorry, This table is not exists."
			break
		fi
	else
		echo "Sorry, you don't have premission to insert in this DataBase"
	fi
else
	echo "Sorry, You don't have admin priviliges!"
fi 

