fx_version "cerulean"
game "gta5"
lua54 "yes"

name "unibridge"
author "IlMelons"
description "Fivem Universal Bridge for Scripts"
version "1.0.0"

shared_scripts {
    "@ox_lib/init.lua",
    "shared/autodetect.lua"
}

files {
    "config.lua",
    "data/*.lua",
}