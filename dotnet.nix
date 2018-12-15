{ stdenv
, fetchurl
, libunwind
, openssl
, icu
, libuuid
, zlib
, curl
}:
  stdenv.mkDerivation rec {
    version = "2.2.101";
    netCoreVersion = "2.1.5";
    name = "dotnet-sdk-${version}";

    src = fetchurl {
      url = "https://dotnetcli.azureedge.net/dotnet/Sdk/${version}/dotnet-sdk-${version}-osx-x64.tar.gz";
      # use sha512 from the download page
      sha512 = "52CAC8B0366356B39F9624C915FE7F38E49433178572D7C0131A7495EB282C4C78ECDE979BFEE3F4846603B8FF7C0C5D96DA7CE33150F12D406DD0EC117DE3E7";
    };

    unpackPhase = ''
      mkdir src
      cd src
      tar xvzf $src
    '';

    buildPhase = ''
      runHook preBuild
      echo -n "dotnet-sdk version: "
      ./dotnet --version
      runHook postBuild
    '';


    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      cp -r ./ $out
      ln -s $out/dotnet $out/bin/dotnet
      runHook postInstall
    '';

    meta = with stdenv.lib; {
      homepage = https://dotnet.github.io/;
      description = ".NET Core SDK ${version} with .NET Core ${netCoreVersion}";
    };
  }
