#!/bin/bash

# By venice & ojaksch
# Universal Version of the tty2x Daemon for other tty2-Projects
#
# 2022-09-12 Release
#

. /media/fat/tty2x/tty2x.ini
. /media/fat/tty2x/tty2x-user.ini

# Debug function
dbug() {
  if [ "${debug}" = "true" ]; then
    echo "${1}"
    if [ ! -e ${debugfile} ]; then							# log file not (!) exists (-e) create it
      echo "---------- tty2x Debuglog ----------" > ${debugfile}
    fi 
    echo "${1}" >> ${debugfile}								# send debug text
    echo "${1}"										# output debug text to console
  fi
}

# USB Send-Picture-Data function
senddata() {
  echo "${1}" > ${TTYDEV}								# send just the CORENAME with line feed "\n"
}

# ** Main **
if [ -c "${TTYDEV}" ]; then								# check for tty device
  dbug "${TTYDEV} detected, setting Parameter: ${BAUDRATE} ${TTYPARAM}."
  stty -F ${TTYDEV} ${BAUDRATE} ${TTYPARAM}						# set tty parameter
  sleep ${WAITSECS}
  if [ "${SENDQWERTZ}" = "yes" ]; then
    dbug "Send QWERTZ as first transmission"
    echo "QWERTZ" > ${TTYDEV}								# send "first transmission" to clear serial send buffer
    sleep ${WAITSECS}
  fi
  while true; do											# main loop
    if [ -r ${corenamefile} ]; then							# proceed if file exists and is readable (-r)
      newcore=$(cat ${corenamefile})							# get CORENAME
      dbug "Read CORENAME: -${newcore}-"
      dbug "Send -${newcore}- to ${TTYDEV}."
	  if [ "${newcore}" != "${oldcore}" ]; then					# proceed only if Corename has changed
        senddata "${newcore}"								# the "transmission"
        if [ "${debug}" = "false" ]; then						# debug mode off
	      inotifywait -qq -e modify "${corenamefile}"				# some quiteness for inotify
        fi
        if [ "${debug}" = "true" ]; then						# debug mode on
	      inotifywait -e modify "${corenamefile}"					# no quiteness :-)
        fi
		oldcore=${newcore}							# update new corname to "old" variable
      fi
    else										# CORENAME file not found
     dbug "File ${corenamefile} not found!"
    fi											# end if /tmp/CORENAME check
  done											# end while
else											# no tty detected
  echo "No ${TTYDEV} Device detected, abort."
  dbug "No ${TTYDEV} Device detected, abort."
fi											# end if tty check
# ** End Main **
