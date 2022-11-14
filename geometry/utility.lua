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
	Returns the square of the distance from point (x1, y1) to point (x2, y2).

	Compared to geometry.point:squaredDistanceToPoint(), this version will be slightly faster.

	https://sdk.play.date/inside-playdate/#f-geometry.squaredDistanceToPoint
]]
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number
function playdate.geometry.squaredDistanceToPoint(x1, y1, x2, y2) end

--[[
	Returns the the distance from point (x1, y1) to point (x2, y2).

	Compared to geometry.point:distanceToPoint(), this version will be slightly faster.

	https://sdk.play.date/inside-playdate/#f-geometry.distanceToPoint
]]
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number
function playdate.geometry.distanceToPoint(x1, y1, x2, y2) end
