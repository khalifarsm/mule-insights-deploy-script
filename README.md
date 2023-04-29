# instructions about how to deploy muleinsight to digital ocean droplet 
##Install the application:
####download the script with the command: 
``` sh
wget https://raw.githubusercontent.com/khalifarsm/mule-insights-deploy-script/master/muleinsights.sh
```
####run the script with the command:
``` sh
/bin/sh muleinsights.sh
```
wait for about 5 minutes for all the applications to run, after that you should be able to access the application backend, try : http://yourdomain/api 
##Command front-end application
to be able to command the front-end application from your droplet and configure you CICD pipline you need to install digital ocean CLI for that go to folder : /root/mule-insights-deploy-script/app-command and run the following command 
``` sh
/bin/sh auth.sh
```
you will be asked to enter a token
to generate this token go to you digital ocean account, under API, click generate new token, take the generated token and past it into your console 
after that type the command
``` sh
/bin/sh list.sh
```
that will list all the applications that you have in your account, copy the ID of the application that you want to control to in the command and execute it:
``` sh
export APPID={{your application id}}
```
## install ssl 
go to folder /root/mule-insights-deploy-script/ssl
open the file generate-certificate.sh, replace the domain with your domain and save 
open the file nginx-ssl.conf and replace the domain in the keys path with your domain, and save 
after that run the following commands 
``` sh
/bin/sh generate-certificate.sh
/bin/sh nginx-ssl.sh
```
the first command will generate the key for you, and the second command will configure nginx 
## deploy applications and apis to new anypoint account 
go to folder /root/mule-insights-deploy-script/deploy-script
open the file deploy.sh and replace the  url, username and password with your account information than save 
run the command 
``` sh
/bin/sh deploy.sh
```
the execution may take up to 30 minutes  to finish deploying 