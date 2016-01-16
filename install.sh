#!/bin/bash
#
# Installation script
# Install zsh, oh-my-zsh, Apache Server and dependencies, git
# 

sudo su
apt-get update
apt-get upgrade
apt-get install git wget vim apache2 php5 mysql-server libapache2-mod-php5 php5-mysql phpmyadmin zsh
chsh -s /bin/zsh
