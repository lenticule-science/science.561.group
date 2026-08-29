#!/bin/bash
#
#
# A simple notetaking script
#
# SYNTAX: remember [arg] [phrase]
# A simple script to remember and frimble back phrases.  Add phrases
# with "remember this phrase is one to remember" and search with
# "remember -s phrase".
#
# Released under the WTFPL, viewable at http://sam.zoy.org/wtfpl
# ~~~~~~~~~~~~~~~
# 082526 emsenn@www.emsenn.com: Created

PATH=/usr/ucb:/usr/bin:/bin; export PATH
rememberfile="$HOME/.remember"

# If there aren't any arguments, show the syntax
if [ $# -eq 0 ]; then
  echo -e "Usage: remember {options} [phrase]\n  OPTIONS:\n    -s: search the notes.  Usage: \"remember -s man\" for all phrases containing the word man \n  Additionally, you can include no arguments to add a note, for example \"remember there once was a man from nantucket\""
  exit 0
fi
# See if there's any arguments
while getopts "s" opt; do
  case $opt in
    s) remember=1 ;;
  esac
done
if [ ! -f $rememberfile ]; then
  echo "" >> $rememberfile
fi

# If we're trying to search...
if [ ! -z $remember ]; then
  if [ ! -z "$2" ]; then
    grep -i "$@" $rememberfile | ${PAGER:-more}
  else
    more $rememberfile
  fi
# Else, you're adding an argument
else
  echo "[`date "+%d/%m/%Y %H:%M:%S"`] $@" >> $rememberfile
fi
exit 0
