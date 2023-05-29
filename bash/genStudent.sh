#!/bin/bash

if [[ "${UID}" -ne 0 ]]
then
   echo "Please use this as an Admin my friend" >&2
   exit 1
fi
 
if [ -n "$1" ]; then
  # File is provided as command line argument
  file="$1"
  if [ ! -f "$file" ]; then
    echo "Error: File not found." >&2
    exit 1
  fi
else
  # File is not provided, prompt for input
  read -p "Enter student details (Name RollNumber Hostel Room): " -a details
  if [ -z "${details[*]}" ]; then
    echo "Error: No student details provided." >&2
    exit 1
  fi

  echo "${details[*]}" >> studentDetails.txt
  file="studentDetails.txt"
fi

while IFS= read -r line; do
  name=$(echo "$line" | awk '{print $1}')
  rollNumber=$(echo "$line" | awk '{print $2}')
  hostel=$(echo "$line" | awk '{print $3}')
  room=$(echo "$line" | awk '{print $4}')
  mess=$(echo "$line" | awk '{print $5}')
  messpref=$(echo "$line" | awk '{print $6}')


 PASSWORD="${name}"

sudo useradd -m  HAD
  echo "HAD:$PASSWORD" | sudo chpasswd || {
    echo "Error: Failed to create HAD user." >&2
    exit 1
  }

  sudo useradd -m  "$hostel"
  echo "$hostel:$PASSWORD" | sudo chpasswd || {
    echo "Error: Failed to create hostel user." >&2
    exit 1
  }

  sudo useradd -m  "$name"
  echo "$name:$PASSWORD" | sudo chpasswd || {
    echo "Error: Failed to create student user." >&2
    exit 1
  }

  sudo mkdir -p "/home/$hostel/$room/$name" || {
    echo "Error: Failed to create directory." >&2
    exit 1
  }
    userDetails="/home/$hostel/$room/$name/userDetails.txt"
    >"$userDetails"
    echo "Name: $name" > "$userDetails"
    echo "Roll Number: $rollNumber" >> "$userDetails"
    echo "Department:-"  >> "$userDetails"
    echo "Year: -" >> "$userDetails"
    echo "Hostel: $hostel" >> "$userDetails"
    echo "Allocated Mess: $mess" >> "$userDetails"
    echo "Month: -" >> "$userDetails"


  fees="/home/$hostel/$room/$name/fees.txt"
  touch "$fees" || {
    echo "Error: Failed to create fees file." >&2
    exit 1
  }

  announcements="/home/$hostel/announcements.txt"
  touch "$announcements" || {
    echo "Error: Failed to create announcements file." >&2
    exit 1
  }

  feeDefaulters="/home/$hostel/feeDefaulters.txt"
  touch "$feeDefaulters" || {
    echo "Error: Failed to create feeDefaulters file." >&2
    exit 1
  }

  mess="/home/HAD/mess.txt"
  touch "$mess" || {
    echo "Error: Failed to create mess file." >&2
    exit 1
  }
done < studentDetails.txt
