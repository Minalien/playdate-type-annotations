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
	Sprites are graphic objects that can be used to represent moving entities in your games, like the player, or the enemies that chase after your player. Sprites animate efficiently, and offer collision detection and a host of other built-in functionality. (If you want to create an environment for your sprites to move around in, consider using tilemaps or drawing a background image.)

	To have access to all the sprite functionality described below, be sure to import "CoreLibs/sprites" at the top of your source file. 

	https://sdk.play.date/inside-playdate/#C-graphics.sprite
]]
---@class playdate.graphics.sprite
---@field x integer			Do not set this properties directly. Use :moveTo() or :setBounds() instead.
---@field y integer			Do not set this properties directly. Use :moveTo() or :setBounds() instead.
---@field width integer		Do not set this properties directly. Use :moveTo() or :setBounds() instead.
---@field height integer	Do not set this properties directly. Use :moveTo() or :setBounds() instead.
playdate.graphics.sprite = {}

--[[
	This class method (note the "." syntax rather than ":") returns a new sprite object. A previously-loaded image object can be optionally passed-in (to do this, be sure to import "CoreLibs/sprites" at the beginning of your source file.)

	To see your sprite onscreeen, you will need to call :add() on your sprite to add it to the display list. 

	https://sdk.play.date/inside-playdate/#f-graphics.sprite.new
]]
---@param image? playdate.graphics.image
---@return playdate.graphics.sprite
function playdate.graphics.sprite.new(image) end

--[[
	This class method (note the "." syntax rather than ":") calls the update() function on every sprite in the global sprite list and redraws all of the dirty rects.

	You will generally want to call playdate.graphics.sprite.update() once in your playdate.update() method, to ensure that your sprites are updated and drawn during every frame. Failure to do so may mean your sprites will not appear onscreen.

	Be careful not confuse sprite.update() with sprite:update(): the former updates all sprites; the latter updates just the sprite being invoked. 

	https://sdk.play.date/inside-playdate/#f-graphics.sprite.update
]]
function playdate.graphics.sprite.update() end

--[[
	Sets the sprite’s image to image, which should be an instance of playdate.graphics.image. The .flip_ argument is optional; see playdate.graphics.image:draw() for valid values. Optional scale arguments are also accepted. Unless disabled with playdate.graphics.sprite:setRedrawOnImageChange(), the sprite is automatically marked for redraw if the image isn’t the previous image.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setImage
]]
---@param image playdate.graphics.image
---@param flip? ImageFlip
---@param scale? number
---@param yscale? number
function playdate.graphics.sprite:setImage(image, flip, scale, yscale) end

--[[
	Returns the playdate.graphics.image object that was set with setImage().

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.getImage
]]
---@return playdate.graphics.image
function playdate.graphics.sprite:getImage() end

--[[
	Adds the given sprite to the display list, so that it is drawn in the current scene.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.add
]]
function playdate.graphics.sprite:add() end

--[[
	Adds the given sprite to the display list, so that it is drawn in the current scene.

	https://sdk.play.date/inside-playdate/#f-graphics.sprite.addSprite
]]
---@param sprite playdate.graphics.sprite
function playdate.graphics.sprite.addSprite(sprite) end

--[[
	Removes the given sprite from the display list.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.remove
]]
function playdate.graphics.sprite:remove() end

--[[
	Removes the given sprite from the display list.

	https://sdk.play.date/inside-playdate/#f-graphics.sprite.removeSprite
]]
---@param sprite playdate.graphics.sprite
function playdate.graphics.sprite.removeSprite(sprite) end

--[[
	Moves the sprite and resets the bounds based on the image dimensions and center.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.moveTo
]]
---@param x integer
---@param y integer
function playdate.graphics.sprite:moveTo(x, y) end

--[[
	Returns the sprite’s current x, y position as multiple values (x, y).

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.getPosition
]]
---@return integer x, integer y
function playdate.graphics.sprite:getPosition() end

--[[
	Moves the sprite by x, y pixels relative to its current position.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.moveBy
]]
---@param x integer
---@param y integer
function playdate.graphics.sprite:moveBy(x, y) end

--[[
	Sets the Z-index of the given sprite. Sprites with higher Z-indexes are drawn on top of those with lower Z-indexes. Valid values for z are in the range (-32768, 32767).

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setZIndex
]]
---@param z integer
function playdate.graphics.sprite:setZIndex(z) end

--[[
	Returns the Z-index of the given sprite.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.getZIndex
]]
---@return integer
function playdate.graphics.sprite:getZIndex() end

--[[
	Sprites that aren’t visible don’t get their draw() method called.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setVisible
]]
---@param flag boolean
function playdate.graphics.sprite:setVisible(flag) end

--[[
	Sprites that aren’t visible don’t get their draw() method called.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.isVisible
]]
---@return boolean
function playdate.graphics.sprite:isVisible() end

--[[
	Sets the sprite’s drawing center as a fraction (ranging from 0.0 to 1.0) of the height and width. Default is 0.5, 0.5 (the center of the sprite). This means that when you call :moveTo(x, y), the center of your sprite will be positioned at x, y. If you want x and y to represent the upper left corner of your sprite, specify the center as 0, 0.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setCenter
]]
---@param x number
---@param y number
function playdate.graphics.sprite:setCenter(x, y) end

--[[
	Returns multiple values (x, y) representing the sprite’s drawing center as a fraction (ranging from 0.0 to 1.0) of the height and width.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.getCenter
]]
---@return integer x, integer y
function playdate.graphics.sprite:getCenter() end

--[[
	Returns a playdate.geometry.point representing the sprite’s drawing center as a fraction (ranging from 0.0 to 1.0) of the height and width.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.getCenterPoint
]]
---@return playdate.geometry.point
function playdate.graphics.sprite:getCenterPoint() end

--[[
	Sets the sprite’s size. The method has no effect if the sprite has an image set.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setSize
]]
---@param width integer
---@param height integer
function playdate.graphics.sprite:setSize(width, height) end

--[[
	Returns multiple values (width, height), the current size of the sprite.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.getSize
]]
---@return integer width, integer height
function playdate.graphics.sprite:getSize() end

--[[
	Sets the scaling factor for the sprite, with an optional separate scaling for the y axis. If setImage() is called after this, the scale factor is applied to the new image. Only affects sprites that have an image set.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setScale
]]
---@param scale number
---@param yScale? number
function playdate.graphics.sprite:setScale(scale, yScale) end

--[[
	Returns multiple values (xScale, yScale), the current scaling of the sprite.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.getScale
]]
---@return number xScale, number yScale
function playdate.graphics.sprite:getScale() end

--[[
	Sets the rotation for the sprite, in degrees clockwise, with an optional scaling factor. If setImage() is called after this, the rotation and scale is applied to the new image. Only affects sprites that have an image set. This function should be used with discretion, as it’s likely to be slow on the hardware. Consider pre-rendering rotated images for your sprites instead.
	
	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setRotation
]]
---@param angle number
---@param scale? number
---@param yScale? number
function playdate.graphics.sprite:setRotation(angle, scale, yScale) end

--[[
	Returns the current rotation of the sprite.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.getRotation
]]
---@return number
function playdate.graphics.sprite:getRotation() end

--[[
	Returns a copy of the caller.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.copy
]]
---@return playdate.graphics.sprite
function playdate.graphics.sprite:copy() end

--[[
	The sprite’s updatesEnabled flag (defaults to true) determines whether a sprite’s update() method will be called. By default, a sprite’s update method does nothing; however, you may choose to have your sprite do something on every frame by implementing an update method on your sprite instance, or implementing it in your sprite subclass.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setUpdatesEnabled
]]
---@param flag boolean
function playdate.graphics.sprite:setUpdatesEnabled(flag) end

--[[
	The sprite’s updatesEnabled flag (defaults to true) determines whether a sprite’s update() method will be called. By default, a sprite’s update method does nothing; however, you may choose to have your sprite do something on every frame by implementing an update method on your sprite instance, or implementing it in your sprite subclass.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.updatesEnabled
]]
---@return boolean
function playdate.graphics.sprite:updatesEnabled() end

--[[
	Sets the sprite’s tag, an integer value useful for identifying sprites later, particularly when working with collisions.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setTag
]]
---@param tag integer
function playdate.graphics.sprite:setTag(tag) end

--[[
	Returns the sprite’s tag, an integer value.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.getTag
]]
---@return integer
function playdate.graphics.sprite:getTag() end

--[[
	Sets the mode for drawing the bitmap. See playdate.graphics.setImageDrawMode(mode) for valid modes.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setImageDrawMode
]]
---@param mode DrawMode
function playdate.graphics.sprite:setImageDrawMode(mode) end

--[[
	Flips the bitmap. See playdate.graphics.image:draw() for valid flip values.

	If true is passed for the optional flipCollideRect argument, the sprite’s collideRect will be flipped as well.

	Calling setImage() will reset the sprite to its default, non-flipped orientation. So, if you call both setImage() and setImageFlip(), call setImage() first.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setImageFlip
]]
---@param flip ImageFlip
---@param flipCollideRect? boolean
function playdate.graphics.sprite:setImageFlip(flip, flipCollideRect) end

--[[
	Returns one of the values listed at playdate.graphics.image:draw().

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.getImageFlip
]]
---@return ImageFlip
function playdate.graphics.sprite:getImageFlip() end

--[[
	When set to true, the sprite will draw in screen coordinates, ignoring the currently-set drawOffset.

	This only affects drawing, and should not be used on sprites being used for collisions, which will still happen in world-space.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setIgnoresDrawOffset
]]
---@param flag boolean
function playdate.graphics.sprite:setIgnoresDrawOffset(flag) end

--[[
	setBounds() positions and sizes the sprite, used for drawing and for calculating dirty rects. upper-left-x and upper-left-y are relative to the overall display coordinate system. (If an image is attached to the sprite, the size will be defined by that image, and not by the width and height parameters passed in to setBounds().)

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setBounds
]]
---@param upper_left_x number
---@param upper_left_y number
---@param width number
---@param height number
---@overload fun(rect: playdate.geometry.rect)
function playdate.graphics.sprite:setBounds(upper_left_x, upper_left_y, width, height) end

--[[
	getBounds() returns multiple values (x, y, width, height).

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.getBounds
]]
---@return number x, number y, number width, number height
function playdate.graphics.sprite:getBounds() end

--[[
	getBoundsRect() returns the sprite bounds as a playdate.geometry.rect object.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.getBoundsRect
]]
---@return playdate.geometry.rect
function playdate.graphics.sprite:getBoundsRect() end

--[[
	Marking a sprite opaque tells the sprite system that it doesn’t need to draw anything underneath the sprite, since it will be overdrawn anyway. If you set an image without a mask/alpha channel on the sprite, it automatically sets the opaque flag.

	Setting a sprite to opaque can have performance benefits.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setOpaque
]]
---@param flag boolean
function playdate.graphics.sprite:setOpaque(flag) end

--[[
	Marking a sprite opaque tells the sprite system that it doesn’t need to draw anything underneath the sprite, since it will be overdrawn anyway. If you set an image without a mask/alpha channel on the sprite, it automatically sets the opaque flag.

	Setting a sprite to opaque can have performance benefits.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.isOpaque
]]
---@return boolean
function playdate.graphics.sprite:isOpaque() end

--[[
	You must import CoreLibs/sprites to use this function.

	A convenience function for drawing a background image behind your sprites.

	drawCallback is a routine you specify that implements your background drawing. The callback should be a function taking the arguments x, y, width, height, where x, y, width, height specify the region (in screen coordinates, not world coordinates) of the background region that needs to be updated.

	https://sdk.play.date/inside-playdate/#f-graphics.sprite.setBackgroundDrawingCallback
]]
---@param drawCallback fun(x: integer, y: integer, width: integer, height: integer)
function playdate.graphics.sprite.setBackgroundDrawingCallback(drawCallback) end

--[[
	You must import CoreLibs/sprites to use this function.

	Marks the background sprite dirty, forcing the drawing callback to be run when playdate.graphics.sprite.update() is called.

	https://sdk.play.date/inside-playdate/#f-graphics.sprite.redrawBackground
]]
function playdate.graphics.sprite.redrawBackground() end

--[[
	Sets the sprite’s contents to the given tilemap. Useful if you want to automate drawing of your tilemap, especially if interleaved by depth with other sprites being drawn.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setTilemap
]]
---@param tilemap playdate.graphics.tilemap|nil
function playdate.graphics.sprite:setTilemap(tilemap) end

--[[
	You must import CoreLibs/sprites to use the setAnimator method.

	setAnimator assigns an playdate.graphics.animator to the sprite, which will cause the sprite to automatically update its position each frame while the animator is active.

	setAnimator should be called only after any custom update method has been set on the sprite. 

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setAnimator
]]
---@param animator playdate.graphics.animator
---@param moveWithCollisions? boolean if provided and true will cause the sprite to move with collisions. A collision rect must be set on the sprite prior to passing true for this argument.
---@param removeOnCollision? boolean if provided and true will cause the animator to be removed from the sprite when a collision occurs.
function playdate.graphics.sprite:setAnimator(animator, moveWithCollisions, removeOnCollision) end

--[[
	Removes a playdate.graphics.animator assigned to the sprite

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.removeAnimator
]]
function playdate.graphics.sprite:removeAnimator() end

--[[
	Sets the clipping rectangle for the sprite, using separate parameters or a playdate.geometry.rect object. Only areas within the rect will be drawn.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setClipRect
]]
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@overload fun(rect: playdate.geometry.rect)
function playdate.graphics.sprite:setClipRect(x, y, width, height) end

--[[
	Clears the sprite’s current clipping rectangle.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.clearClipRect
]]
function playdate.graphics.sprite:clearClipRect() end

--[[
	Sets the clip rect for sprites in the given z-index range.

	https://sdk.play.date/inside-playdate/#f-graphics.sprite.setClipRectsInRange
]]
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@param startz integer
---@param endz integer
---@overload fun(rect: playdate.geometry.rect, startz: integer, endz: integer)
function playdate.graphics.sprite.setClipRectsInRange(x, y, width, height, startz, endz) end

--[[
	Clears sprite clip rects in the given z-index range.

	https://sdk.play.date/inside-playdate/#f-graphics.sprite.clearClipRectsInRange
]]
---@param startz integer
---@param endz integer
function playdate.graphics.sprite.clearClipRectsInRange(startz, endz) end

--[[
	Specifies a stencil image to be set on the frame buffer before the sprite is drawn. If tile is set, the the stencil will be tiled; in this case, the image width must be a multiple of 32 pixels.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setStencilImage
]]
---@param stencil playdate.graphics.image
---@param tile boolean
function playdate.graphics.sprite:setStencilImage(stencil, tile) end

--[[
	Sets the sprite’s stencil to the given pattern, tiled across the screen.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setStencilPattern
]]
---@param pattern integer[]
function playdate.graphics.setStencilPattern(pattern) end

-- TODO: Verify the expected type of level param
--[[
	Sets the sprite’s stencil to a dither pattern specified by level and optional ditherType (defaults to playdate.graphics.image.kDitherTypeBayer8x8).

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setStencilPattern-dither
]]
---@param level any
---@param ditherType? DitherType
function playdate.graphics.sprite:setStencilPattern(level, ditherType) end

--[[
	Clears the sprite’s stencil.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.clearStencil
]]
function playdate.graphics.sprite:clearStencil() end

--[[
	If set to true, causes all sprites to draw each frame, whether or not they have been marked dirty. This may speed up the performance of your game if the system’s dirty rect tracking is taking up too much time - for example if there are many sprites moving around on screen at once.

	https://sdk.play.date/inside-playdate/#f-graphics.sprite.setAlwaysRedraw
]]
---@param flag boolean
function playdate.graphics.sprite.setAlwaysRedraw(flag) end

--[[
	If set to true, causes all sprites to draw each frame, whether or not they have been marked dirty. This may speed up the performance of your game if the system’s dirty rect tracking is taking up too much time - for example if there are many sprites moving around on screen at once.

	https://sdk.play.date/inside-playdate/#f-graphics.sprite.getAlwaysRedraw
]]
---@return boolean
function playdate.graphics.sprite.getAlwaysRedraw() end

--[[
	Marks the rect defined by the sprite’s current bounds as needing a redraw.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.markDirty
]]
function playdate.graphics.sprite:markDirty() end

--[[
	Marks the given rectangle (in screen coordinates) as needing a redraw. playdate.graphics drawing functions now call this automatically, adding their drawn areas to the sprite’s dirty list, so there’s likely no need to call this manually any more. This behavior may change in the future, though.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.addDirtyRect
]]
---@param x integer
---@param y integer
---@param width integer
---@param height integer
function playdate.graphics.sprite.addDirtyRect(x, y, width, height) end

--[[
	By default, sprites are automatically marked for redraw when their image is changed via playdate.graphics.sprite:setImage(). If disabled by calling this function with a false argument, playdate.graphics.sprite.addDirtyRect() can be used to mark the (potentially smaller) area of the screen that needs to be redrawn.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setRedrawsOnImageChange
]]
---@param flag boolean
function playdate.graphics.sprite:setRedrawsOnImageChange(flag) end

--[[
	Returns an array of all sprites in the display list.

	https://sdk.play.date/inside-playdate/#f-graphics.sprite.getAllSprites
]]
---@return playdate.graphics.sprite[]
function playdate.graphics.sprite.getAllSprites() end

--[[
	You must import CoreLibs/sprites to use this function.

	Performs the function f on all sprites in the display list. f should take one argument, which will be a sprite.

	https://sdk.play.date/inside-playdate/#f-graphics.sprite.performOnAllSprites
]]
---@param f fun(sprite: playdate.graphics.sprite)
function playdate.graphics.sprite.performOnAllSprites(f) end

--[[
	Returns the number of sprites in the display list.

	https://sdk.play.date/inside-playdate/#f-graphics.sprite.spriteCount
]]
---@return integer
function playdate.graphics.sprite.spriteCount() end

--[[
	Removes all sprites from the global sprite list.

	https://sdk.play.date/inside-playdate/#f-graphics.sprite.removeAll
]]
function playdate.graphics.sprite.removeAll() end

--[[
	Removes all sprites in spriteArray from the global sprite list.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.removeSprites
]]
---@param spriteArray playdate.graphics.sprite[]
function playdate.graphics.sprite.removeSprites(spriteArray) end

--[[
	If the sprite doesn’t have an image, the sprite’s draw function is called as needed to update the display. The rect passed in is the current dirty rect being updated by the display list.

	https://sdk.play.date/inside-playdate/#c-graphics.sprite.draw
]]
---@param x integer
---@param y integer
---@param width integer
---@param height integer
function playdate.graphics.sprite:draw(x, y, width, height) end

--[[
	Called by playdate.graphics.sprite.update() (note the syntactic difference between the period and the colon) before sprites are drawn. Implementing :update() gives you the opportunity to perform some code upon every frame.

	https://sdk.play.date/inside-playdate/#c-graphics.sprite.update
]]
function playdate.graphics.sprite:update() end

--[[
	setCollideRect() marks the area of the sprite, relative to its own internal coordinate system, to be checked for collisions with other sprites' collide rects. Note that the coordinate space is relative to the top-left corner of the bounds, regardless of where the sprite’s center/anchor is located.
	If you want to set the sprite’s collide rect to be the same size as the sprite itself, you can write sprite:setCollideRect( 0, 0, sprite:getSize() ).
	setCollideRect() must be invoked on a sprite in order to get it to participate in collisions. 

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setCollideRect
]]
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@overload fun(rect: playdate.geometry.rect)
function playdate.graphics.sprite:setCollideRect(x, y, width, height) end

--[[
	Returns the sprite’s collide rect set with setCollideRect(). Return value is a playdate.geometry.rect.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.getCollideRect
]]
---@return playdate.geometry.rect
function playdate.graphics.sprite:getCollideRect() end

--[[
	Returns the sprite’s collide rect as multiple values, (x, y, width, height).

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.getCollideBounds
]]
---@return integer x, integer y, integer width, integer height
function playdate.graphics.sprite:getCollideBounds() end

--[[
	Clears the sprite’s collide rect set with setCollideRect().

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.clearCollideRect
]]
function playdate.graphics.sprite:clearCollideRect() end

--[[
	Returns an array of sprites that have collide rects that are currently overlapping the calling sprite’s collide rect, taking the sprites' groups and collides-with masks into consideration.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.overlappingSprites
]]
---@return playdate.graphics.sprite[]
function playdate.graphics.sprite:overlappingSprites() end

--[[
	Returns an array of array-style tables, each containing two sprites that have overlapping collide rects. All sprite pairs that are have overlapping collide rects (taking the sprites' group and collides-with masks into consideration) are returned.
	
	An example of iterating over the collisions array:
		local collisions = gfx.sprite.allOverlappingSprites()

		for i = 1, #collisions do
			local collisionPair = collisions[i]
			local sprite1 = collisionPair[1]
			local sprite2 = collisionPair[2]
			-- do something with the colliding sprites
		end
	
	https://sdk.play.date/inside-playdate/#f-graphics.sprite.allOverlappingSprites
]]
---@return playdate.graphics.sprite[][]
function playdate.graphics.sprite.allOverlappingSprites() end

--[[
	Returns a boolean value set to true if a pixel-by-pixel comparison of the sprite images shows that non-transparent pixels are overlapping, based on the current bounds of the sprites.

	This method may be used in conjunction with the standard collision architecture. Say, if overlappingSprites() or moveWithCollisions() report a collision of two sprite’s bounding rects, alphaCollision() could then be used to discern if a pixel-level collision occurred.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.alphaCollision
]]
---@param anotherSprite playdate.graphics.sprite
---@return boolean
function playdate.graphics.sprite:alphaCollision(anotherSprite) end

--[[
	The sprite’s collisionsEnabled flag (defaults to true) can be set to false in order to temporarily keep a sprite from colliding with any other sprite.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setCollisionsEnabled
]]
---@param flag boolean
function playdate.graphics.sprite:setCollisionsEnabled(flag) end

--[[
	The sprite’s collisionsEnabled flag (defaults to true) can be set to false in order to temporarily keep a sprite from colliding with any other sprite.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.collisionsEnabled
]]
---@return boolean
function playdate.graphics.sprite:collisionsEnabled() end

--[[
	Adds the sprite to one or more collision groups. A group is a collection of sprites that exhibit similar collision behavior. (An example: in Atari’s Asteroids, asteroid sprites would all be added to the same group, while the player’s spaceship might be in a different group.) Use setCollidesWithGroups() to define which groups a sprite should collide with.

	There are 32 groups, each defined by the integer 1 through 32. To add a sprite to only groups 1 and 3, for example, call mySprite:setGroups({1, 3}).

	Alternatively, use setGroupMask() to set group membership via a bitmask.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setGroups
]]
---@param groups integer[]
function playdate.graphics.sprite:setGroups(groups) end

--[[
	Pass in a group number or an array of group numbers to specify which groups this sprite can collide with. Groups are numbered 1 through 32. Use setGroups() to specify which groups a sprite belongs to.

	Alternatively, you can specify group collision behavior with a bitmask by using setCollidesWithGroupsMask().

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setCollidesWithGroups
]]
---@param groups integer[]
function playdate.graphics.sprite:setCollidesWithGroups(groups) end

--[[
	setGroupMask() sets the sprite’s group bitmask, which is 32 bits. In conjunction with the setCollidesWithGroupsMask() method, this controls which sprites can collide with each other.

	For large group mask numbers, pass the number as a hex value, eg. 0xFFFFFFFF to work around limitations in Lua’s integer sizes.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setGroupMask
]]
---@param mask integer
function playdate.graphics.sprite:setGroupMask(mask) end

--[[
	getGroupMask() returns the integer value of the sprite’s group bitmask.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.getGroupMask
]]
---@return integer
function playdate.graphics.sprite:getGroupMask() end

--[[
	Sets the sprite’s collides-with-groups bitmask, which is 32 bits. The mask specifies which other sprite groups this sprite can collide with. Sprites only collide if the moving sprite’s collidesWithGroupsMask matches at least one group of a potential collision sprite (i.e. a bitwise AND (&) between the moving sprite’s collidesWithGroupsMask and a potential collision sprite’s groupMask != zero) or if the moving sprite’s collidesWithGroupsMask and the other sprite’s groupMask are both set to 0x00000000 (the default values).

	For large mask numbers, pass the number as a hex value, eg. 0xFFFFFFFF to work around limitations in Lua’s integer sizes.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.setCollidesWithGroupsMask
]]
---@param mask integer
function playdate.graphics.sprite:setCollidesWithGroupsMask(mask) end

--[[
	Returns the integer value of the sprite’s collision bitmask.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.getCollidesWithGroupsMask
]]
---@return integer
function playdate.graphics.sprite:getCollidesWithGroupsMask() end

--[[
	Resets the sprite’s group mask to 0x00000000.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.resetGroupMask
]]
function playdate.graphics.sprite:resetGroupMask() end

--[[
	Resets the sprite’s collides-with-groups mask to 0x00000000.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.resetCollidesWithGroupsMask
]]
function playdate.graphics.sprite:resetCollidesWithGroupsMask() end

---@alias CollisionType
---|`playdate.graphics.sprite.kCollisionTypeSlide`
---|`playdate.graphics.sprite.kCollisionTypeFreeze`
---|`playdate.graphics.sprite.kCollisionTypeOverlap`
---|`playdate.graphics.sprite.kCollisionTypeBounce`
---|"slide"
---|"freeze"
---|"overlap"
---|"bounce"

---@alias MoveCollisionData { sprite: playdate.graphics.sprite, other: playdate.graphics.sprite, type: CollisionType, overlaps: boolean, ti: number, move: playdate.geometry.vector2D, normal: playdate.geometry.vector2D, touch: playdate.geometry.point, spriteRect: playdate.geometry.rect, otherRect: playdate.geometry.rect, bounce: playdate.geometry.point|nil, slide: playdate.geometry.point|nil }

--[[
	Moves the sprite towards goalX, goalY taking collisions into account, which means the sprite’s final position may not be the same as goalX, goalY.

	Returns actualX, actualY, collisions, length.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.moveWithCollisions
]]
---@param goalX number
---@param goalY number
---@return number actualX, number actualY, MoveCollisionData[] collisions, integer length
---@overload fun(goalPoint: playdate.geometry.point): (number, number, MoveCollisionData[], integer)
function playdate.graphics.sprite:moveWithCollisions(goalX, goalY) end

--[[
	Returns the same values as moveWithCollisions() but does not actually move the sprite.

	https://sdk.play.date/inside-playdate/#m-graphics.sprite.checkCollisions
]]
---@param x integer
---@param y integer
---@return number actualX, number actualY, MoveCollisionData[] collisions, integer length
---@overload fun(point: playdate.geometry.point): (number, number, MoveCollisionData[], integer)
function playdate.graphics.sprite:checkCollisions(x, y) end

--[[
	A callback that can be defined on a sprite to control the type of collision response that should happen when a collision with other occurs. This callback should return one of the following four values:

    - playdate.graphics.sprite.kCollisionTypeSlide: Use for collisions that should slide over other objects, like Super Mario does over a platform or the ground.
    - playdate.graphics.sprite.kCollisionTypeFreeze: Use for collisions where the sprite should stop moving as soon as it collides with other, such as an arrow hitting a wall.
    - playdate.graphics.sprite.kCollisionTypeOverlap: Use for collisions in which you want to know about the collision but it should not impact the movement of the sprite, such as when collecting a coin.
    - playdate.graphics.sprite.kCollisionTypeBounce: Use when the sprite should move away from other, like the ball in Pong or Arkanoid.

	The strings "slide", "freeze", "overlap", and "bounce" can be used instead of the constants.

	Feel free to return different values based on the value of other. For example, if other is a wall sprite, you may want to return "slide" or "bounce", but if it’s a coin you might return "overlap".

	If the callback is not present, or returns nil, kCollisionTypeFreeze is used.
	Instead of defining a callback, the collisionResponse property of a sprite can be set directly to one of the four collision response types. This will be faster, as the lua function will not need to be called, but does not allow for dynamic behavior.

	This method should not attempt to modify the sprites in any way. While it might be tempting to deal with collisions here, doing so will have unexpected and undesirable results. Instead, this function should return one of the collision response values as quickly as possible. If sprites need to be modified as the result of a collision, do so elsewhere, such as by inspecting the list of collisions returned by moveWithCollisions().

	https://sdk.play.date/inside-playdate/#c-graphics.sprite.collisionResponse
]]
---@param other playdate.graphics.sprite
---@return CollisionType
function playdate.graphics.sprite:collisionResponse(other) end

--[[
	Returns all sprites with collision rects containing the point.

	https://sdk.play.date/inside-playdate/#f-graphics.sprite.querySpritesAtPoint
]]
---@param x integer
---@param y integer
---@return playdate.graphics.sprite[]
---@overload fun(p: playdate.geometry.point): playdate.graphics.sprite[]
function playdate.graphics.sprite.querySpritesAtPoint(x, y) end

--[[
	Returns all sprites with collision rects overlapping the rect.

	https://sdk.play.date/inside-playdate/#f-graphics.sprite.querySpritesInRect
]]
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@return playdate.graphics.sprite[]
---@overload fun(rect: playdate.geometry.rect): playdate.graphics.sprite[]
function playdate.graphics.sprite.querySpritesInRect(x, y, width, height) end

--[[
	Returns all sprites with collision rects intersecting the line segment.

	https://sdk.play.date/inside-playdate/#f-graphics.sprite.querySpritesAlongLine
]]
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return playdate.graphics.sprite[]
---@overload fun(lineSegment: playdate.geometry.lineSegment): playdate.graphics.sprite[]
function playdate.graphics.sprite.querySpritesAlongLine(x1, y1, x2, y2) end

---@alias LineCollisionInfo { sprite: playdate.graphics.sprite, entryPoint: playdate.geometry.point, exitPoint: playdate.geometry.point, ti1: number, ti2: number }

--[[
	Similar to querySpritesAlongLine(), but instead of sprites returns an array of collisionInfo tables containing information about sprites intersecting the line segment, and len, which is the number of collisions found. If you don’t need this information, use querySpritesAlongLine() as it will be faster.

	Each collisionInfo table contains:

		sprite: the sprite being intersected by the segment.

		entryPoint: a point representing the coordinates of the first intersection between sprite and the line segment.

		exitPoint: a point representing the coordinates of the second intersection between sprite and the line segment.

		ti1 & ti2: numbers between 0 and 1 which indicate how far from the starting point of the line segment the collision happened; t1 for the entry point, t2 for the exit point. This can be useful for things like having a laser cause more damage if the impact is close.
	
	https://sdk.play.date/inside-playdate/#f-graphics.sprite.querySpriteInfoAlongLine
]]
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return LineCollisionInfo[]
---@overload fun(lineSegment: playdate.geometry.lineSegment): LineCollisionInfo[]
function playdate.graphics.sprite.querySpriteInfoAlongLine(x1, y1, x2, y2) end

--[[
	You must import CoreLibs/sprites to use this function.

	This convenience function adds an invisible sprite defined by the rectangle x, y, w, h (or the playdate.geometry.rect r) for the purpose of triggering collisions. This is useful for making areas impassable, triggering an event when a sprite enters a certain area, and so on.

	https://sdk.play.date/inside-playdate/#f-graphics.sprite.addEmptyCollisionSprite
]]
---@param x number
---@param y number
---@param w number
---@param h number
---@overload fun(rect: playdate.geometry.rect)
function playdate.graphics.sprite.addEmptyCollisionSprite(x, y, w, h) end

--[[
	This convenience function automatically adds empty collision sprites necessary to restrict movement within a tilemap.

	tilemap is a playdate.graphics.tilemap.

	emptyIDs is an array of tile IDs that should be considered "passable" — in other words, not walls. Tiles with default IDs of 0 are treated as passable by default, so you do not need to include 0 in the array.

	xOffset, yOffset optionally indicate the distance the new sprites should be offset from (0,0).

	Returns an array-style table of the newly created sprites.

	Calling this function is effectively a shortcut for calling playdate.graphics.tilemap:getCollisionRects() and passing the resulting rects to addEmptyCollisionSprite().

	https://sdk.play.date/inside-playdate/#f-graphics.sprite.addWallSprites
]]
---@param tilemap playdate.graphics.tilemap
---@param emptyIDs integer[]
---@param xOffset? number
---@param yOffset? number
function playdate.graphics.sprite.addWallSprites(tilemap, emptyIDs, xOffset, yOffset) end
