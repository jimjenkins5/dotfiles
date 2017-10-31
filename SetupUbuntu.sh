sudo apt-get update && sudo apt-get upgrade -y

# miscellaneous packages for stuff and things
sudo apt-get -qy install build-essential libevent-dev libncurses5-dev

# tmux 2.6
cd ~
wget https://github.com/tmux/tmux/releases/download/2.6/tmux-2.6.tar.gz
tar -xzf tmux-2.6.tar.gz
cd ~/tmux-2.6/
./configure && make
sudo make install
cd ~ && rm -rf ~/tmux-2.6

# nvm install
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
nvm install lts/* && nvm use lts/*

# standard global npm packages
npm i -g serverless grunt webpack

# mysql
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -qy install mysql-server
