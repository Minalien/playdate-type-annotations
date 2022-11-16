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

---@alias FileMode
---|`playdate.file.kFileRead`
---|`playdate.file.kFileWrite`
---|`playdate.file.kFileAppend`

---@class playdate.file.file : Object
playdate.file.file = {}

--[[
	Returns a playdate.file.file corresponding to the opened file. mode should be one of the following:

	- playdate.file.kFileRead: the file is opened for reading; the system first looks in the /Data/<bundleid> folder for the given file, then in the game’s pdx folder if it isn’t found
	- playdate.file.kFileWrite: the file is created if it doesn’t exist, truncated to zero length if it does, then opened for writing
	- playdate.file.kFileAppend: the file is created if it doesn’t exist, opened for writing, with new data written to the end of the file

	If mode is not specified, the default is playdate.file.kFileRead.

	If the file couldn’t be opened, a second return value indicates the error. The filesystem has a limit of 64 simultaneous open files.

	Equivalent to `playdate->file->open()` in the C API.

	https://sdk.play.date/inside-playdate/#f-file.open
]]
---@param path string
---@param mode? FileMode
---@return playdate.file.file|nil file, string errorMessage
function playdate.file.open(path, mode) end

--[[
	Closes the file.

	Equivalent to `playdate->file->close()` in the C API.

	https://sdk.play.date/inside-playdate/#m-file.close
]]
function playdate.file.file:close() end

--[[
	Writes the given string to the file and returns the number of bytes written if successful, or 0 and a second return value describing the error. If you wish to include line termination characters (`\n`, `\r`), please include them in the string.

	https://sdk.play.date/inside-playdate/#m-file.write
]]
---@param string string
---@return integer, string|nil errorMessage
function playdate.file.file:write(string) end

--[[
	Flushes any buffered data written to the file to the disk.
	
	Equivalent to `playdate->file->flush()` in the C API.

	https://sdk.play.date/inside-playdate/#m-file.flush
]]
function playdate.file.file:flush() end

--[[
	Returns the next line of the file, delimited by either \n or \r\n. The returned string does not include newline characters.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#m-file.readLine
]]
---@return string
function playdate.file.file:readline() end

-- TODO: Verify the actual return type from file:read()
--[[
	Returns a buffer containing up to numberOfBytes bytes from the file, and the number of bytes read. If the read failed, the function returns nil and a second value describing the error.

	Equivalent to `playdate->file->read()` in the C API.

	https://sdk.play.date/inside-playdate/#m-file.read
]]
---@param numberOfBytes integer
---@return any|nil dataBuffer, string|nil errorMesasge
function playdate.file.file:read(numberOfBytes) end

--[[
	Sets the file read/write position to the given byte offset.

	Equivalent to `playdate->file->seek()` in the C API.

	https://sdk.play.date/inside-playdate/#m-file.seek
]]
---@param offset integer
function playdate.file.file:seek(offset) end

--[[
	Returns the current byte offset of the read/write position in the file.

	Equivalent to `playdate->file->tell()` in the C API.

	https://sdk.play.date/inside-playdate/#m-file.tell
]]
---@return integer
function playdate.file.file:tell() end
