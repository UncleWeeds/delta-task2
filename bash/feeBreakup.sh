#!/bin/bash

# Prompt for the amount paid by the student
read -p "Enter the amount paid: " amount_paid
name=$(whoami)

filee="/home/bash/studentDetails.txt"
rollnum=$(cat "$filee" | grep "$name" | awk '{print $2}')
hostel=$(cat "$filee" | grep "$name" | awk '{print $3}')
room=$(cat "$filee" | grep "$name" | awk '{print $4}')

dir="/home/$hostel/$room/$name/fees.txt"


#Fee breakup percentages
tuition_fee_percentage=50
hostel_rent_percentage=20
service_charge_percentage=10
mess_fee_percentage=20

# Calculate the amounts for each category based on the fee breakup percentages
tuition_fee=$(echo "scale=2; $amount_paid * $tuition_fee_percentage / 100" | bc)
hostel_rent=$(echo "scale=2; $amount_paid * $hostel_rent_percentage / 100" | bc)
service_charge=$(echo "scale=2; $amount_paid * $service_charge_percentage / 100" | bc)
mess_fee=$(echo "scale=2; $amount_paid * $mess_fee_percentage / 100" | bc)

# Path to the fees.txt file
fees_file="$dir"

existing_content=$(tail -n +9 "$fees_file")

# Update the fees.txt file with cumulative amounts and transaction details
{
  echo "Cumulative amounts:"
  echo "TuitionFee: $tuition_fee"
  echo "HostelRent: $hostel_rent"
  echo "ServiceCharge: $service_charge"
  echo "MessFee: $mess_fee"
  echo "---"
  echo "Transaction details:"
  echo "$(date): Amount paid: $amount_paid"
  echo ""
  echo "$(whoami):$rollnum:Paid"
  cat "$existing_content"  # Append the existing content of fees.txt
} > "$fees_file"  

echo "Fees paid successfully."
