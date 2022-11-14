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
	Sets the nominal refresh rate in frames per second. The default is 30 fps, which is a recommended figure that balances animation smoothness with performance and power considerations. Maximum is 50 fps.

	If rate is 0, playdate.update() is called as soon as a frame buffer is available. Since the display refreshes line-by-line, and unchanged lines aren’t sent to the display, the update cycle will be faster than 30 times a second but at an indeterminate rate. playdate.getCurrentTimeMilliseconds() should then be used as a steady time base.

	Equivalent to `playdate->display->setRefreshRate()` in the C API.

	https://sdk.play.date/inside-playdate/#f-display.setRefreshRate
]]
---@param rate integer
function playdate.display.setRefreshRate(rate) end

--[[
	Gets the nominal refresh rate in frames per second.

	https://sdk.play.date/inside-playdate/#f-display.getRefreshRate
]]
---@return integer
function playdate.display.getRefreshRate() end

--[[
	Sends the contents of the frame buffer to the display immediately. Useful if you have called playdate.stop() to disable update callbacks in, say, the case where your app updates the display only in reaction to button presses.

	https://sdk.play.date/inside-playdate/#f-display.flush
]]
function playdate.display.flush() end

--[[
	Returns the height the Playdate display, taking the current display scale into account; e.g., if the scale is 2, the values returned will be based off of a 200 x 120-pixel screen rather than the native 400 x 240. (See playdate.display.setScale().)

	Equivalent to `playdate->display->getHeight()` in the C API.

	https://sdk.play.date/inside-playdate/#f-display.getHeight
]]
---@return integer
function playdate.display.getHeight() end

--[[
	Returns the width the Playdate display, taking the current display scale into account; e.g., if the scale is 2, the values returned will be based off of a 200 x 120-pixel screen rather than the native 400 x 240. (See playdate.display.setScale().)

	Equivalent to `playdate->display->getWidth()` in the C API.

	https://sdk.play.date/inside-playdate/#f-display.getWidth
]]
---@return integer
function playdate.display.getWidth() end

--[[
	Returns the values (width, height) describing the Playdate display size. Takes the current display scale into account; e.g., if the scale is 2, the values returned will be based off of a 200 x 120-pixel screen rather than the native 400 x 240. (See playdate.display.setScale().)

	https://sdk.play.date/inside-playdate/#f-display.getSize
]]
---@return integer width, integer height
function playdate.display.getSize() end

--[[
	Returns the values (x, y, width, height) describing the Playdate display size. Takes the current display scale into account; e.g., if the scale is 2, the values returned will be based off of a 200 x 120-pixel screen rather than the native 400 x 240. (See playdate.display.setScale().)

	https://sdk.play.date/inside-playdate/#f-display.getRect
]]
---@return integer x, integer y, integer width, integer height
function playdate.display.getRect() end

---@alias DisplayScale 1|2|4|8

--[[
	Sets the display scale factor. Valid values for scale are 1, 2, 4, and 8.

	The top-left corner of the frame buffer is scaled up to fill the display; e.g., if the scale is set to 4, the pixels in rectangle [0,100] x [0,60] are drawn on the screen as 4 x 4 squares.

	Equivalent to `playdate->display->setScale()` in the C API.
]]
---@param scale DisplayScale
function playdate.display.setScale(scale) end

--[[
	Gets the display scale factor. Valid values for scale are 1, 2, 4, and 8.

	https://sdk.play.date/inside-playdate/#f-display.getScale
]]
---@return DisplayScale
function playdate.display.getScale() end

--[[
	If the argument passed to setInverted() is true, the frame buffer will be drawn inverted (everything onscreen that was black will now be white, etc.)

	Equivalent to `playdate->display->setInverted()` in the C API.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-display.setInverted
]]
---@param flag boolean
function playdate.display.setInverted(flag) end

--[[
	If getInverted() returns true, the frame buffer will be drawn inverted (everything onscreen that was black will now be white, etc.)

	https://sdk.play.date/inside-playdate/#f-display.getInverted
]]
---@return boolean
function playdate.display.getInverted() end

--[[
	Adds a mosaic effect to the display. Valid x and y values are between 0 and 3, inclusive.

	Equivalent to `playdate->display->setMosaic()` in the C API.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-display.setMosaic
]]
---@param x integer
---@param y integer
function playdate.display.setMosaic(x, y) end

--[[
	Returns the current mosaic effect settings as multiple values (x, y).

	https://sdk.play.date/inside-playdate/#f-display.getMosaic
]]
---@return integer x, integer y
function playdate.display.getMosaic() end

--[[
	Offsets the entire display by x, y. Offset values can be negative. The "exposed" part of the display is black or white, according to the value set in playdate.graphics.setBackgroundColor(). This is an efficient way to make a "shake" effect without redrawing anything.
	
	This function is different from playdate.graphics.setDrawOffset().

	Equivalent to `playdate->display->setOffset()` in the C API.

	https://sdk.play.date/inside-playdate/#f-display.setOffset
]]
---@param x integer
---@param y integer
function playdate.display.setOffset(x, y) end

--[[
	Returns the current display offset as multiple values (x, y).

	https://sdk.play.date/inside-playdate/#f-display.getOffset
]]
---@return integer x, integer y
function playdate.display.getOffset() end

--[[
	Flips the display on the x or y axis, or both.

	Equivalent to `playdate->display->setFlipped()` in the C API.

	https://sdk.play.date/inside-playdate/#f-display.setFlipped
]]
---@param x boolean
---@param y boolean
function playdate.display.setFlipped(x, y) end

--[[
	The simplest method for putting an image on the display. Copies the contents of the image at path directly to the frame buffer. The image must be 400x240 pixels with no transparency.

	https://sdk.play.date/inside-playdate/#f-display.loadImage
]]
---@param path string
function playdate.display.loadImage(path) end
