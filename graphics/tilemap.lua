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

---@class playdate.graphics.tilemap
playdate.graphics.tilemap = {}

--[[
	Tilemaps are often used to represent the game environment. Tiles are a very efficient way to create levels and scenery. (Alternatively, sprites are the best way to create objects that move about your playfield, like the character that represents the player, enemies, etc.)

	At its most fundamental, a tilemap is a table of indexes into an playdate.graphics.imagetable. The images in the imagetable represent small chunks of your scenery; the tilemap is what organizes them into a specific arrangement.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#C-graphics.tilemap
]]
---@return playdate.graphics.tilemap
function playdate.graphics.tilemap.new() end

--[[
	Sets the tilemap’s playdate.graphics.imagetable to table, a playdate.graphics.imagetable.

	https://sdk.play.date/inside-playdate/#m-graphics.tilemap.setImageTable
]]
---@param table playdate.graphics.imagetable
function playdate.graphics.tilemap:setImageTable(table) end

--[[
	Sets the tilemap’s width to width, then populates the tilemap with data, which should be a flat, one-dimensional array-like table containing index values to the tilemap’s imagetable.

	https://sdk.play.date/inside-playdate/#m-graphics.tilemap.setTiles
]]
---@param data integer[]
---@param width integer
function playdate.graphics.tilemap:setTiles(data, width) end

--[[
	Returns data, width
	data is a flat, one-dimensional array-like table containing index values to the tilemap’s imagetable.
	width is the width of the tile map, in number of tiles.

	https://sdk.play.date/inside-playdate/#m-graphics.tilemap.getTiles
]]
---@return integer[] data, integer width
function playdate.graphics.tilemap:getTiles() end

--[[
	Draws the tile map at screen coordinate (x, y).

	sourceRect, if specified, will cause only the part of the tilemap within sourceRect to be drawn.

	https://sdk.play.date/inside-playdate/#m-graphics.tilemap.draw
]]
---@param x integer
---@param y integer
---@param sourceRect? playdate.geometry.rect
function playdate.graphics.tilemap:draw(x, y, sourceRect) end

--[[
	Sets the index of the tile at tilemap position (x, y). index is the (1-based) index of the image in the tilemap’s playdate.graphics.imagetable.

	Tilemaps and imagetables, like Lua arrays, are 1-based, not 0-based. tilemap:getTileAtPosition(1, 1) will get the index of the top-leftmost tile. 

	https://sdk.play.date/inside-playdate/#m-graphics.tilemap.setTileAtPosition
]]
---@param x integer
---@param y integer
---@param index integer
function playdate.graphics.tilemap:setTileAtPosition(x, y, index) end

--[[
	Returns the image index of the tile at the given x and y coordinate. If x or y is out of bounds, returns nil.

	Tilemaps and imagetables, like Lua arrays, are 1-based, not 0-based. tilemap:getTileAtPosition(1, 1) will return the index of the top-leftmost tile. 

	https://sdk.play.date/inside-playdate/#m-graphics.tilemap.getTileAtPosition
]]
---@param x integer
---@param y integer
---@return integer
function playdate.graphics.tilemap:getTileAtPosition(x, y) end

--[[
	Sets the tilemap’s width and height, in number of tiles.

	https://sdk.play.date/inside-playdate/#m-graphics.tilemap.setSize
]]
---@param width integer
---@param height integer
function playdate.graphics.tilemap:setSize(width, height) end

--[[
	Returns the size of the tile map, in tiles, as a pair, (width, height).

	https://sdk.play.date/inside-playdate/#m-graphics.tilemap.getSize
]]
---@return integer width, integer height
function playdate.graphics.tilemap:getSize() end

--[[
	Returns the size of the tilemap in pixels; that is, the size of the image multiplied by the number of rows and columns in the map. Returns multiple values (width, height).

	https://sdk.play.date/inside-playdate/#m-graphics.tilemap.getPixelSize
]]
---@return integer width, integer height
function playdate.graphics.tilemap:getPixelSize() end

--[[
	Returns multiple values (width, height), the pixel width and height of an individual tile.

	https://sdk.play.date/inside-playdate/#m-graphics.tilemap.getTileSize
]]
---@return integer width, integer height
function playdate.graphics.tilemap:getTileSize() end

--[[
	This function returns an array of playdate.geometry.rect objects that describe the areas of the tilemap that should trigger collisions. You can also think of them as the "impassable" rects of your tilemap. These rects will be in tilemap coordinates, not pixel coordinates.

	emptyIDs is an array that contains the tile IDs of "empty" (or "passable") tiles in the tilemap — in other words, tile IDs that should not trigger a collision. Tiles with default IDs of 0 are treated as empty by default, so you do not need to include 0 in the array.

	For example, if you have a tilemap describing terrain, where tile ID 1 represents grass the player can walk over, and tile ID 2 represents mountains that the player can’t cross, you’d pass an array containing just the value 1. You’ll get a back an array of a minimal number of rects describing the areas where there are mountain tiles.

	You can then pass each of those rects into playdate.graphics.sprite.addEmptyCollisionSprite() to add an empty (invisible) sprite into the scene for the built-in collision detection methods. In this example, collide rects would be added around mountain tiles but not grass tiles.

	Alternatively, instead of calling getCollisionRects() at all, you can use the convenience function playdate.graphics.sprite.addWallSprites(), which is effectively a shortcut for calling getCollisionRects() and passing all the resulting rects to addEmptyCollisionSprite().
]]
---@param emptyIDs integer[]
---@return playdate.geometry.rect[]
function playdate.graphics.tilemap:getCollisionRects(emptyIDs) end
