# Vagrant config file to create your LEDGER environment dev

## Installation
- Install Vagrant and Virtualbox on your machine
- Run the following
```
> git clone https://github.com/fix/ledger-vagrant
> cd ledger-vagrant
> vagrant up
```
This will take a few minutes to install

## Compile your ledger app
- install your app under `apps/` for instance:
```
cd apps/
git clone https://github.com/LedgerHQ/blue-app-xrp
```
- Connect to the machine `vagrant ssh`
- build your app
```
cd apps/blue-app-xrp
make clean
make
```
- connect your ledger Nano S to your computer
- install the app on your ledger: `make load`
- remove the app from the ledger: `make delete`

## Known issues
- USB port is locked out of the host machine, making tests rather tedious (needs to tear down `vagrant halt`) to test ledger on host machine
- on Ubuntu, if the dongle is not found in the vagrant box, be sure that your **host** user belongs to the vboxusers group `sudo usermod -aG vboxusers <username>` (see https://askubuntu.com/questions/25596/how-to-set-up-usb-for-virtualbox/25600#25600)
- if you have some issue involving wrong TARGET_ID, please either upgrade your nano S firmware to 1.4.x, either downgrade nano s secure sdk tag to nano-1314:
```
cd /opt/bolos/nanos-secure-sdk
sudo git checkout tags/nanos-1314
```
