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
	Implements a two-dimensional point. You can directly read or write the x and y values of a point.

	https://sdk.play.date/inside-playdate/#C-geometry.point
]]
---@class playdate.geometry.point
---@field x number
---@field y number
---@operator add(playdate.geometry.vector2D): playdate.geometry.point
---@operator sub(playdate.geometry.point): playdate.geometry.vector2D
---@operator mul(playdate.geometry.affineTransform): playdate.geometry.point
---@operator concat(playdate.geometry.point): playdate.geometry.lineSegment
playdate.geometry.point = {}

--[[
	Returns a new playdate.geometry.point.

	https://sdk.play.date/inside-playdate/#f-geometry.point.new
]]
---@param x number
---@param y number
---@return playdate.geometry.point
function playdate.geometry.point.new(x, y) end

--[[
	Returns a new copy of the point.

	https://sdk.play.date/inside-playdate/#m-geometry.point.copy
]]
---@return playdate.geometry.point
function playdate.geometry.point:copy() end

--[[
	Returns the values x, y.

	https://sdk.play.date/inside-playdate/#m-geometry.point.unpack
]]
---@return number x, number y
function playdate.geometry.point:unpack() end

--[[
	Modifies the point, offsetting its values by dx, dy.

	https://sdk.play.date/inside-playdate/#m-geometry.point.offset
]]
---@param dx number
---@param dy number
function playdate.geometry.point:offset(dx, dy) end

--[[
	Returns a new point object, the given point offset by dx, dy.

	https://sdk.play.date/inside-playdate/#m-geometry.point.offsetBy
]]
---@param dx number
---@param dy number
---@return playdate.geometry.point
function playdate.geometry.point:offsetBy(dx, dy) end

--[[
	Returns the square of the distance to point p.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#m-geometry.point.squaredDistanceToPoint
]]
---@param p playdate.geometry.point
---@return number
function playdate.geometry.point:squaredDistanceToPoint(p) end

--[[
	Returns the distance to point p.

	https://sdk.play.date/inside-playdate/#m-geometry.point.distanceToPoint
]]
---@param p playdate.geometry.point
---@return number
function playdate.geometry.point:distanceToPoint(p) end
