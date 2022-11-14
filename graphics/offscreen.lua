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
	lockFocus() routes all drawing to the given playdate.graphics.image. playdate.graphics.unlockFocus() returns drawing to the frame buffer.

	https://sdk.play.date/inside-playdate/#f-graphics.lockFocus
]]
---@param image playdate.graphics.image
function playdate.graphics.lockFocus(image) end

--[[
	After calling unlockFocus(), drawing is routed to the frame buffer.

	https://sdk.play.date/inside-playdate/#f-graphics.unlockFocus
]]
function playdate.graphics.unlockFocus() end
