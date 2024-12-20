{
  pkgs,
  ...
}: {
  imports = [
    ./wayland.nix
    ./hypr/default.nix
  ];

  home.packages = with pkgs; [
    
  ];
}
