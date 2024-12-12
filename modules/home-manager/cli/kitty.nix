{
  config,
  lib, 
  pkgs,
  ...
}:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "Comic Code";
      size = 13;
    };
  };
}
