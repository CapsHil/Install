#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo "Le script doit être lancé en root: # sudo $0" 1>&2
  exit 1
fi

LISTE=""
LISTE=$LISTE" vlc x264 ffmpeg2theora oggvideotools istanbul shotwell mplayer hugin nautilus-image-converter pavucontrol gimp gimp-save-for-web ogmrip transmageddon guvcview wavpack mppenc faac flac vorbis-tools faad lame nautilus-script-audio-convert cheese sound-juicer picard arista nautilus-arista milkytracker mypaint"
LISTE=$LISTE" build-essential vim git git-core gparted ubuntu-restricted-extras"

ADDAPT="add-apt-repository -y"
UBUNTUVERSION=`lsb_release -cs`
echo "Add repository for Ubuntu $UBUNTUVERSION"

$ADDAPT ppa:shutter
LISTE=$LISTE" shutter"
$ADDAPT ppa:ubuntu-wine
LISTE=$LISTE" wine"

echo "Update package list"
apt-get update

echo "Upgrade system"
apt-get upgrade

echo "Install those package: $LISTE"
apt-get install $LISTE

sudo su
apt-get update
apt-get upgrade
apt-get install git wget vim apache2 php5 mysql-server libapache2-mod-php5 php5-mysql phpmyadmin zsh
chsh -s /bin/zsh
