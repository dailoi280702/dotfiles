hs.loadSpoon("SpoonInstall")
hs.loadSpoon("EmmyLua")
hs.loadSpoon("ReloadConfiguration")

spoon.ReloadConfiguration:start()

-- require("paper")
require("cleaner").init({
	age = 60 * 60 * 24, -- 1 day
	scheduleInterval = 60 * 60, -- 1 hour
	path = "~/Downloads/",
})

hs.hotkey.bind({ "cmd" }, "escape", function()
	hs.eventtap.keyStroke({ "cmd" }, "`")
end)

hs.notify.new({ title = "Hammerspoon", informativeText = "Hammerspoon reloaded!" }):send()
