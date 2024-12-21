sudo cd ~
sudo yum update -y && sudo yum install git curl nginx cronie -y

sudo rm -rf ~/PB-CompassUOL-GabrielGomesDev/
git clone https://github.com/gabrielng-rj99/PB-CompassUOL-GabrielGomesDev
sudo cp -R ~/PB-CompassUOL-GabrielGomesDev/website/* /usr/share/nginx/html

sudo systemctl restart crond && sudo systemctl restart nginx

VERIFY_NGINX="*/5 * * * * sudo ~/PB-CompassUOL-GabrielGomesDev/Project_1/scripts/verify-nginx.sh"
START_INSTANCE="@reboot sudo ~/PB-CompassUOL-GabrielGomesDev/Project_1/scripts/start_instance.sh"

(sudo crontab -l | sudo grep -q "$VERIFY_NGINX") || (sudo crontab -l; sudo echo "$VERIFY_NGINX") | sudo crontab -
(sudo crontab -l | sudo grep -q "$START_INSTANCE") || (sudo crontab -l; sudo echo "$START_INSTANCE") | sudo crontab -