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
	There are two kinds of image tables: matrix and sequential.

	Matrix image tables are great as sources of imagery for tilemap. They are loaded from a single file in your game’s source folder with the suffix -table-<w>-<h> before the file extension. The compiler splits the image into separate bitmaps of dimension w by h pixels that are accessible via imagetable:getImage(x,y).

	Sequential image tables are useful as a way to load up sequential frames of animation. They are loaded from a sequence of files in your game’s source folder at compile time from filenames with the suffix -table-<sequenceNumber> before the file extension. Individual images in the sequence are accessible via imagetable:getImage(n). The images employed by a sequential image table are not required to be the same size, unlike the images used in a matrix image table.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#C-graphics.imagetable
]]
---@class playdate.graphics.imagetable : Object
---@operator len: integer
playdate.graphics.imagetable = {}
-- Note: The imagetable class also supports indexing with an integer as shorthand for :getImage()

--[[
	Returns a playdate.graphics.imagetable object from the data at path. If there is no file at path, the function returns nil and a second value describing the error. If the file at path is an animated GIF, successive frames of the GIF will be loaded as consecutive bitmaps in the imagetable. Any timing data in the animated GIF will be ignored.

	Or returns an empty image table for loading images into via imagetable:load() or setting already-loaded images into with imagetable:setImage(). If set, cellsWide is used to locate images by x,y position. The optional cellSize argument gives the allocation size for the images, if load() will be used. (This is a weird technical detail, so ask us if you need guidance here.)

	https://sdk.play.date/inside-playdate/#f-graphics.imagetable.new
	https://sdk.play.date/inside-playdate/#f-graphics.imagetable.new-alloc
]]
---@param count integer
---@param cellsWide? integer
---@param cellSize? integer
---@return playdate.graphics.imagetable
---@overload fun(path: string): playdate.graphics.imagetable
function playdate.graphics.imagetable.new(count, cellsWide, cellSize) end

--[[
	Returns the image in cell (x,y) in the original bitmap. The first image is at index 1. If n or (x,y) is out of bounds, the function returns nil. See also imagetable[n].

	Alternatively, returns the n-th playdate.graphics.image in the table (ordering left-to-right, top-to-bottom). The first image is at index 1. If .n_ or (x,y) is out of bounds, the function returns nil. See also imagetable[n].

	https://sdk.play.date/inside-playdate/#m-graphics.imagetable.getImage-n
]]
---@param x integer
---@param y integer
---@return playdate.graphics.image
---@overload fun(n: integer): playdate.graphics.image
function playdate.graphics.imagetable:getImage(x, y) end

--[[
	Sets the image at slot n in the image table by creating a reference to the data in image.

	https://sdk.play.date/inside-playdate/#m-graphics.imagetable.setImage
]]
---@param n integer
---@param image playdate.graphics.image
function playdate.graphics.imagetable:setImage(n, image) end

--[[
	Loads a new image from the data at path into an already-existing image table, without allocating additional memory. The image table at path must contain images of the same dimensions as the previous.

	Returns (success, [error]). If the boolean success is false, error is also returned.

	https://sdk.play.date/inside-playdate/#m-graphics.imagetable.load
]]
---@param path string
---@return boolean success, string|nil errorMessage
function playdate.graphics.imagetable:load(path) end

--[[
	Returns the number of images in the table. See also #imagetable.

	https://sdk.play.date/inside-playdate/#m-graphics.imagetable.getLength
]]
---@return integer
function playdate.graphics.imagetable:getLength() end

--[[
	Returns the pair (cellsWide, cellsHigh).

	https://sdk.play.date/inside-playdate/#m-graphics.imagetable.getSize
]]
---@return integer cellsWide, integer cellsHigh
function playdate.graphics.imagetable:getSize() end

--[[
	Equivalent to graphics.imagetable:getImage(n):draw(x,y,[flip]).

	https://sdk.play.date/inside-playdate/#m-graphics.imagetable.drawImage
]]
---@param n integer
---@param x integer
---@param y integer
---@param flip? ImageFlip
function playdate.graphics.imagetable:drawImage(n,x,y,flip) end
