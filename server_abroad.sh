#!/bin/bash

# نصب figlet و wireguard اگر قبلاً نصب نشده باشند
sudo apt-get update && sudo apt-get install -y figlet wireguard

# نمایش پیام گرافیکی
figlet nikancloud

# دریافت IP سرور ایران از کاربر
read -p "لطفاً IP سرور ایران را وارد کنید: " iran_server_ip

# ایجاد فایل wg0.conf با محتویات زیر
cat << EOF > /etc/wireguard/wg0.conf
[Interface]
## This Desktop/client's private key ##
PrivateKey = yI0dq+0K1Yh9MQKm/jYLPYIqcURmD7m7g5K78g/JZlI=

## Client ip address ##
Address = 192.168.6.2/24
MTU=1282
PreUp = udp2raw_amd64 -c -l 127.0.0.1:8080 -r $iran_server_ip:4096 -k "alinikan1402" --raw-mode icmp -a --fix-gro --cipher-mode none --auth-mode none --log-level 0 &
Postdown = pkill -f "udp2raw.*:8080"
[Peer]
## Ubuntu 20.04 server public key ##
PublicKey = Tg5nc09SQ6At7CFRjDGvtP3XV9rr00jYlu+1xEcA4XE=

## set ACL ##
AllowedIPs = 192.168.6.0/24

## Your Ubuntu 20.04 LTS server's public IPv4/IPv6 address and port ##
Endpoint = 127.0.0.1:8080

## Key connection alive ##
PersistentKeepalive = 15
EOF

echo "فایل wg0.conf برای سرور خارج با موفقیت ایجاد و تنظیم شد."
