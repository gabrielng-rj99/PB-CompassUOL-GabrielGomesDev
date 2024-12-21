sudo cd ~
sudo yum update -y && sudo yum install git curl nginx cronie -y

sudo rm -rf ~/PB-CompassUOL-GabrielGomesDev/
git clone https://github.com/gabrielng-rj99/PB-CompassUOL-GabrielGomesDev
sudo cp -R ~/PB-CompassUOL-GabrielGomesDev/website/* /usr/share/nginx/html

sudo systemctl restart crond

sudo systemctl stop nginx
sudo bash ~/PB-CompassUOL-GabrielGomesDev/Project_1/scripts/verify-nginx.sh
sudo systemctl start nginx

VERIFY_NGINX="*/5 * * * * sudo bash ~/PB-CompassUOL-GabrielGomesDev/Project_1/scripts/verify-nginx.sh"
START_INSTANCE="@reboot bash ~/PB-CompassUOL-GabrielGomesDev/Project_1/scripts/start_instance.sh"

if ! crontab -l 2>/dev/null | grep -qF "$VERIFY_NGINX"; then
    (crontab -l 2>/dev/null; echo "$VERIFY_NGINX") | crontab -
fi

# Verifique se o comando START_INSTANCE já existe
if ! crontab -l 2>/dev/null | grep -qF "$START_INSTANCE"; then
    (crontab -l 2>/dev/null; echo "$START_INSTANCE") | crontab -
fi