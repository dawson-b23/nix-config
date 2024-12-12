{ pkgs, lib, config, ... }:
{
  imports = [
    ./home-manager/cli/default.nix
    ./home-manager/desktop/default.nix
  ];
}
