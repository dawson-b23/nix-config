{
  pkgs,
  ...
}: {
  imports = [
    ./zsh.nix
    ./fzf.nix
    ./kitty.nix
  ];

  home.packages = with pkgs; [
    
  ];
}
