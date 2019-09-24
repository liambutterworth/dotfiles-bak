#
# Fish Prompt
#

function fish_prompt
    set_color $nord9
    echo -n (prompt_pwd)
    echo -n ' '
    set_color $nord3
    echo -n (git branch ^/dev/null | sed -n '/\* /s///p')
    echo
    set_color $nord15

    if [ $fish_bind_mode = 'insert' ]
        echo '❯ '
    else
        echo '❮ '
    end
end

function pad_prompt \
    --on-event fish_preexec \
    --on-event fish_postexec
    echo
end
