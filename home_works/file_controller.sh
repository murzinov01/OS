#!bin/bash

# vars
fl="<file_name>"
help_var="I can:\n\n- create $fl\n- delete $fl\n- edit $fl\n- rename $fl >> <new_file_name>\n- move $fl >> <new_path>\n- copy <file_name1> >> <file_name2>\n\n- ls\n- help\n- exit\n\nWhat do you choose?\n"

clear

echo -e "\t\t\tHello, I'm the file controller!"
echo -e $help_var


while true
do

read a

IFS=' ' read -ra params <<< "$a"

  # Create a file
  if [[ "$a" == "create"* ]]
  then
    touch "${params[1]}"
    if [ `echo $?` = "0" ]
    then
      echo "${params[1]} was created successfully!"
    else
      echo "ERROR: this file can not be created"
    fi
      
  # Delete a file
  elif [[ "$a" == "delete"* ]]
  then
    rm "${params[1]}"
    if [ `echo $?` = "0" ]
    then
      echo "${params[1]} was deleted successfully!"
    else
      echo "ERROR: this file can not be deleted"
    fi
      
  # Rename a file
  elif [[ "$a" == "rename"* ]]
  then
    mv "${params[1]}" "${params[2]}"
    if [ `echo $?` = "0" ]
    then
      echo "${params[1]} was renamed to ${params[2]} successfully!"
    else
      echo "ERROR: this file can not be renamed"
    fi
      
  # Edit a file
  elif [[ "$a" == "edit"* ]]
  then
    nano "${params[1]}"
    
  # Move a file  
  elif [[ "$a" == "move"* ]]
  then
    mv "${params[1]}" "${params[2]}"
    if [ `echo $?` = "0" ]
    then
      echo "${params[1]} was moved to ${params[2]} successfully!"
    else
      echo "ERROR: this file can not be moved"
    fi
      
  # Copy a file  
  elif [[ "$a" == "copy"* ]]
  then
    cp "${params[1]}" "${params[2]}"
    if [ `echo $?` = "0" ]
    then
      echo "${params[1]} was copied to ${params[2]} successfully!"
    else
      echo "ERROR: this file can not be copied"
    fi
      
  # ls
  elif [[ "$a" == "ls"* ]]
  then
    ls
       
  # help      
  elif [[ "$a" == "help"* ]]
  then
    echo -e $help_var
    
  # Exit 
  elif [[ "$a" == "exit"* ]]
  then
    exit 0        
  fi

done

