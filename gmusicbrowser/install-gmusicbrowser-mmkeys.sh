#!/bin/bash
#
# Description: install the gmusicbrowser-mmkeys.sh script.
# Please visit http://xubuntugeek.blogspot.com/2011/11/use-multimedia-keys-with-gmusicbrowser.html to learn how to use this script with keyboard multimedia keys.
# Author: Wilson Santos (wilson.bl.santos@gmail.com)
#
# Version: 1.0

# Use xfconf-query to assign multimedia keys to gmusicbrowser commands.
for gfunc in PlayPause:XF86AudioPlay PrevSong:XF86AudioPrev NextSong:XF86AudioNext Stop:XF86AudioStop; do
  cmd=$(echo $gfunc | cut -f 1 -d ':')
  key=$(echo $gfunc | cut -f 2 -d ':')
  xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/$key -n -t string -s "gmusicbrowser-mmkeys.sh $cmd"
done
sudo wget -q -O /usr/local/bin/gmusicbrowser-mmkeys.sh http://goo.gl/0nvCN
sudo chmod +x /usr/local/bin/gmusicbrowser-mmkeys.sh
