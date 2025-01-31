sudo apt update && sudo apt install -y nginx
systemctl start nginx
systemctl enable nginx

cat <<EOL | sudo tee /etc/nginx/sites-enabled/balanceador
upstream servidoresweb {
    server IP_WEB1;
    server IP_WEB2;
}

server {
    listen 80;
    server_name balanceador;

    location / {
        proxy_redirect off;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_pass http://servidoresweb;
    }
}
EOL

systemctl restart nginx
