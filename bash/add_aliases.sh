#!/bin/bash

alias genStudent="/home/bash/genStudent.sh"
alias updateDefaulter="/home/bash/updateDefaulter.sh"
alias feeBreakup="/home/bash/feeBreakup.sh"
alias messAllocation="/home/bash/messAllocation.sh"
alias signOut="/home/bash/superUser_Mode/signOut.sh"
alias signOutApproval="/home/bash/superUser_Mode/signOutApproval.sh"
alias permit="/home/bash/permit.sh"
alias signIn="/home/bash/superUser_Mode/signIn.sh"

echo "# Custom Aliases" >> ~/.bashrc
echo "alias genStudent=\"/home/bash/genStudent.sh\"" >> ~/.bashrc
echo "alias updateDefaulter=\"/home/bash/updateDefaulter.sh\"" >> ~/.bashrc
echo "alias feeBreakup=\"/home/bash/feeBreakup.sh\"" >> ~/.bashrc
echo "alias messAllocation=\"/home/bash/messAllocation.sh\"" >> ~/.bashrc
echo "alias signOut=\"/home/bash/superUser_Mode/signOut.sh\"" >> ~/.bashrc
echo "alias signOutApproval=\"/home/bash/superUser_Mode/signOutApproval.sh\"" >> ~/.bashrc
echo "alias permit=\"/home/bash/permit.sh\"" >> ~/.bashrc
echo "alias signIn=\"/home/bash/superUser_Mode/signIn.sh\"" >> ~/.bashrc

echo "# Custom Aliases" >> /etc/bash.bashrc
echo "alias genStudent=\"/home/bash/genStudent.sh\"" >> /etc/bash.bashrc
echo "alias updateDefaulter=\"/home/bash/updateDefaulter.sh\"" >> /etc/bash.bashrc
echo "alias feeBreakup=\"/home/bash/feeBreakup.sh\"" >> /etc/bash.bashrc
echo "alias messAllocation=\"/home/bash/messAllocation.sh\"" >> /etc/bash.bashrc
echo "alias signOut=\"/home/bash/superUser_Mode/signOut.sh\"" >> /etc/bash.bashrc
echo "alias signOutApproval=\"/home/bash/superUser_Mode/signOutApproval.sh\"" >> /etc/bash.bashrc
echo "alias permit=\"/home/bash/permit.sh\"" >> /etc/bash.bashrc
echo "alias signIn=\"/home/bash/superUser_Mode/signIn.sh\"" >> /etc/bash.bashrc

source ~/.bashrc

echo "Alias commands have been added to .bashrc file."
