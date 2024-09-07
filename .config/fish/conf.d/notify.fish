function command_takes_too_long
    set pgs 'pacman' 'yay' 'make' 'cmake' 'cargo' 'sleep' 'ansible-playbook' 'ansible'
    set dur_time 30000 # 30 seconds
    set last_command (string split ' ' (history | head -1))

    for pg in $pgs
        if contains $pg $last_command
            # Show notification if duration is more than 5 seconds
            if test $CMD_DURATION -gt $dur_time
                # Show duration of the last command in seconds
                set duration (echo "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2}')
                notify-send (echo (history | head -1) returned $status after $duration)
                curl -H "Title: A task has finished on $(hostname)" \
                     -H "Priority: default" \
                     -H "Tags: ok" \
                     -d "\"$last_command\" returned $status after $duration" http://ntfy.lan/homelab
            end
        end
    end
end
