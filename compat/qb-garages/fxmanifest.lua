fx_version 'cerulean'
game 'gta5'

description 'QG-Garages'
version '1.0'
author 'JDev'
shared_scripts {'@qb-core/shared/locale.lua', 'locales/en.lua', 'config.lua'}
client_scripts {'@PolyZone/client.lua', '@PolyZone/BoxZone.lua', '@PolyZone/EntityZone.lua', '@PolyZone/CircleZone.lua', '@PolyZone/ComboZone.lua', 'client/main.lua'}
server_scripts {'@oxmysql/lib/MySQL.lua', 'server/main.lua'}
lua54 'yes'
