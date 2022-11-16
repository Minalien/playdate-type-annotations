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
	A frame-based timer useful for handling frame-precise animation timings. For a time-based timer see playdate.timer or playdate.graphics.animation.loop

	You must import CoreLibs/frameTimer to use these functions. It is also to critical to call playdate.frameTimer.updateTimers() in your playdate.update() function to ensure that all timers are updated every frame.

	https://sdk.play.date/inside-playdate/#C-frameTimer
]]
---@class playdate.frameTimer : Object
---@field delay integer Number of frames to wait before starting the timer.
---@field discardOnCompletion boolean If true, the timer is discarded once it is complete. Defaults to true.
---@field duration integer The number of frames for which the timer will run.
---@field frame integer The current frame.
---@field repeats boolean If true, the timer starts over from the beginning when it completes. Defaults to false.
---@field reverses boolean If true, the timer plays in reverse once it has completed. The number of frames to complete both the forward and reverse will be duration x 2. Defaults to false. Please note that the frame counter will restart at 0 and count up to duration again when the reverse timer starts, but value will be calculated in reverse, from endValue to startValue. The same easing function (as opposed to the inverse of the easing function) will be used for the reverse timer unless an alternate is provided by setting reverseEasingFunction.
---@field timerEndedCallback fun(...) Function of the form function(timer) or function(...) where "..." corresponds to the values in the table assigned to timerEndedArgs. Called when the timer has completed.
---@field timerEndedArgs any[] For repeating timers, this function will be called each time the timer completes, before it starts again. An array-style table of values that will be passed to the timerEndedCallback function.	
---@field updateCallback fun(...) A function to be called on every frame update. If the frame timer was created with arguments, those will be passed as arguments to the function provided. Otherwise, the timer is passed as the single argument.
playdate.frameTimer = {}

---@class ValueFrameTimer : playdate.frameTimer
---@field value number Current value calculated from the start and end values, the current frame, and the easing function.
---@field startValue number Start value used when calculating value.
---@field endValue number End value used when calculating value.
---@field easingFunction EasingFunction The function used to calculate value. The function should be of the form function(t, b, c, d), where t is elapsed time, b is the beginning value, c is the change (or endValue - startValue), and d is the duration.
---@field easingAmplitude number|nil For easing functions in CoreLibs/easing that take additional amplitude and period arguments (such as inOutElastic), set these to desired values.
---@field easingPeriod number|nil For easing functions in CoreLibs/easing that take additional amplitude and period arguments (such as inOutElastic), set these to desired values.
---@field reverseEasingFunction EasingFunction Set to provide an easing function to be used for the reverse portion of the timer. The function should be of the form function(t, b, c, d), where t is elapsed time, b is the beginning value, c is the change (or endValue - startValue), and d is the duration.

--[[
	This should be called from the main playdate.update() loop to drive the frame timers.

	https://sdk.play.date/inside-playdate/#f-frameTimer.updateTimers
]]
function playdate.frameTimer.updateTimers() end

--[[
	Returns a new playdate.frameTimer that will run for duration frames. callback is a function closure that will be called when the timer is complete.

	Accepts a variable number of arguments that will be passed to the callback function when it is called. If arguments are not provided, the timer itself will be passed to the callback instead.

	Alternatively, returns a new playdate.frameTimer that will run for duration number of frames. If not specified, startValue and endValue will be 0, and a linear easing function will be used.

	By default, frame timers start upon instantiation. To modify the behavior of a frame timer, see common frame timer methods and properties.

	https://sdk.play.date/inside-playdate/#f-frameTimer.new
]]
---@param duration integer
---@param startValue number
---@param endValue number
---@param easingFunction? EasingFunction
---@return ValueFrameTimer
---@overload fun(duration: integer): ValueFrameTimer
---@overload fun(duration: integer, callback: fun(...), ...): playdate.frameTimer
function playdate.frameTimer.new(duration, startValue, endValue, easingFunction) end

--[[
	Performs the function callback after the delay number of frames. Accepts a variable number of arguments that will be passed to the callback function when it is called. If arguments are not provided, the timer itself will be passed to the callback instead.

	https://sdk.play.date/inside-playdate/#f-frameTimer.performAfterDelay
]]
---@param delay integer
---@param callback fun(...)
---@param ... any
function playdate.frameTimer.performAfterDelay(delay, callback, ...) end

--[[
	Pauses a timer. (There is no need to call :start() on a newly-instantiated frame timer: frame timers start automatically.)

	https://sdk.play.date/inside-playdate/#m-frameTimer.pause
]]
function playdate.frameTimer:pause() end

--[[
	Resumes a timer. (There is no need to call :start() on a newly-instantiated frame timer: frame timers start automatically.)

	https://sdk.play.date/inside-playdate/#m-frameTimer.start
]]
function playdate.frameTimer:start() end

--[[
	Removes this timer from the list of timers. This happens automatically when a non-repeating timer reaches it’s end, but you can use this method to dispose of timers manually.

	https://sdk.play.date/inside-playdate/#m-frameTimer.remove
]]
function playdate.frameTimer:remove() end

--[[
	Resets a timer to its initial values.

	https://sdk.play.date/inside-playdate/#m-frameTimer.reset
]]
function playdate.frameTimer:reset() end

--[[
	Returns an array listing all running frameTimers.

	https://sdk.play.date/inside-playdate/#f-frameTimer.allTimers
]]
function playdate.frameTimer.allTimers() end