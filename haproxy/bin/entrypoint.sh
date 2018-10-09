#!/bin/bash

set -e

/haproxy-src/haproxy/bin/install-certs.sh
/haproxy-src/haproxy/bin/watch-certs.sh &

LETSENCRYPT_CERT="$(cat /certs/letsencrypt0.pem)"
export DEFAULT_SSL_CERT="${DEFAULT_SSL_CERT:-$LETSENCRYPT_CERT}"

exec "$@"