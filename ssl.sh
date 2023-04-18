systemctl stop nginx
certbot certonly --standalone -d muleinsights.com -d www.muleinsights.com -d analyze.muleinsights.com
cp nginx-ssh.conf /etc/nginx/nginx.conf
systemctl start nginx
