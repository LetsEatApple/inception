#!/bin/sh

openssl req -x509 -nodes -days 365 \
-newkey rsa:2048 \
-keyout $CRED_KEY \
-out $CRED_CERT \
-subj "/C=DE/L=BER/O=42/OU=student/CN=lhagemos.42.de"

exec nginx -g "daemon off;"