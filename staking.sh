#/bin/bash

cd ~
  
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get install -y nano htop git
sudo apt-get install -y software-properties-common
sudo apt-get install -y build-essential libtool autotools-dev pkg-config libssl-dev
sudo apt-get install -y libboost-all-dev
sudo apt-get install -y libevent-dev
sudo apt-get install -y libminiupnpc-dev
sudo apt-get install -y autoconf
sudo apt-get install -y automake unzip
sudo add-apt-repository  -y  ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev
sudo apt-get install libzmq3-dev

cd /var
sudo touch swap.img
sudo chmod 600 swap.img
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000
sudo mkswap /var/swap.img
sudo swapon /var/swap.img
sudo free
sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
cd

wget https://github.com/kydcoin/KYD/releases/download/1.0.0/kyd-v1.0.0-linux-gnu.tar.gz
tar -xzf kyd-v1.0.0-linux-gnu.tar.gz

sudo apt-get install -y ufw
sudo ufw allow ssh/tcp
sudo ufw limit ssh/tcp
sudo ufw logging on
echo "y" | sudo ufw enable
sudo ufw status
sudo ufw allow 3434/tcp
  
cd
mkdir -p .kyd
echo "staking=1" >> kyd.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> kyd.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> kyd.conf
echo "rpcallowip=127.0.0.1" >> kyd.conf
echo "listen=1" >> kyd.conf
echo "server=1" >> kyd.conf
echo "daemon=1" >> kyd.conf
echo "logtimestamps=1" >> kyd.conf
echo "maxconnections=256" >> kyd.conf
echo "addnode=199.247.24.117" >> kyd.conf
echo "addnode=95.179.129.78" >> kyd.conf
echo "port=3434" >> kyd.conf
mv kyd.conf .kyd

  
cd
./kydd -daemon
sleep 30
./kyd-cli getinfo
sleep 5
./kyd-cli getnewaddress
echo "Use the address above to send your KYD coins to this server"
echo "If you found this helpful, please donate NORT to address"
