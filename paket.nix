{ stdenv
, fetchurl
, mono
, writeShellScriptBin
}:
let 
    version = "5.194.0";
    paketExe = fetchurl {
      url = "https://github.com/fsprojects/Paket/releases/download/${version}/paket.exe";
      sha256 = "DEA8D2ED83FA7C56AE9A9F10198F5722DF385B558E376EFB6A6B128EE08C9C47";
    };
    paketWithMono = writeShellScriptBin "paket" ''
      ${mono}/bin/mono ${paketExe} "$@"
    '';
  in
  paketWithMono.overrideAttrs(old: 
  {
    inherit version;
    name = "paket-darwin-${version}";
    meta = with stdenv.lib; {
      homepage = https://github.com/fsprojects/Paket;
      description = "Paket ${version} for darwin";
      platforms = [ "x86_64-darwin" ];
    };
  })

