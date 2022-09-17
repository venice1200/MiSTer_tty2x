# MiSTer_tty2x
Simple Script Deamon sending actual loaded MiSTer FPGA Corename to a tty device
  
I have created out of the tty2oled project a simple script daemon called tty2x which sends nothing more than the Corename to the configured tty device.  
  
If you like to test, get the files from the Repo and extract the content to your MiSTer into /media/fat/tty2x.  
  
The default device is ttyUSB0 and is set in tty2x.ini and can be overwritten with values in tty2x-user.ini.  
  
The only option which can be deactivated is the possiblity to disable the "first transmission" which „flows“ the Arduino receive buffer.  
Means, the value "QWERTZ" will not sent to the tty Device as first data.  
Uncomment the Option #SENDQWERTZ="no" in tty2xxx-user.ini by removing the leading "#" for this.  
  
If you need to use another tty Device, configure yours in the tty2x-user.ini file.  
Some examples are already in the file. Remove the leading "#" to activate the entry.  

If you run `/media/fat/tty2x/S60tty2x setup`  
the autostart entry for tty2x within /media/fat/linux/user-startup.sh is created.
