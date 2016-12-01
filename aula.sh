#!/bin/bash
#Liberar http, https, dns pro host
./firewall_stop.sh
ifconfig enp63s0:1 10.255.138.1/24
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -s 10.255.138.2 -j SNAT --to 172.16.1.138
iptables -P FORWARD DROP
#iptables -A FORWARD  -j ACCEPT
iptables -A FORWARD -s 10.255.138.0/24 -p udp --dport 53 -j ACCEPT
iptables -A FORWARD -d 10.255.138.0/24 -p udp --sport 53 -j ACCEPT
iptables -A FORWARD -s 10.255.138.0/24 -p tcp --dport 443 -j ACCEPT
iptables -A FORWARD -d 10.255.138.0/24 -p tcp --sport 443 -j ACCEPT
iptables -A FORWARD -s 10.255.138.0/24 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -d 10.255.138.0/24 -p tcp --sport 80 -j ACCEPT


