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
      initialPassword = "asdfghjkl;'";
      #initialHashedPassword = "$y$j9T$Q8uP2pfps2jSRCQb9mDV60$LiAOypGC2n09GGxQpgSZBZxgcJFuiPeUvS8WEtmfH06";
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
