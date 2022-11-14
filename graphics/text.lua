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
	Playdate fonts are playdate.graphics.font objects, loaded into Lua with the playdate.graphics.font.new(path) function and drawn on screen using playdate.graphics.drawText(text, x, y).

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#C-graphics.font
]]
---@class playdate.graphics.font
playdate.graphics.font = {}

--[[
	Returns a playdate.graphics.font object from the data at path. If there is no file at path, the function returns nil.

	https://sdk.play.date/inside-playdate/#f-graphics.font.new
]]
---@param path string
---@return playdate.graphics.font|nil
function playdate.graphics.font.new(path) end

---@alias FontVariant
---|`playdate.graphics.font.kVariantNormal`
---|`playdate.graphics.font.kVariantBold`
---|`playdate.graphics.font.kVariantItalic`
---|"normal"
---|"bold"
---|"italic"

--[[
	Returns a font family table from the font files specified in fontPaths. fontPaths should be a table with the following format:

	local fontPaths = {
		[playdate.graphics.font.kVariantNormal] = "path/to/normalFont",
		[playdate.graphics.font.kVariantBold] = "path/to/boldFont",
		[playdate.graphics.font.kVariantItalic] = "path/to/italicFont"
	}

	The table returned is of the same format with font objects in place of the paths, and is appropriate to pass to the functions setFontFamily() and getTextSize().

	https://sdk.play.date/inside-playdate/#f-graphics.font.newFamily
]]
---@param fontPaths { [FontVariant]: string }
---@return { [FontVariant]: playdate.graphics.font }
function playdate.graphics.font.newFamily(fontPaths) end

--[[
	Sets the current font, a playdate.graphics.font.

	variant should be one of the strings "normal", "bold", or "italic", or one of the constants:

    playdate.graphics.font.kVariantNormal
    playdate.graphics.font.kVariantBold
    playdate.graphics.font.kVariantItalic

	If no variant is specified, kFontVariantNormal is used.

	https://sdk.play.date/inside-playdate/#f-graphics.setFont
]]
---@param font playdate.graphics.font
---@param variant? FontVariant
function playdate.graphics.setFont(font, variant) end

--[[
	Returns the current font, a playdate.graphics.font.

	https://sdk.play.date/inside-playdate/#f-graphics.getFont
]]
---@param variant? FontVariant
---@return playdate.graphics.font
function playdate.graphics.getFont(variant) end

--[[
	Sets multiple font variants at once. fontFamily should be a table using the following format:

	local fontFamily = {
		[playdate.graphics.font.kVariantNormal] = normal_font,
		[playdate.graphics.font.kVariantBold] = bold_font,
		[playdate.graphics.font.kVariantItalic] = italic_font
	}

	All fonts and font variants need not be present in the table.

	https://sdk.play.date/inside-playdate/#f-graphics.setFontFamily
]]
---@param fontFamily { [FontVariant]: playdate.graphics.font }
function playdate.graphics.setFontFamily(fontFamily) end

--[[
	Sets the global font tracking (spacing between letters) in pixels. This value is added to the font’s own tracking value as specified in its .fnt file.

	See playdate.graphics.font:setTracking to adjust tracking on a specific font.

	https://sdk.play.date/inside-playdate/#f-graphics.setFontTracking
]]
---@param pixels integer
function playdate.graphics.setFontTracking(pixels) end

--[[
	Gets the global font tracking (spacing between letters) in pixels.

	See playdate.graphics.font:setTracking to adjust tracking on a specific font.

	https://sdk.play.date/inside-playdate/#f-graphics.getFontTracking
]]
---@return integer
function playdate.graphics.getFontTracking() end

--[[
	Like getFont() but returns the system font rather than the currently set font.

	variant should be one of the strings "normal", "bold", or "italic", or one of the constants:

    playdate.graphics.font.kVariantNormal
    playdate.graphics.font.kVariantBold
    playdate.graphics.font.kVariantItalic

	https://sdk.play.date/inside-playdate/#f-graphics.getSystemFont
]]
---@param variant? FontVariant
function playdate.graphics.getSystemFont(variant) end

--[[
	Draws a string at the specified x, y coordinate using this particular font instance. (Compare to playdate.graphics.drawText(text, x, y), which draws the string with whatever the "current font", as defined by playdate.graphics.setFont(font)).

	The optional leadingAdjustment may be used to modify the spacing between lines of text. Pass nil to use the default leading for the font.

	https://sdk.play.date/inside-playdate/#m-graphics.font.drawText
]]
---@param text string
---@param x integer
---@param y integer
---@param leadingAdjustment? number
function playdate.graphics.font:drawText(text, x, y, leadingAdjustment) end

---@alias TextAlignment
---|`kTextAlignment.left`
---|`kTextAlignment.center`
---|`kTextAlignment.right`

--[[
	You must import CoreLibs/graphics to use this function.

	Draws the string text aligned to the left, right, or centered on the x coordinate. Pass one of kTextAlignment.left, kTextAlignment.center, kTextAlignment.right for the alignment parameter. (Compare to playdate.graphics.drawTextAligned(text, x, y, alignment), which draws the string with the "current font", as defined by playdate.graphics.setFont(font)).

	https://sdk.play.date/inside-playdate/#m-graphics.font.drawTextAligned
]]
---@param text string
---@param x integer
---@param y integer
---@param alignment TextAlignment
---@param leadingAdjustment? number
function playdate.graphics.font:drawTextAligned(text, x, y, alignment, leadingAdjustment) end

--[[
	Returns the pixel height of this font.

	https://sdk.play.date/inside-playdate/#m-graphics.font.getHeight
]]
---@return integer
function playdate.graphics.font:getHeight() end

--[[
	Returns the pixel width of the text when rendered with this font.

	https://sdk.play.date/inside-playdate/#m-graphics.font.getTextWidth
]]
---@param text string
---@return integer
function playdate.graphics.font:getTextWidth(text) end

--[[
	Sets the tracking of this font (spacing between letters), in pixels.

	Equivalent to playdate->graphics->setTextTracking() in the C API.

	https://sdk.play.date/inside-playdate/#m-graphics.font.setTracking
]]
---@param pixels integer
function playdate.graphics.font:setTracking(pixels) end

--[[
	Returns the tracking of this font (spacing between letters), in pixels.

	https://sdk.play.date/inside-playdate/#m-graphics.font.getTracking
]]
---@return integer
function playdate.graphics.font:getTracking() end

--[[
	Sets the leading (spacing between lines) of this font, in pixels.

	Equivalent to playdate->graphics->setTextLeading() in the C API.

	https://sdk.play.date/inside-playdate/#m-graphics.font.setLeading
]]
---@param pixels integer
function playdate.graphics.font:setLeading(pixels) end

--[[
	Returns the leading (spacing between lines) of this font, in pixels.

	https://sdk.play.date/inside-playdate/#m-graphics.font.getLeading
]]
---@return integer
function playdate.graphics.font:getLeading() end

--[[
	Returns the playdate.graphics.image containing the requested glyph. character can either be a string or a unicode codepoint number.

	https://sdk.play.date/inside-playdate/#m-graphics.font.getGlyph
]]
---@param character string|integer
---@return playdate.graphics.image
function playdate.graphics.font:getGlyph(character) end
