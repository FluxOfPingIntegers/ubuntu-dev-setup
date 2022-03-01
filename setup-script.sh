# standard best practice prescript
sudo apt update
sudo apt upgrade

# install curl for legacy fix suggestions you will undoubtedly need/try later
sudo apt install curl

# Obtain keys that are required for upcomming RVM installation
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -

# Install RVM for ruby library management, various Ruby versions, and Rails
curl -sSL https://get.rvm.io | bash -s stable --rails
source ~/.rvm/scripts/rvm
/bin/bash --login
rvm install 3.1.0
rvm install 2.6.8
rvm install 2.6.1

# Install sqlite3, a basic SQL adapter I am familiar with from my time at FlatIron
sudo apt install sqlite3

# Install postgresql in order to allow broader compatibility for database deployment
sudo apt install postgresql postgresql-contrib
sudo -i -u postgres
sudo apt-get install postgresql-client libpq5 libpq-dev #

# Install nodejs in order to allow work with node javascript
sudo apt install nodejs

# Install node package manager in order to manage various nodes with ease.
sudo apt install npm

# Installing expo-cli for easy react-native development
sudo npm i -g expo-cli

# Instal node version manager in order to manage various versions of npm.
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash