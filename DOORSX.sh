#!/bin/bash

function DOORSXMENU() {

	ADVSEL=$(whiptail --title "DOORSX-MENU" --fb --menu "Select Script" 15 60 4 \
	"1" "Apply Pollen" \
	"2" "USB Booting" \
	"3" "Install Mr.Chromebox FW" 3>&1 1>&2 2>&3)
	
	case $ADVSEL in
	
	1)
	  shell
	  sudo su
	  echo "Attempting to apply Pollen..."
	  curl -Ls https://mercuryworkshop.github.io/Pollen/RootFS.sh | bash
	  whiptail --title "Note on Pollen" --msgbox "Now restart and run DOORSX again and select pollen and it should work" 8 45
	  
	  
	  safesync
	  echo "relocking rootfs..."
	  disable_rw_mount "${loopdev}p3"
	  
	  ;;
	 
    2)
	  shell
	  sudo su
	  echo "Attempting to apply Pollen..."
	  crossystem dev_boot_usb=1
	  
	  
	  safesync
	  echo "relocking rootfs..."
	  disable_rw_mount "${loopdev}p3"
	  
	  ;;
	
	
	3)
	  sudo su
	  echo "Attempting to download Mr.Chromebox..."
	  cd; curl -LOk mrchromebox.tech/firmware-util.sh && sudo bash firmware-util.sh
	  
	  
	  safesync
	  echo "relocking rootfs..."
	  disable_rw_mount "${loopdev}p3"
	  
	  ;;
	
	
	
	esac

}
DOORSXMENU
	  