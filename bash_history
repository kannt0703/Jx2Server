exit
userdel admin 
rm -rf /home/admin
vim /etc/hostname 
reboot 
poweroff 
gedit /etc/selinux/config 
systemctl stop firewalld
systemctl disable firewalld
poweroff 
unzip db_server.zip 
unzip payJX2.zip 
cd Desktop/
wget http://172.16.70.1/Tool_JXStudio.zip
wget http://172.16.77.23/Tool_JXStudio.zip
unzip Tool_JXStudio.zip 
yum install samba-winbind-clients -y
yum install libjpeg-turbo-devel libtiff-devel freetype-devel -y
yum -y install glibc.i686
yum -y install zlib.i686
yum -y install libstdc++.i686
yum -y install https://harbottle.gitlab.io/wine32/7/i386/wine32-release.rpm
yum -y install wine.i686
winecfg 
cd Desktop/
clear
wget http://172.16.70.1/server.zip
wget http://172.16.70.1/soft.zip
unzip server.zip
unzip soft.zip
yum -y install mariadb-server
systemctl start mariadb
systemctl enable mariadb
mysql_secure_installation
ln -s /var/lib/mysql/mysql.sock /tmp/mysql.sock
gedit /etc/my.cnf
systemctl restart mariadb
systemctl status mariadb
mysql -uroot -p
yum -y install epel-release yum-utils httpd
yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum-config-manager --enable remi-php73
yum install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd -y
cd /var/www/html/
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.0/phpMyAdmin-5.0.0-all-languages.zip
unzip phpMyAdmin-5.0.0-all-languages.zip
mv phpMyAdmin-5.0.0-all-languages admin
systemctl start httpd
systemctl enable httpd
cd /home/
ls
cd server/
ls
cd gw/
ls
cd Goddess/
ls
gedit KG_Goddess.ini
./KG_GoddessD 
 rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
yum-config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
yum install sublime-text
ls
./KG_GoddessD 
cd ..
ls
cd Bishop/
ls
gedit bishop.ini
./KG_BishopD 
cd ..
ls
cd RE
cd Relay/
ls
gedit relay.ini
./SO2RelayD 
rm -rf logs/*
./SO2RelayD 
gedit logs/KG_Relay/2020_01_03/KG_Relay_2020_01_03_09_56_33.log 
gedit relay.ini
./SO2RelayD 
gedit relay.inibk 
gedit relay.ini
./SO2RelayD 
gedit relay.ini
./SO2RelayD 
cd ..
ls
cd ..
ls
cd gs/
ls
gedit servercfg.ini 
./SO2GameSvrD345 
poweroff 
ifconfig 
exit
wget http://172.16.77.23/gm_item_tifuzhiyin.zip
unzip gm_item_tifuzhiyin.zip 
cd /home/server/
ls
cd gw/
ls
cd Goddess/
./KG_GoddessD 
exit
cd ..
ls
cd gs/
ls
./SO2GameSvrD345 
exit
cd ..
ls
cd Relay/
ls
./SO2RelayD 
exit
cd ..
ls
cd Bishop/
./KG_BishopD 
poweroff 
cd ..
ls
cd gs/
ls
gedit servercfg.ini 
./SO2GameSvrD345 
ls
cd script
cd ²Ø½£É½×¯
cd task_script/
ls
gedit task_head.lua 
cd ..
ls
cd ..
ls
cd ..
ls
cd script/Â²Ã˜Â½Â£Ã‰Â½Ã—Â¯/task_script/
ls
cd script
cd Â²Ã˜Â½Â£Ã‰Â½Ã—Â¯
cd ..
ls
nautilus
./SO2GameSvrD345 
gedit maps/worldset_1.ini 
./SO2GameSvrD345 
ls
cd maps
ls
gedit worldset_1.ini 
exit
cd ..
ls
cd Relay/
ls
gedit relay.ini
./SO2RelayD 
exit
cd ..
ls
cd Bishop/
ls
gedit bishop.ini
./KG_BishopD 
exit
ifconfig 
cd /home/server/gw/
cd Goddess/
ls
./KG_Goddess.ini
gedit KG_Goddess.ini
./KG_GoddessD 
poweroff 
cd ..
ls
cd gs/
ls
./SO2GameSvrD345 
ls maps
chmod +x maps/worldset_1.ini 
./SO2GameSvrD345 
exit
cd ..
ls
cd Relay/
./SO2RelayD 
exit
cd /home/server/
ls
cd gw/
ls
cd Goddess/
ls
./KG_GoddessD 
exit
cd..
ls
cd ..
ls
cd BI
cd Bishop/
./KG_BishopD 
poweroff 
cd ..
ls
cd gs/
./SO2GameSvrD345 
exit
cd Relay/
./SO2RelayD 
exit
cd /home/server/gw/
cd Goddess/
./KG_GoddessD 
exit
cd Bishop/
./KG_BishopD 
poweroff 
exit
cd /var/www/html/
gedit ketnoi.php
gedit dangky.php
gedit xuly.php
gedit dangky.php 
gedit xuly.php 
chmod +x *
chmod 777 *
php -v
rm -rf ketnoi.php 
rm -rf dangky.php 
rm -rf xuly.php 
gedit index.php
gedit style.css
gedit server.php
gedit errors.php
ls
chmod +x *
ls
mv index.php regiser.php
chmod 777 *
mv regiser.php index.php
gedit index2.php
cd Desktop/
wget http://192.168.70.1/horse.zip
unzip horse.zip 
./4
exit
./3
exit
cd /home/server/gs/
ls
cd maps
gedit worldset_1.ini 
cd ..
ls
cd ..
ls
cd ~
ls
clear
gedit 1
chmod +x 1
gedit 2
chmod +x 2
gedit 3
chmod +x 3
gedit 4
chmod +x 4
clear
./1
exit
./2
poweroff 
wget World_919=1
ls
chmod +x *
exit
./4
exit
./3
exit
./2
exit
poweroff 
./4
exit
./3
exit
./1
exit
./2
poweroff 
ls
hostname
vim /etc/hostname 
gnome-tweaks 
unzip Bibata_Classic.zip 
gnome-tweaks 
cd /tmp/
reboot 
cd /tmp/
git clone https://github.com/powerline/fonts.git --depth=1
yum install git -y
rm -f /var/run/yum.pid
yum install git -y
git clone https://github.com/powerline/fonts.git --depth=1
rm -rf fonts
ls
clear
yum install python-pip
pip install --user powerline-status
echo export PATH=${PATH}:~/.local/bin >> ~/.bashrc
exit
bash_powerline_loc=$(sudo find / | grep -E 'bash.*powerline.sh')
chmod +x $bash_powerline_loc
bash_powerline_loc=$(sudo find / | grep -E 'bash.*powerline.sh')
chmod +x $bash_powerline_loc
powerline_daemon_loc=$(sudo find / | grep powerline-daemon)
gedit .bashrc 
exit
gedit .bashrc 
powerline
exit
wget http://192.168.70.1/EmBangLongLamMotNguoiBinhThuongOBenCanhAnhDJYahaRemix-VuongThatThat-6022264_hq.mp3
ls
chmod 777 EmBangLongLamMotNguoiBinhThuongOBenCanhAnhDJYahaRemix.mp3 
exit
chmod 777 wall.jpg 
ifconfig 
cd /var/www/html/
ls
chmod +x index2.php 
ls
clear
gedit index2.php 
gedit index.php 
poweroff 
exit
poweroff 
./1
./2
./3
./4
./1
./2
./3
./4
./1
./2
./1
./3
./4
./2
./3
./1
./2
./4
./3
./1
./2
./4
./2
./1
./3
./1
./2
./4
./1
./2
./3
./1
./2
./4
./3
./1
./2
./4
./3
./2
./1
./1
./4
./2
./3
./1
./4
./2
./3
./1
./4
./1
./2
./3
./2
./4
./1
./3
./4
./2
./1
./3
./4
./2
./3
./1
reboot
cd /home/server/gw/Goddess 
./KG_GoddessD 
cd /home/server/gw/Bishop 
 ./KG_BishopD 
cd /home/server/gw/Relay 
./SO2RelayD 
cd /home/server/gs 
./SO2GameSvrD345 
cd /home/server/gw/Goddess 
./KG_GoddessD 
cd /home/server/gw/Bishop 
 ./KG_BishopD 
cd /root/Desktop/pay/gmc 
 wine GameMasterCentralD.exe 
cd /root/Desktop/pay 
 wine vzopaysys.exe 
reboot
