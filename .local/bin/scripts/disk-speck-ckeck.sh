#!/bin/bash

mingigs=10
avail=$(df -h / | awk 'NR==2 && $4 < '$mingigs' { print $4 }')

topicurl=https://ntfy.sinest.duckdns.org/homelab

if [ -n "$avail" ]; then
  curl \
    -d "Only $avail GB available on the root disk. Better clean that up." \
    -H "Title: Low disk space alert on $(hostname)" \
    -H "Priority: high" \
    -H "Tags: warning,cd" \
    $topicurl
fi
