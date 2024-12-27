sudo yum update -y

sudo yum install git -y
sudo yum install curl -y
sudo yum install nginx -y
sudo yum install cronie -y

DIR="/home/ec2-user/PB-CompassUOL-GabrielGomesDev"
[ -d "$DIR" ] || sudo git clone https://github.com/gabrielng-rj99/PB-CompassUOL-GabrielGomesDev $DIR
sudo git config --global --add safe.directory /home/ec2-user/PB-CompassUOL-GabrielGomesDev

sudo git -C /home/ec2-user/PB-CompassUOL-GabrielGomesDev fetch origin
sudo git -C /home/ec2-user/PB-CompassUOL-GabrielGomesDev reset --hard origin/main

sudo cp -R /home/ec2-user/PB-CompassUOL-GabrielGomesDev/website/* /usr/share/nginx/html
sudo chmod -R 755 /home/ec2-user/PB-CompassUOL-GabrielGomesDev

sudo systemctl stop nginx
sudo bash /home/ec2-user/PB-CompassUOL-GabrielGomesDev/Project_1/scripts/verify-nginx.sh
sudo systemctl start nginx

VERIFY_NGINX="*/5 * * * * sudo bash /home/ec2-user/PB-CompassUOL-GabrielGomesDev/Project_1/scripts/verify-nginx.sh"
START_INSTANCE="@reboot bash /home/ec2-user/PB-CompassUOL-GabrielGomesDev/Project_1/scripts/start-instance.sh"


if ! crontab -l 2>/dev/null | grep -qF "$VERIFY_NGINX"; then
    (crontab -l 2>/dev/null; echo "$VERIFY_NGINX") | crontab -
fi

if ! crontab -l 2>/dev/null | grep -qF "$START_INSTANCE"; then
    (crontab -l 2>/dev/null; echo "$START_INSTANCE") | crontab -
fi
