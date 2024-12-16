#!/bin/sh

rm -rf certs/*

cd certs

openssl genrsa -out signing_key.priv 2048

openssl req -new -key signing_key.priv -out signing_key.csr

# CHANGE DAYS "365" (= 1 year) to preferred expiration time
openssl x509 -req -days 365 -in signing_key.csr -signkey signing_key.priv -out signing_key.x509

cat signing_key.priv > signing_key.pem
cat signing_key.x509 >> signing_key.pem
