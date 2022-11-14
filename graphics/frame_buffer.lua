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
	Returns a copy the contents of the last completed frame, i.e., a "screenshot", as a playdate.graphics.image.

	Display functions like setMosaic(), setInverted(), setScale(), and setOffset() do not affect the returned image. 

	https://sdk.play.date/inside-playdate/#f-graphics.getDisplayImage
]]
---@return playdate.graphics.image
function playdate.graphics.getDisplayImage() end

--[[
	Returns a copy the contents of the working frame buffer — the current frame, in-progress — as a playdate.graphics.image.

	Display functions like setMosaic(), setInverted(), setScale(), and setOffset() do not affect the returned image. 

	https://sdk.play.date/inside-playdate/#f-graphics.getWorkingImage
]]
---@return playdate.graphics.image
function playdate.graphics.getWorkingImage() end
