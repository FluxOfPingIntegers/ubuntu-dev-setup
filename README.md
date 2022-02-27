## Script For Pulling Flatiron Coursework

### Disclaimer

this is meant for my own personal use as I am preparing to migrate from a windows WSL2 environment to a true Linux environment

### Instructions For Setup

- First: Before installing Ubuntu I should copy all files I know I am going to need from this computer on to a USB, I should also make sure to record my wireless adapters driver information.

- Second: After following the installation procedures for [Ubuntu](https://ubuntu.com/download/desktop) and booting to the new Linux OS, I should connect to the internet via an ethernet jack. Once connected I need to lookup how to install the correct wireless driver for my system that is compatible with Ubuntu. For instance I found good instructions for broadcom drivers [here](https://askubuntu.com/questions/55868/installing-broadcom-wireless-drivers).

- Third: Download preferred browser.  [Here](https://www.google.com/chrome/?brand=YTUH&geo=US&gclid=CjwKCAiAvOeQBhBkEiwAxutUVBr86PdeC7juCWHUmOCDD2Lwgk5T5C8RQRrUKDtCVzxE_Cr6xD3WvxoC79kQAvD_BwE&gclsrc=aw.ds) is the link for chrome, make sure to sync settings in order to keep bookmarks.

- Fourth: Download a text editor to code with.  [Here](https://code.visualstudio.com/docs/?dv=linux64_deb) is the link for Visual Studio Code.

- Fifth: Download/Install git using [these](https://github.com/git-guides/install-git) instructions.  Use [these](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/checking-for-existing-ssh-keys) instructions to check/add GitHub account SSH key

- Sixth: Give execute permission to scripts by typing (The following should be done in this order: setup-script, pull-script):
```
chmod +x /path/to/thescript.sh
```
then run the script by entering (WARNING: you will at a certain point be prompted to enter your user password, also at a very specific point, postgresql will drop you into its CLI.  Configuration of postgresql will be handled in a later step.  Simply type __exit__ and hit enter to continue with the setup-script):
```
/path/to/thescript.sh
```

- Seventh: In order to allow RVM to run during terminal shells within VS code by default, you will have to
navigate to your .bashrc file and leave a pointer to rvm.  In order to do this within terminal, first enter:
```
cd ~
```
then
```
code .
```
then add the following to the line under __export PATH="$PATH:$HOME/.rvm/bin"__  in .bashrc and make sure you save
```
source ~/.rvm/scripts/rvm
```

- Eighth: This is the most complicated step.  During running setup-script.sh you probably ran into the postgresql cli.  You will now need to create a SUPERUSER account that reflects your ubuntu username. open terminal or VS code and navigate to __/etc/postgresql__ there you will see a folder that is simply a number.  Remember this number, it will be refered to as NUMBER in the following instructions.  Initially postgresql will not allow you to login as a user other than the default postgres and it won't even let you login to that if your ubuntu username is not postgres.  In order to fix this enter the following in terminal:
```
sudo nano /etc/postgresql/NUMBER/main/pg_hba.conf
```
After entering your password you will be presented with a large text file, scroll down to the bottom until you see a line that resembles:
```
# Database administrative login by Unix domain socket
local all   postgres    peer
```
focus on the column that says __peer__ please take a picture or remember the value of not only this entry but all the entries of similar columns below it.  We are going to TEMPORARILY change them to __trust__ in order to login to postgres, do our necessary changes, and then convert this file back to its previous state.  With the exception that this specific __peer__ entry will be finalized as __md5__.  Once you change this and all similar entries from __peer__ and __md5__ to __trust__ enter __CTRL+X__ to exit.  It will prompt you to save, enter __y__ then hit __enter__ once again

Now that you are back within terminal, enter the following to start the postgres cli:
```
sudo -u postgres psql postgres
```
you will know this is successful because you terminal will start with __postgres-#__. in order to create a super user enter the following (parts that are relative to your setup will be presented as lower case, please use your ubuntu username as username):
```
CREATE ROLE username WITH LOGIN SUPERUSER PASSWORD 'password';
```
after hitting enter you should see a confirmation of __CREATE ROLE__ . On the next line you should also create a database that shares the same name as the superuser you just created (hopefully using your ubuntu username).  Do this by entering:
```
CREATE DATABASE username;
```
after hitting enter you should see a confirmation of __CREATE DATABASE__ . At which point it will be time to revert that pg_hba.conf file back to its original state.  exit the postgresql cli by entering __exit__ and reenter the following once in terminal:
```
sudo nano /etc/postgresql/NUMBER/main/pg_hba.conf
```
refer to the picture you took or the notes, or hopefully your good memory to reassign the values of the entries you changed in a previous step back to how they were with the exception of the first entry which has to be __md5__ and may originally have been __peer__.  Once complete press __CTRL+X__ to exit, then __y__ to save, then hit __enter__ again to exit.  It is NOT safe to leave these settings to __trust__ as you did in a previous step.

### Progress

- Environmental setup script for Linux
* [x] prepare files for migration
* [x] setup wireless driver
* [x] download browser
* [x] download text editor
* [x] link github account and confirm SSH key
* [x] run scripts

- Write pull scripts for the following modules:

* [x] Module 1
* [x] Module 2
* [x] Module 3
* [x] Module 4
* [x] Module 5