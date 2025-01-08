{
  config,
  lib,
  ...
}:
{
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        xwayland = {
          force_zero_scaling = true;
        };
	monitor = [ "eDP-1,2256x1504@60.00,0x0,1.0" ];

	exec-once = [
	  "kitty"
          "waybar"
	  "swaync"
          "hyprpaper"
          "hypridle"
          "wl-paste --type text --watch cliphist store"
        ];

        env = [
          "XCURSOR_SIZE,32"
          "WLR_NO_HARDWARE_CURSORS,1"
          "GTK_THEME,Dracula"
        ];

        input = {
          kb_layout = "us";
          kb_variant = "";
          kb_model = "";
          kb_rules = "";
          kb_options = "";
          follow_mouse = 1;

          touchpad = {
            natural_scroll = true;
          };

          sensitivity = 0;
        };

	gestures = {
    	  workspace_swipe = true;
    	  workspace_swipe_invert = true;
	};

        general = {
          gaps_in = 5;
          gaps_out = 5;
          border_size = 1;
          "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";
	  resize_on_border = true;
	  allow_tearing = false;
          layout = "master";
        };

        decoration = {
          rounding = 5;
          blur = {
            enabled = true;
            size = 5;
            passes = 1;
          };
          active_opacity = 0.98;
          inactive_opacity = 0.90;
        };
	
        animations = {
          enabled = true;
	  bezier = [ 
	    "wind, 0.05, 0.9, 0.1, 1.05"
    	    "winIn, 0.1, 1.1, 0.1, 1.1"
    	    "winOut, 0.3, -0.3, 0, 1"
    	    "liner, 1, 1, 1, 1"
          ];
	  animation = [
	    "windows, 1, 6, wind, slide"
	    "windowsIn, 1, 6, winIn, slide"
	    "windowsOut, 1, 5, winOut, slide"
	    "windowsMove, 1, 5, wind, slide"
	    "border, 1, 1, liner"
	    "borderangle, 1, 30, liner, loop"
	    "fade, 1, 10, default"
    	    "workspaces, 1, 5, wind"
          ];
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        #master = {
	 # new_status = "master";
	#};

	misc = {
 	  force_default_wallpaper = 0;
    	  disable_hyprland_logo = false; 
	};

        windowrule = [
          "float, file_progress"
          "float, confirm"
          "float, dialog"
          "float, download"
          "float, notification"
          "float, error"
          "float, splash"
          "float, confirmreset"
          "float, title:Open File"
          "float, title:branchdialog"
          "float, Lxappearance"
          "float, Wofi"
          "float, dunst"
          "animation none,Wofi"
          "float,viewnior"
          "float,feh"
          "float, pavucontrol-qt"
          "float, pavucontrol"
          "float, file-roller"
          "fullscreen, wlogout"
          "float, title:wlogout"
          "fullscreen, title:wlogout"
          "idleinhibit focus, mpv"
          "idleinhibit fullscreen, firefox"
          "float, title:^(Media viewer)$"
          "float, title:^(Volume Control)$"
          "float, title:^(Picture-in-Picture)$"
          "size 800 600, title:^(Volume Control)$"
          "move 75 44%, title:^(Volume Control)$"
        ];
	
	# mode for user key
        "$mainMod" = "SUPER";

        bind = [
	  # programs
          "$mainMod, T, exec, kitty"
          "$mainMod, Q, killactive"
	  "$mainMod SHIFT, L, exec, hyprlock"
	  "$mainMod, E, exec, pcmanfm"
	  "$mainMod, SPACE, exec, rofi -show drun"
	  "$mainMod, P, exec, wlogout"
	  "$mainMod, F, exec, firefox"
	  "$mainMod, O, exec, obsidian"
	  "$mainMod, C, exec, code"
          "$mainMod, M, exit"
	
	  # clipboard and screenshots
	  "$mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
	  "$mainMod, PRINT, exec, hyprshot -m window"
	  "$mainMod SHIFT, PRINT, exec, hyprshot -m region"

	  # window nav
	  "$mainMod, H, movefocus, l"
	  "$mainMod, L, movefocus, r"
	  "$mainMod, K, movefocus, u"
	  "$mainMod, J, movefocus, d"

	  # switching workspaces
	  "$mainMod, 1, workspace, 1"
	  "$mainMod, 2, workspace, 2"
	  "$mainMod, 3, workspace, 3"
	  "$mainMod, 4, workspace, 4"
	  "$mainMod, 5, workspace, 5"
	  "$mainMod, 6, workspace, 6"
	  "$mainMod, 7, workspace, 7"
	  "$mainMod, 8, workspace, 8"
	  "$mainMod, 9, workspace, 9"
	  "$mainMod, 0, workspace, 10"

	  # move window to workspace
	  "$mainMod SHIFT, 1, movetoworkspace, 1"
	  "$mainMod SHIFT, 2, movetoworkspace, 2"
	  "$mainMod SHIFT, 3, movetoworkspace, 3"
	  "$mainMod SHIFT, 4, movetoworkspace, 4"
	  "$mainMod SHIFT, 5, movetoworkspace, 5"
	  "$mainMod SHIFT, 6, movetoworkspace, 6"
	  "$mainMod SHIFT, 7, movetoworkspace, 7"
	  "$mainMod SHIFT, 8, movetoworkspace, 8"
	  "$mainMod SHIFT, 9, movetoworkspace, 9"
	  "$mainMod SHIFT, 0, movetoworkspace, 10"

        ];

        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

	bindel = [
	  ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
	  ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
 	  ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	  ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
	  ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
	  ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
	];

        windowrulev2 = [
	  "suppressevent maximize, class:.*"
        ];
      };
    };
}
