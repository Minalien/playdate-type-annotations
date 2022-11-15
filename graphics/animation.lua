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
	Helps keep track of animation frames, especially for frames in an playdate.graphics.imagetable. For a more general timer see playdate.timer or playdate.frameTimer.
	
	You must import CoreLibs/animation to use these functions. 

	https://sdk.play.date/inside-playdate/#C-graphics.animation.loop
]]
---@class playdate.graphics.animation.loop
---@field imageTable playdate.graphics.imagetable|nil
---@field delay integer Delay before moving to the next frame, in ms
---@field startFrame integer Frame the object resets to when the loop completes
---@field endFrame integer Last frame value in the loop
---@field frame integer Current frame counter
---@field step integer Value by which frame increments
---@field shouldLoop boolean Whether the object loops when it completes
---@field paused boolean Paused loops don't change their frame value
playdate.graphics.animation.loop = {}

--[[
	Creates a new animation object.

	https://sdk.play.date/inside-playdate/#f-graphics.animation.loop.new
]]
---@param delay? integer
---@param imageTable? playdate.graphics.imagetable
---@param shouldLoop? boolean
function playdate.graphics.animation.loop.new(delay, imageTable, shouldLoop) end

--[[
	Draw’s the loop’s current image at x, y.

	The flip argument is optional; see playdate.graphics.image:draw() for valid values.

	https://sdk.play.date/inside-playdate/#m-graphics.animation.loop.draw
]]
---@param x integer
---@param y integer
---@param flip? ImageFlip
function playdate.graphics.animation.loop:draw(x, y, flip) end

--[[
	Returns a playdate.graphics.image from the caller’s imageTable if it exists.
	The image returned will be at the imageTable’s index that matches the caller’s frame.

	https://sdk.play.date/inside-playdate/#m-graphics.animation.loop.image
]]
---@return playdate.graphics.image|nil
function playdate.graphics.animation.loop:image() end

--[[
	Returns false if the loop has passed its last frame and does not loop.

	https://sdk.play.date/inside-playdate/#m-graphics.animation.loop.isValid
]]
---@return boolean
function playdate.graphics.animation.loop:isValid() end

--[[
	Sets the playdate.graphics.imagetable to be used for this animation loop, and sets the loop’s endFrame property to #imageTable.

	https://sdk.play.date/inside-playdate/#m-graphics.animation.loop.setImageTable
]]
---@param imageTable playdate.graphics.imagetable
function playdate.graphics.animation.loop:setImageTable(imageTable) end

--[[
	Animators are lightweight objects that keep track of animation progress. They can animate between two numbers, two points, along a line segment, arc, or polygon, or along a compound path made up of all three.

	Usage is simple: create a new Animator, query for its current value when you need to update your animation, and optionally call animator:ended() to see if the animation is complete.

	You must import CoreLibs/animator to use these functions. 

	https://sdk.play.date/inside-playdate/#C-graphics.animator
]]
---@class playdate.graphics.animator
---@field easingAmplitude number For easing functions that take additional amplitude (such as inOutElastic), set these values on animator instances to the desired values.
---@field easingPeriod number For easing functions that take additional period arguments (such as inOutElastic), set these values on animator instances to the desired values.
---@field repeatCount integer Indicates the number of times after the initial animation the animator should repeat; i.e., if repeatCount is set to 2, the animation will play through 3 times.
---@field reverses boolean If set to true, after the animation reaches the end, it runs in reverse from the end to the start. The time to complete both the forward and reverse will be duration x 2. Defaults to false.
playdate.graphics.animator = {}

--[[
	Animates between two number or playdate.geometry.point values, a line segment, an arc, a polygon, or a parts array.

	easingFunction, if supplied, should be a value from playdate.easingFunctions. If your easing function requires additional variables s, a, or p, set them on the animator directly after creation. For example:

	local a = playdate.graphics.animator.new(1000, 0, 100, playdate.easingFunctions.inBack)
	a.s = 1.9

	https://sdk.play.date/inside-playdate/#f-graphics.animator.new1
	https://sdk.play.date/inside-playdate/#f-graphics.animator.new2
	https://sdk.play.date/inside-playdate/#f-graphics.animator.new3
	https://sdk.play.date/inside-playdate/#f-graphics.animator.new4
	https://sdk.play.date/inside-playdate/#f-graphics.animator.new5
]]
---@param duration integer Total time of the animation in milliseconds.
---@param startValue number|playdate.geometry.point
---@param endValue number|playdate.geometry.point
---@param easingFunction? EasingFunction if supplied, should be a value from `playdate.easingFunctions`. If your easing function requires additional variables s, a, or p, set them on the animator directly after creation.
---@param startTimeOffset? integer If supplied, will shift the start time of the animation by the specified number of milliseconds. If positive, the animation will be delayed. If negative, the animation will effectively have started before the moment the animator is instantiated.
---@overload fun(duration: integer, lineSegment: playdate.geometry.lineSegment, easingFunction?: EasingFunction, startTimeOffset?: integer)
---@overload fun(duration: integer, arc: playdate.geometry.arc, easingFunction?: EasingFunction, startTimeOffset?: integer)
---@overload fun(duration: integer, polygon: playdate.geometry.polygon, easingFunction?: EasingFunction, startTimeOffset?: integer)
---@overload fun(duration: integer, parts: playdate.geometry.lineSegment[]|playdate.geometry.arc[]|playdate.geometry.polygon[], easingFunction?: EasingFunction, startTimeOffset?: integer)
function playdate.graphics.animator.new(duration, startValue, endValue, easingFunction, startTimeOffset) end

--[[
	Returns the current value of the animation, which will be either a number or a playdate.geometry.point, depending on the type of animator.

	https://sdk.play.date/inside-playdate/#m-graphics.animator.currentValue
]]
---@return number|playdate.geometry.point
function playdate.graphics.animator:currentValue() end

--[[
	Returns the value of the animation at the given number of seconds after the start time. The value will be either a number or a playdate.geometry.point, depending on the type of animator.

	https://sdk.play.date/inside-playdate/#m-graphics.animator.valueAtTime
]]
---@param time integer
---@return number|playdate.geometry.point
function playdate.graphics.animator:valueAtTime(time) end

--[[
	Returns the current progress of the animation as a value from 0 to 1.

	https://sdk.play.date/inside-playdate/#m-graphics.animator.progress
]]
---@return number
function playdate.graphics.animator:progress() end

--[[
	Resets the animation, setting its start time to the current time, and changes the animation’s duration if a new duration is given.

	https://sdk.play.date/inside-playdate/#m-graphics.animator.reset
]]
---@param duration number
function playdate.graphics.animator:reset(duration) end

--[[
	Returns true if the animation is completed. Only returns true if this function or currentValue() has been called since the animation ended in order to allow animations to fully finish before true is returned.

	https://sdk.play.date/inside-playdate/#m-graphics.animator.ended
]]
---@return boolean
function playdate.graphics.animator:ended() end

--[[
	Keeps track of a boolean that changes on a timer.

	You must import CoreLibs/animation to use these functions. 

	https://sdk.play.date/inside-playdate/#C-graphics.animation.blinker
]]
---@class playdate.graphics.animation.blinker
---@field cycles integer Number of changes the blinker goes through before it's complete.
---@field counter integer Cycle the blinker is on (counts from n down to 0)
---@field onDuration integer Number of milliseconds the blinker is "on"
---@field offDuration integer Number of milliseconds the blinker is "off"
---@field default boolean Default state of the blinker - true is "on", false is "off"
---@field loop boolean Should the blinker restart after completing
---@field on boolean Read this property to determine the current state of the blinker
---@field running boolean Read this property to see if the blinker is actively running
playdate.graphics.animation.blinker = {}

--[[
	Creates a new blinker object.

	https://sdk.play.date/inside-playdate/#f-graphics.animation.blinker.new
]]
function playdate.graphics.animation.blinker.new() end

--[[
	Updates the state of all valid blinkers

	https://sdk.play.date/inside-playdate/#f-graphics.animation.blinker.updateAll
]]
function playdate.graphics.animation.blinker.updateAll() end

--[[
	Updates the caller’s state.

	https://sdk.play.date/inside-playdate/#m-graphics.animation.blinker.update
]]
function playdate.graphics.animation.blinker:update() end

--[[
	Starts a blinker if it’s not running.

	https://sdk.play.date/inside-playdate/#m-graphics.animation.blinker.start
]]
function playdate.graphics.animation.blinker:start() end

--[[
	Starts a blinker if it’s not running and sets its loop property to true.

	https://sdk.play.date/inside-playdate/#m-graphics.animation.blinker.startLoop
]]
function playdate.graphics.animation.blinker:startLoop() end

--[[
	Stops a blinker if it’s running. Its state will reset to its default value.

	https://sdk.play.date/inside-playdate/#m-graphics.animation.blinker.stop
]]
function playdate.graphics.animation.blinker:stop() end

--[[
	Stops all blinkers.

	https://sdk.play.date/inside-playdate/#f-graphics.animation.blinker.stopAll
]]
function playdate.graphics.animation.blinker.stopAll() end

--[[
	Flags the caller for removal from the global list of blinkers

	https://sdk.play.date/inside-playdate/#m-graphics.animation.blinker.remove
]]
function playdate.graphics.animation.blinker:remove() end
