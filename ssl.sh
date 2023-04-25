certbot --nginx -d api.muleinsights.com -d analyze.muleinsights.com
cp nginx-ssl.conf /etc/nginx/nginx.conf
systemctl restart nginx
