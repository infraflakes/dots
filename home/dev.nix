{ pkgs, ... }: {
  home.packages = with pkgs; [
    less
    stow
    tmux
  ];
}
