sudo apt update
sudo apt upgrade
sudo apt install curl

curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable --rails
source ~/.rvm/scripts/rvm
/bin/bash --login
rvm install 3.1.0
rvm install 2.6.8
rvm install 2.6.1

sudo apt install sqlite3

sudo apt install postgresql postgresql-contrib
sudo -i -u postgres
sudo apt-get install postgresql-client libpq5 libpq-dev

sudo apt install nodejs
sudo apt install npm