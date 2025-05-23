#!/bin/bash
echo "🔐 Blocking suspicious IPs..."
while read ip; do
    echo "Blocking $ip"
    sudo ufw deny from "$ip"
done < /tmp/suspicious_ips.txt
