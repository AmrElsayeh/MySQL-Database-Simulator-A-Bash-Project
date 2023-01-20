#!/usr/bin/bash

# Prompt the user to select a database
echo "Please, Select one Database:"
echo $(ls ./DataBases/)

# Read the selected database from the user
read database

# Check if the selected database exists in the DataBases directory
if [[ $(ls -R | grep -i ./$database.sql | wc -l) -eq 1 ]]
then
	# Prompt the user to select a table
	echo "Please, Select one Table"
	echo $(ls ./DataBases/$database/ | grep .table)
	# Read the selected table from the user
	read tablename
	# Check if the selected table exists in the selected database directory
	if [[ $(ls -R | grep $tablename.table | wc -l) -eq 1 ]]
	then
		# Display the contents of the selected table
		cat ./DataBases/$database/$tablename.table
	fi
fi

