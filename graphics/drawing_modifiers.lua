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
	Sets the clipping rectangle for all subsequent graphics drawing, including bitmaps. The argument can either be separate dimensions or a playdate.geometry.rect object. The clip rect is automatically cleared at the beginning of the playdate.update() callback. The function uses world coordinates; that is, the given rectangle will be translated by the current drawing offset. To use screen coordinates instead, use setScreenClipRect()

	Equivalent to playdate->graphics->setClipRect() in the C API.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-graphics.setClipRect
	https://sdk.play.date/inside-playdate/#f-graphics.setClipRect-rect
]]
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@overload fun(rect: playdate.geometry.rect)
function playdate.graphics.setClipRect(x, y, width, height) end

--[[
	Returns multiple values (x, y, width, height) giving the current clipping rectangle.

	https://sdk.play.date/inside-playdate/#f-graphics.getClipRect
]]
---@return integer x, integer y, integer width, integer height
function playdate.graphics.getClipRect() end

--[[
	Sets the clip rectangle as above, but uses screen coordinates instead of world coordinates—​that is, it ignores the current drawing offset.

	Equivalent to playdate->graphics->setScreenClipRect() in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.setScreenClipRect
	https://sdk.play.date/inside-playdate/#f-graphics.setScreenClipRect-rect
]]
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@overload fun(rect: playdate.geometry.rect)
function playdate.graphics.setScreenClipRect(x, y, width, height) end

--[[
	Gets the clip rectangle as above, but uses screen coordinates instead of world coordinates—​that is, it ignores the current drawing offset.

	https://sdk.play.date/inside-playdate/#f-graphics.getScreenClipRect
]]
---@return integer x, integer y, integer width, integer height
function playdate.graphics.getScreenClipRect() end

--[[
	Clears the current clipping rectangle, set with setClipRect().

	Equivalent to playdate->graphics->clearClipRect() in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.clearClipRect
]]
function playdate.graphics.clearClipRect() end

--[[
	Sets the current stencil to the given image. If tile is set, the the stencil will be tiled; in this case, the image width must be a multiple of 32 pixels.

	Equivalent to playdate->graphics->setStencilImage() in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.setStencilImage
]]
---@param image playdate.graphics.image
---@param tile? boolean
function playdate.graphics.setStencilImage(image, tile) end

--- TODO: Verify the actual typing here.
--[[
	Sets a pattern to use for stenciled drawing, as an alternative to creating an image, drawing a pattern into the image, then using that in setStencilImage().

	https://sdk.play.date/inside-playdate/#f-graphics.setStencilPattern
	https://sdk.play.date/inside-playdate/#playdate-graphics-setstencilpattern-row1-row2-row3-row4-row5-row
	https://sdk.play.date/inside-playdate/#f-graphics.setStencilPattern-dither
]]
---@param ... any
function playdate.graphics.setStencilPattern(...) end

--[[
	Clears the stencil buffer.

	https://sdk.play.date/inside-playdate/#f-graphics.clearStencil
]]
function playdate.graphics.clearStencil() end

---@alias DrawMode
---|`playdate.graphics.kDrawModeCopy`
---|`playdate.graphics.kDrawModeWhiteTransparent`
---|`playdate.graphics.kDrawModeBlackTransparent`
---|`playdate.graphics.kDrawModeFillWhite`
---|`playdate.graphics.kDrawModeFillBlack`
---|`playdate.graphics.kDrawModeXOR`
---|`playdate.graphics.kDrawModeNXOR`
---|`playdate.graphics.kDrawModeInverted`
---|"copy"
---|"inverted"
---|"XOR"
---|"NXOR"
---|"whiteTransparent"
---|"blackTransparent"
---|"fillWhite"
---|"fillBlack"

--[[
	Sets the current drawing mode for images.

	The draw mode applies to images and fonts (which are technically images). The draw mode does not apply to primitive shapes such as lines or rectangles.

	Equivalent to playdate->graphics->setDrawMode() in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.setImageDrawMode
]]
---@param mode DrawMode
function playdate.graphics.setImageDrawMode(mode) end

--[[
	Gets the current drawing mode for images.

	https://sdk.play.date/inside-playdate/#f-graphics.getImageDrawMode
]]
---@return DrawMode
function playdate.graphics.getImageDrawMode() end

--[[
	Sets the width of the line for drawLine, drawRect, drawPolygon, and drawArc when a playdate.geometry.arc is passed as the argument.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-graphics.setLineWidth
]]
---@param width number
function playdate.graphics.setLineWidth(width) end

--[[
	Gets the width of the line for drawLine, drawRect, drawPolygon, and drawArc when a playdate.geometry.arc is passed as the argument.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-graphics.getLineWidth
]]
---@return number
function playdate.graphics.getLineWidth() end

---@alias StrokeLocation
---|`playdate.graphics.kStrokeCentered`
---|`playdate.graphics.kStrokeOutside`
---|`playdate.graphics.kStrokeInside`

--[[
	Specifies where the stroke is placed relative to the rectangle passed into drawRect.

	https://sdk.play.date/inside-playdate/#f-graphics.setStrokeLocation
]]
---@param location StrokeLocation
function playdate.graphics.setStrokeLocation(location) end

--[[
	Gets stroke position relative to the rectangle passed into drawRect.

	https://sdk.play.date/inside-playdate/#f-graphics.getStrokeLocation
]]
---@return StrokeLocation
function playdate.graphics.getStrokeLocation() end
