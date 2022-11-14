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

---@alias PlaydateColor
---|`playdate.graphics.kColorBlack`
---|`playdate.graphics.kColorWhite`
---|`playdate.graphics.kColorClear`
---|`playdate.graphics.kColorXOR`

--[[
	Sets and gets the current drawing color for primitives.

	This color applies to drawing primitive shapes such as lines and rectangles, not bitmap images.

	https://sdk.play.date/inside-playdate/#f-graphics.setColor
]]
---@param color PlaydateColor
function playdate.graphics.setColor(color) end

--[[
	Gets the current drawing color for primitives.

	https://sdk.play.date/inside-playdate/#f-graphics.getColor
]]
---@return PlaydateColor
function playdate.graphics.getColor() end

--[[
	Sets the color used for drawing the background, if necessary, before playdate.graphics.sprites are drawn on top.

	Use kColorClear if you intend to draw behind sprites.

	Equivalent to `playdate->graphics->setBackgroundColor()` in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.setBackgroundColor
]]
---@param color PlaydateColor
function playdate.graphics.setBackgroundColor(color) end

--[[
	Gets the color used for drawing the background, if necessary, before playdate.graphics.sprites are drawn on top.

	https://sdk.play.date/inside-playdate/#f-graphics.getBackgroundColor
]]
---@return PlaydateColor
function playdate.graphics.getBackgroundColor() end

--[[
	Sets the 8x8 pattern used for drawing.

	Alternatively, uses the given playdate.graphics.image to set the 8 x 8 pattern used for drawing. The optional x, y offset (default 0, 0) indicates the top left corner of the 8 x 8 pattern.

	https://sdk.play.date/inside-playdate/#f-graphics.setPattern
]]
---@param pattern_or_image playdate.graphics.image|integer[] An array of 8 numbers describing the bitmap for each row; for example, { 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55 } specifies a checkerboard pattern. An additional 8 numbers can be specified for an alpha mask bitmap.
---@param x? number
---@param y? number
function playdate.graphics.setPattern(pattern_or_image, x, y) end

--[[
	Sets the pattern used for drawing to a dithered pattern. If the current drawing color is white, the pattern is white pixels on a transparent background and (due to a bug) the alpha value is inverted: 1.0 is transparent and 0 is opaque. Otherwise, the pattern is black pixels on a transparent background and alpha 0 is transparent while 1.0 is opaque.

	The optional ditherType argument is a dither type as used in playdate.graphics.image:blurredImage(), and should be an ordered dither type; i.e., line, screen, or Bayer.

	https://sdk.play.date/inside-playdate/#f-graphics.setDitherPattern
]]
---@param alpha number
---@param ditherType DitherType
function playdate.graphics.setDitherPattern(alpha, ditherType) end
