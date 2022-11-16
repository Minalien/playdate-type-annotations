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
	You can directly read or write the width and height values of a size.

	https://sdk.play.date/inside-playdate/#C-geometry.size
]]
---@class playdate.geometry.size : Object
---@field width number
---@field height number
playdate.geometry.size = {}

--[[
	Returns a new playdate.geometry.size.

	https://sdk.play.date/inside-playdate/#f-geometry.size.new
]]
---@param width number
---@param height number
---@return playdate.geometry.size
function playdate.geometry.size.new(width, height) end

--[[
	Returns a new copy of the size.

	https://sdk.play.date/inside-playdate/#m-geometry.size.copy
]]
---@return playdate.geometry.size
function playdate.geometry.size:copy() end

--[[
	Returns the values width, height.

	https://sdk.play.date/inside-playdate/#m-geometry.size.unpack
]]
---@return number width, number height
function playdate.geometry.size:unpack() end
