function fish_prompt
    echo
    set_color -o 4a4b52
    echo -n ""
    set_color normal
    set_color -o 8ab4f8
    set_color -b 4a4b52
    echo -n "  "
    set_color normal
    set_color -o 8ab4f8
    set_color -b 4a4b52
    echo -n (prompt_pwd)
    set_color normal
    set_color -o 4a4b52
    echo -n ""
    set_color normal
    echo -n (set_color -o 8ab4f8)" ❯ "
end
