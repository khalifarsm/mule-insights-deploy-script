certbot --nginx -d muleinsights.com -d www.muleinsights.com -d analyze.muleinsights.com
cp nginx-ssl.conf /etc/nginx/nginx.conf
systemctl restart nginx
