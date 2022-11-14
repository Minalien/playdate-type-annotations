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

---@alias DateTime { year: integer, month: integer, day: integer, weekday: number, hour: number, minute: number, second: number, millisecond: number }

--[[
	Returns the number of milliseconds the game has been active since launched.

	https://sdk.play.date/inside-playdate/#f-getCurrentTimeMilliseconds
]]
---@return integer
function playdate.getCurrentTimeMilliseconds() end

--[[
	Resets the high-resolution timer.

	https://sdk.play.date/inside-playdate/#f-resetElapsedTime
]]
function playdate.resetElapsedTime() end

--[[
	Returns the number of seconds since playdate.resetElapsedTime() was called. The value is a floating-point number with microsecond accuracy.

	https://sdk.play.date/inside-playdate/#f-getElapsedTime
]]
---@return number
function playdate.getElapsedTime() end

--[[
	Returns the number of seconds and milliseconds elapsed since midnight (hour 0), January 1 2000 UTC, as a list: (seconds, milliseconds). This function is suitable for seeding the random number generator.

	https://sdk.play.date/inside-playdate/#f-getSecondsSinceEpoch
]]
---@return integer
function playdate.getSecondsSinceEpoch() end

--[[
	Returns a table with values for the local time, accessible via the following keys:

	- year: 4-digit year (until 10,000 AD)
	- month: month of the year, where 1 is January and 12 is December
	- day: day of the month, 1 - 31
	- weekday: day of the week, where 1 is Monday and 7 is Sunday
	- hour: 0 - 23
	- minute: 0 - 59
	- second: 0 - 59 (or 60 on a leap second)
	- millisecond: 0 - 999

	https://sdk.play.date/inside-playdate/#f-getTime
]]
---@return DateTime
function playdate.getTime() end

--[[
	Returns a table in the same format as playdate.getTime(), but in GMT rather than local time.

	https://sdk.play.date/inside-playdate/#f-getGMTTime
]]
---@see playdate.getTime
---@return DateTime
function playdate.getGMTTime() end

--[[
	Returns the number of seconds and milliseconds between midnight (hour 0), January 1 2000 UTC and time, specified in local time, as a list: (seconds, milliseconds).
]]
---@see playdate.getTime
---@param time DateTime should be a table of the same format as the one returned by playdate.getTime().
---@return integer seconds, integer milliseconds
function playdate.epochFromTime(time) end

--[[
	Returns the number of seconds and milliseconds between midnight (hour 0), January 1 2000 UTC and time, specified in GMT time, as a list: (seconds, milliseconds).
]]
---@see playdate.getTime
---@param time DateTime should be a table of the same format as the one returned by playdate.getTime().
---@return integer seconds, integer milliseconds
function playdate.epochFromGMTTime(time) end

--[[
	Converts the epoch to a local date and time table, in the same format as the table returned by playdate.getTime().

	https://sdk.play.date/inside-playdate/#f-secondsSinceEpochToTime
]]
---@see playdate.getTime
---@param second integer
---@param milliseconds integer
---@return DateTime
function playdate.timeFromEpoch(second, milliseconds) end

--[[
	Converts the epoch to a GMT date and time table, in the same format as the table returned by playdate.getTime().

	https://sdk.play.date/inside-playdate/#f-secondsSinceEpochToGMTTime
]]
---@see playdate.getTime
---@param second integer
---@param milliseconds integer
---@return DateTime
function playdate.GMTTimeFromEpoch(second, milliseconds) end
