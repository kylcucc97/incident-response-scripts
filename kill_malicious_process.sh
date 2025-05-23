#!/bin/bash
target_hash="e3b0c44298fc1c149afbf4c8996fb924"  # Example MD5

for pid in $(ls /proc | grep -E '^[0-9]+$'); do
    exe="/proc/$pid/exe"
    if [[ -L $exe ]]; then
        hash=$(md5sum "$exe" 2>/dev/null | awk '{print $1}')
        if [[ "$hash" == "$target_hash" ]]; then
            echo "🛑 Killing malicious process: $pid"
            kill -9 "$pid"
        fi
    fi
done
