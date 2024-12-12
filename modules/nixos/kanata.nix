{
  pkgs, 
  lib,
  ...
}: 
{
  services.kanata = {
        enable = true;
        keyboards = {
            internalKeyboard = {
                devices = [ "/dev/input/by-path/platform-i8042-serio-0-event-kbd" ];
                extraDefCfg = "process-unmapped-keys yes";
                config = ''
                    (defsrc
                        caps
                    )

                    (defalias
                        escctrl (tap-hold 100 125 esc lctrl)
                    )

                    (deflayer base
                        @escctrl
                    )
                '';
            };
        };
    };
}
