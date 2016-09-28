#!/bin/bash
#
# Description: uninstall the gmusicbrowser-mmkeys.sh script.
# Please visit http://xubuntugeek.blogspot.com/2011/11/use-multimedia-keys-with-gmusicbrowser.html to learn how to use this script with keyboard multimedia keys.
# Author: Wilson Santos (wilson.bl.santos@gmail.com)
#
# Version: 1.0

# Remove the shortcuts created
for key in XF86AudioPlay XF86AudioPrev XF86AudioNext XF86AudioStop; do
  xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/$key -r
done
sudo rm -f /usr/local/bin/gmusicbrowser-mmkeys.sh
