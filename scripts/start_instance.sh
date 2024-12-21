sudo yum update && sudo yum install git curl nginx -y
sudo rm -rf ~/PB-CompassUOL-GabrielGomesDev/
git clone https://github.com/gabrielng-rj99/PB-CompassUOL-GabrielGomesDev
sudo cp -R ~/PB-CompassUOL-GabrielGomesDev/website/* /usr/share/nginx/html

sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl restart nginx