{ config, pkgs, ... }:

{
  home.file.".config/ohmyposh/omp_config.toml".text = ''
    console_title_template = '{{ .Shell }} in {{ .Folder }}'
    version = 3
    final_space = true

    [secondary_prompt]
      template = '❯❯ '
      foreground = 'blue'
      background = 'transparent'

    [transient_prompt]
      template = '❯ '
      foreground = 'blue'
      background = 'transparent'
      foreground_templates = ['{{if gt .Code 0}}red{{end}}', '{{if eq .Code 0}}blue{{end}}']

    [[blocks]]
      type = 'prompt'
      alignment = 'left'
      newline = true

      [[blocks.segments]]
        template = '{{ if .WSL }}WSL at{{ end }} {{.Icon}} '
        foreground = 'lightWhite'
        background = 'black'
        type = 'os'
        style = 'powerline'

        [blocks.segments.properties]
          cache_duration = 'none'

      [[blocks.segments]]
        template = ' {{ .Path }} '
        foreground = 'black'
        powerline_symbol = ''
        background = 'blue'
        type = 'path'
        style = 'powerline'

        [blocks.segments.properties]
          cache_duration = 'none'
          style = 'full'

      [[blocks.segments]]
        template = ' {{ if .UpstreamURL }}{{ url .UpstreamIcon .UpstreamURL }} {{ end }}{{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }}  {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }}  {{ .Staging.String }}{{ end }}{{ if gt .StashCount 0 }}  {{ .StashCount }}{{ end }} '
        foreground = 'black'
        powerline_symbol = ''
        background = 'green'
        type = 'git'
        style = 'powerline'
        foreground_templates = ['{{ if or (.Working.Changed) (.Staging.Changed) }}black{{ end }}', '{{ if and (gt .Ahead 0) (gt .Behind 0) }}white{{ end }}', '{{ if gt .Ahead 0 }}white{{ end }}']
        background_templates = ['{{ if or (.Working.Changed) (.Staging.Changed) }}yellow{{ end }}', '{{ if and (gt .Ahead 0) (gt .Behind 0) }}red{{ end }}', '{{ if gt .Ahead 0 }}purple{{ end }}', '{{ if gt .Behind 0 }}darkMagenta{{ end }}']

        [blocks.segments.properties]
          branch_icon = ' '
          branch_identical_icon = ''
          branch_max_length = 25
          cache_duration = 'none'
          fetch_stash_count = true
          fetch_status = true

    [[blocks]]
      type = 'prompt'
      alignment = 'left'
      newline = true

      [[blocks.segments]]
        template = '❯'
        foreground = 'blue'
        background = 'transparent'
        type = 'text'
        style = 'plain'
        foreground_templates = ['{{if gt .Code 0}}red{{end}}', '{{if eq .Code 0}}blue{{end}}']

        [blocks.segments.properties]
          cache_duration = 'none'

    [[blocks]]
      type = 'rprompt'

      [[blocks.segments]]
        template = '   {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }} '
        foreground = 'blue'
        background = 'transparent'
        type = 'lua'
        style = 'plain'

        [blocks.segments.properties]
          cache_duration = 'none'
          fetch_version = true

      [[blocks.segments]]
        template = '  {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }} '
        foreground = 'red'
        background = 'transparent'
        type = 'rust'
        style = 'plain'

        [blocks.segments.properties]
          cache_duration = 'none'
          fetch_version = true

      [[blocks.segments]]
        template = ' '
        foreground = 'green'
        background = 'transparent'
        type = 'node'
        style = 'plain'

        [blocks.segments.properties]
          cache_duration = 'none'
          display_mode = 'files'
          fetch_package_manager = true
          home_enabled = false

      [[blocks.segments]]
        template = ' {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}'
        foreground = 'blue'
        background = 'transparent'
        type = 'go'
        style = 'plain'

        [blocks.segments.properties]
          cache_duration = 'none'
          fetch_version = true

      [[blocks.segments]]
        template = ' {{ if .Error }}{{ .Error }}{{ else }}{{ if .Venv }}{{ .Venv }} {{ end }}{{ .Full }}{{ end }} '
        foreground = 'yellow'
        background = 'transparent'
        type = 'python'
        style = 'plain'

        [blocks.segments.properties]
          cache_duration = 'none'
          display_mode = 'files'
          fetch_version = true
      	  fetch_virtual_env = true

      [[blocks.segments]]
    	template = 'in <blue><b>{{ .Name }}</b></> '
    	foreground = 'white'
    	background = 'transparent'
    	type = 'shell'
    	style = 'plain'

    	[blocks.segments.properties]
      	  cache_duration = 'none'

      [[blocks.segments]]
   	template = 'at <blue><b>{{ .CurrentDate | date "15:04:05" }}</b></>'
    	background = 'transparent'
    	type = 'time'
    	style = 'plain'

    	[blocks.segments.properties]
      	  cache_duration = 'none'

      [[blocks.segments]]
    	template = ' {{ .FormattedMs }} '
    	foreground = 'yellow'
    	background = 'transparent'
    	type = 'executiontime'
    	style = 'plain'

    	[blocks.segments.properties]
      	  cache_duration = 'none'
      	  threshold = 500
  '';  
}
