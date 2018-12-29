//Nix Auto generated dependendcies references
//nix-start
#r /nix/store/1cbcv248vwkx5m84fya6nypvyl5yw70q-System.Data.SqlClient-4.6.0/lib/dotnet/System.Data.SqlClient/netstandard2.0/System.Data.SqlClient.dll
#r /nix/store/1cbcv248vwkx5m84fya6nypvyl5yw70q-System.Data.SqlClient-4.6.0/lib/dotnet/System.Data.SqlClient/netstandard2.0/System.Data.SqlClient.dll
//nix-end
open System.Data.SqlClient
open System
open System.Data.SqlClient



type Query = Query of string
type Command = 
    | SqlQuery of Query
    | HanaQuery of Query


type ConnectionString = CS of string
type DBState = {
    ConnectionString: ConnectionString   
}

type ColumnName = ColumnName of string
type ColumnValue = ColumnValue of string
type QueryRow = QueryRow of Map<ColumnName, ColumnValue>
type QueryResult = QueryResult of seq<QueryRow>
let CreateQueryRow ls = ls |> Map.ofList |> QueryRow

let r = [ (ColumnName "b", ColumnValue "3") ] |> CreateQueryRow 

let ExecuteSql sqlQuery = seq { yield r } |> QueryResult

Query "select * from oitm"
|> SqlQuery 
|> ExecuteSql
|> printfn "%A" 

