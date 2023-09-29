-- Quick reloading of Hammerspoon
hs.hotkey.bindSpec({ {"cmd", "alt"}, "y"}, hs.reload)

-- Show Hammerspoon console
hs.hotkey.bindSpec({ {"cmd", "alt"}, "y"}, hs.toggleConsole)

-- hs.hotkey.bind({"F17"}, "T", function()
  -- hs.application.launchOrFocusByBundleID("org.Alacritty")
  -- end
-- )
