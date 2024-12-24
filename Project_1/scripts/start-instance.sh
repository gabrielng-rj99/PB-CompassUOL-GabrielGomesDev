sudo cd /home/ec2-user
sudo yum update -y

sudo yum install git -y
sudo yum install curl -y
sudo yum install nginx -y
sudo yum install cronie -y

git clone https://github.com/gabrielng-rj99/PB-CompassUOL-GabrielGomesDev
cd /home/ec2-user/PB-CompassUOL-GabrielGomesDev
git pull origin main

sudo cp -R /home/ec2-user/PB-CompassUOL-GabrielGomesDev/website/* /usr/share/nginx/html

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
