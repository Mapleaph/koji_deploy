#!/bin/bash

dnf install -y koji-web mod_ssl

#cp /etc/httpd/conf.d/kojiweb.conf /etc/httpd/conf.d/kojiweb.conf.bak
#cp /etc/kojiweb/web.conf /etc/kojiweb/web.conf.bak

cp kojiweb.conf /etc/httpd/conf.d/
cp web.conf /etc/kojiweb/

systemctl enable --now httpd