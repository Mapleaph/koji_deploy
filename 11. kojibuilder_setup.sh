#!/bin/bash

dnf install -y koji-builder

useradd default_builder
echo "123456" | passwd --stdin default_builder

cp /etc/group /etc/group.bak
sed -i 's/:kojibuilder/:default_builder/g' /etc/group

#cp /etc/kojid/kojid.conf /etc/kojid/kojid.conf.bak
cp kojid.conf /etc/kojid/

su - kojiadmin -c "koji add-host default_builder x86_64"
su - kojiadmin -c "koji add-host-to-channel default_builder createrepo"

systemctl enable --now kojid