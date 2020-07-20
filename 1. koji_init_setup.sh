#!/bin/bash

mkdir -p /etc/pki/koji/{certs,private,confs}
cp ssl.cnf /etc/pki/koji/
cd /etc/pki/koji/
touch index.txt
echo 01 > serial
openssl genrsa -out private/koji_ca_cert.key 2048
openssl req -config ssl.cnf -new -x509 -subj "/C=CN/ST=Tianjin/L=Tianjin/O=FunTogether/CN=koji.funtogether.com" -days 3650 -key private/koji_ca_cert.key -out koji_ca_cert.crt -extensions v3_ca

echo "127.0.0.1 kojihub" >> /etc/hosts
