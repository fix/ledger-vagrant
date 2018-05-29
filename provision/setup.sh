echo "Provisioning virtual machine..."

echo "Installing Utilities"
dpkg --add-architecture i386
apt-get update  > /dev/null
apt-get install git curl python-dev python-pip python-pil python-setuptools zlib1g-dev libjpeg-dev libudev-dev build-essential libusb-1.0-0-dev -y > /dev/null
apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 libc6-dev-i386 -y > /dev/null
pip install --upgrade setuptools
pip install ledgerblue

echo "Setting up BOLOS environment"
mkdir /opt/bolos
cd /opt/bolos

echo "Installing custom compilers, can take a few minutes..."
wget -q https://launchpad.net/gcc-arm-embedded/5.0/5-2016-q1-update/+download/gcc-arm-none-eabi-5_3-2016q1-20160330-linux.tar.bz2
tar xjf gcc-arm-none-eabi-5_3-2016q1-20160330-linux.tar.bz2
ln -s /opt/bolos/gcc-arm-none-eabi-5_3-2016q1/bin/arm-none-eabi-gcc /usr/bin/arm-none-eabi-gcc

wget -q http://releases.llvm.org/4.0.0/clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz
tar xvf clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz
mv clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-14.04 clang-arm-fropi
chmod 757 -R clang-arm-fropi/
chmod +x clang-arm-fropi/bin/clang
ln -s /opt/bolos/clang-arm-fropi/bin/clang /usr/bin/clang

echo "cloning sdk for nano s"
cd /opt/bolos/
git clone https://github.com/LedgerHQ/nanos-secure-sdk.git
cd nanos-secure-sdk/
git checkout tags/nanos-1421
cd /opt/bolos/

echo "finetuning rights for usb access"
wget -q -O - https://raw.githubusercontent.com/LedgerHQ/udev-rules/master/add_udev_rules.sh | bash
usermod -a -G plugdev vagrant

echo "Setting up bash profile"
echo "" >> /home/vagrant/.bashrc
echo "# Custom variables for Ledger Development" >> /home/vagrant/.bashrc
echo "export BOLOS_ENV=/opt/bolos" >> /home/vagrant/.bashrc
echo "export BOLOS_SDK=/opt/bolos/nanos-secure-sdk" >> /home/vagrant/.bashrc
echo "export ARM_HOME=/opt/bolos/gcc-arm-none-eabi-5_3-2016q1" >> /home/vagrant/.bashrc
echo "" >> /home/vagrant/.bashrc
echo "export PATH=\$PATH:\$ARM_HOME/bin" >> /home/vagrant/.bashrc
