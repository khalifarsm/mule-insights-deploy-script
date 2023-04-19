apt-get update
apt install -y git
apt-get install -y ca-certificates curl gnupg
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get -y update
apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
docker swarm init --advertise-addr=127.0.0.1
git clone https://github.com/khalifarsm/mule-insights-deploy-script.git
mkdir mule-insights-deploy-script/data
mkdir mule-insights-deploy-script/data/dependencies
mkdir mule-insights-deploy-script/data/mysql-data
mkdir mule-insights-deploy-script/data/mysql-dump
mkdir mule-insights-deploy-script/data/ramls
mkdir mule-insights-deploy-script/data/responses
docker stack deploy -c mule-insights-deploy-script/docker-compose.yml muleinsights
apt install -y nginx
cp mule-insights-deploy-script/nginx.conf /etc/nginx/nginx.conf
systemctl restart nginx
apt-get install -y certbot
apt install -y python3-certbot-nginx
cp mule-insights-deploy-script/webhook.service /etc/systemd/system/webhook.service
systemctl start webhook.service