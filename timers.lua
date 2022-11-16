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
	Provides a time-based timer useful for handling animation timings, countdowns, or performing tasks after a delay. For a frame-based timer see playdate.frameTimer.

	https://sdk.play.date/inside-playdate/#C-timer
]]
---@class playdate.timer : Object
---@field currentTime number The number of milliseconds the timer has been running. Read-only.
---@field delay integer Number of milliseconds to wait before starting the timer.
---@field discardOnCompletion boolean If true, the timer is discarded once it is complete. Defaults to true.
---@field duration integer The number of milliseconds for which the timer will run.
---@field timeLeft integer The number of milliseconds remaining in the timer. Read-only.
---@field repeats boolean If true, the timer starts over from the beginning when it completes. Defaults to false.
---@field reverses boolean If true, the timer plays in reverse once it has completed. The time to complete both the forward and reverse will be duration x 2. Defaults to false. Please note that currentTime will restart at 0 and count up to duration again when the reverse timer starts, but value will be calculated in reverse, from endValue to startValue. The same easing function (as opposed to the inverse of the easing function) will be used for the reverse timer unless an alternate is provided by setting reverseEasingFunction.
---@field timerEndedCallback fun(...) A Function of the form function(timer) or function(...) where "..." corresponds to the values in the table assigned to timerEndedArgs. Called when the timer has completed.
---@field timerEndedArgs any[] For repeating timers, this function will be called each time the timer completes, before it starts again. An array-style table of values that will be passed to the timerEndedCallback function.
---@field updateCallback fun(...) A callback function that will be called on every frame (every time timer.updateAll() is called). If the timer was created with arguments, those will be passed as arguments to the function provided. Otherwise, the timer is passed as the single argument.
playdate.timer = {}

---@class ValueTimer : playdate.timer
---@field value number Current value calculated from the start and end values, the time elapsed, and the easing function.
---@field easingFunction EasingFunction The function used to calculate value. The function should be of the form function(t, b, c, d), where t is elapsed time, b is the beginning value, c is the change (or end value - start value), and d is the duration. Many such functions are available in playdate.easingFunctions.
---@field easingAmplitude number|nil For easing functions that take additional amplitude and period arguments (such as inOutElastic), set these to the desired values.
---@field easingPeriod number|nil For easing functions that take additional amplitude and period arguments (such as inOutElastic), set these to the desired values.
---@field reverseEasingFunction EasingFunction Set to provide an easing function to be used for the reverse portion of the timer. The function should be of the form function(t, b, c, d), where t is elapsed time, b is the beginning value, c is the change (or end value - start value), and d is the duration. Many such functions are available in playdate.easingFunctions.
---@field startValue number Start value used when calculating value.
---@field endValue number End value used when calculating value.

--[[
	This should be called from the main playdate.update() loop to drive the timers.

	https://sdk.play.date/inside-playdate/#f-timer.updateTimers
]]
function playdate.timer.updateTimers() end

--[[
	Returns a new playdate.timer that will run for duration milliseconds. callback is a function closure that will be called when the timer is complete.

	Accepts a variable number of arguments that will be passed to the callback function when it is called. If arguments are not provided, the timer itself will be passed to the callback instead.

	Alternatively, returns a new playdate.timer that will run for duration milliseconds. If not specified, startValue and endValue will be 0, and a linear easing function will be used.

	By default, timers start upon instantiation. To modify the behavior of a timer, see common timer methods and properties.

	https://sdk.play.date/inside-playdate/#f-timer.new
	https://sdk.play.date/inside-playdate/#f-timer.new2
]]
---@param duration integer
---@param startValue number
---@param endValue number
---@param easingFunction? EasingFunction
---@return ValueTimer
---@overload fun(duration: integer): ValueTimer
---@overload fun(duration: integer, callback: fun(...), ...): playdate.timer
function playdate.timer.new(duration, startValue, endValue, easingFunction) end

--[[
	Performs the function callback after delay milliseconds. Accepts a variable number of arguments that will be passed to the callback function when it is called. If arguments are not provided, the timer itself will be passed to the callback instead.

	https://sdk.play.date/inside-playdate/#f-timer.performAfterDelay
]]
---@param delay integer
---@param callback fun(...)
---@param ... any
function playdate.timer.performAfterDelay(delay, callback, ...) end

--[[
	keyRepeatTimer() returns a timer that fires at key-repeat intervals. The function callback will be called immediately, then again after 300 milliseconds, then repeatedly at 100 millisecond intervals. If you wish to customize these millisecond intervals, use keyRepeatTimerWithDelay().

	https://sdk.play.date/inside-playdate/#f-timer.keyRepeatTimer
]]
---@param callback fun(...)
---@param ... any
---@return playdate.timer
function playdate.timer.keyRepeatTimer(callback, ...) end

--[[
	keyRepeatTimer() returns a timer that fires at key-repeat intervals. The function callback will be called immediately, then again after 300 milliseconds, then repeatedly at 100 millisecond intervals. If you wish to customize these millisecond intervals, use keyRepeatTimerWithDelay().

	https://sdk.play.date/inside-playdate/#f-timer.keyRepeatTimerWithDelay
]]
---@param delayAfterInitialFiring number
---@param delayAfterSecondFiring number
---@param callback fun(...)
---@param ... any
---@return playdate.timer
function playdate.timer.keyRepeatTimerWithDelay(delayAfterInitialFiring, delayAfterSecondFiring, callback, ...) end

--[[
	Pauses a timer. (There is no need to call :start() on a newly-instantiated timer: timers start automatically.)

	https://sdk.play.date/inside-playdate/#m-timer.pause
]]
function playdate.timer:pause() end

--[[
	Resumes a previously paused timer. (There is no need to call :start() on a newly-instantiated timer: timers start automatically.)

	https://sdk.play.date/inside-playdate/#m-timer.start
]]
function playdate.timer:start() end

--[[
	Removes this timer from the list of timers. This happens automatically when a non-repeating timer reaches its end, but you can use this method to dispose of timers manually.

	Note that timers do not actually get removed until the next invocation of playdate.timer.updateTimers().
]]
function playdate.timer:remove() end

--[[
	Resets a timer to its initial values.

	https://sdk.play.date/inside-playdate/#m-timer.reset
]]
function playdate.timer:reset() end

--[[
	Returns an array listing all running timers.

	https://sdk.play.date/inside-playdate/#f-timer.allTimers
]]
---@return playdate.timer[]
function playdate.timer.allTimers() end