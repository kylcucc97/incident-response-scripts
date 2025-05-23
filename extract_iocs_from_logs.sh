#!/bin/bash
log_file="/var/log/syslog"

echo "📌 Extracting IOCs from $log_file"
grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' "$log_file" | sort | uniq > iocs_ips.txt
grep -Eo '[a-f0-9]{32,64}' "$log_file" | sort | uniq > iocs_hashes.txt
grep -Eo 'https?://[^ ]+\.exe' "$log_file" | sort | uniq > iocs_urls.txt

echo "✔️ IOCs saved to iocs_ips.txt, iocs_hashes.txt, iocs_urls.txt"
