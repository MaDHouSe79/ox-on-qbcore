fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'
name 'ox_inventory'
author 'Overextended'
version '2.43.3'
repository 'https://github.com/overextended/ox_inventory'
description 'Slot-based inventory with item metadata support'

dependencies {
    '/server:6116',
    '/onesync',
    'oxmysql',
    'ox_lib',
}

shared_script '@ox_lib/init.lua'

ox_libs {
    'locale',
    'table',
    'math',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'init.lua'
}

client_script 'init.lua'

ui_page 'html/index.html'

files {
    'client.lua',
    'server.lua',
    'locales/*.json',
    'html/index.html',
    'html/assets/js/*.js',
    'html/assets/css/*.css',
    'html/assets/images/*.png',
    'modules/**/shared.lua',
    'modules/**/client.lua',
    'mods/**/client.lua',
    'modules/bridge/**/client.lua',
    'data/*.lua',
}