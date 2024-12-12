{
  config,
  lib, 
  ...
}:
{  
    programs.fzf = {
        enable = true;
	enableZshIntegration = true;
	
	colors = with config.colorScheme.colors; {
	  "fg" = "0x${base07}";
	  "bg" = "0x${base00}";
	  "hl" = "0x${base0E}";
	  "fg+" = "0x${base07}";
	  "bg+" = "0x${base01}";
	  "hl+" = "0x${base0E}"; 
	  "info" = "0x${base09}";
	  "prompt" = "0x${base0B}";
	  "pointer" = "0x${base08}";
	  "marker" = "0x${base08}";
	  "spinner" = "0x${base09}";
	  "header" = "0x${base0D}";

	};

	defaultOptions = [
	  "--preview='bat --color=always -n {}'"
	  "--bind 'ctrl-/:toggle-preview'"
	];
	defaultCommand = "fd --type f --exclude .git --follow --hidden";
	changeDirWidgetCommand = "fd --type d --exclude .git --follow --hidden";
      };
}
