#!/bin/bash

dnf install -y postgresql-server koji
postgresql-setup initdb
systemctl enable postgresql --now
useradd koji
echo "123456" | passwd --stdin koji
echo "123456" | passwd --stdin postgres
su - postgres -c "createuser --no-superuser --no-createrole --no-createdb koji"
su - postgres -c "createdb -O koji koji"
su - postgres -c "psql -c \"alter user koji with encrypted password 'mypassword';\""
su - koji -c "psql koji koji < /usr/share/doc/koji*/docs/schema.sql"
