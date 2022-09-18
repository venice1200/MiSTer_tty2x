# MiSTer_tty2x  
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://github.com/venice1200/MiSTer_tty2oled/blob/main/LICENSE)  
  
An **Universal tty2x Script Daemon** which sends **only** the Name of the Core,  
which is currently loaded by the Mister FPGA, to the configured **tty** device.  
 
**Installation**  
Get the latest Release from this Repo and extract only the files to your MiSTer FPGA into the folder `/media/fat/tty2x`.  
Or use the following **One-Liner** from the MiSTer's Command Line:  
`wget https://github.com/venice1200/MiSTer_tty2x/archive/refs/heads/main.zip -O /tmp/tty2x.zip && unzip -j /tmp/tty2x.zip "MiSTer_tty2x-main/*" -d /media/fat/tty2x && rm /tmp/tty2x.zip`  
  
**tty Device**  
The default tty device is **/dev/ttyUSB0** and is set in `/media/fat/tty2x/tty2x.ini`.  
If you need to use another **tty** Device, configure yours in the `/media/fat/tty2x/tty2x-user.ini` file.  
Some examples are already in the file. Remove the leading "#" to activate the correct entry.  
  
**Options**  
The only option which can be deactivated is the possiblity to disable the "first transmission".  
Means, the value "QWERTZ" will not been sent to the tty Device to „clear“ the Arduino's receive and the MiSTer's send buffer.  
Uncomment the Option `#SENDQWERTZ="no"` in `/media/fat/tty2x/tty2x-user.ini` by removing the leading "#".  
  
**Autostart**  
If you run `/media/fat/tty2x/S60tty2x setup` the autostart entry for **tty2x**  
within `/media/fat/linux/user-startup.sh` will be created.  
