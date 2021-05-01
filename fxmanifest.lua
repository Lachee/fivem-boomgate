-- This resource is part of the default Cfx.re asset pack (cfx-server-data)
-- Altering or recreating for local use only is strongly discouraged.

version '1.1.0'
author 'Lachee'
description 'Better boomgate control.'
repository 'https://github.com/lachee/fivem-boomgate'

client_scripts {
    "config.lua",
    "client/utils.lua",
    "client/client.lua",
}

server_scripts {
    "config.lua",
    "server/server.lua",
}

fx_version 'adamant'
games { 'rdr3', 'gta5' }

dependencies { }

