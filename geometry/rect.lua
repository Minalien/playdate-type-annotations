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

-- TODO: Verify types of origin & size
--[[
	Implements a rectangle.

	You can directly read or write x, y, width, or height values to a rect.
	The values of top, bottom, right, left, origin, and size are read-only.

	https://sdk.play.date/inside-playdate/#C-geometry.rect
]]
---@class playdate.geometry.rect : Object
---@field x number
---@field y number
---@field width number
---@field height number
---@field top number
---@field bottom number
---@field left number
---@field right number
---@field origin playdate.geometry.point
---@field size playdate.geometry.size
playdate.geometry.rect = {}

--[[
	Returns a new playdate.geometry.rect.

	https://sdk.play.date/inside-playdate/#f-geometry.rect.new
]]
---@param x number
---@param y number
---@param width number
---@param height number
---@return playdate.geometry.rect
function playdate.geometry.rect.new(x, y, width, height) end

--[[
	Returns a new copy of the rect.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.copy
]]
---@return playdate.geometry.rect
function playdate.geometry.rect:copy() end

--[[
	Returns a new playdate.geometry.polygon version of the rect.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.toPolygon
]]
---@return playdate.geometry.polygon
function playdate.geometry.rect:toPolygon() end

--[[
	Returns x, y, width and height as individual values.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.unpack
]]
---@return number x, number y, number width, number height
function playdate.geometry.rect:unpack() end

--[[
	Returns true if a rectangle has zero width or height.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.isEmpty
]]
---@return boolean
function playdate.geometry.rect:isEmpty() end

--[[
	Returns true if the x, y, width, and height values of the caller and r2 are all equal.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.isEqual
]]
---@param r2 playdate.geometry.rect
---@return boolean
function playdate.geometry.rect:isEqual(r2) end

--[[
	Returns true if r2 intersects the caller.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.intersects
]]
---@param r2 playdate.geometry.rect
function playdate.geometry.rect:intersects(r2) end

--[[
	Returns a rect representing the overlapping portion of the caller and r2.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.intersection
]]
---@param r2 playdate.geometry.rect
---@return playdate.geometry.rect
function playdate.geometry.rect:intersection(r2) end

--[[
	For use in inner loops where speed is the priority. About 3x faster than intersection.

	Returns multiple values (x, y, width, height) representing the overlapping portion of the two rects defined by x1, y1, w1, h1 and x2, y2, w2, h2. If there is no intersection, (0, 0, 0, 0) is returned.

	https://sdk.play.date/inside-playdate/#f-geometry.rect.fast_intersection
]]
---@param x1 number
---@param y1 number
---@param width1 number
---@param height1 number
---@param x2 number
---@param y2 number
---@param width2 number
---@param height2 number
---@return number x, number y, number width, number height
function playdate.geometry.rect.fast_intersection(x1, y1, width1, height1, x2, y2, width2, height2) end

--[[
	Returns the smallest possible rect that contains both the source rect and r2.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.union
]]
---@param r2 playdate.geometry.rect
---@return playdate.geometry.rect
function playdate.geometry.rect:union(r2) end

--[[
	For use in inner loops where speed is the priority. About 3x faster than union.

	Returns multiple values (x, y, width, height) representing the smallest possible rect that contains the two rects defined by x1, y1, w1, h1 and x2, y2, w2, h2.

	https://sdk.play.date/inside-playdate/#f-geometry.rect.fast_union
]]
---@param x1 number
---@param y1 number
---@param width1 number
---@param height1 number
---@param x2 number
---@param y2 number
---@param width2 number
---@param height2 number
---@return number x, number y, number width, number height
function playdate.geometry.rect.fast_union(x1, y1, width1, height1, x2, y2, width2, height2) end

--[[
	Insets the rect by the given dx and dy.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.inset
]]
---@param dx number
---@param dy number
function playdate.geometry.rect:inset(dx, dy) end

--[[
	Returns a rect that is inset by the given dx and dy, with the same center point.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.insetBy
]]
---@param dx number
---@param dy number
---@return playdate.geometry.rect
function playdate.geometry.rect:insetBy(dx, dy) end

--[[
	Offsets the rect by the given dx and dy.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.offset
]]
---@param dx number
---@param dy number
function playdate.geometry.rect:offset(dx, dy) end

--[[
	Returns a rect with its origin point offset by dx, dy.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.offsetBy
]]
---@param dx number
---@param dy number
---@return playdate.geometry.rect
function playdate.geometry.rect:offsetBy(dx, dy) end

--[[
	Returns true if the rect r2 is contained within the caller rect.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.containsRect-r2
]]
---@param r2 playdate.geometry.rect
---@return boolean
function playdate.geometry.rect:containsRect(r2) end

--[[
	Returns true if the point p is contained within the caller rect.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.containsPoint
]]
---@param pOrX number|playdate.geometry.point
---@param y? number
---@return boolean
function playdate.geometry.rect:containsPoint(pOrX, y) end

--[[
	Returns a point at the center of the caller.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.centerPoint
]]
---@return playdate.geometry.point
function playdate.geometry.rect:centerPoint() end

--[[
	Flips the caller about the center of rect r2.

	https://sdk.play.date/inside-playdate/#m-geometry.rect.flipRelativeToRect
]]
---@param r2 playdate.geometry.rect
---@param flip `playdate.geometry.kUnflipped`
---|`playdate.geometry.kFlippedX`
---|`playdate.geometry.kFlippedY`
---|`playdate.geometry.kFlippedXY`
function playdate.geometry.rect.flipRelativeToRect(r2, flip) end
