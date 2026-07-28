function fish_prompt
    echo
    set_color -o white
    echo -n "  "
    set_color -o white
    echo -n (prompt_pwd)
    echo -n (set_color -o white)" ❯ "
end
