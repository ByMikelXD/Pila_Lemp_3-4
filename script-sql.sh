sudo apt-get update && sudo apt-get install -y mariadb-server

sudo sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
sudo systemctl restart mariadb

mysql -u root -e "CREATE DATABASE wordpress_db;"
mysql -u root -e "CREATE USER 'wp_user'@'%' IDENTIFIED BY 'password';"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wp_user'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
