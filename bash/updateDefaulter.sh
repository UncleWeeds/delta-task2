#!/bin/bash

warden_username=$(whoami)
hostel_name=${warden_username}

 fee_defaulters_file="/home/$hostel_name/feeDefaulters.txt"
 announcements_file="/home/$hostel_name/announcements.txt"

> "$fee_defaulters_file"
paid_students=0  

if [[ "$warden_username" != "Agate" && "$warden_username" != "GarentA" && "$warden_username" != "GarnetB" && "$warden_username" != "Opal" ]]; then
  echo "Error: Access denied. This script can only be executed by the hostel warden."
  exit 1
fi

 for student_dir in /home/$hostel_name/*/*; do
 student_username=$(basename "$student_dir")
 fee_file="$student_dir/fees.txt"

 if [ -f "$fee_file" ]; then
 # Read the last line of the fee file
 last_line=$(tail -n 1 "$fee_file")

 # Extract the roll number and fee status from the last line
 roll_number=$(echo "$last_line" | awk -F ':' '{print $2}')
 fee_status=$(echo "$last_line" | awk -F ':' '{print $NF}')

filee="/home/bash/studentDetails.txt" 
 roolnum=$(cat "$filee" | grep "$student_username" | awk '{print $2}')

if [ "$fee_status" != "Paid" ]; then
echo "Name: $student_username, Roll Number: $roolnum" >> "$fee_defaulters_file"

 else
      # Add the roll number to announcements.txt if the count is less than 5
      if [ "$paid_students" -lt 5 ]; then
        echo "$roolnum" >> "$announcements_file"
        ((paid_students++))
      fi
    fi
   else
     echo "Error: Fee file not found for student: $student_username"
  fi
done

exit 0
