#! /bin/sh
echo "Checking if the Script is Running as Super user....."
if [ "$EUID" -ne 0 ]
  then echo; echo "Kindly run this as Super User"
  echo
  exit
fi
clear 
fdisk -l
printf 'Enter your Linux Installation Parition (Ex:sda1) : ' ;read -r parition
clear
sudo mkdir /media/$partition
sudo mount /dev/$parition /media/$parition
sudo chroot /media/$parition
clear
getent passwd | cut -d : -f 1
printf 'Kindly Enter the Name of the User you want to reset from above list: ' ;read -r username
passwd $username
clear
echo "Mission Accomplished, Exiting........"
exit


