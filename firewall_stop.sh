#!/bin/bash
echo "Stoping Firewall"
iptables -F
iptables -t nat -F
iptables -t mangle -F
iptables -X DOCKER
iptables -X DOCKER-ISOLATION
iptables -t nat -X DOCKER

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT 
iptables -P FORWARD ACCEPT
