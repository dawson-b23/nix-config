# derivation for comic-code font installation
{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "comic-code";
  version = "1";

  src = ../source/fonts/ComicCode.zip;

  unpackPhase = ''
    runHook preUnpack
    ${pkgs.unzip}/bin/unzip $src

    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall

    install -Dm644 berkeley-mono-patched/*.otf -t $out/share/fonts/truetype

    runHook postInstall
  '';
}

