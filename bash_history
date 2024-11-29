---Make by Thương EoPi---
https://facebook.com/Thuong.EoPi
https://loliteam.net

---Fix nếu bị lock yum---
yum bị Another app is currently hol... thì dùng lệnh dưới để fix
rm -f /var/run/yum.pid

---Cài thư viện---
yum update
yum -y install glibc.i686
yum -y install zlib.i686
yum -y install libstdc++.i686

---Cài wine---
yum -y install https://harbottle.gitlab.io/wine32/7/i386/wine32-release.rpm
yum -y install wine.i686
winecfg (để config)
wget https://dl.winehq.org/wine/source/9.0/wine-9.0.tar.xz
Chọn windowsXP

---Lệnh giải nén---
Tải toàn bộ mọi thứ lưu ở /root/Desktop
unzip server.zip
unzip soft.zip
giải nén xong thì copy thư mục server và 2 file trong thư mục db_server vào /home/
thư mục pay thì để ngoài desktop

---Cấu hình SQL---
yum -y install mariadb-server
systemctl start mariadb
systemctl enable mariadb
mysql_secure_installation
ln -s /var/lib/mysql/mysql.sock /tmp/mysql.sock
gedit /etc/my.cnf
[mysqld]
lower_case_table_names=1

systemctl restart mariadb
systemctl status mariadb

---Cấu hình DB---
mysql -uroot -p
CREATE DATABASE jx2ib_database;
CREATE DATABASE jx2ib_database_log;
use jx2ib_database;
source /home/jx2ib_database_new.sql;
use jx2ib_database_log;
source /home/jx2ib_database_log_newsua.sql;
GRANT ALL PRIVILEGES ON jx2ib_database.* TO 'root'@'localhost' IDENTIFIED BY 'thuong123' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON jx2ib_database_log.* TO 'root'@'127.0.0.1' IDENTIFIED BY 'thuong123' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit

---Cấu hình db paysys---
cd /root/Desktop/
cd /root/Desktop/pay/
mysql -uroot -p
create database paysys;
use paysys;
source /root/Desktop/pay/paysys.sql;
GRANT ALL PRIVILEGES ON paysys.* TO 'root'@'localhost' IDENTIFIED BY 'thuong123' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit

---Cấu hình web và đăng ký account---
yum -y install httpd
yum -y install epel-release yum-utils -y
yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum-config-manager --enable remi-php73
yum install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd -y
php -v
cd /var/www/html/
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.0/phpMyAdmin-5.0.0-all-languages.zip
unzip phpMyAdmin-5.0.0-all-languages.zip
mv phpMyAdmin-5.0.0-all-languages admin
systemctl start httpd
systemctl enable httpd
Lúc này truy cập vào địa chỉ http://ip.add.rr.ss/admin
Đăng nhập bằng tài khhoản root của mysql
vào csdl paysys -> account -> tạo tài khoản (không biết thì cứ chép ở trên xuống)

---Cấu hình paysys---
Vào thư mục pay ngoài Desktop
Chỉnh sửa IP và thông tin trong file paysy.ini
[Mysql]
Host=192.168.1.123
Username=root
Password=thuong123
DBName=paysys

Xong rồi lưu lại, dùng chuột click và chạy trực tiếp file vzopaysys.exe
nếu không chạy được thì chuột phải chọn Properties
Qua tab Open With chọn Wine Windows Program Loader làm default application rồi chạy lại
Hiện Running Completed là xong, treo nó ở đó
Nếu có hiện lỗi gì thì cứ chọn Show Details -> Close

---Chạy GameMaster---
Vào thư mục gmc trong pay
Chỉnh sửa IP trong file gamemastercentral.ini
Lưu lại rồi chạy trực tiếp file GameMasterCentralD.exe như paysys

---Chạy Gooddess---
Mở một terminal mới
cd /home/server/gw/Goddess/
gedit KG_Goddess.ini
Chỉnh sửa IP và thông số database
[DatabaseServer]
Server=192.168.1.123
UserName=root
Database=jx2ib_database
Password=YLGDQRH81ho3u>D8CZA0biA0_jA0AC6A
EnableEncrypt=1

Ở mục [DatabaseServer] để có Password thì ta chạy phần mềm GMPassGen.exe có trong soft
2 ô trên điền mật khẩu rồi nhấn nút covert để có mật khẩu mã hóa
Xong rồi lưu lại và phân quyền
chmod +x *
./KG_GoddessD

Hiện [KG_Goddess] Started successful là thành công

---Chạy bishop---
Mở một terminal mới
cd /home/server/gw/Bishop/
gedit bishop.ini
Chỉnh sửa toàn bộ IP về IP của bạn, chỉnh sửa pass sql

[Paysys]
IPAddress=192.168.1.123
Port=8000
UserName=root
Password=thuong123
SendRecvTimeout=60000
ReconnectTime=10000
LoopTime=50
PingTime=10000

Xong lưu lại, phân quyền và chạy
chmod +x *
./KG_BishopD

Hiện -> OK là thành công

---Chạy Relay---
Mở một terminal mới
cd /home/server/gw/Relay
gedit relay.ini
Chỉnh sửa toàn bộ IP như bioshop
Lưu ý chỉnh phần kết nối csdl DBUser=root và DBPwd= cho đúng giống Goddess
Hoàn tất thì lưu lại, phân quyền và chạy
chmod +x *
./SO2RelayD

Khi thấy [Relay] Start success là thành công

---Chạy GameServer---
Mở một terminal mới
cd /home/server/gs/
gedit servercfg.ini
Chỉnh sửa toàn bộ IP về IP của máy
Lưu lại phân quyền và chạy
chmod +x *
./SO2GameSvrD345

Đến khi nào hiện [Jxonline2] FPS là thành công

---Cấu hình client---
Vào thư mục client -> settings -> sửa IP trong server_list.ini
chạy so2game để chơi
1
