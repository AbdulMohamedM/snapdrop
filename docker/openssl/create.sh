#!/bin/sh

cnf_dir='/mnt/openssl/'
certs_dir='/etc/ssl/certs/'
openssl req -config ${cnf_dir}sujadropCA.cnf -new -x509 -days 1 -keyout ${certs_dir}sujadropCA.key -out ${certs_dir}sujadropCA.crt
openssl req -config ${cnf_dir}sujadropCert.cnf -new -out /tmp/sujadrop-dev.csr -keyout ${certs_dir}sujadrop-dev.key
openssl x509 -req -in /tmp/sujadrop-dev.csr -CA ${certs_dir}sujadropCA.crt -CAkey ${certs_dir}sujadropCA.key -CAcreateserial -extensions req_ext -extfile ${cnf_dir}sujadropCert.cnf -sha512 -days 1 -out ${certs_dir}sujadrop-dev.crt

exec "$@"