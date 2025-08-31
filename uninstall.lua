local shell = require('shell')
local scripts = {
    'setup.lua',
    'config.lua',
    'autoPump.lua',
    'uninstall.lua'
}

-- UNINSTALL
for i=1, #scripts do
    shell.execute(string.format('rm %s', scripts[i]))
    print(string.format('Uninstalled %s', scripts[i]))
end