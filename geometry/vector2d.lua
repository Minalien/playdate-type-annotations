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
	Implements a two-dimensional vector.

	You can directly read or write dx, or dy values to a vector2D.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#C-geometry.vector2D
]]
---@class playdate.geometry.vector2D : Object
---@field dx number
---@field dy number
---@operator unm(): playdate.geometry.vector2D
---@operator add(playdate.geometry.vector2D): playdate.geometry.vector2D
---@operator sub(playdate.geometry.vector2D): playdate.geometry.vector2D
---@operator mul(number): playdate.geometry.vector2D
---@operator mul(playdate.geometry.vector2D): number
---@operator mul(playdate.geometry.affineTransform): playdate.geometry.vector2D
---@operator div(number): playdate.geometry.vector2D
playdate.geometry.vector2D = {}

--[[
	Returns a new playdate.geometry.vector2D.

	https://sdk.play.date/inside-playdate/#f-geometry.vector2D.new
]]
---@param x number
---@param y number
---@return playdate.geometry.vector2D
function playdate.geometry.vector2D.new(x, y) end

--[[
	Returns a new copy of the vector2D.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.copy
]]
---@return playdate.geometry.vector2D
function playdate.geometry.vector2D:copy() end

--[[
	Returns the values dx, dy.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.unpack
]]
---@return number dx, number dy
function playdate.geometry.vector2D:unpack() end

--[[
	Modifies the caller by adding vector v.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#m-geometry.vector2D.addVector
]]
---@param v playdate.geometry.vector2D
function playdate.geometry.vector2D:addVector(v) end

--[[
	Modifies the caller, scaling it by amount s.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.scale
]]
---@param s number
function playdate.geometry.vector2D:scale(s) end

--[[
	Returns the given vector scaled by s.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.scaledBy
]]
---@param s number
---@return playdate.geometry.vector2D
function playdate.geometry.vector2D:scaledBy(s) end

--[[
	Modifies the caller by normalizing it so that its length is 1. If the vector is (0,0), the vector is unchanged.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.normalize
]]
function playdate.geometry.vector2D:normalize() end

--[[
	Returns a new vector by normalizing the given vector.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.normalized
]]
---@return playdate.geometry.vector2D
function playdate.geometry.vector2D:normalized() end

--[[
	Returns the dot product of the caller and the vector v.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.dotProduct
]]
---@param v playdate.geometry.vector2D
---@return number
function playdate.geometry.vector2D:dotProduct(v) end

--[[
	Returns the magnitude of the caller.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.magnitude
]]
---@return number
function playdate.geometry.vector2D:magnitude() end

--[[
	Returns the square of the magnitude of the caller.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.magnitudeSquared
]]
---@return number
function playdate.geometry.vector2D:magnitudeSquared() end

--[[
	Modifies the caller by projecting it along the vector v.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.projectAlong
]]
---@param v playdate.geometry.vector2D
function playdate.geometry.vector2D:projectAlong(v) end

--[[
	Returns a new vector created by projecting the given vector along the vector v.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.projectedAlong
]]
---@param v playdate.geometry.vector2D
---@return playdate.geometry.vector2D
function playdate.geometry.vector2D:projectedAlong(v) end

--[[
	Returns the angle between the caller and the vector v.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.angleBetween
]]
---@param v playdate.geometry.vector2D
function playdate.geometry.vector2D:angleBetween(v) end

--[[
	Returns a vector that is the left normal of the caller.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.leftNormal
]]
---@return playdate.geometry.vector2D
function playdate.geometry.vector2D:leftNormal() end

--[[
	Returns a vector that is the right normal of the caller.

	https://sdk.play.date/inside-playdate/#m-geometry.vector2D.rightNormal
]]
---@return playdate.geometry.vector2D
function playdate.geometry.vector2D:rightNormal() end
