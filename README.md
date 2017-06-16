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
cd blue-app-xrp
```
- Connect to the machine `vagrant ssh`
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

Whenever you change source file: make clean -> make -> make delete -> make load
