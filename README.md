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

- Eighth: During running setup-script.sh you probably ran into the postgresql cli.  You will now need to create a SUPERUSER account that reflects your ubuntu username. open terminal or VS code and navigate to __/etc/postgresql__ there you will see a folder that is simply a number.  Remember this number, it will be refered to as NUMBER in the following instructions.  Initially postgresql will not allow you to login as a user other than the default postgres and it won't even let you login to that if your ubuntu username is not postgres.  In order to fix this enter the following:
```
sudo nano /etc/postgresql/NUMBER/main/pg_hba.conf
```
After entering your password you will be presented with a large text file, scroll down to the bottom until you see a line that resembles:
```
# Database administrative login by Unix domain socket
local all   postgres    peer
```
you will need to change __peer__ to __md5__ and hit __CTRL+X__ to exit.  enter __y__ when prompted to save then hit __enter__

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