#!/bin/bash
file="/home/bash/superUser_Mode/signOutInfo.txt"
current_date=$(date +%Y-%m-%d)
student=$(tail -n1 "$file" | awk '{print $4}')
last_line=$(tail -n1 "$file")

if [[ $last_line == *"approved"* ]]; then
return_date=$(grep "SignOut request by $student on" "$file" | awk '{print $6}')
warden=$(grep "SignOut request by $student on" "$file" | awk '{print $11}')
   if [[ "$current_date" > "$return_date" ]]; then
echo "You have exceeded the approved sign-out period. Please contact the warden."
echo "$student have exceeded the approval sign-out period." >> "$file" 
write "$warden" "The student has exceeded the approved sign-out period." &>/dev/null
else
echo "$student has returned back in time" >> "$file"
fi
fi
