{ stdenv
, fetchurl
, unzip
}:
  stdenv.mkDerivation rec {
    version = "5.8.4";
    name = "fake-dotnetcore-${version}";

    src = fetchurl {
      url = "https://github.com/fsharp/FAKE/releases/download/${version}/fake-dotnetcore-osx.10.11-x64.zip";
      sha256 = "0fljx9rxxmh8yb48mksr1vkq627p8i49y33cybl6jssi1c8c2zi1";
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
