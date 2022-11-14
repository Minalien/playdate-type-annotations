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
	Pushes the current graphics state to the context stack and creates a new context. If a playdate.graphics.image is given, drawing functions are applied to the image instead of the screen buffer.

	Equivalent to `playdate->graphics->pushContext()` in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.pushContext
]]
---@param image? playdate.graphics.image
function playdate.graphics.pushContext(image) end

--[[
	Pops a graphics context off the context stack and restores its state.

	Equivalent to `playdate->graphics->popContext()` in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.popContext
]]
function playdate.graphics.popContext() end
