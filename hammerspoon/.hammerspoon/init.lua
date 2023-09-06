-- Load and install the Hyper key extension. Binding to F18
local hyper = require('hyper')
hyper.install('F18')

-- Quick reloading of Hammerspoon
hyper.bindKey('r', hs.reload)

-- Global Application Keyboard Shortcuts
hyper.bindKey('t', function()
  am.switchToAndFromApp("org.Alacritty")
end)
