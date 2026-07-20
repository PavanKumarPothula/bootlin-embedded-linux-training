#!/bin/sh
/sbin/ip tap add $1 mode tap user $(whoami)
/sbin/ip addr add 192.168.53.1/24 dev $1
/sbin/ip link set $1 up
