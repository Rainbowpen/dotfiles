function fish_prompt

    if not set -q -g __fish_robbyrussell_functions_defined
        set -g __fish_robbyrussell_functions_defined
        function _git_branch_name
            set -l branch (git symbolic-ref --quiet HEAD 2>/dev/null)
            if set -q branch[1]
                echo (string replace -r '^refs/heads/' '' $branch)
            else
                echo (git rev-parse --short HEAD 2>/dev/null)
            end
        end

        function _is_git_dirty
            echo (git status -s --ignore-submodules=dirty 2>/dev/null)
        end

        function _is_git_repo
            type -q git
            or return 1
            git rev-parse --git-dir >/dev/null 2>&1
        end

        function _hg_branch_name
            echo (hg branch 2>/dev/null)
        end

        function _is_hg_dirty
            echo (hg status -mard 2>/dev/null)
        end

        function _is_hg_repo
            fish_print_hg_root >/dev/null
        end

        function _repo_branch_name
            _$argv[1]_branch_name
        end

        function _is_repo_dirty
            _is_$argv[1]_dirty
        end

        function _repo_type
            if _is_hg_repo
                echo 'hg'
                return 0
            else if _is_git_repo
                echo 'git'
                return 0
            end
            return 1
        end
    end

    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red)
    set -l green (set_color -o green)
    set -l blue (set_color -o brblue)
    set -l normal (set_color normal)

    set -l arrow_color "$red"

	# vi mode indicator
    switch $fish_bind_mode
        case default
            set arrow_color "$yellow"
        case insert
            set arrow_color "$red"
        case replace_one
            set arrow_color "$green"
        case visual
            set arrow_color "$green"
        case '*'
            set arrow_color "$cyan"
    end

    set -l arrow "$arrow_color "
    if test "$USER" = 'root'
        set arrow "$arrow_color# "
    end

    set -l cwd $blue(basename (prompt_pwd))

    if set -l repo_type (_repo_type)
        set -l repo_branch $red(_repo_branch_name $repo_type)
        set repo_info "$blue $repo_type:($repo_branch$blue)"

        set -l dirty (_is_repo_dirty $repo_type)
        if test -n "$dirty"
            set -l dirty "$yellow ✗"
            set repo_info "$repo_info$dirty"
        end
    end

	if test -n "$SSH_TTY"
		# Main ssh
		echo -n (set_color brwhite)' ['(set_color green)$USER(set_color brwhite)'@'(set_color purple)(prompt_hostname)':'(set_color blue)(prompt_pwd)(set_color brwhite)']'$arrow_color'$ '
	else
		# Main local
		#echo -n ' '(set_color blue)(prompt_pwd)(set_color red)' $ '
		echo -n -s ' ' $cwd $repo_info $normal ' ' $arrow
	end
end
