#!/bin/bash
#
#
# Fetch a file via scp and return it when done
#
# SYNTAX: fetch [source] [destination]
# Grabs a file from the specified SSH server, opens it with whatever 
# your preferred Gnome application, and then, when the password for the
# server is typed again, sends it back and deletes the local copy.
#
# Released under the WTFPL, viewable at http://sam.zoy.org/wtfpl/
# ~~~~~~~~~~~~~~
# 081117 emsenn@emsenn.com: Created


PATH=/usr/ucb:/usr/bin:/bin; export PATH

# Check to make sure there's at least one argument.
if [ -z $1 ];
then
  echo "SYNTAX: fetch [source] [destination]"
  echo "NOTE: the destination is optional, the source is not"
  exit 0
fi

# Change these to match your settings...
USER="emsenn"
SERVER="emsenn.com"
DOCPATH="/home/emsenn/Documents"

DEST=$USER@$SERVER:$DOCPATH
FILE=$1
if [ -z $2 ];
then
  LOCAL=`echo "$FILE" | tr "/" "_"`
  LOCAL="$DOCPATH.$LOCAL"
else
  LOCAL=$2
fi

# Download the file, 
scp -q $DEST$FILE $LOCAL
if [ -f $LOCAL ];
then
  echo "File downloaded, opening now."
else
  echo "Oops!  Turns out that file doesn't exist.  Maybe you mistyped?"
  exit 0
fi

gnome-open $LOCAL 2>/dev/null
echo -e "\n\n\033[36m***When you're ready to return the file, please type the password again.***\033[0m"
scp -q $LOCAL $DEST$FILE
rm $LOCAL
echo "The file has been returned, safe and sound, to the server."
exit 1
