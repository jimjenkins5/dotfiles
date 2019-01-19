sudo apt-get update && sudo apt-get upgrade -y

# miscellaneous packages for stuff and things
sudo apt-get -qy install build-essential python-dev cmake jq

# nvm install
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
nvm install v8.10.0 && nvm use lts/*

# standard global npm packages
npm i -g npm@6.4.1 serverless

# mysql
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -qy install mysql-server
