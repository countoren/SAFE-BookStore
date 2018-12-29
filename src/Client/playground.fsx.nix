{ fetchNuGet }:
[
  ''${( fetchNuGet {
    baseName = "System.Data.SqlClient";
    version = "4.6.0";
    sha256 = "0m8dpga8idcrhcjd1l8dqajvis4aip12z04m7grj6qi9j47rrkpr";
    outputFiles = [ "lib/*" ];
  })}/lib/dotnet/System.Data.SqlClient/netstandard2.0/System.Data.SqlClient.dll''
  ''${( fetchNuGet {
    baseName = "System.Data.SqlClient";
    version = "4.6.0";
    sha256 = "0m8dpga8idcrhcjd1l8dqajvis4aip12z04m7grj6qi9j47rrkpr";
    outputFiles = [ "lib/*" ];
  })}/lib/dotnet/System.Data.SqlClient/netstandard2.0/System.Data.SqlClient.dll''
]
