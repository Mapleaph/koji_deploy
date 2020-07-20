#!/bin/bash
# kojiadmin, kojihub, kojiweb, kojira
# if you change your certificate authority name to something else you will
# need to change the caname value to reflect the change.
caname=koji

# user is equal to parameter one or the first argument when you actually
# run the script
#user=$1
#
#if [ -z "$1" ]; then
#    echo "Usage: $0 user"
#    exit
#fi

users=(kojiadmin kojihub kojiweb kojira default_builder)

cd /etc/pki/koji

for user in ${users[@]}; do
    openssl genrsa -out private/${user}.key 2048
    cat ssl.cnf | sed 's/insert_hostname/'${user}'/'> ssl2.cnf
    openssl req -config ssl2.cnf -new -subj "/C=CN/ST=Tianjin/L=Tianjin/O=FunTogether/CN=${user}" -nodes -out certs/${user}.csr -key private/${user}.key << EOF
y
y
EOF
    openssl ca -config ssl2.cnf -keyfile private/${caname}_ca_cert.key -cert ${caname}_ca_cert.crt -out certs/${user}.crt -outdir certs -infiles certs/${user}.csr << EOF
y
y
EOF
    cat certs/${user}.crt private/${user}.key > ${user}.pem
    mv ssl2.cnf confs/${user}-ssl.cnf
done

cd -
