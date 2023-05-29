#!/bin/bash

if [[ "${UID}" -ne 0 ]]
then
   echo "Please use this as an Admin my friend" >&2
   exit 1
fi


while IFS= read -r line; do
  name=$(echo "$line" | awk '{print $1}')
  rollNumber=$(echo "$line" | awk '{print $2}')
  hostel=$(echo "$line" | awk '{print $3}')
  room=$(echo "$line" | awk '{print $4}')
  mess=$(echo "$line" | awk '{print $5}')
  messpref=$(echo "$line" | awk '{print $6}')

 # Set ownership and permissions for the directories
  sudo chown -R "${name}:${name}" "/home/$hostel/$room/${name}"
  sudo chmod 700 "/home/$hostel/$room/$name"
  sudo chmod 600 "/home/$hostel/$room/$name/userDetails.txt"
  sudo chmod 600 "/home/$hostel/$room/$name/fees.txt"

    sudo chown "${hostel}:${hostel}" "/home/${hostel}"
    sudo chmod 750 "/home/${hostel}"

   sudo usermod -aG "${hostel}" "${name}"
   sudo usermod -aG HAD "${name}"  
# Set permissions for hostel announcements and feeDefaulters
  sudo chown "${hostel}:${hostel}" "/home/$hostel/announcements.txt"
  sudo chown "${hostel}:${hostel}" "/home/$hostel/feeDefaulters.txt"
  sudo chmod 640 "/home/$hostel/announcements.txt"
  sudo chmod 640 "/home/$hostel/feeDefaulters.txt"
sudo setfacl -R -m u:HAD:rwx /home
sudo setfacl -R -m u:$name:rw /home/HAD/mess.txt
sudo setfacl -R -m u:$name:rw /home/HAD/allocated_messes.txt
sudo setfacl -R -m u:$name:rx /home/bash
sudo setfacl -R -m u:$hostel:rwx /home/$hostel
sudo setfacl -R -m u:$hostel:rx /home/bash
sudo setfacl -R -m u:$hostel:rw /home/bash/signOutInfo.txt
sudo setfacl -R -m u:$name:rw /home/bash/signOutInfo.txt
done < studentDetails.txt
