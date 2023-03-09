#!/bin/sh

echo "1" > /proc/sys/net/ipv4/ip_forward


sudo iptables -A FORWARD -i ens256 -o ens160 -j ACCEPT
sudo iptables -A FORWARD -i ens160 -o ens256 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -t nat -A POSTROUTING -o ens160 -j MASQUERADE

