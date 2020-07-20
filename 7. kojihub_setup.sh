#!/bin/bash

dnf install -y koji-hub mod_ssl
#cp /etc/httpd/conf.d/kojihub.conf /etc/httpd/conf.d/kojihub.conf.bak
#cp /etc/httpd/conf.d/ssl.conf /etc/httpd/conf.d/ssl.conf.bak
#cp /etc/koji-hub/hub.conf /etc/koji-hub/hub.conf.bak

cp kojihub.conf /etc/httpd/conf.d/
cp ssl.conf /etc/httpd/conf.d/
cp hub.conf /etc/koji-hub/
