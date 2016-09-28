#!/bin/bash
#
# Description: send 'Play/Pause/Stop/NextSong/PreviousSong' commands to gmusicbrowser music player.
# Please visit http://xubuntugeek.blogspot.com/2011/11/use-multimedia-keys-with-gmusicbrowser.html to learn how to use this script with keyboard multimedia keys.
#
# Author: Wilson Santos (wilson.bl.santos@gmail.com)
#
# Vesion: 1.0

case $1 in 
  PlayPause | PrevSong | NextSong | Stop ) 
    gmusicbrowser -cmd "$1"
    ;;
  *)
    echo "[ERROR] Unknown option: '"$1"'"
esac
