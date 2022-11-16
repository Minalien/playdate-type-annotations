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
	Implements an arc.

	You can directly read or write the x, y, radius, startAngle, endAngle and clockwise values of an arc.

	https://sdk.play.date/inside-playdate/#C-geometry.arc
]]
---@class playdate.geometry.arc
---@field x number
---@field y number
---@field radius number
---@field startAngle number
---@field endAngle number
---@field clockwise boolean
playdate.geometry.arc = {}

--[[
	Returns a new playdate.geometry.arc. Angles should be specified in degrees. Zero degrees represents the top of the circle.

	https://sdk.play.date/inside-playdate/#m-geometry.arc.new
]]
---@param x number
---@param y number
---@param radius number
---@param startAngle number
---@param endAngle number
---@param direction boolean Should be true for clockwise, false for counterclockwise. If not specified, the direction is inferred from the start and end angles.
---@return playdate.geometry.arc
function playdate.geometry.arc.new(x, y, radius, startAngle, endAngle, direction) end

--[[
	Returns a new copy of the arc.

	https://sdk.play.date/inside-playdate/#m-geometry.arc.copy
]]
---@return playdate.geometry.arc
function playdate.geometry.arc:copy() end

--[[
	Returns the length of the arc.

	https://sdk.play.date/inside-playdate/#m-geometry.arc.length
]]
---@return number
function playdate.geometry.arc:length() end

--[[
	Returns true if the direction of the arc is clockwise.

	https://sdk.play.date/inside-playdate/#m-geometry.arc.isClockwise
]]
---@return boolean
function playdate.geometry.arc:isClockwise() end

--[[
	Sets the direction of the arc.

	https://sdk.play.date/inside-playdate/#m-geometry.arc.setIsClockwise
]]
---@param flag boolean
function playdate.geometry.arc:setIsClockwise(flag) end

--[[
	Returns a new point on the arc, distance pixels from the arc’s start angle.

	https://sdk.play.date/inside-playdate/#m-geometry.arc.pointOnArc
]]
---@param distance number
---@return playdate.geometry.point
function playdate.geometry.arc:pointOnArc(distance) end
