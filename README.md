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
