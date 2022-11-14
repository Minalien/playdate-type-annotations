--[[
	PlayDate SDK Types Meta-File
	A collection of type annotations for the PlayDate SDK
	Compatible with SDK 1.12.3

	This file should NOT actually be imported; VSCode should automatically reference it for type completion.
	Importing this file will likely break things, as some functions are redefined for the sake of providing type definition.

	Originally written by Minalien (https://cohost.org/Minalien).
	Consider this file public domain.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#api-reference
]]
---@meta

--[[
	Implement this callback and Playdate OS will call it once per frame. This is the place to put the main update-and-draw code for your game. Playdate will attempt to call this function by default 30 times per second; that value can be changed by calling playdate.display.setRefreshRate().

	https://sdk.play.date/inside-playdate/#c-update
]]
function playdate.update() end

--[[
	Suspends callbacks to playdate.update() for the specified number of milliseconds.

	https://sdk.play.date/inside-playdate/#f-wait
]]
---@param milliseconds integer
function playdate.wait(milliseconds) end

--[[
	Stops per-frame callbacks to playdate.update(). Useful in conjunction with playdate.display.flush() if your program only does things in response to button presses.

	https://sdk.play.date/inside-playdate/#f-stop
]]
function playdate.stop() end

--[[
	Resumes per-frame callbacks to playdate.update().

	https://sdk.play.date/inside-playdate/#f-start
]]
function playdate.start() end
