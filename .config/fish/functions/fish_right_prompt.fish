function fish_right_prompt
    set -l __last_command_exit_status $status
    if test $__last_command_exit_status != 0
        set_color red
    else
        set_color green
    end
    set duration (echo "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2}')
    echo "$duration"
    set_color $fish_color_autosuggestion 2> /dev/null; or set_color 555
    echo "|"
    date "+%H:%M:%S"
    set_color normal
    #command_takes_too_long
end
