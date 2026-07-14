{pkgs, ...}: {
  home.packages = with pkgs; [
    bottom
    fastfetch
    ncdu
    ripgrep
    fd
    fzf
  ];
}
