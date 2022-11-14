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
	Implements two-dimensional open or closed polygons.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#C-geometry.polygon
]]
---@class playdate.geometry.polygon
---@operator mul(playdate.geometry.affineTransform): playdate.geometry.polygon
playdate.geometry.polygon = {}

---@alias PolygonFillRule
---|`playdate.graphics.kPolygonFillNonZero`
---|`playdate.graphics.kPolygonFillEvenOdd`

--[[
	new(x1, y1, x2, y2, ..., xn, yn) returns a new playdate.geometry.polygon with vertices (x1, y1) through (xn, yn). The Lua function table.unpack() can be used to turn an array into function arguments.

	new(p1, p2, ..., pn) does the same, except the points are expressed via point objects.

	new(numberOfVertices) returns a new playdate.geometry.polygon with space allocated for numberOfVertices vertices. All vertices are initially (0, 0). Vertex coordinates can be set with playdate.geometry.polygon:setPointAt().

	https://sdk.play.date/inside-playdate/#f-geometry.polygon.new
]]
---@param ... number|playdate.geometry.point
function playdate.geometry.polygon.new(...) end

--[[
	Returns a copy of a polygon.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.copy
]]
---@return playdate.geometry.polygon
function playdate.geometry.polygon:copy() end

--[[
	Closes a polygon. If the polygon’s first and last point aren’t coincident, a line segment will be generated to connect them.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.close
]]
function playdate.geometry.polygon:close() end

--[[
	Returns true if the polygon is closed, false if not.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.isClosed
]]
---@return boolean
function playdate.geometry.polygon:isClosed() end

--[[
	Returns a boolean value, true if the point p or the point at (x, y) is contained within the caller polygon.

	fillrule is an optional argument that can be one of the values defined in playdate.graphics.setPolygonFillRule. By default playdate.graphics.kPolygonFillEvenOdd is used.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.containsPoint
]]
---@param x number|playdate.geometry.point
---@param y? number|PolygonFillRule
---@param fillRule? PolygonFillRule
---@return boolean
function playdate.geometry.polygon:containsPoint(x, y, fillRule) end

--[[
	Returns multiple values (x, y, width, height) giving the axis-aligned bounding box for the polygon.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.getBounds
]]
---@return number x, number y, number width, number height
function playdate.geometry.polygon:getBounds() end

--[[
	Returns the axis-aligned bounding box for the given polygon as a playdate.geometry.rect object.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.getBoundsRect
]]
---@return playdate.geometry.rect
function playdate.geometry.polygon:getBoundsRect() end

--[[
	Returns the number of points in the polygon.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.count
]]
---@return integer
function playdate.geometry.polygon:count() end

--[[
	Returns the total length of all line segments in the polygon.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.length
]]
---@return number
function playdate.geometry.polygon:length() end

--[[
	Sets the polygon’s n-th point to (x, y).

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.setPointAt
]]
---@param n integer
---@param x number
---@param y number
function playdate.geometry.polygon:setPointAt(n, x, y) end

--[[
	Returns the polygon’s n-th point.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.getPointAt
]]
---@param n integer
---@return playdate.geometry.point
function playdate.geometry.polygon:getPointAt(n) end

--[[
	Returns true if the given polygon intersects the polygon p.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.intersects
]]
---@param p playdate.geometry.polygon
---@return boolean
function playdate.geometry.polygon:intersects(p) end

--[[
	Returns a playdate.geometry.point on one of the polygon’s line segments, distance pixels from the start of the polygon.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.pointOnPolygon
]]
---@param distance number
---@return playdate.geometry.point
function playdate.geometry.polygon:pointOnPolygon(distance) end

--[[
	Translates each point on the polygon by dx, dy pixels.

	https://sdk.play.date/inside-playdate/#m-geometry.polygon.translate
]]
---@param dx integer
---@param dy integer
function playdate.geometry.polygon:translate(dx, dy) end
