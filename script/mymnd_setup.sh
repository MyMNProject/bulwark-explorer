#!/bin/bash
# Download latest node and install.
#bwklink=`https://github.com/telostia/mymn-guides/raw/master/wallet/linux64/mymn-linux.tar.gz`
#mkdir -p /tmp/mymn
cd
# /tmp/mymn
#wget $bwklink
wget https://github.com/telostia/mymn-guides/raw/master/wallet/linux64/mymn-linux.tar.gz
tar -xzf mymn-linux.tar.gz
sudo mv mymn* /usr/local/bin
cd
rm mymn*
mkdir ~/.mymn

# Setup configuration for node.
rpcuser=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13 ; echo '')
rpcpassword=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32 ; echo '')
cat >~/.mymn/mymn.conf <<EOL
rpcuser=$rpcuser
rpcpassword=$rpcpassword
daemon=1
txindex=1
EOL

# Start node.
mymnd
