#!/bin/bash
# set -x
clear
#-----------------------------------------------------------
# ABOUT                  (C)opyleft Keld Norman - Jan, 2022
#-----------------------------------------------------------
#
# This script will scrape all google dorks from the official
# dorks website.
#
# They really need to get an API to get this data with or 
# make a "Download all dorks" link..
#
#-----------------------------------------------------------
# VARIABLES
#-----------------------------------------------------------
USER_AGENT='Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.6 (KHTML, like Gecko) Chrome/20.0.1090.0 Safari/536.6'
ALL_DORKS_FILE="./dork.list"
#-----------------------------------------------------------
# Banner for the 1337'ishness
#-----------------------------------------------------------
cat << "EOF"
 
 ,'.-.'.      Find all the Dorks ! 
 '\~ o/` ,,
  { @ } f       The hard way..
  /`-'\$ 
 (_/-\_)           "Wruf"

EOF
#-----------------------------------------------------------
# MAIN
#-----------------------------------------------------------
printf " Standby while fetching all the dorks (this might take some time)..\n\n"
printf " $(date) - Started dorking..\n\n"
I=1
> ${ALL_DORKS_FILE:-error}
LOOP=1
while [ ${LOOP:-0} -eq 1 ]; do 
 printf "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\r Testing dork page $I.."
 RAW_HTML=$(timeout 30 curl -L -k -s --user-agent "${USER_AGENT}" "https://www.exploit-db.com/ghdb/${I}" -o - 2>/dev/null |tr -cd '\000-\177')
 if [ $(echo "${RAW_HTML}"|egrep -E -ia '<TITLE>|</TITLE>'|head -1|grep -ic "404 Page Not Found") -eq 1 ]; then 
  printf "\n\n ### STOPPED - Found 404 when asking for page #${I}\n"
  LOOP=0
 fi
 DORK=$(echo "${RAW_HTML}"|html2text |grep -A1 "**** Google Dork Description: ****"|tail -1)
 echo ${DORK} >> ${ALL_DORKS_FILE:-error}
 let I++
done
printf "\n $(date) - Finished dorking - Found ${I} dorks !\n\n"
#-----------------------------------------------------------
# END OF SCRIPT
#-----------------------------------------------------------