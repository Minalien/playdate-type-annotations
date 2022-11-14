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
	Implements a line segment between two points in two-dimensional space.

	You can directly read or write x1, y1, x2, or y2 values to a lineSegment.
]]
---@class playdate.geometry.lineSegment
---@field x1 number
---@field y1 number
---@field x2 number
---@field y2 number
playdate.geometry.lineSegment = {}

--[[
	Returns a new playdate.geometry.lineSegment.

	https://sdk.play.date/inside-playdate/#f-geometry.lineSegment.new
]]
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return playdate.geometry.lineSegment
function playdate.geometry.lineSegment.new(x1, y1, x2, y2) end

--[[
	Returns a new copy of the line segment.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.copy
]]
---@return playdate.geometry.lineSegment
function playdate.geometry.lineSegment:copy() end

--[[
	Returns the values x1, y1, x2, y2.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.unpack
]]
---@return number x1, number y1, number x2, number y2
function playdate.geometry.lineSegment:unpack() end

--[[
	Returns the length of the line segment.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.length
]]
---@return number
function playdate.geometry.lineSegment:length() end

--[[
	Modifies the line segment, offsetting its values by dx, dy.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.offset
]]
---@param dx number
---@param dy number
function playdate.geometry.lineSegment:offset(dx, dy) end

--[[
	Returns a new line segment, the given segment offset by dx, dy.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.offsetBy
]]
---@param dx number
---@param dy number
---@return playdate.geometry.lineSegment
function playdate.geometry.lineSegment:offsetBy(dx, dy) end

--[[
	Returns a playdate.geometry.point representing the mid point of the line segment.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.midPoint
]]
---@return playdate.geometry.point
function playdate.geometry.lineSegment:midPoint() end

--[[
	Returns a playdate.geometry.point on the line segment, distance pixels from the start of the line.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.pointOnLine
]]
---@param distance number
---@return playdate.geometry.point
function playdate.geometry.lineSegment:pointOnLine(distance) end

--[[
	Returns a playdate.geometry.vector2D representation of the line segment.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.segmentVector
]]
---@return playdate.geometry.vector2D
function playdate.geometry.lineSegment:segmentVector() end

--[[
	Returns a playdate.geometry.point that is the closest point to point p that is on the line segment.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.closestPointOnLineToPoint
]]
---@param p playdate.geometry.point
function playdate.geometry.lineSegment:closestPointOnLineToPoint(p) end

--[[
	Returns true if there is an intersection between the caller and the line segment ls.

	If there is an intersection, a playdate.geometry.point representing that point is also returned.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#m-geometry.lineSegment.intersectsLineSegment
]]
---@param ls playdate.geometry.lineSegment
---@return boolean intersects, playdate.geometry.point|nil pointOfIntersection
function playdate.geometry.lineSegment:intersectsLineSegment(ls) end

--[[
	For use in inner loops where speed is the priority.

	Returns true if there is an intersection between the line segments defined by (x1, y1), (x2, y2) and (x3, y3), (x4, y4). If there is an intersection, x, y values representing the intersection point are also returned.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.fast.intersection
]]
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param x3 number
---@param y3 number
---@param x4 number
---@param y4 number
---@return boolean intersects, number intersectionX, number intersectionY
function playdate.geometry.lineSegment.fast_intersection(x1, y1, x2, y2, x3, y3, x4, y4) end

--[[
	Returns the values (intersects, intersectionPoints).

	intersects is true if there is at least one intersection between the caller and poly.

	intersectionPoints is an array of playdate.geometry.points containing all intersection points between the caller and poly.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.intersectsPolygon
]]
---@param poly playdate.geometry.polygon
---@return boolean intersects, playdate.geometry.point[] intersectionPoints
function playdate.geometry.lineSegment:intersectsPolygon(poly) end

--[[
	Returns the values (intersects, intersectionPoints).

	intersects is true if there is at least one intersection between the caller and rect.

	intersectionPoints is an array of playdate.geometry.points containing all intersection points between the caller and rect.

	https://sdk.play.date/inside-playdate/#m-geometry.lineSegment.intersectsRect
]]
---@param rect playdate.geometry.rect
---@return boolean intersects, playdate.geometry.point[] intersectionPoints
function playdate.geometry.lineSegment:intersectsRect(rect) end
