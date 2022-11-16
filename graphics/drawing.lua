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
	Draws a line from (x1, y1) to (x2, y2), or draws the playdate.geometry.lineSegment ls.

	Line width is specified by `setLineWidth()`. End cap style is specified by `setLineCapStyle()`.

	Equivalent to `playdate->graphics->drawLine()` in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.drawLine
]]
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@overload fun(ls: playdate.geometry.lineSegment)
function playdate.graphics.drawLine(x1, y1, x2, y2) end

---@alias LineCapStyle
---|`playdate.graphics.kLineCapStyleButt`
---|`playdate.graphics.kLineCapStyleRound`
---|`playdate.graphics.kLineCapStyleSquare`

--[[
	Specifies the shape of the endpoints drawn by drawLine.

	Equivalent to playdate->graphics->setLineCapStyle() in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.setLineCapStyle
]]
---@param style LineCapStyle
function playdate.graphics.setLineCapStyle(style) end

--[[
	Draw a single pixel in the current color at (x, y).

	playdate.graphics.drawPixel(p)

	Draw a single pixel in the current color at playdate.geometry.point p.

	https://sdk.play.date/inside-playdate/#f-graphics.drawPixel
]]
---@param x integer
---@param y integer
---@overload fun(p: playdate.geometry.point)
function playdate.graphics.drawPixel(x, y) end

--[[
	Draws the rect r or the rect with origin (x, y) with a size of (w, h).

	Line width is specified by setLineWidth(). Stroke location is specified by setStrokeLocation().

	Equivalent to playdate->graphics->drawRect() in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.drawRect
]]
---@param x integer
---@param y integer
---@param w integer
---@param h integer
---@overload fun(rect: playdate.geometry.rect)
function playdate.graphics.drawRect(x, y, w, h) end

--[[
	Draws the filled rectangle r or the rect at (x, y) of the given width and height.

	Equivalent to playdate->graphics->fillRect() in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.fillRect
]]
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@overload fun(rect: playdate.geometry.rect)
function playdate.graphics.fillRect(x, y, width, height) end

--[[
	Draws a rectangle with rounded corners in the rect r or the rect with origin (x, y) and size (w, h).

	https://sdk.play.date/inside-playdate/#f-graphics.drawRoundRect
]]
---@param x integer
---@param y integer
---@param w integer
---@param h integer
---@param radius number
---@overload fun(rect: playdate.geometry.rect, radius: number)
function playdate.graphics.drawRoundRect(x, y, w, h, radius) end

--[[
	Draws a filled rectangle with rounded corners in the rect r or the rect with origin (x, y) and size (w, h).

	https://sdk.play.date/inside-playdate/#f-graphics.fillRoundRect
]]
---@param x integer
---@param y integer
---@param w integer
---@param h integer
---@param radius number
---@overload fun(rect: playdate.geometry.rect, radius: number)
function playdate.graphics.fillRoundRect(x, y, w, h, radius) end

--[[
	Draws an arc using the current color.

	Angles are specified in degrees, not radians.

	https://sdk.play.date/inside-playdate/#f-graphics.drawArc
]]
---@param x integer
---@param y integer
---@param radius number
---@param startAngle number
---@param endAngle number
---@overload fun(arc: playdate.geometry.arc)
function playdate.graphics.drawArc(x, y, radius, startAngle, endAngle) end

--[[
	Draws a circle at the point (x, y) (or p) with radius radius.

	https://sdk.play.date/inside-playdate/#f-graphics.drawCircleAtPoint
]]
---@param x integer
---@param y integer
---@param radius number
---@overload fun(p: playdate.geometry.point, radius: number)
function playdate.graphics.drawCircleAtPoint(x, y, radius) end

--[[
	Draws a circle in the rect r or the rect with origin (x, y) and size (width, height).

	If the rect is not a square, the circle will be drawn centered in the rect.

	https://sdk.play.date/inside-playdate/#f-graphics.drawCircleInRect
]]
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@overload fun(rect: playdate.geometry.rect)
function playdate.graphics.drawCircleInRect(x, y, width, height) end

--[[
	Draws a filled circle at the point (x, y) (or p) with radius radius.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-graphics.fillCircleAtPoint
]]
---@param x integer
---@param y integer
---@param radius number
---@overload fun(p: playdate.geometry.point, radius: number)
function playdate.graphics.fillCircleAtPoint(x, y, radius) end

--[[
	Draws a filled circle in the rect r or the rect with origin (x, y) and size (width, height).

	If the rect is not a square, the circle will be drawn centered in the rect.

	https://sdk.play.date/inside-playdate/#f-graphics.fillCircleInRect
]]
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@overload fun(r: playdate.geometry.rect)
function playdate.graphics.fillCircleInRect(x, y, width, height) end

--[[
	Draws an ellipse in the rect r or the rect with origin (x, y) and size (width, height).

	startAngle and endAngle, if provided, should be in degrees (not radians), and will cause only the segment of the ellipse between startAngle and endAngle to be drawn.

	https://sdk.play.date/inside-playdate/#f-graphics.drawEllipseInRect
]]
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@param startAngle? number
---@param endAngle? number
---@overload fun(rect: playdate.geometry.rect, startAngle?: number, endAngle?: number)
function playdate.graphics.drawEllipseInRect(x, y, width, height, startAngle, endAngle) end

--[[
	Draws a filled ellipse in the rect r or the rect with origin (x, y) and size (width, height).

	startAngle and endAngle, if provided, should be in degrees (not radians), and will cause only the segment of the ellipse between startAngle and endAngle to be drawn.

	https://sdk.play.date/inside-playdate/#f-graphics.fillEllipseInRect
]]
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@param startAngle? number
---@param endAngle? number
---@overload fun(rect: playdate.geometry.rect, startAngle?: number, endAngle?: number)
function playdate.graphics.fillEllipseInRect(x, y, width, height, startAngle, endAngle) end

--[[
	Draw the playdate.geometry.polygon p.

	Line width is specified by setLineWidth().

	https://sdk.play.date/inside-playdate/#f-graphics.drawPolygon
	https://sdk.play.date/inside-playdate/#playdate-graphics-drawpolygon-x1-y1-x2-y2-draw-the-polygon-speci
]]
---@param p playdate.geometry.polygon
---@overload fun(...: number)
function playdate.graphics.drawPolygon(p) end

--[[
	Fills the polygon specified by a list of x,y coordinates.

	Equivalent to playdate->graphics->fillPolygon() in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.fillPolygon
	https://sdk.play.date/inside-playdate/#playdate-graphics-fillpolygon-p-fills-the-polygon-specified-by-t
]]
---@param p playdate.geometry.polygon
---@overload fun(...: number)
function playdate.graphics.fillPolygon(p) end

--[[
	Sets the winding rule for filling polygons, one of:

    playdate.graphics.kPolygonFillNonZero
    playdate.graphics.kPolygonFillEvenOdd

	See https://en.wikipedia.org/wiki/Nonzero-rule for an explanation of the winding rule.

	https://sdk.play.date/inside-playdate/#f-graphics.setPolygonFillRule
]]
---@param rule PolygonFillRule
function playdate.graphics.setPolygonFillRule(rule) end

--[[
	Draws a triangle with vertices (x1, y1), (x2, y2), and (x3, y3).

	https://sdk.play.date/inside-playdate/#f-graphics.drawTriangle
]]
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param x3 number
---@param y3 number
function playdate.graphics.drawTriangle(x1, y1, x2, y2, x3, y3) end

--[[
	Draws a filled triangle with vertices (x1, y1), (x2, y2), and (x3, y3).

	Equivalent to playdate->graphics->fillTriangle() in the C API.

	https://sdk.play.date/inside-playdate/#f-graphics.fillTriangle
]]
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param x3 number
---@param y3 number
function playdate.graphics.fillTriangle(x1, y1, x2, y2, x3, y3) end

--[[
	A "9 slice" is a rectangular image that is made "stretchable" by being sliced into nine pieces — the four corners, the four edges, and the center.

	https://sdk.play.date/inside-playdate/#C-graphics.nineSlice
]]
---@class playdate.graphics.nineSlice : Object
playdate.graphics.nineSlice = {}

--[[
	Returns a new 9 slice image from the image at imagePath with the stretchable region defined by other parameters. The arguments represent the origin and dimensions of the innermost ("center") slice.

	https://sdk.play.date/inside-playdate/#f-graphics.nineSlice.new
]]
---@param imagePath string
---@param innerX number
---@param innerY number
---@param innerWidth number
---@param innerHeight number
---@return playdate.graphics.nineSlice
function playdate.graphics.nineSlice.new(imagePath, innerX, innerY, innerWidth, innerHeight) end

--[[
	Returns the size of the 9 slice image as a pair (width, height).

	https://sdk.play.date/inside-playdate/#m-graphics.nineSlice.getSize
]]
---@return number width, number height
function playdate.graphics.nineSlice:getSize() end

--[[
	Returns the minimum size of the 9 slice image as a pair (width, height).

	https://sdk.play.date/inside-playdate/#m-graphics.nineSlice.getMinSize
]]
---@return number width, number height
function playdate.graphics.nineSlice:getMinSize() end

--[[
	Draws the 9 slice image at the desired coordinates by stretching the defined region to achieve the width and height inputs.

	https://sdk.play.date/inside-playdate/#m-graphics.nineSlice.drawInRect
]]
---@param x integer
---@param y integer
---@param width number
---@param height number
---@overload fun(rect: playdate.geometry.rect)
function playdate.graphics.nineSlice:drawInRect(x, y, width, height) end

--[[
	Returns the Perlin value (from 0.0 to 1.0) at position (x, y, z).

	If rep is greater than 0, the pattern of noise will repeat at that point on all 3 axes.

	octaves is the number of octaves of noise to apply. Compute time increases linearly with each additional octave, but the results are a bit more organic, consisting of a combination of larger and smaller variations.

	When using more than one octave, persistence is a value from 0.0 - 1.0 describing the amount the amplitude is scaled each octave. The lower the value of persistence, the less influence each successive octave has on the final value.

	https://sdk.play.date/inside-playdate/#f-graphics.perlin
]]
---@param x number
---@param y number
---@param z number
---@param rep number
---@param octaves number
---@param persistence number
---@return number
---@overload fun(x: number, y: number, z: number, rep: number)
function playdate.graphics.perlin(x, y, z, rep, octaves, persistence) end

--[[
	Returns an array of Perlin values at once, avoiding the performance penalty of calling perlin() multiple times in a loop.

	The parameters are the same as perlin() except:

	dx, dy, and dz are how far to step along the x, y, and z axes in each iteration.

	https://sdk.play.date/inside-playdate/#f-graphics.perlinArray
]]
---@param count integer number of values to be returned.
---@param x number
---@param dx number
---@param y number
---@param dy number
---@param z number
---@param dz number
---@param rep number
---@param octaves number
---@param persistence number
---@return number[]
---@overload fun(count: integer, x: number, dx: number)
function playdate.graphics.perlinArray(count, x, dx, y, dy, z, dz, rep, octaves, persistence) end

--[[
	You must import CoreLibs/qrcode to use this function.

	Asynchronously returns an image representing a QR code for the passed-in string to the function callback. The arguments passed to the callback are image, errorMessage. (If an errorMessage string is returned, image will be nil.)

	desiredEdgeDimension lets you specify an approximate edge dimension in pixels for the desired QR code, though the function has limited flexibility in sizing QR codes, based on the amount of information to be encoded, and the restrictions of a 1-bit screen. The function will attempt to generate a QR code smaller than desiredEdgeDimension if possible. (Note that QR codes always have the same width and height.)

	If you specify nil for desiredEdgeDimension, the returned image will balance small size with easy readability. If you specify 0, the returned image will be the smallest possible QR code for the specified string.

	generateQRCode() will return a reference to the timer it uses to run asynchronously. If you wish to stop execution of the background process generating the QR code, call :remove() on that returned timer.

	https://sdk.play.date/inside-playdate/#f-graphics.generateQRCode
]]
---@param stringToEncode string
---@param desiredEdgeDimension integer
---@param callback fun()
function playdate.graphics.generateQRCode(stringToEncode, desiredEdgeDimension, callback) end

--[[
	You must import CoreLibs/graphics to use this function.

	Draws an approximation of a sine wave between the points startX, startY and endX, endY.

    startAmplitude: The number of pixels above and below the line from startX, startY and endX, endY the peaks and valleys of the wave will be drawn at the start of the wave.

    endAmplitude: The number of pixels above and below the line from startX, startY and endX, endY the peaks and valleys of the wave will be drawn at the end of the wave.

    period: The distance between peaks, in pixels.

    phaseShift: If provided, specifies the wave’s offset, in pixels.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#f-graphics.drawSineWave
]]
---@param startX number
---@param startY number
---@param endX number
---@param endY number
---@param startAmplitude number
---@param endAmplitude number
---@param period number
---@param phaseShift? number
function playdate.graphics.drawSineWave(startX, startY, endX, endY, startAmplitude, endAmplitude, period, phaseShift) end
