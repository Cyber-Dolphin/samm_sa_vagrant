echo "===============INSTALL REQ==============="

sudo apt update && sudo apt install -y git gnupg2 libssl-dev libpq-dev postgresql rake libv8-dev nodejs

echo "===============INSTALL RVM==============="

curl -sSL https://rvm.io/mpapis.asc | gpg2 --import - 

curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -

curl -sSL https://get.rvm.io | bash -s stable

source ~/.rvm/scripts/rvm

echo "===============CLONE REPO SAMM SELF==============="

git clone https://github.com/AsteriskLabs/ssa.git 

echo "===============INSTALL SSA==============="

cd ~/ssa 

rvm install "ruby-1.9.3-p551"

gem i bundler -v 1.17.3

bundle i

echo "===============OPEN PORT==============="

sudo ufw allow 3000

echo "===============MIGRATE DB==============="

cp config/database.yml.example config/database.yml

rake db:migrate

echo "===============!!!YOU NEED CHANGE SECRET TOKEN!!!==============="

echo "Need to change token in file ~/ssa/config/initializers/secret_token.rb"

echo 'Ssa::Application.config.secret_token = "cfe9fd554841f77b302273591a83783a8e865e8a9ca1feabef7a093df7861721b8599f6605409f0990713607699c98888ced7686339a4fe970a6a3c63868edb8"' > config/initializers/secret_token.rb

echo "===============ADD APP IN CRONTAB==============="

echo "@reboot /bin/bash -l -c 'cd /home/vagrant/ssa && rails s -d'" | crontab -

echo "Launching the application after reboot"

sudo reboot