#!/bin/bash

warden=$(whoami)
signOutinfo="/home/bash/signOutInfo.txt"
# Read sign-out requests from userDetails.txt
file="/home/bash/signOutInfo.txt"
request=$(tail -n1 "$file" | awk '{print $6}')
name=$(tail -n1 "$file" | awk '{print $4}')
  read -p "Student has requested sign-out until $request. Approve? (Y/N): " approval
  if [[ $approval == [Yy] ]]; then
    echo "SignOutApproval: $request"
    echo "SignOut request by $name on $request has been approved by $warden" >> signOutInfo.txt
    write "$name" "Your sign-out request until $request has been approved by $warden."  &> /dev/null
  else
    echo "Sign-out request for $request rejected."
    echo "Sign-out request by $name has been rejected by $warden" >> signOutInfo.txt
    write "$name" "Your sign-out request until $request has been rejected by $warden."  &> /dev/null
  fi
