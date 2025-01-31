sudo apt update && sudo apt install -y nfs-kernel-server nfs-common php-mysql
sudo mkdir -p /var/nfs/compartir/wordpress
sudo chmod 777 /var/nfs/compartir/wordpress

cat <<EOL | sudo tee -a /etc/exports
/var/nfs/compartir/wordpress X.X.X.X(rw,sync,no_root_squash,no_subtree_check)
EOL

sudo exportfs -a
sudo systemctl restart nfs-kernel-server

cd /var/nfs/compartir/wordpress
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xzvf latest.tar.gz
