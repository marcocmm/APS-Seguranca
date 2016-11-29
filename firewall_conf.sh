#!/bin/bash

ifconfig enp63s0:0 172.16.2.138
ifconfig enp63s0:1 10.255.138.1/24
echo 1 > /proc/sys/net/ipv4/ip_forward