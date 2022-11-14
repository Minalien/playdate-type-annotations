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
	Encodes the given table into the named file. (The .json extension should be omitted from the file name.) The default file name is "data". If pretty-print is true, the JSON will be nicely formatted.

	https://sdk.play.date/inside-playdate/#f-datastore.write
]]
---@param table table
---@param filename? string
---@param prettyPrint? boolean
function playdate.datastore.write(table, filename, prettyPrint) end

--[[
	Returns a table instantiated with the data in the JSON-encoded file you specify. (The .json extension should be omitted.) The default file name is "data". If no file is found, this function returns nil.

	https://sdk.play.date/inside-playdate/#f-datastore.read
]]
---@param filename? string
---@return { [string]: any }
function playdate.datastore.read(filename) end

--[[
	Deletes the specified datastore file. The default file name is "data". Returns false if the datastore file could not be deleted.

	https://sdk.play.date/inside-playdate/#f-datastore.delete
]]
---@param filename? string
---@return boolean
function playdate.datastore.delete(filename) end

--[[
	Saves a playdate.graphics.image to a file. If path doesn’t contain a folder name, the image is stored in a folder named "images".

	By default, this method writes out a PDI file, a custom image format used by Playdate that can be read back in using readImage(). If you want to write out a GIF file, append a .gif extension to your path.
	Because writeImage() doesn’t currently support GIF transparency, if you attempt to write a GIF from an image buffer you instantiated, you must call playdate.graphics.image.new( width, height, bgcolor ) with bgcolor set to playdate.graphics.kColorWhite or playdate.graphics.kColorBlack, otherwise your image will render improperly to the file.

	https://sdk.play.date/inside-playdate/#f-datastore.writeImage
]]
---@param image playdate.graphics.image
---@param path string
function playdate.datastore.writeImage(image, path) end

--[[
	Reads a playdate.graphics.image from a file in the data folder. If path doesn’t contain a folder name, the image is searched for in a folder named "images".

	https://sdk.play.date/inside-playdate/#f-datastore.readImage
]]
---@return playdate.graphics.image|nil
function playdate.datastore.readImage() end
