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
- Connect to the machine `vagrant ssh`
- inside the machine install your app for instance:
```
git clone https://github.com/LedgerHQ/blue-app-xrp
cd blue-app-xrp
```
- build your app
```
make clean
make
```
- connect your ledger Nano S to your computer
- install the app on your ledger
```make load```
- remove the app from the ledger
```make delete```
