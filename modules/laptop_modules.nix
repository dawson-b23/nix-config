{ pkgs, lib, config, ... }:
{
  imports = [
    ./home-manager/cli    
    ./home-manager/desktop
  ];
}
