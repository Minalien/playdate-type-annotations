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

---@class Object
Object = {}

--[[
	Override to initialize
]]
function Object:init(...) end

--[[
	Override to base a subclass on an already existing table (see CoreLibs: Sprites)
]]
function Object.baseObject() end

--[[
	Returns a boolean value that indicates whether the receiver is an instance of Class or an instance of any class that Class inherits from.
]]
---@param class table
function Object:isa(class) end

--[[
	debugging convenience function that prints all of the objects key/value pairs, and the key/value pairs for all superclasses
]]
---@param indent? integer
---@param table? table
function Object:tableDump(indent, table) end

---@class PlaydateClass
---@field className string
---@field properties table
---@field namespace table

---@return PlaydateClass
function class() end
PlaydateClass = {}

---@param parent table
function PlaydateClass:extends(parent) end
