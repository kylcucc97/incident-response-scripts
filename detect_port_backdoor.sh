#!/bin/bash
port=4444
pid=$(lsof -i :$port -t)

if [[ -n "$pid" ]]; then
    echo "⚠️ Unauthorized listener on port $port detected. Killing PID $pid"
    kill -9 $pid
else
    echo "✅ No suspicious listeners on port $port"
fi
