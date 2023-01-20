#!/usr/bin/bash


# Use the 'select' command to present the user with a list of options
# from the 'option.txt' file
select x in $(cat ./option.txt) 
do
	# Check if the user selected "CreateUser"
	if [[ $x == "CreateUser" ]]
	then
		# Execute the CreateUser.sh script
		./CreateUser.sh
	# Check if the user selected "DeleteUser"
	elif [[ $x == "DeleteUser" ]]
	then
		# Execute the DeleteUser.sh script
		./DeleteUser.sh
	# Check if the user selected "CreateDatabase"
	elif [[ $x == "CreateDatabase" ]]
        then
               # Execute the CreateDB.sh script
               ./CreateDB.sh
        # Check if the user selected "DeleteDatabase"
        elif [[ $x == "DeleteDatabase" ]]
        then
       	 # Execute the DeleteDB.sh script
		./DeleteDB.sh
	# Check if the user selected "Create_A_New_Table_Inside_Database"
        elif [[ $x == "Create_A_New_Table_Inside_Database" ]]
        then
		# Execute the CreateTable.sh script
               ./CreateTable.sh
        # Check if the user selected "Insert_A_New_Row_in_a_Table"
        elif [[ $x == "Insert_A_New_Row_in_a_Table" ]]
        then
        	# Execute the InsertRow.sh script
               ./InsertRow.sh
        # Check if the user selected "Select_Data_from_Table"
        elif [[ $x == "Select_Data_from_Table" ]]
        then
        	# Execute the SelectData.sh script
                ./SelectData.sh
        # Check if the user selected "Exit"
	elif [[ $x == "Exit" ]]
	then
		exit
	fi
done

