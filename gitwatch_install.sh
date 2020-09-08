#!/bin/bash
echo "Installing Dev Tools"
yum groupinstall "Development Tools" -y
yum install zlib-devel -y
echo "Removing Old GIT"
sudo yum remove git*

echo "Installing GIT v2.0"
cd /tmp
export VER="2.27.0"
wget https://github.com/git/git/archive/v${VER}.tar.gz
tar -xvf v${VER}.tar.gz
rm -f v${VER}.tar.gz
cd git-*
make configure
sudo ./configure --prefix=/usr
sudo make
sudo make install

echo "Installing Inotify Tools"
yum install inotify-tools

echo Installing FS-Watch
cd /tmp
wget https://github.com/emcrisostomo/fswatch/releases/download/1.9.3/fswatch-1.9.3.tar.gz
tar xzf fswatch-1.9.3.tar.gz
cd fswatch-1.9.3/
./configure
make
make install
echo "Install Gitwatch"
wget https://github.com/gitwatch/gitwatch/archive/master.zip
git config --global credential.helper store
unzip master.zip
cd gitwatch-master
sudo install -b gitwatch.sh /usr/local/bin/gitwatch

