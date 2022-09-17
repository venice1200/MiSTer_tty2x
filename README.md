# MiSTer_tty2x
Simple MiSTer FPGA Script Daemon which sends the name of the currently loaded core to the configured **tty** device.  
  
Get the files from this Repo and copy the content to your MiSTer FPGA into the folder `/media/fat/tty2x`.  
  
The default device is **/dev/ttyUSB0** and is set in `/media/fat/tty2x/tty2x.ini`.  
But the default device can be overwritten with values in `/media/fat/tty2x/tty2x-user.ini`.  
  
The only option which can be deactivated is the possiblity to disable the "first transmission".  
Means, the value "QWERTZ" will not been sent to the tty Device to „flow“ the Arduino's receive and the MiSTer's send buffer.  
Uncomment the Option `#SENDQWERTZ="no"` in tty2xxx-user.ini by removing the leading "#" for this.  
  
If you need to use another **tty** Device, configure yours in the `/media/fat/tty2x/tty2x-user.ini` file.  
Some examples are already in the file. Remove the leading "#" to activate the correct entry.  

If you run `/media/fat/tty2x/S60tty2x setup`  
the autostart entry for **tty2x** within `/media/fat/linux/user-startup.sh` is created.
