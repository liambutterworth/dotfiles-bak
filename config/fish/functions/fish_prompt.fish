function pad_prompt -e fish_preexec -e fish_postexec
    echo
end

function fish_prompt
    set_color blue

    printf '\033[1m%s\033[0m' (dirs)

    set_color brblack

    printf ' %s' (git branch 2>/dev/null | sed -n '/\* /s///p')

    set_color magenta

    printf '\n\033[1m%-2s\033[0m' (switch $fish_bind_mode
        case default; echo \U276E
        case insert;  echo \U276F
    end)
end
