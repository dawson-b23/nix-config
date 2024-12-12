{
  pkgs,
  ...
}: {
  imports = [
    ./zsh.nix
    ./fzf.nix
  ];

  home.packages = with pkgs; [
    
  ];
}
