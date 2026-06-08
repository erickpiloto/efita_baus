fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'ErickFita - QBCore Scripts'
description 'Sistema de Baus para servidores QBCore default'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua'
}

client_scripts {
    'client/cliente.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/servidor.lua'
}

dependencies {
    'qb-core',
    'qb-target',
    'qb-inventory'
}