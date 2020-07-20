#!/bin/bash

caname=koji
user=kojiadmin

#if [ -z "$1" ]; then
#    echo "Usage: $0 user"
#    exit
#fi

cd /etc/pki/koji/

openssl pkcs12 -export -inkey private/${user}.key -in certs/${user}.crt -CAfile ${caname}_ca_cert.crt -out certs/${user}_browser_cert.p12
