#!/bin/bash

if [ "$UID" -ne 0 ]; then

name=$(whoami)

filee="/home/bash/studentDetails.txt"
rollnum=$(cat "$filee" | grep "$name" | awk '{print $2}')
hostel=$(cat "$filee" | grep "$name" | awk '{print $3}')
room=$(cat "$filee" | grep "$name" | awk '{print $4}')

dir="/home/$hostel/$room/$name/userDetails.txt"

read -p "Enter your mess preference order (numeric sequence): " preference
echo "MessPreference: $preference" >> "$dir"
echo "$rollnum" >> "/home/HAD/mess.txt"

echo "Mess preferences updated."


else
filo="/home/HAD/mess.txt"
capacity=$(sed -n '2p' "$filo" | awk '{print $2}' 2>/dev/null)

while IFS= read -r line; do
  name=$(echo "$line" | awk '{print $1}')
  rollNumber=$(echo "$line" | awk '{print $2}')
  hostel=$(echo "$line" | awk '{print $3}')
  room=$(echo "$line" | awk '{print $4}')
  mess=$(echo "$line" | awk '{print $5}')
dir="/home/$hostel/$room/$name/userDetails.txt"  
preference=$(grep "MessPreference:" "$dir" | awk '{print $2}') 

 if [[ $(grep -c "^$preference$" "$messFile") -lt capacity ]]; then
      echo "$rollNumber allocated to Mess $preference"
    else
      # Allocate the student to the next available mess
      for (( i=1; i<=capacity; i++ )); do
        if [[ $(grep -c "^$i$" "$messFile") -lt capacity ]]; then
          echo "$rollNumber allocated to Mess $i"
          break
        fi
      done
    fi
  done < studentDetails.txt 2>/dev/null
fi
