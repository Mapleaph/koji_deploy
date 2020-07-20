#!/bin/bash

./1.\ koji_init_setup.sh
./2.\ koji_auth_gen.sh
./3.\ koji_user_cert.sh
./4.\ kojiadmin_copy_cert.sh
./5.\ postgresql_setup.sh
./6.\ postgresql_setup_conf.sh
./7.\ kojihub_setup.sh
./8.\ koji_fs_setup.sh
./9.\ koji_selinux_setup.sh
./10.\ kojiweb_setup.sh
./11.\ kojibuilder_setup.sh.sh
./12.\ kojira_setup.sh
./13.\ koji_repo.sh
