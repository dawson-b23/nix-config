{
  config,
  lib, 
  ...
}:
{
      programs.zsh = {
        enable = true;
        initExtraFirst = ''
          if [[ -o interactive ]]; then 
            fastfetch
          fi
        '';
        syntaxHighlighting.enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;        
	shellAliases = {
          # navigation
          "c"="clear"; 
          ".." = "cd .."; 
          "..." = "cd ../..";   
          
          #editor 
          "vim"="nvim";
          "zshrc"="vim ~/.zshrc";

          # file manip
          "mkdir"="mkdir -p";
          "rm"="rm -i";
          "cp"="cp -i";
          "mv"="mv -i";
         
	 # git 
	 "pull_all"="ls ; ls | xargs -I{} git -C {} pull";
	 "status_all"="ls ; ls | xargs -I{} git -C {} status";

          # eza 
          "ll"="eza -lha --icons=auto --sort=name --group-directories-first"; # long list all
          "lt"="eza -a --icons=auto --tree -I \".git\" "; # list tree
          "l"="eza -1a --icons=auto --sort=name --group-directories-first"; # short list
        };
        
        initExtra = ''
	  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/omp_config.toml)"
        '';
      };
    
}
