check SDK version if 8.0.x

check package manager settings if in package sources there's this -> nuget.org https://api.nuget.org/v3/index.json

if there's problem with MSBuild version lower than 17.7 please update vs 2022

run dotnet tool install --global dotnet-ef for creating DB schema

run `dotnet ef database update` to create schema

copy script from `data/AddData.sql`
open new query on DB level
paste and run script