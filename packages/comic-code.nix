# derivation for comic-code font installation
{ stdenvNoCC,
  lib,
  pkgs,
}:

stdenvNoCC.mkDerivation {
  pname = "comic-code";
  version = "1.0";

  src = ../source/fonts/ComicCodeFont;

  installPhase = ''
    mkdir -p $out/share/fonts/truetype/
    if [ -d "$src" ]; then
      cp -r $src/*.{ttf,otf} $out/share/fonts/truetype/
    else
      echo "No fonts found in $src"
      exit 0
    fi
  '';
}

