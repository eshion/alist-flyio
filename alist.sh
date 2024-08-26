#!/bin/bash
chown -R ${PUID}:${PGID} /opt/alist/

umask ${UMASK}

# 创建配置文件目录
mkdir -p /opt/alist/data/

# cat >/opt/alist/data/config.json <<EOF
# {
#   "address": "0.0.0.0",
#   "port": 5244,
#   "site_url": "$SITE_URL",
#   "database": {
#     "type": "$DATABASE",
#     "user": "$SQLUSER",
#     "password": "$SQLPASSWORD",
#     "host": "$SQLHOST",
#     "port": $SQLPORT,
#     "name": "$SQLNAME",
#     "db_file": "data.db",
#     "table_prefix": "x_",
#     "ssl_mode": "prefer"
#   },
#   "scheme": {
#     "https": false,
#     "cert_file": "",
#     "key_file": ""
#   },
#   "cache": {
#     "expiration": 60,
#     "cleanup_interval": 120
#   }
# }
# EOF

cd /opt/alist

cat data/config.json

# ./alist server
exec su-exec ${PUID}:${PGID} nohup aria2c \
  --enable-rpc \
  --rpc-allow-origin-all \
  --conf-path=/root/.aria2/aria2.conf \
  >/dev/null 2>&1 &

exec su-exec ${PUID}:${PGID} ./alist server
