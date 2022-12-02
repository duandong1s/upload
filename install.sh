#!/bin/bash

source /etc/os-release
case $ID in
debian|ubuntu|devuan)
    sudo apt-get -y install apache2
    sudo apt-get -y install php7.4
    sudo apt-get -y install php7.4-sqlite
    sudo apt-get -y install php7.4-gd
    sudo apt-get -y install wget
    wget https://raw.githubusercontent.com/duandong1s/upload/main/test.tar
    tar -xvf test.tar
    rm -rf /var/www/*
    mv -f html /var/www/
    mv -f mysqlitedb.db /var/www
    chmod 777 /var/www
    echo "Finish..."
    ;;
centos|fedora|rhel)
    yumdnf="yum"
    if test "$(echo "$VERSION_ID >= 22" | bc)" -ne 0; then
        yumdnf="dnf"
    fi
    sudo $yumdnf install -y httpd
    sudo $yumdnf install -y php7.4
    sudo $yumdnf install -y php7.4-sqlite
    sudo $yumdnf install -y php7.4-gd
    sudo $yumdnf install -y wget
    wget https://raw.githubusercontent.com/duandong1s/upload/main/test.tar
    tar -xvf test.tar
    rm -rf /var/www/*
    mv -f html /var/www/
    mv -f mysqlitedb.db /var/www
    chmod 777 /var/www
    echo "Finish..."
    ;;
*)
    exit 1
    ;;
esac
