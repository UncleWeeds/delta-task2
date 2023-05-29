#!/bin/bash
name=$(whoami)
filee="/home/bash/studentDetails.txt"
hostel=$(cat "$filee" | grep "$name" | awk '{print $3}')
signOutinfo="/home/bash/signOutInfo.txt"
   warden="$hostel"
   return_date=""

  read -p "Enter the return date (YYYY-MM-DD): " return_date
  echo "SignOut request by $name till $return_date" >> signOutInfo.txt

  # Send a direct message to the warden
  write "$warden" "You have received a message from $name" &> /dev/null

if [[ ${?} -eq 0 ]]; then
  echo "Sign-out request submitted. Waiting for approval."
fi

# Execute the signOut function when the alias is run
alias signOut="signOut"
