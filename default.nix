{ mkDerivation, writeText }:
let appDeps = writeText "appDeps" ''
  
'';
in
mkDerivation rec {
  name = "SierrTek web app";
  buildInputs = [
    
  ];

  
}
