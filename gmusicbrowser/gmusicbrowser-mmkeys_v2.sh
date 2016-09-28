#!/bin/bash
#
# Description: install the gmusicbrowser-mmkeys.sh script.
# Please visit http://xubuntugeek.blogspot.com/2011/11/use-multimedia-keys-with-gmusicbrowser.html to learn how to use this script with keyboard multimedia keys.
# Author: Wilson Santos (wilson.bl.santos@gmail.com)
#
# Version: 1.1

INSTALL_SH=/usr/local/bin/gmusicbrowser-mmkeys.sh
function install {
    # Use xfconf-query to assign multimedia keys to gmusicbrowser commands.
    for gfunc in PlayPause:XF86AudioPlay PrevSong:XF86AudioPrev NextSong:XF86AudioNext Stop:XF86AudioStop; do
        cmd=$(echo $gfunc | cut -f 1 -d ':')
        key=$(echo $gfunc | cut -f 2 -d ':')
        xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/$key -n -t string -s "gmusicbrowser-mmkeys.sh $cmd"
    done
    sudo cp $0 ${INSTALL_SH}
    sudo chmod +x ${INSTALL_SH}
}

function uninstall {
    # Remove the shortcuts created
    for key in XF86AudioPlay XF86AudioPrev XF86AudioNext XF86AudioStop; do
        xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom/$key -r
    done
    sudo rm -f ${INSTALL_SH}
}

function mmkeys {
    case $1 in 
        PlayPause | PrevSong | NextSong | Stop ) 
            gmusicbrowser -cmd "$1"
            ;;
        *)
            echo "[ERROR] Unknown option: '"$1"'"
    esac
}


case $1 in
    "install")
        install
        ;;
    "uninstall")
        uninstall
        ;;
    *)
        mmkeys $1
        ;;
esac
