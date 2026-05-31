# XDG Base Directory Specification
set -gx EDITOR 'nvim'
set -gx GLFW_IM_MODULE 'ibus'
set -gx SDL_IM_MODULE 'fcitx'
set -gx SHELL 'fish'
set -gx TMUX_TMPDIR '/tmp'
set -gx VISUAL 'nvim'
set -gx XDG_CACHE_HOME "$HOME"'/.cache'
set -gx XDG_CONFIG_HOME "$HOME"'/.config'
set -gx XDG_DATA_HOME "$HOME"'/.local/share'
set -gx XDG_DESKTOP_DIR "$HOME"'/Desktop'
set -gx XDG_DOCUMENTS_DIR "$HOME"'/Documents'
set -gx XDG_DOWNLOAD_DIR "$HOME"'/Downloads'
set -gx XDG_MUSIC_DIR "$HOME"'/Music'
set -gx XDG_PICTURES_DIR "$HOME"'/Pictures'
set -gx XDG_STATE_HOME "$HOME"'/.local/state'
set -gx XDG_VIDEOS_DIR "$HOME"'/Videos'
set -gx XMODIFIERS '@im=fcitx'
set -gx PATH "$HOME"'/.local/bin:'"$HOME"'/.cargo/bin'(test -n "$PATH" && echo ':' || echo)"$PATH"

set -gx SSH_AUTH_SOCK '/run/user/1000/ssh-agent'
if test -z "$SSH_AUTH_SOCK"; or test -z "$SSH_CONNECTION"
    set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent"
end

set UID (id -u)
set -g fish_color_command 8ab4f8 --bold
set -g fish_color_param ccd0d9 --bold
set -g fish_color_redirection 8ab4f8 --bold
set -g fish_color_error cf6679 --bold
set -g fish_color_autosuggestion 908caa --bold
set -g fish_color_selection --reverse --bold

status is-login; and begin

end

status is-interactive; and begin

    alias cat bat
    alias cd scd
    alias e nvim
    alias tm 'tmux new-session -A -s default'

    sn cd init fish | source
    fastfetch
    set username (whoami)
    echo "				Welcome back, $username!"

end
