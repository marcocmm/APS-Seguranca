#!/bin/bash

./firewall_stop.sh
ifconfig enp63s0:1 10.255.138.1/24
echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -t nat -A POSTROUTING -s 10.255.138.2 -j SNAT --to 172.16.1.138
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 3128 
iptables -P FORWARD ACCEPT



#a) Deverá ser configurado um Proxy e um HIDS no firewall;
#c) Os hosts da LAN devem utilizar o proxy para acessar sites HTTP e essa configuração deve ser transparente (proxy transparente).
#Arquivo confHIDS explica sobre a instalação e configuração do HIDS
#Proxy
#sudo dnf install squid
#Substituir o arquivo squid.conf pelo enviado com o trabalho

#b) O firewall deve permitir que os hosts da Internet acessem o host 1 e host 2 via HTTP;
#Como escolher qual dos hosts usar?
iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to 10.255.138.2
iptables -A FORWARD -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp --sport 80 -j ACCEPT



#d) Somente o firewall pode acessar os hosts da LAN via SSH.
iptables -A INPUT -s 10.255.138.0/24 -p tcp --dport 22 -j DROP

#e) Somente um host da rede da UTFPR (exemplo do IP 172.16.2.X e não do IP 10.255.X.2) poderá acessar o firewall via SSH.
iptables -A INPUT ! -s 172.16.1.137 -p tcp --dport 22 -j DROP
