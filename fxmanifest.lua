fx_version 'cerulean'
game 'gta5'

author 'alenvalek'
description 'Vue boilerplate for building beautiful NUI-s'
version '1.0.0'



client_script {
   'c_main.lua'
}

server_script {
   's_main.lua'
}
shared_script {
   '@es_extended/imports.lua',
   'sh.lua'
}
ui_page {
   "html/dist/index.html"
}

files {
   "html/dist/index.html",
   "html/dist/assets/*.*",
   "html/dist/images/items/*.*",
}

lua54 'yes'
