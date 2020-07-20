#!/bin/bash

dnf install -y koji-utils

su - kojiadmin -c "koji add-user kojira"
su - kojiadmin -c "koji grant-permission repo kojira"

#cp /etc/kojira/kojira.conf /etc/kojira/kojira.conf.bak
cp kojira.conf /etc/kojira/

systemctl enable --now kojira
