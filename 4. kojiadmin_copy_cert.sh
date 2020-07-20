#!/bin/bash

useradd kojiadmin
echo "123456" | passwd --stdin kojiadmin
su - kojiadmin -c "mkdir ~/.koji"
su - kojiadmin -c "cp /etc/pki/koji/kojiadmin.pem ~/.koji/client.crt"
su - kojiadmin -c "cp /etc/pki/koji/koji_ca_cert.crt ~/.koji/clientca.crt"
su - kojiadmin -c "cp /etc/pki/koji/koji_ca_cert.crt ~/.koji/serverca.crt"
su kojiadmin -c "cp config ~/.koji/config"