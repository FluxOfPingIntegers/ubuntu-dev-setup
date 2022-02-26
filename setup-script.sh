sudo apt update
sudo apt upgrade
sudo apt install curl

curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable --rails
source ~/.rvm/scripts/rvm

sudo apt install sqlite3

sudo apt install postgresql postgresql-contrib
sudo -i -u postgres

sudo apt install nodejs
sudo apt install npm

