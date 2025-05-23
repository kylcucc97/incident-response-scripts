#!/bin/bash
log="/var/log/auth.log"
threshold=5

echo "📋 Checking for SSH brute-force attempts..."
grep "Failed password" "$log" | awk '{print $(NF-3)}' | sort | uniq -c | awk -v t=$threshold '$1 > t {print $2}' > /tmp/suspicious_ips.txt

echo "✅ Found the following IPs:"
cat /tmp/suspicious_ips.txt
