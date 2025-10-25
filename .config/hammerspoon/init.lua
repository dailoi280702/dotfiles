hs.loadSpoon("EmmyLua")
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

require("trash_cleaner").init({
	age = 60 * 60 * 24, -- 1 day
	scheduleInterval = 60 * 60, -- 1 hour
	path = "~/Downloads/",
})

hs.notify.new({ title = "Hammerspoon", informativeText = "Hammerspoon reloaded!" }):send()
