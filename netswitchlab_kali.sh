#!/usr/bin/env bash
# Label: kali
# Kali Linux equivalent of `netswitchlab.bat`

IFACE="eth0"

LAB_IP="10.2.11.81/22"
LAB_GW="10.2.8.1"
LAB_DNS="8.8.8.8"

set -e

if [ "$EUID" -ne 0 ]; then
  echo "This script requires sudo/root. Re-run with sudo." >&2
  exit 1
fi

echo "Configuring LAB network on $IFACE (kali)..."
ip addr flush dev "$IFACE"
ip addr add $LAB_IP dev "$IFACE"
ip link set "$IFACE" up
ip route replace default via $LAB_GW dev "$IFACE"
printf "nameserver %s\n" "$LAB_DNS" > /etc/resolv.conf

echo "LAB network configured successfully (kali)."
