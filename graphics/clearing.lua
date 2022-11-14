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
	Clears the entire display, setting the color to either the given color argument, or the current background color set in setBackgroundColor(color) if no argument is given.

	Equivalent to `playdate->graphics->clear()` in the C API.
]]
---@param color PlaydateColor
function playdate.graphics.clear(color) end
