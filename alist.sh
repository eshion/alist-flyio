#!/usr/bin/env sh

# 创建配置文件目录
mkdir -p /opt/alist/data/temp

echo "============config==========="

cat > /opt/alist/data/config.json <<EOF
{
  "address": "0.0.0.0",
  "port": 443,
  "assets": "local",
  "temp_dir": "/opt/alist/data/temp",
  "database": {
    "type": "$DATABASE",
    "user": "$SQLUSER",
    "password": "$SQLPASSWORD",
    "host": "$SQLHOST",
    "port": $SQLPORT,
    "name": "$SQLNAME",
    "table_prefix": "x_",
    "db_file": "data.db"
  },
  "scheme": {
    "https": false,
    "cert_file": "",
    "key_file": ""
  },
  "cache": {
    "expiration": 60,
    "cleanup_interval": 120
  }
}
EOF
cd /opt/alist
chmod +x alist
#./alist --data ./data
cat data/config.json
./alist -conf /opt/alist/data/config.json
