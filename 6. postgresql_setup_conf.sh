#!/bin/bash

#cp /var/lib/pgsql/data/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf.bak
cp pg_hba.conf /var/lib/pgsql/data/
chown postgres:postgres /var/lib/pgsql/data/pg_hba.conf
chmod 600 /var/lib/pgsql/data/pg_hba.conf
systemctl reload postgresql
su - koji -c "psql -c \"insert into users (name, status, usertype) values ('kojiadmin', 0, 0);\""
su - koji -c "psql -c \"insert into user_perms (user_id, perm_id, creator_id) values (1, 1, 1);\""
#cp /var/lib/pgsql/data/postgresql.conf /var/lib/pgsql/data/postgresql.conf.bak
cp postgresql.conf /var/lib/pgsql/data/
chown postgres:postgres /var/lib/pgsql/data/postgresql.conf
chmod 600 /var/lib/pgsql/data/postgresql.conf
systemctl restart postgresql
