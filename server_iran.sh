#!/bin/bash

# Install figlet and wireguard if they are not installed
sudo apt-get update && sudo apt-get install -y figlet wireguard

# Display graphical message
figlet nikancloud

# Get server IP from the user with green color
echo -e "\033[0;32mPlease enter the Iran server IP:\033[0m"
read server_ip

# Create wg0.conf with the following contents
cat << EOF > /etc/wireguard/wg0.conf
## Set Up WireGuard VPN on Ubuntu By Editing/Creating wg0.conf File ##
[Interface]
## My VPN server private IP address ##
Address = 192.168.6.1/24
MTU=1490

## My VPN server port ##
ListenPort = 8443

## VPN server's private key ##
PrivateKey = cFK9Vb6mvNnIxCRbLDVk2+5QJPr739WETmyPiPweU3Y=
PreUp = sudo udp2raw_amd64 -s -l $server_ip:4096 -r 127.0.0.1:8443 -k "alinikan1402" --raw-mode icmp -a --fix-gro --cipher-mode none --auth-mode simple --log-level 0 &
Postdown = pkill -f "udp2raw.*:8443"
[Peer]
## Desktop/client VPN public key ##
PublicKey = ZaX/nYl6I2blqtnRBz9Ectk0961ALUy1gtytCQ82ASA=

## client VPN IP address (note the /32 subnet) ##
AllowedIPs = 192.168.6.2/32
EOF

echo "wg0.conf file has been successfully created and configured."
