#!/bin/bash

ifconfig enp63s0:0 10.255.138.3/24
route add default 10.255.138.1
echo "nameserver 10.255.138.1" > /etc/resolv.conf