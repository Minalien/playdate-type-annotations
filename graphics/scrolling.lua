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
	Offsets the origin point for all drawing calls to x, y (can be negative). So, for example, if the offset is set to -20, -20, an image drawn at 20, 20 will appear at the origin (in the upper left corner.)

	This is useful, for example, for centering a "camera" on a sprite that is moving around a world larger than the screen.

	It can be useful to have operations sometimes ignore the draw offsets. For example, you may want to have the score or some other heads-up display appear onscreen apart from scrolling content. A sprite can be set to ignore offsets by calling playdate.graphics.sprite:setIgnoresDrawOffset(true). playdate.graphics.image:drawIgnoringOffsets() lets you render an image using screen coordinates.

	Equivalent to `playdate->graphics->setDrawOffset()` in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.setDrawOffset
]]
---@param x integer
---@param y integer
function playdate.graphics.setDrawOffset(x, y) end

--[[
	Returns multiple values (x, y) giving the current draw offset.

	https://sdk.play.date/inside-playdate/#f-graphics.getDrawOffset
]]
---@return integer x, integer y
function playdate.graphics.getDrawOffset() end
