{
  pkgs,
  ...
}: {
  imports = [
    ./zsh.nix
    ./fzf.nix
    ./kitty.nix
    ./ohmyposh.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    
  ];
}
