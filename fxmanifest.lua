-- For support join my discord: https://discord.gg/Z9Mxu72zZ6

author "Valencia Modifcations | TheStoicBear"
description "StoicMDT Mugshot Handler"
version "1.0"

fx_version "cerulean"
game "gta5"
lua54 "yes"

client_scripts {
    "client.lua"
}
server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "server.lua"
}
shared_script "@ox_lib/init.lua"
dependency "oxmysql"
