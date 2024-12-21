sudo cd ~
sudo yum update -y && sudo yum install git curl nginx cronie -y

sudo rm -rf ~/PB-CompassUOL-GabrielGomesDev/
git clone https://github.com/gabrielng-rj99/PB-CompassUOL-GabrielGomesDev
sudo cp -R ~/PB-CompassUOL-GabrielGomesDev/website/* /usr/share/nginx/html

sudo systemctl restart crond && sudo systemctl restart nginx

VERIFY_NGINX="*/5 * * * * sudo bash ~/PB-CompassUOL-GabrielGomesDev/Project_1/scripts/verify-nginx.sh"
START_INSTANCE="@reboot sudo bash ~/PB-CompassUOL-GabrielGomesDev/Project_1/scripts/start_instance.sh"

(crontab -u ec2-user -l | grep -q "$VERIFY_NGINX") || (crontab -u ec2-user -l; echo "$VERIFY_NGINX") | crontab -u ec2-user -
(crontab -u ec2-user -l | grep -q "$START_INSTANCE") || (crontab -u ec2-user -l; echo "$START_INSTANCE") | crontab -u ec2-user -