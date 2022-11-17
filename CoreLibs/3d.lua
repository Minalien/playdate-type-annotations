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

---@class vector3d
---@operator add(vector3d): vector3d
---@operator sub(vector3d): vector3d
---@operator mul(number): vector3d
---@operator div(number): vector3d
vector3d = {}

---@param x number
---@param y number
---@param z number
---@return vector3d
function vector3d.new(x, y, z) end

---@param v vector3d
---@return number
function vector3d:dot(v) end

---@param v vector3d
---@return vector3d
function vector3d:cross(v) end

---@return number
function vector3d:length() end

---@return string
function vector3d:__tostring() end

---@param angle number
function vector3d:rotateAroundY(angle) end

---@param angle number
function vector3d:rotateAroundX(angle) end

---@return vector3d
function vector3d:copy() end

---@class face3d
face3d = {}

---@param v1 vector3d
---@param v2 vector3d
---@param v3 vector3d
---@return face3d
function face3d.new(v1, v2, v3) end

---@return vector3d
function face3d:normal() end

---@return boolean
function face3d:isFacingForward() end

---@return string
function face3d:__tostring() end

---@class shape3d
shape3d = {}

---@return shape3d
function shape3d.new() end

---@param v1 vector3d
---@param v2 vector3d
---@param v3 vector3d
function shape3d:addFace(v1, v2, v3) end

---@param angle number
function shape3d:rotateAroundY(angle) end

---@param angle number
function shape3d:rotateAroundX(angle) end

---@param scene scene3d
function shape3d:drawInScene(scene) end

---@param scene scene3d
function shape3d:drawWireframeInScene(scene) end

---@param scale number
function shape3d:scaleBy(scale) end

---@class scene3d
scene3d = {}

---@return scene3d
function scene3d.new() end

---@param s shape3d
function scene3d:addShape(s) end

---@param v vector3d
function scene3d:setLight(v) end

function scene3d:draw() end
function scene3d:drawWireframe() end

---@param dot number
---@return number
function scene3d:lightmap(dot) end