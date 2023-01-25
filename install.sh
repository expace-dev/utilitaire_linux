#!/bin/sh

clear

#######################################################################
#         On renseigne les variables de changement de couleur         #
#######################################################################
VERT="\\033[1;32m"
NORMAL="\\033[0;39m"
ROUGE="\\033[1;31m"
ROSE="\\033[1;35m"
BLEU="\\033[1;34m"
BLANC="\\033[0;02m"
BLANCLAIR="\\033[1;08m"
JAUNE="\\033[1;33m"
CYAN="\\033[1;36m"

echo "$JAUNE|------------------------------------------------------------------------------------------------------------------|"
echo "$JAUNE|                                                                                                                  |"
echo "$JAUNE|                           Nous allons proceder à l'installation du serveur web                                   |"
echo "$JAUNE|                                                                                                                  |"
echo "$JAUNE|------------------------------------------------------------------------------------------------------------------|"

echo "$BLANC\nVoulez vous vraiment continuer ? (y ou n) ?"

read reponse

if [ "$reponse" = "y" ]; then
clear
hostnamectl set-hostname admin.expace-development.fr
apt-get -y update
apt-get -y upgrade
export DEBIAN_FRONTEND=noninteractive
apt-get -q -y install apache2
apt-get -q -y install mariadb-server mariadb-client
apt-get -q -y install pure-ftpd-mysql
apt-get -q -y install postfix-mysql
apt-get -q -y install php php-cli php-curl php-fpm php-gd php-php-gettext php-imagick php-imap php-intl php-mbstring php-mysql php-opcache php-pear php-pspell php-redis php-soap php-sqlite3 php-tidy php-xml php-xmlrpc php-xsl php-zip
apt-get -q -y install git
apt-get -q -y install curl
cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo $HASH
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
apt-get install nodejs
cd /tmp
wget http://www.ispconfig.org/downloads/ISPConfig-3-stable.tar.gz
tar xfz ISPConfig-3-stable.tar.gz
cd ispconfig3_install/install/


echo "$BLANC"
fi

echo "$JAUNE|------------------------------------------------------------------------------------------------------------------|"
echo "$JAUNE|                                                                                                                  |"
echo "$JAUNE|                               Nous allons proceder à la configuration d'IspConfig                                |"
echo "$JAUNE|                                                                                                                  |"
echo "$JAUNE|------------------------------------------------------------------------------------------------------------------|"

echo "$BLANC\nVoulez vous vraiment continuer ? (y ou n) ?"

read reponse

if [ "$reponse" = "y" ]; then
clear
php -q update.php
fi
