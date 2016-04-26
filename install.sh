#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo "Le script doit être lancé en root: # sudo $0" 1>&2
  exit 1
fi

LISTE=""
LISTE=$LISTE" vlc x264 ffmpeg2theora oggvideotools istanbul shotwell mplayer hugin nautilus-image-converter pavucontrol gimp gimp-save-for-web ogmrip transmageddon guvcview wavpack mppenc faac flac vorbis-tools faad lame nautilus-script-audio-convert cheese sound-juicer picard arista nautilus-arista milkytracker mypaint"
LISTE=$LISTE" guake build-essential vim git git-core gparted ubuntu-restricted-extras wget zsh"

ADDAPT="add-apt-repository -y"
UBUNTUVERSION=`lsb_release -cs`
echo "Add repository for Ubuntu $UBUNTUVERSION"

$ADDAPT ppa:shutter
LISTE=$LISTE" shutter"
$ADDAPT ppa:ubuntu-wine
LISTE=$LISTE" wine"

echo "Update package list"
apt update

echo "Upgrade system"
apt upgrade

echo "Install those package: $LISTE"
apt install $LISTE

chsh -s /bin/zsh

cd ~/

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
#git clone git@github.com:CapsHil/zshrc.git
#mv zshrc/.zshrc ./
#rm -rf zshrc

git clone git@github.com:CapsHil/vimrc.git
mv vimrc/.vim ./
rm -rf vimrc

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
apt update
apt install google-chrome-stable
