# main-user.nix
{ 
  lib,
  config,
  pkgs,
  ...
}: 
let 
  cfg = config.main-user;
in
{
  options.main-user = {
    enable = lib.mkEnableOption "enable user module";

    userName = lib.mkOption {
      default = "mainUser";
      description = ''
        username
      '';
    };
  };

  config = lib.mkIf config.main-user.enable {
    users.users.${config.main-user.userName} = {
      initialHashedPassword = "$y$j9T$QCwLqJ495qLs0og8Ow3bF1$e2xb5elCzAmFdDsImpxi4RbXyZ3SX.4p9ZU82.kSaC6";
      isNormalUser = true;
      description = "main user";
      extraGroups = [
        "wheel"
        "networkmanager"
        "flatpak"
        "audio"
        "video"
        "plugdev"
        "input"
      ];
    };
  };
}
