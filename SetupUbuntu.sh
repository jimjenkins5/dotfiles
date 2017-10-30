# miscellaneous packages for stuff and things
sudo apt-get install build-essential libevent-dev libncurses5-dev

# tmux 2.6
cd ~
wget https://github.com/tmux/tmux/releases/download/2.6/tmux-2.6.tar.gz
tar -xfz ~/tmux-2.6.tar.gz
cd ~/tmux-2.6/
./configure && make
sudo make install
cd ~ && rm -rf ~/tmux-2.6

# nvm install
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
nvm use lts/*

# mysql
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -q -y install mysql-server
