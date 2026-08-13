#!/usr/bin/env bash
# Label: kali
# Kali Linux equivalent of `netswitchroom.bat`

IFACE="eth0"

HOME_IP="10.0.112.133/21"
HOME_GW="10.0.112.1"
HOME_DNS="1.1.1.1"

set -e

if [ "$EUID" -ne 0 ]; then
  echo "This script requires sudo/root. Re-run with sudo." >&2
  exit 1
fi

echo "Configuring HOME network on $IFACE (kali)..."
ip addr flush dev "$IFACE"
ip addr add $HOME_IP dev "$IFACE"
ip link set "$IFACE" up
ip route replace default via $HOME_GW dev "$IFACE"
printf "nameserver %s\n" "$HOME_DNS" > /etc/resolv.conf

echo "HOME network configured successfully (kali)."
