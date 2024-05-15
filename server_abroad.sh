#!/bin/bash

# Install figlet and wireguard if they are not installed
sudo apt-get update && sudo apt-get install -y figlet wireguard

# Display graphical message
figlet nikancloud

# Get server IP from the user with green color
echo -e "\033[0;32mPlease enter the Iran server IP:\033[0m"
read iran_server_ip

# Create wg0.conf with the following contents
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

echo "wg0.conf file for the foreign server has been successfully created and configured."
