#!/bin/bash

set -uo pipefail

# FLOAT_TERM="${1:-}"
LIST_SESSIONS="$(tmux ls -F '#{session_name}' -f '#{!=:#{m:*popup,#{session_name}},1}' )"

selected_session="$(fzf --tmux <<< "$LIST_SESSIONS")"

if [ -n "${selected_session}" ]; then
    tmux switch-client -t "${selected_session}"
else
    echo "No sessions found."
fi
