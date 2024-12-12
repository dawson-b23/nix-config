{
  pkgs,
  ...
}: {
  imports = [
    ./zsh.nix
    ./fzf.nix
    ./kitty.nix
    ./ohmyposh.nix
  ];

  home.packages = with pkgs; [
    
  ];
}
