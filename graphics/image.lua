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
	PNG and GIF images in the source folder are compiled into a Playdate-specific format by pdc, and can be loaded into Lua with playdate.graphics.image.new(path). Playdate images are 1 bit per pixel, with an optional alpha channel.

	https://sdk.play.date/inside-playdate/#C-graphics.image
]]
---@class playdate.graphics.image : Object

--[[
	Creates a new image from the data at path, or creates a new blank image of the given width and height. The image can be drawn on using playdate.graphics.pushContext() or playdate.graphics.lockFocus(). The optional bgcolor argument is one of the color constants as used in playdate.graphics.setColor(), defaulting to kColorClear.

	https://sdk.play.date/inside-playdate/#f-graphics.image.new
	https://sdk.play.date/inside-playdate/#f-graphics.image.new-path
]]
---@param width integer
---@param height integer
---@param bgColor? PlaydateColor
---@return playdate.graphics.image
---@overload fun(path: string): playdate.graphics.image
function playdate.graphics.image.new(width, height, bgColor) end

--[[
	Loads a new image from the data at path into an already-existing image, without allocating additional memory. The image at path must be of the same dimensions as the original.

	Returns (success, [error]). If the boolean success is false, error is also returned.

	https://sdk.play.date/inside-playdate/#m-graphics.image.load
]]
---@param path string
---@return boolean success, string|nil errorMessage
function playdate.graphics.image:load(path) end

--[[
	Returns a new playdate.graphics.image that is an exact copy of the original.

	https://sdk.play.date/inside-playdate/#m-graphics.image.copy
]]
---@return playdate.graphics.image
function playdate.graphics.image:copy() end

-- TODO: Verify whether this returns width, height or returns an actual size object
--[[
	Returns the pair (width, height)

	https://sdk.play.date/inside-playdate/#m-graphics.image.getSize
]]
---@return integer width, integer height
function playdate.graphics.image:getSize() end

-- TODO: Verify whether this returns width, height or returns an actual size object
--[[
	Returns the pair (width, height) for the image at path without actually loading the image.

	https://sdk.play.date/inside-playdate/#f-graphics.image.imageSizeAtPath
]]
---@param path string
---@return integer width, integer height
function playdate.graphics.image.imageSizeAtPath(path) end

---@alias ImageFlip
---|`playdate.graphics.kImageUnflipped`
---|`playdate.graphics.kImageFlippedX`
---|`playdate.graphics.kImageFlippedY`
---|`playdate.graphics.kImageFlippedXY`
---|"flipX"
---|"flipY"
---|"flipZ"

--[[
	Draws the image with its upper-left corner at location (x, y) or playdate.geometry.point p.

	sourceRect, if specified, will cause only the part of the image within sourceRect to be drawn. sourceRect should be relative to the image’s bounds and can be a playdate.geometry.rect or four integers, (x, y, w, h), representing the rect.

	https://sdk.play.date/inside-playdate/#m-graphics.imgDraw
]]
---@param x integer|playdate.geometry.point
---@param y? integer|ImageFlip
---@param flip? ImageFlip|playdate.geometry.rect
---@param sourceRect? playdate.geometry.rect
function playdate.graphics.image:draw(x, y, flip, sourceRect)  end

--[[
	Draws the image at location (x, y) centered at the point within the image represented by (ax, ay) in unit coordinate space. For example, values of ax = 0.0, ay = 0.0 represent the image’s top-left corner, ax = 1.0, ay = 1.0 represent the bottom-right, and ax = 0.5, ay = 0.5 represent the center of the image.

	The flip argument is optional; see playdate.graphics.image:draw() for valid values.

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawAnchored
]]
---@param x integer
---@param y integer
---@param ax number
---@param ay number
---@param flip? ImageFlip
function playdate.graphics.image:drawAnchored(x, y, ax, ay, flip) end

--[[
	Draws the image centered at location (x, y).

	The flip argument is optional; see playdate.graphics.image:draw() for valid values.

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawCentered
]]
---@param x integer
---@param y integer
---@param flip? ImageFlip
function playdate.graphics.image:drawCentered(x, y, flip) end

--[[
	Draws the image ignoring the currently-set drawOffset.

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawIgnoringOffset
]]
---@param x integer|playdate.geometry.point
---@param y? integer|ImageFlip
---@param flip? ImageFlip
function playdate.graphics.image:drawIgnoringOffset(x, y, flip) end

--[[
	Returns playdate.graphics.kColorWhite if the image is white at (x, y), playdate.graphics.kColorBlack if it’s black, or playdate.graphics.kColorClear if it’s transparent.

	https://sdk.play.date/inside-playdate/#m-graphics.image.sample
]]
---@param x integer
---@param y integer
---@return PlaydateColor
function playdate.graphics.image:sample(x, y) end

--[[
	Draws this image centered at point (x,y) at (clockwise) angle degrees, scaled by optional argument scale, with an optional separate scaling for the y axis.

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawRotated
]]
---@param x integer
---@param y integer
---@param angle number
---@param scale? number
---@param yScale? number
function playdate.graphics.image:drawRotated(x, y, angle, scale, yScale) end

--[[
	Returns a new image containing this image rotated by (clockwise) angle degrees, scaled by optional argument scale, with an optional separate scaling for the y axis.

	https://sdk.play.date/inside-playdate/#m-graphics.image.rotatedImage
]]
---@param angle number
---@param scale? number
---@param yScale? number
---@return playdate.graphics.image
function playdate.graphics.image:rotatedImage(angle, scale, yScale) end

--[[
	Draws this image with its upper-left corner at point (x,y), scaled by amount scale, with an optional separate scaling for the y axis.

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawScaled
]]
---@param x integer
---@param y integer
---@param scale number
---@param yScale? number
function playdate.graphics.image:drawScaled(x, y, scale, yScale) end

--[[
	Returns a new image containing this image scaled by amount scale, with an optional separate scaling for the y axis.

	https://sdk.play.date/inside-playdate/#m-graphics.image.scaledImage
]]
---@param scale number
---@param yScale? number
---@return playdate.graphics.image
function playdate.graphics.image:scaledImage(scale, yScale) end

--[[
	Draws this image centered at point (x,y) with the transform xform applied.

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawWithTransform
]]
---@param xform playdate.geometry.affineTransform
---@param x number
---@param y number
function playdate.graphics.image:drawWithTransform(xform, x, y) end

--[[
	Returns a new image containing the image with the transform xform applied.

	https://sdk.play.date/inside-playdate/#m-graphics.image.transformedImage
]]
---@param xform playdate.geometry.affineTransform
---@return playdate.graphics.image
function playdate.graphics.image:transformedImage(xform) end

--[[
	Draws the image as if it’s mapped onto a tilted plane, transforming the target coordinates to image coordinates using an affine transform:

	x' = dxx * x + dyx * y + dx
	y' = dxy * x + dyy * y + dy

    x, y, width, height: The rectangle to fill
    centerx, centery: The point in the above rectangle [in (0,1)x(0,1) coordinates] for the center of the transform
    dxx, dyx, dxy, dyy, dx, dy: Defines an affine transform from geometry coordinates to image coordinates
    z: The distance from the viewer to the target plane — lower z means more exaggerated perspective
    tiltAngle: The tilt of the target plane about the x axis, in degrees
    tile: A boolean, indicating whether the image is tiled on the target plane

	The Mode7Driver demo in the /Examples folder of the SDK demonstrates the usage of this function.

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawSampled
]]
---@param x number
---@param y number
---@param width number
---@param height number
---@param centerx number
---@param centery number
---@param dxx number
---@param dyx number
---@param dxy number
---@param dyy number
---@param dx number
---@param dy number
---@param z number
---@param tiltAngle number
---@param tile boolean
function playdate.graphics.image:drawSampled(x, y, width, height, centerx, centery, dxx, dyx, dxy, dyy, dx, dy, z, tiltAngle, tile) end

--[[
	Sets the image’s mask to a copy of maskImage.

	https://sdk.play.date/inside-playdate/#m-graphics.image.setMaskImage
]]
---@param maskImage playdate.graphics.image
function playdate.graphics.image:setMaskImage(maskImage) end

--[[
	If the image has a mask, returns the mask as a separate image. Otherwise, returns nil.

	The returned image references the original’s data, so drawing into this image alters the original image’s mask. 

	https://sdk.play.date/inside-playdate/#m-graphics.image.getMaskImage
]]
---@return playdate.graphics.image|nil
function playdate.graphics.image:getMaskImage() end

--[[
	Adds a mask to the image if it doesn’t already have one. If opaque is true, the image will be set to entirely opaque. Otherwise, or if not specified, the image will be completely transparent.

	https://sdk.play.date/inside-playdate/#m-graphics.image.addMask
]]
---@param opaque? boolean
function playdate.graphics.image:addMask(opaque) end

--[[
	Removes the mask from the image if it has one.

	https://sdk.play.date/inside-playdate/#m-graphics.image.removeMask
]]
function playdate.graphics.image:removeMask() end

--[[
	Returns true if the image has a mask.

	https://sdk.play.date/inside-playdate/#m-graphics.image.hasMask
]]
---@return boolean
function playdate.graphics.image:hasMask() end

--[[
	Erases the contents of the image’s mask, so that the image is entirely opaque if opaque is 1, transparent otherwise. This function has no effect if the image doesn’t have a mask.

	https://sdk.play.date/inside-playdate/#m-graphics.image.clearMask
]]
---@param opaque? boolean
function playdate.graphics.image:clearMask(opaque) end

--[[
	Tiles the image into the given rectangle, using either listed dimensions or a playdate.geometry.rect object, and the optional flip style.

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawTiled
]]
---@param x number
---@param y number
---@param width number
---@param height number
---@param flip? ImageFlip
---@overload fun(rect: playdate.geometry.rect, flip?: ImageFlip)
function playdate.graphics.image:drawTiled(x, y, width, height, flip)  end

---@alias DitherType
---|`playdate.graphics.image.kDitherTypeNone`
---|`playdate.graphics.image.kDitherTypeDiagonalLine`
---|`playdate.graphics.image.kDitherTypeVerticalLine`
---|`playdate.graphics.image.kDitherTypeHorizontalLine`
---|`playdate.graphics.image.kDitherTypeScreen`
---|`playdate.graphics.image.kDitherTypeBayer2x2`
---|`playdate.graphics.image.kDitherTypeBayer4x4`
---|`playdate.graphics.image.kDitherTypeBayer8x8`
---|`playdate.graphics.image.kDitherTypeFloydSteinberg`
---|`playdate.graphics.image.kDitherTypeBurkes`
---|`playdate.graphics.image.kDitherTypeAtkinson`

--[[
	Draws a blurred version of the image at (x, y).

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawBlurred
]]
---@param x number
---@param y number
---@param radius number A bigger radius means a more blurred result. Processing time is independent of the radius.
---@param numPasses number A box blur is used to blur the image. The more passes, the more closely the blur approximates a gaussian blur. However, higher values will take more time to process.
---@param ditherType DitherType
---@param flip? ImageFlip
---@param xPhase? DitherType
---@param yPhase? DitherType
function playdate.graphics.image:drawBlurred(x, y, radius, numPasses, ditherType, flip, xPhase, yPhase) end

--[[
	Draws a partially transparent image with its upper-left corner at location (x, y)

	https://sdk.play.date/inside-playdate/#m-graphics.image.drawFaded
]]
---@param x number
---@param y number
---@param alpha number The alpha value used to draw the image, with 1 being fully opaque, and 0 being completely transparent.
---@param ditherType DitherType
function playdate.graphics.image:drawFaded(x, y, alpha, ditherType) end

--[[
	If flag is true, the image will be drawn with its colors inverted. If the image is being used as a stencil, its behavior is reversed: pixels are drawn where the stencil is black, nothing is drawn where the stencil is white.

	https://sdk.play.date/inside-playdate/#m-graphics.image.setInverted
]]
---@param flag boolean
function playdate.graphics.image:setInverted(flag) end

--[[
	Returns a color-inverted copy of the caller.

	https://sdk.play.date/inside-playdate/#m-graphics.image.invertedImage
]]
---@return playdate.graphics.image
function playdate.graphics.image:invertedImage() end

--[[
	Returns an image that is a blend between the caller and image.

	https://sdk.play.date/inside-playdate/#m-graphics.image.blendWithImage
]]
---@param image playdate.graphics.image the playdate.graphics.image to be blended with the caller.
---@param alpha number The alpha value assigned to the caller. image will have an alpha of (1 - alpha).
---@param ditherType DitherType The caller and image are blended into a greyscale image and dithered with one of the dithering algorithms listed in playdate.graphics.image:blurredImage()
function playdate.graphics.image:blendWithImage(image, alpha, ditherType) end

--[[
	Returns a blurred copy of the caller.

	https://sdk.play.date/inside-playdate/#m-graphics.image.blurredImage
]]
---@param radius number A bigger radius means a more blurred result. Processing time is independent of the radius.
---@param numPasses integer A box blur is used to blur the image. The more passes, the more closely the blur approximates a gaussian blur. However, higher values will take more time to process.
---@param ditherType DitherType
---@param padEdges boolean Boolean indicating whether the edges of the images should be padded to accommodate the blur radius. Defaults to false.
---@param xPhase? DitherType
---@param yPhase? DitherType
function playdate.graphics.image:blurredImage(radius, numPasses, ditherType, padEdges, xPhase, yPhase) end

--[[
	Returns a faded version of the caller.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#m-graphics.image.fadedImage
]]
---@param alpha number The alpha value assigned to the caller, in the range 0.0 - 1.0. If an image mask already exists it is multiplied by alpha.
---@param ditherType DitherType The caller is faded into a greyscale image and dithered with one of the dithering algorithms listed in 
function playdate.graphics.image:fadedImage(alpha, ditherType) end

--[[
	Returns an image created by applying a VCR pause effect to the calling image.

	https://sdk.play.date/inside-playdate/#m-graphics.image.vcrPauseFilterImage
]]
---@return playdate.graphics.image
function playdate.graphics.image:vcrPauseFilterImage() end

--[[
	Returns true if the non-alpha-masked portions of image1 and image2 overlap if they were drawn at positions (x1, y1) and (x2, y2) and flipped according to flip1 and flip2, which should each be one of the values listed in playdate.graphics.image:draw().

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-graphics.checkAlphaCollision
]]
---@param image1 playdate.graphics.image
---@param x1 number
---@param y1 number
---@param flip1 ImageFlip
---@param image2 playdate.graphics.image
---@param x2 number
---@param y2 number
---@param flip2 ImageFlip
function playdate.graphics.checkAlphaCollision(image1, x1, y1, flip1, image2, x2, y2, flip2) end
