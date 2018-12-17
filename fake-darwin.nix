{ stdenv
, fetchurl
, unzip
}:
  stdenv.mkDerivation rec {
    version = "5.11.1";
    name = "fake-dotnetcore-${version}";

    src = fetchurl {
      url = "https://github.com/fsharp/FAKE/releases/download/${version}/fake-dotnetcore-osx.10.11-x64.zip";
      sha256 = "09g5dj39fws0wch0zxz3wdv3y2qph801nxgb85ns5ksl8lpn1195";
    };

    buildInputs = [ unzip ];

    unpackPhase = ''
      mkdir src
      cd src
      unzip $src
    '';

    buildPhase = ''
      runHook preBuild
      chmod +x ./fake
      echo -n "dotnet-sdk version: "
      ./fake --version
      runHook postBuild
    '';


    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      cp -r ./ $out
      ln -s $out/fake $out/bin/fake
      runHook postInstall
    '';

    meta = with stdenv.lib; {
      homepage = https://github.com/fsharp/FAKE;
      description = "Fake ${version} for dotnetcore for darwin";
      platforms = [ "x86_64-darwin" ];
    };
  }
