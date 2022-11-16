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
	Affine transforms can be used to modify the coordinates of points, rects (as axis aligned bounding boxes (AABBs)), line segments, and polygons. The underlying matrix is of the form:
	The matrix of an affine transform

	[m11 m12 tx]
	[m21 m22 ty]
	[ 0   0  1 ]
]]
---@class playdate.geometry.affineTransform : Object
---@operator mul(playdate.geometry.affineTransform): playdate.geometry.affineTransform
---@operator mul(playdate.geometry.vector2D): playdate.geometry.vector2D
---@operator mul(playdate.geometry.point): playdate.geometry.point
playdate.geometry.affineTransform = {}

--[[
	Returns a new playdate.geometry.affineTransform. Call without arguments to get a new copy of the identity transform.

	https://sdk.play.date/inside-playdate/#f-geometry.affineTransform.new
	https://sdk.play.date/inside-playdate/#f-geometry.affineTransform.new-1
]]
---@param m11 number
---@param m12 number
---@param m21 number
---@param m22 number
---@param tx number
---@param ty number
---@return playdate.geometry.affineTransform
---@overload fun(): playdate.geometry.affineTransform
function playdate.geometry.affineTransform.new(m11, m12, m21, m22, tx, ty) end

--[[
	Returns a new copy of the affine transform.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.copy
]]
---@return playdate.geometry.affineTransform
function playdate.geometry.affineTransform:copy() end

--[[
	Mutates the caller so that it is an affine transformation matrix constructed by inverting itself.

	Inversion is generally used to provide reverse transformation of points within transformed objects. Given the coordinates (x, y), which have been transformed by a given matrix to new coordinates (x’, y’), transforming the coordinates (x’, y’) by the inverse matrix produces the original coordinates (x, y).

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.invert
]]
function playdate.geometry.affineTransform:invert() end

--[[
	Mutates the the caller, changing it to an identity transform matrix.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.reset
]]
function playdate.geometry.affineTransform:reset() end

--[[
	Mutates the the caller. The affine transform af is concatenated to the caller.

	Concatenation combines two affine transformation matrices by multiplying them together. You might perform several concatenations in order to create a single affine transform that contains the cumulative effects of several transformations.

	Note that matrix operations are not commutative — the order in which you concatenate matrices is important. That is, the result of multiplying matrix t1 by matrix t2 does not necessarily equal the result of multiplying matrix t2 by matrix t1.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.concat
]]
---@param af playdate.geometry.affineTransform
function playdate.geometry.affineTransform:concat(af) end

--[[
	Mutates the caller by applying a translate transformation. x values are moved by dx, y values by dy.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.translate
]]
---@param dx number
---@param dy number
function playdate.geometry.affineTransform:translate(dx, dy) end

--[[
	Returns a copy of the calling affine transform with a translate transformation appended.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#m-geometry.affineTransform.translatedBy
]]
---@param dx number
---@param dy number
---@return playdate.geometry.affineTransform
function playdate.geometry.affineTransform:translatedBy(dx, dy) end

--[[
	Mutates the caller by applying a scaling transformation.

	If both parameters are passed, sx is used to scale the x values of the transform, sy is used to scale the y values.

	If only one parameter is passed, it is used to scale both x and y values.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.scale
]]
---@param sx number
---@param sy? number
function playdate.geometry.affineTransform:scale(sx, sy) end

--[[
	Returns a copy of the calling affine transform with a scaling transformation appended.

	If both parameters are passed, sx is used to scale the x values of the transform, sy is used to scale the y values.

	If only one parameter is passed, it is used to scale both x and y values.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.scaledBy
]]
---@param sx number
---@param sy? number
---@return playdate.geometry.affineTransform
function playdate.geometry.affineTransform:scaledBy(sx, sy) end

--[[
	Mutates the caller by applying a rotation transformation.

	angle is the value, in degrees, by which to rotate the affine transform. A positive value specifies clockwise rotation and a negative value specifies counterclockwise rotation. If the optional x and y arguments or point point are given, the transform rotates around (x,y) or point instead of (0,0).

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.rotate
]]
---@param angle any
---@param x? number|playdate.geometry.point
---@param y? number
function playdate.geometry.affineTransform:rotate(angle, x, y) end

--[[
	Returns a copy of the calling affine transform with a rotate transformation appended.

	angle is the value, in degrees, by which to rotate the affine transform. A positive value specifies clockwise rotation and a negative value specifies counterclockwise rotation. If the optional x and y arguments or point point are given, the transform rotates around (x,y) or point instead of (0,0).

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.rotatedBy
]]
---@param angle number
---@param x? number|playdate.geometry.point
---@param y? number
---@return playdate.geometry.affineTransform
function playdate.geometry.affineTransform:rotatedBy(angle, x, y) end

--[[
	Mutates the caller, appending a skew transformation. sx is the value by which to skew the x axis, and sy the value for the y axis. Values are in degrees.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.skew
]]
---@param sx number
---@param sy number
function playdate.geometry.affineTransform:skew(sx, sy) end

--[[
	Returns the given transform with a skew transformation appended. sx is the value by which to skew the x axis, and sy the value for the y axis. Values are in degrees.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.skewedBy
]]
---@param sx number
---@param sy number
---@return playdate.geometry.affineTransform
function playdate.geometry.affineTransform:skewedBy(sx, sy) end

--[[
	Modifies the point p by applying the affine transform.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.transformPoint
]]
---@param p playdate.geometry.point
function playdate.geometry.affineTransform:transformPoint(p) end

--[[
	As transformPoint, but returns a new point rather than modifying p.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.transformedPoint
]]
---@see playdate.geometry.affineTransform:transformPoint
---@param p playdate.geometry.point
---@return playdate.geometry.point
function playdate.geometry.affineTransform:transformedPoint(p) end

--[[
	Returns two values calculated by applying the affine transform to the point (x, y)

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.transformXY
]]
---@param x number
---@param y number
---@return number x, number y
function playdate.geometry.affineTransform:transformXY(x, y) end

--[[
	Modifies the line segment ls by applying the affine transform.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#m-geometry.affineTransform.transformLineSegment
]]
---@param ls playdate.geometry.lineSegment
function playdate.geometry.affineTransform:transformLineSegment(ls) end

--[[
	As above, but returns a new line segment rather than modifying ls.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.transformedLineSegment
]]
---@param ls playdate.geometry.lineSegment
---@return playdate.geometry.lineSegment
function playdate.geometry.affineTransform:transformedLineSegment(ls) end

--[[
	Modifies the axis aligned bounding box r (a rect) by applying the affine transform.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.transformAABB
]]
---@param r playdate.geometry.rect
function playdate.geometry.affineTransform:transformAABB(r) end

--[[
	As above, but returns a new rect rather than modifying r.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.transformedAABB
]]
---@param r playdate.geometry.rect
---@return playdate.geometry.rect
function playdate.geometry.affineTransform:transformedAABB(r) end

--[[
	Modifies the polygon p by applying the affine transform.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.transformPolygon
]]
---@param p playdate.geometry.polygon
function playdate.geometry.affineTransform:transformPolygon(p) end

--[[
	As above, but returns a new polygon rather than modifying p.

	https://sdk.play.date/inside-playdate/#m-geometry.affineTransform.transformedPolygon
]]
---@param p playdate.geometry.polygon
---@return playdate.geometry.polygon
function playdate.geometry.affineTransform:transformedPolygon(p) end
