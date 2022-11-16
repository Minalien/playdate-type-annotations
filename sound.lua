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

---@alias SoundFormat
---|`playdate.sound.kFormat8bitMono`
---|`playdate.sound.kFormat8bitStereo`
---|`playdate.sound.kFormat16bitMono`
---|`playdate.sound.kFormat16bitStereo`

--#region Source

--[[
	playdate.sound.source is the parent class of our sound sources, playdate.sound.fileplayer, playdate.sound.sampleplayer, playdate.sound.synth, and playdate.sound.instrument.

	https://sdk.play.date/inside-playdate/#C-sound.source
]]
---@class playdate.sound.source : Object
playdate.sound.source = {}

--[[
	Returns a list of all sources currently playing.

	https://sdk.play.date/inside-playdate/#f-sound.playingSources
]]
---@return playdate.sound.source[]
function playdate.sound.playingSources() end

--#endregion

--#region Sample

--[[
	playdate.sound.sample is an abstraction of an individual sound sample. If all you want to do is play a single sound sample, you may wish to use playdate.sound.sampleplayer instead. However, playdate.sound.sample exists so you can preload sounds and swap them in and out without fragmenting device memory.

	https://sdk.play.date/inside-playdate/#C-sound.sample
]]
---@class playdate.sound.sample : Object
playdate.sound.sample = {}

--[[
	Returns a new playdate.sound.sample object, with the sound data loaded in memory. If the sample can’t be loaded, the function returns nil and a second value containing the error.

	Alternatively, returns a new playdate.sound.sample object, with a buffer size of seconds in the given format. If format is not specified, it defaults to playdate.sound.kFormat16bitStereo. When used with playdate.sound.sample:load(), this allows you to swap in a different sample without re-allocating the buffer, which could lead to memory fragmentation.
]]
---@param seconds integer
---@param format? SoundFormat
---@return playdate.sound.sample
---@overload fun(path: string): playdate.sound.sample|nil
function playdate.sound.sample.new(seconds, format) end

--[[
	Returns a new subsample containing a subrange of the given sample. Offset values are in frames, not bytes.

	https://sdk.play.date/inside-playdate/#m-sound.sample.getSubsample
]]
---@param startOffset integer
---@param endOffset integer
---@return playdate.sound.sample
function playdate.sound.sample:getSubsample(startOffset, endOffset) end

--[[
	Loads the sound data from the file at path into an existing sample buffer. If there is no file at path, the function returns nil.

	https://sdk.play.date/inside-playdate/#m-sound.sample.load
]]
---@param path string
---@return playdate.sound.sample|nil
function playdate.sound.sample:load(path) end

--[[
	Returns the sample rate as an integer, such as 44100 or 22050.

	https://sdk.play.date/inside-playdate/#m-sound.sample.getSampleRate
]]
---@return integer
function playdate.sound.sample:getSampleRate() end

--[[
	Returns the format of the sample, one of
    - playdate.sound.kFormat8bitMono
    - playdate.sound.kFormat8bitStereo
    - playdate.sound.kFormat16bitMono
    - playdate.sound.kFormat16bitStereo

	https://sdk.play.date/inside-playdate/#m-sound.sample.getFormat
]]
---@return SoundFormat
function playdate.sound.sample:getFormat() end

--[[
	Returns two values, the length of the available sample data and the size of the allocated buffer. Both values are measured in seconds. For a sample loaded from disk, these will be the same; for a sample used for recording, the available data may be less than the allocated size.

	https://sdk.play.date/inside-playdate/#m-sound.sample.getLength
]]
---@return integer dataLength, integer bufferSize
function playdate.sound.sample:getLength() end

--[[
	Convenience function: Creates a new sampleplayer for the sample and passes the function arguments to its play function.
]]
---@param repeatCount? integer
---@param rate? number
function playdate.sound.sample:play(repeatCount, rate) end

--[[
	Convenience function: Creates a new sampleplayer for the sample and passes the function arguments to its playAt function.

	https://sdk.play.date/inside-playdate/#m-sound.sample.playAt
]]
---@param when number
---@param vol number
---@param rightvol number
---@param rate number
function playdate.sound.sample:playAt(when, vol, rightvol, rate) end

--[[
	Saves the sample to the given file. If filename has a .wav extension it will be saved in WAV format (and be unreadable by the Playdate sound functions), otherwise it will be saved in the Playdate pda format.

	https://sdk.play.date/inside-playdate/#m-sound.sample.save
]]
---@param filename string
function playdate.sound.sample:save(filename) end

--#endregion

--#region Instrument

--[[
	https://sdk.play.date/inside-playdate/#C-sound.instrument
]]
---@class playdate.sound.instrument : playdate.sound.source
playdate.sound.instrument = {}

--[[
	Creates a new playdate.sound.instrument object. If synth is given, adds it as a voice for the instrument.

	https://sdk.play.date/inside-playdate/#m-sound.instrument.new
]]
---@param synth? playdate.sound.synth
---@return playdate.sound.instrument
function playdate.sound.instrument.new(synth) end

-- TODO: Need to verify parameter types here.
--[[
	Adds the given playdate.sound.synth to the instrument. If only the note argument is given, the voice is only used for that note, and is transposed to play at normal speed (i.e. rate=1.0 for samples, or C4 for synths). If rangeend is given, the voice is assigned to the range note to rangeend, inclusive, with the first note in the range transposed to rate=1.0/C4. The note and rangeend arguments can be MIDI note numbers or note names like "Db3". The final transpose argument transposes the note played, in half-tone units.

	https://sdk.play.date/inside-playdate/#m-sound.instrument.addVoice
]]
---@param v playdate.sound.synth
---@param note? integer
---@param rangeend? number
---@param transpose? number
function playdate.sound.instrument:addVoice(v, note, rangeend, transpose) end

--[[
	Transposes all voices in the instrument. halfsteps can be a fractional value.

	https://sdk.play.date/inside-playdate/#m-sound.instrument.setTranspose
]]
---@param halfsteps number
function playdate.sound.instrument:setTranspose(halfsteps) end

--[[
	Plays the given note on the instrument. A string like Db3 can be used instead of a pitch/note number. Fractional values are allowed. vel defaults to 1.0, fully on. If length isn’t specified, the note stays on until instrument.noteOff(note) is called. when is the number of seconds in the future to start playing the note, default is immediately.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#m-sound.instrument.playNote
]]
---@param frequency number
---@param vel? number
---@param length? number
---@param when? number
function playdate.sound.instrument:playNote(frequency, vel, length, when) end

--[[
	Plays the given note on the instrument, where note is a MIDI note number: 60=C4, 61=C#4, etc. A string like Db3 can be used instead of a pitch/note number. Fractional values are allowed. vel defaults to 1.0, fully on. If length isn’t specified, the note stays on until instrument.noteOff(note) is called. when is the number of seconds in the future to start playing the note, default is immediately.

	https://sdk.play.date/inside-playdate/#m-sound.instrument.playMIDINote
]]
---@param note integer
---@param vel? number
---@param length? number
---@param when? number
function playdate.sound.instrument:playMIDINote(note, vel, length, when) end

--[[
	Stops the instrument voice playing note note. If when is given, the note is stopped when seconds in the future, otherwise it’s stopped immediately.

	https://sdk.play.date/inside-playdate/#m-sound.instrument.noteOff
]]
---@param note integer
---@param when number
function playdate.sound.instrument:noteOff(note, when) end

--[[
	Sends a stop signal to all playing notes.

	https://sdk.play.date/inside-playdate/#m-sound.instrument.allNotesOff
]]
function playdate.sound.instrument:allNotesOff() end

--[[
	Sets the instrument volume. If a single value is passed in, sets both left side and right side volume to the given value. If two values are given, volumes are set separately.

	Volume values are between 0.0 and 1.0.

	https://sdk.play.date/inside-playdate/#m-sound.instrument.setVolume
]]
---@param left number
---@param right? number
function playdate.sound.instrument:setVolume(left, right) end

--[[
	Returns the current volume for the synth, a single value for mono sources or a pair of values (left, right) for stereo sources.

	Volume values are between 0.0 and 1.0.

	https://sdk.play.date/inside-playdate/#m-sound.instrument.getVolume
]]
---@return number
function playdate.sound.instrument:getVolume() end

--#endregion

--#region Sequence

--[[
	https://sdk.play.date/inside-playdate/#C-sound.sequence
]]
---@class playdate.sound.sequence : Object
playdate.sound.sequence = {}

--[[
	Creates a new sound sequence. If path is given, it attempts to load data from the midi file into the sequence.

	https://sdk.play.date/inside-playdate/#f-sound.sequence.new
]]
---@param path? string
---@return playdate.sound.sequence|nil
function playdate.sound.sequence.new(path) end

--[[
	Starts playing the sequence. finishCallback is an optional function to be called when the sequence finishes playing or is stopped. The sequence is passed to the callback as its single argument.

	https://sdk.play.date/inside-playdate/#m-sound.sequence.play
]]
---@param finishCallback fun(sequence: playdate.sound.sequence)
function playdate.sound.sequence:play(finishCallback) end

--[[
	Stops playing the sequence.

	https://sdk.play.date/inside-playdate/#m-sound.sequence.stop
]]
function playdate.sound.sequence:stop() end

--[[
	Returns true if the sequence is currently playing.

	https://sdk.play.date/inside-playdate/#m-sound.sequence.isPlaying
]]
---@return boolean
function playdate.sound.sequence:isPlaying() end

--[[
	Returns the length of the longest track in the sequence. See also playdate.sound.track.getLength().

	https://sdk.play.date/inside-playdate/#m-sound.sequence.getLength
]]
---@return number
function playdate.sound.sequence:getLength() end

--[[
	Moves the play position for the sequence to step number step. If play is set, triggers the notes at that step.

	https://sdk.play.date/inside-playdate/#m-sound.sequence.goToStep
]]
---@param step integer
---@param play? boolean
function playdate.sound.sequence:goToStep(step, play) end

--[[
	Returns the step number the sequence is currently at.

	https://sdk.play.date/inside-playdate/#m-sound.sequence.getCurrentStep
]]
---@return integer
function playdate.sound.sequence:getCurrentStep() end

--[[
	Sets the tempo of the sequence, in steps per second.

	https://sdk.play.date/inside-playdate/#m-sound.sequence.setTempo
]]
---@param stepsPerSecond integer
function playdate.sound.sequence:setTempo(stepsPerSecond) end

--[[
	Gets the tempo of the sequence, in steps per second.

	https://sdk.play.date/inside-playdate/#m-sound.sequence.getTempo
]]
---@return integer
function playdate.sound.sequence:getTempo() end

--[[
	Sets the looping range of the sequence. If loops is 0 or unset, the loop repeats endlessly.

	https://sdk.play.date/inside-playdate/#m-sound.sequence.setLoops
]]
---@param startStep integer
---@param endStep integer
---@param loopCount? integer
function playdate.sound.sequence:setLoops(startStep, endStep, loopCount) end

--[[
	Returns the number of tracks in the sequence.

	https://sdk.play.date/inside-playdate/#m-sound.sequence.getTrackCount
]]
---@return integer
function playdate.sound.sequence:getTrackCount() end

--[[
	Adds the given playdate.sound.track to the sequence.

	https://sdk.play.date/inside-playdate/#m-sound.sequence.addTrack
]]
---@param track playdate.sound.track
function playdate.sound.sequence:addTrack(track) end

--[[
	Sets the given playdate.sound.track object at position n in the sequence.

	https://sdk.play.date/inside-playdate/#m-sound.sequence.setTrackAtIndex
]]
---@param n integer
---@param track playdate.sound.track
function playdate.sound.sequence:setTrackAtIndex(n, track) end

--[[
	Gets the given playdate.sound.track object at position n in the sequence.

	https://sdk.play.date/inside-playdate/#m-sound.sequence.getTrackAtIndex
]]
---@param n integer
---@return playdate.sound.track|nil
function playdate.sound.sequence:getTrackAtIndex(n) end

--[[
	Sends an allNotesOff() message to each track’s instrument.

	https://sdk.play.date/inside-playdate/#m-sound.sequence.allNotesOff
]]
function playdate.sound.sequence:allNotesOff() end

--#endregion

--#region Effect

--[[
	playdate.sound.effect is the parent class of our sound effects, playdate.sound.bitcrusher, playdate.sound.twopolefilter, playdate.sound.onepolefilter, playdate.sound.ringmod, playdate.sound.overdrive, and playdate.sound.delayline

	https://sdk.play.date/inside-playdate/#C-sound.effect
]]
---@class playdate.sound.effect : Object
playdate.sound.effect = {}

--[[
	Adds the given playdate.sound.effect to the default sound channel.

	https://sdk.play.date/inside-playdate/#f-sound.addEffect
]]
---@param effect playdate.sound.effect
function playdate.sound.addEffect(effect) end

--[[
	Removes the given effect from the default sound channel.

	https://sdk.play.date/inside-playdate/#f-sound.removeEffect
]]
---@param effect playdate.sound.effect
function playdate.sound.removeEffect(effect) end

--#endregion

--#region Channel

--[[
	Channels are collections of sources (synths, sampleplayers, and fileplayers) with a list of effects to apply to the sounds, and pan and volume parameters.

	https://sdk.play.date/inside-playdate/#C-sound.channel
]]
---@class playdate.sound.channel : Object
playdate.sound.channel = {}

--[[
	Returns a new channel object and adds it to the global list.

	https://sdk.play.date/inside-playdate/#f-sound.channel.new
]]
---@return playdate.sound.channel
function playdate.sound.channel.new() end

--[[
	Removes the channel from the global list.

	https://sdk.play.date/inside-playdate/#m-sound.channel.remove
]]
function playdate.sound.channel:remove() end

--[[
	Adds an effect to the channel.

	https://sdk.play.date/inside-playdate/#m-sound.channel.addeffect
]]
---@param effect playdate.sound.effect
function playdate.sound.channel:addEffect(effect) end

--[[
	Removes an effect from the channel.

	https://sdk.play.date/inside-playdate/#m-sound.channel.removeeffect
]]
---@param effect playdate.sound.effect
function playdate.sound.channel:removeEffect(effect) end

--[[
	Adds a source to the channel. If a source is not assigned to a channel, it plays on the default global channel.

	https://sdk.play.date/inside-playdate/#m-sound.channel.addsource
]]
---@param source playdate.sound.source
function playdate.sound.channel:addSource(source) end

--[[
	Removes a source from the channel.

	https://sdk.play.date/inside-playdate/#m-sound.channel.removesource
]]
---@param source playdate.sound.source
function playdate.sound.channel:removeSource(source) end

--[[
	Sets the volume (0.0 - 1.0) for the channel.

	https://sdk.play.date/inside-playdate/#m-sound.channel.setVolume
]]
---@param volume number
function playdate.sound.channel:setVolume(volume) end

--[[
	Gets the volume (0.0 - 1.0) for the channel.

	https://sdk.play.date/inside-playdate/#m-sound.channel.getVolume
]]
---@return number
function playdate.sound.channel:getVolume() end

--[[
	Sets the pan parameter for the channel. -1 is left, 0 is center, and 1 is right.

	https://sdk.play.date/inside-playdate/#m-sound.channel.setPan
]]
---@param pan number
function playdate.sound.channel:setPan(pan) end

--[[
	Sets a signal to automate the pan parameter.

	https://sdk.play.date/inside-playdate/#m-sound.channel.setPanMod
]]
---@param signal playdate.sound.signal
function playdate.sound.channel:setPanMod(signal) end

--[[
	Sets a signal to automate the volume parameter.

	https://sdk.play.date/inside-playdate/#m-sound.channel.setVolumeMod
]]
---@param signal playdate.sound.signal
function playdate.sound.channel:setVolumeMod(signal) end

--#endregion

--#region Signal

--[[
	playdate.sound.signal is the parent class of our low-frequency signals, playdate.sound.lfo, playdate.sound.envelope, and playdate.sound.controlsignal. These can be used to automate certain parameters in the audio engine.

	https://sdk.play.date/inside-playdate/#C-sound.signal
]]
---@class playdate.sound.signal : Object
playdate.sound.signal = {}

--[[
	Adds a constant offset to the signal (lfo, envelope, etc.).

	https://sdk.play.date/inside-playdate/#f-sound.signal.setOffset
]]
---@param offset number
function playdate.sound.signal:setOffset(offset) end

--[[
	Multiplies the signal’s output by the given scale factor. The scale is applied before the offset.

	https://sdk.play.date/inside-playdate/#f-sound.signal.setScale
]]
---@param scale number
function playdate.sound.signal:setScale(scale) end

--#endregion

--#region Sample Player

--[[
	The sampleplayer class is used for playing short samples like sound effects. Audio data is loaded into memory at instantiation, so it plays with little overhead. For longer audio like background music, the fileplayer class may be more appropriate; there, audio data is streamed from disk as it’s played and only a small portion of the data is in memory at any given time.

	https://sdk.play.date/inside-playdate/#C-sound.sampleplayer
]]
---@class playdate.sound.sampleplayer : playdate.sound.source
playdate.sound.sampleplayer = {}

--[[
	Returns a new playdate.sound.sampleplayer object, with the sound data loaded in memory. If the sample can’t be loaded, the function returns nil and a second value containing the error.

	https://sdk.play.date/inside-playdate/#f-sound.sampleplayer.new
]]
---@param sample playdate.sound.sample
---@return playdate.sound.sampleplayer
---@overload fun(path: string): playdate.sound.sampleplayer|nil
function playdate.sound.sampleplayer.new(sample) end

--[[
	Returns a new playdate.sound.sampleplayer with the same sample, volume, and rate as the given sampleplayer.

	https://sdk.play.date/inside-playdate/#m-sound.sampleplayer.copy
]]
---@return playdate.sound.sampleplayer
function playdate.sound.sampleplayer:copy() end

--[[
	Starts playing the sample. If repeatCount is greater than one, it loops the given number of times. If zero, it loops endlessly until it is stopped with playdate.sound.sampleplayer:stop(). If rate is set, the sample will be played at the given rate instead of the rate previous set with playdate.sound.sampleplayer.setRate().

	https://sdk.play.date/inside-playdate/#m-sound.sampleplayer.play
]]
---@param repeatCount? integer
---@param rate? number
function playdate.sound.sampleplayer:play(repeatCount, rate) end

--[[
	Schedules the sound for playing at device time when. If vol is specified, the sample will be played at level vol (with optional separate right channel volume rightvol). If when is less than the current device time, the sample is played immediately. If rate is set, the sample will be played at the given rate instead of the rate previous set with playdate.sound.sampleplayer.setRate().

	The function returns true if the sample was successfully added to the sound channel, otherwise false (i.e., if the channel is full).
]]
---@param when number
---@param vol number
---@param rightvol number
---@param rate number
---@return boolean
function playdate.sound.sampleplayer:playAt(when, vol, rightvol, rate) end

--[[
	Sets the playback volume (0.0 - 1.0) for left and right channels. If the optional right argument is omitted, it is the same as left.

	https://sdk.play.date/inside-playdate/#m-sound.sampleplayer.setVolume
]]
---@param left number
---@param right number
function playdate.sound.sampleplayer:setVolume(left, right) end

--[[
	Returns the playback volume for the sampleplayer, a single value for mono sources or a pair of values (left, right) for stereo sources.

	https://sdk.play.date/inside-playdate/#m-sound.sampleplayer.getVolume
]]
---@return number left, number right
function playdate.sound.sampleplayer:getVolume() end

--[[
	Sets a function to be called every time the sample loops. The sample object is passed to this function as the first argument, and the optional arg argument is passed as the second.

	https://sdk.play.date/inside-playdate/#m-sound.sampleplayer.setLoopCallback
]]
---@generic T
---@param callback fun(sample: playdate.sound.sample, arg: T)
---@param arg T
function playdate.sound.sampleplayer:setLoopCallback(callback, arg) end

--[[
	Sets the range of the sample to play. start and end are frame offsets from the beginning of the sample.

	https://sdk.play.date/inside-playdate/#m-sound.sampleplayer.setPlayRange
]]
---@param startOffset integer
---@param endOffset integer
function playdate.sound.sampleplayer:setPlayRange(startOffset, endOffset) end

--[[
	Pauses or resumes playback.

	https://sdk.play.date/inside-playdate/#m-sound.sampleplayer.setPaused
]]
---@param flag boolean
function playdate.sound.sampleplayer:setPaused(flag) end

--[[
	Returns a boolean indicating whether the sample is playing.

	https://sdk.play.date/inside-playdate/#m-sound.sampleplayer.isPlaying
]]
---@return boolean
function playdate.sound.sampleplayer:isPlaying() end

--[[
	Stops playing the sample.

	https://sdk.play.date/inside-playdate/#m-sound.sampleplayer.stop
]]
function playdate.sound.sampleplayer:stop() end

--[[
	Sets a function to be called when playback has completed. The sample object is passed to this function as the first argument, and the optional arg argument is passed as the second.

	https://sdk.play.date/inside-playdate/#m-sound.sampleplayer.setFinishCallback
]]
---@generic T
---@param func fun(sample: playdate.sound.sample, arg?: T)
---@param arg? T
function playdate.sound.sampleplayer:setFinishCallback(func, arg) end

--[[
	Sets the sample to be played.

	https://sdk.play.date/inside-playdate/#m-sound.sampleplayer.setSample
]]
---@param sample playdate.sound.sample
function playdate.sound.sampleplayer:setSample(sample) end

--[[
	Gets the sample to be played.

	https://sdk.play.date/inside-playdate/#m-sound.sampleplayer.getSample
]]
---@return playdate.sound.sample
function playdate.sound.sampleplayer:getSample() end

--[[
	Returns the length of the sampleplayer’s sample, in seconds. Length is not scaled by playback rate.

	https://sdk.play.date/inside-playdate/#m-sound.sampleplayer.getLength
]]
---@return number
function playdate.sound.sampleplayer:getLength() end

--[[
	Sets the playback rate for the sample. 1.0 is normal speed, 0.5 is down an octave, 2.0 is up an octave, etc. Sampleplayers can also play samples backwards, by setting a negative rate; however, this does not work with ADPCM-encoded files.

	https://sdk.play.date/inside-playdate/#m-sound.sampleplayer.setRate
]]
---@param rate number
function playdate.sound.sampleplayer:setRate(rate) end

--[[
	Gets the playback rate for the sample. 1.0 is normal speed, 0.5 is down an octave, 2.0 is up an octave, etc. Sampleplayers can also play samples backwards, by setting a negative rate.

	https://sdk.play.date/inside-playdate/#m-sound.sampleplayer.getRate
]]
---@return number
function playdate.sound.sampleplayer:getRate() end

--[[
	Sets the signal to use as a rate modulator, added to the rate set with playdate.sound.sampleplayer:setRate().

	https://sdk.play.date/inside-playdate/#m-sound.sampleplayer.setRateMod
]]
---@param signal playdate.sound.signal
function playdate.sound.sampleplayer:setRateMod(signal) end

--[[
	Sets the current offset of the sampleplayer, in seconds. This value is not adjusted for rate.

	https://sdk.play.date/inside-playdate/#m-sound.sampleplayer.setOffset
]]
---@param seconds number
function playdate.sound.sampleplayer:setOffset(seconds) end

--[[
	Gets the current offset of the sampleplayer, in seconds. This value is not adjusted for rate.

	https://sdk.play.date/inside-playdate/#m-sound.sampleplayer.getOffset
]]
---@return number
function playdate.sound.sampleplayer:getOffset() end

--#endregion

--#region File Player

--[[
	The fileplayer class is used for streaming audio from a file on disk. This requires less memory than keeping all of the file’s data in memory (as with the sampleplayer), but can increase overhead at run time.

	Fileplayer can play MP3 files, but MP3 decoding is CPU-intensive. For a balance of good performance and small file size, we recommend encoding audio into ADPCM .wav files. 

	https://sdk.play.date/inside-playdate/#C-sound.fileplayer
]]
---@class playdate.sound.fileplayer : playdate.sound.source
playdate.sound.fileplayer = {}

--[[
	Returns a fileplayer object for streaming samples from the file at path. Note that the file isn’t loaded until playdate.sound.fileplayer:play() or playdate.sound.fileplayer:setBufferSize() is called, in order to reduce initialization overhead.

	If given, buffersize specifies the size in seconds of the fileplayer’s data buffer. A shorter value reduces the latency of a playdate.sound.fileplayer:setOffset() call, but increases the chance of a buffer underrun.

	https://sdk.play.date/inside-playdate/#f-sound.fileplayer.new-empty
]]
---@param path? string
---@param buffersize? number
---@return playdate.sound.fileplayer|nil
function playdate.sound.fileplayer.new(path, buffersize) end

--[[
	Instructs the fileplayer to load the file at path when play() is called on it. The fileplayer must not be playing when this function is called. The fileplayer’s play offset is reset to the beginning of the file, and its loop range is cleared.

	https://sdk.play.date/inside-playdate/#m-sound.fileplayer.load
]]
---@param path string
function playdate.sound.fileplayer:load(path) end

--[[
	Opens and starts playing the file, first creating and filling a 1/4 second playback buffer if a buffer size hasn’t been set yet.

	If repeatCount is set, playback repeats when it reaches the end of the file or the end of the loop range if one is set. After the loop has run repeatCount times, it continues playing to the end of the file. A repeatCount of zero loops endlessly. If repeatCount is not set, the file plays once.

	The function returns true if the file was successfully opened and the fileplayer added to the sound channel, otherwise false and a string describing the error.

	https://sdk.play.date/inside-playdate/#m-sound.fileplayer.play
]]
---@param repeatCount? integer
function playdate.sound.fileplayer:play(repeatCount) end

--[[
	Stops playing the file, resets the playback offset to zero, and calls the finish callback.

	https://sdk.play.date/inside-playdate/#m-sound.fileplayer.stop
]]
function playdate.sound.fileplayer:stop() end

--[[
	Stops playing the file. A subsequent play() call resumes playback from where it was paused.

	https://sdk.play.date/inside-playdate/#m-sound.fileplayer.pause
]]
function playdate.sound.fileplayer:pause() end

--[[
	Returns a boolean indicating whether the fileplayer is playing.

	https://sdk.play.date/inside-playdate/#m-sound.fileplayer.isPlaying
]]
---@return boolean
function playdate.sound.fileplayer:isPlaying() end

--[[
	Returns the length, in seconds, of the audio file.

	https://sdk.play.date/inside-playdate/#m-sound.fileplayer.getLength
]]
---@return number
function playdate.sound.fileplayer:getLength() end

--[[
	Sets a function to be called when playback has completed. The fileplayer is passed as the first argument to func. The optional argument arg is passed as the second.

	https://sdk.play.date/inside-playdate/#m-sound.fileplayer.setFinishCallback
]]
---@generic T
---@param func fun(filePlayer: playdate.sound.fileplayer, arg?: T)
---@param arg? T
function playdate.sound.fileplayer:setFinishCallback(func, arg) end

--[[
	Returns the fileplayer’s underrun flag, indicating that the player ran out of data. This can be checked in the finish callback function to check for an underrun error.

	https://sdk.play.date/inside-playdate/#m-sound.fileplayer.didUnderrun
]]
---@return boolean
function playdate.sound.fileplayer:didUnderrun() end

--[[
	By default, the fileplayer stops playback if it can’t provide data fast enough. Setting the flag to false tells the fileplayer to restart playback (after an audible stutter) as soon as data is available.

	https://sdk.play.date/inside-playdate/#m-sound.fileplayer.setStopOnUnderrun
]]
---@param flag boolean
function playdate.sound.fileplayer:setStopOnUnderrun(flag) end

--[[
	Provides a way to loop a portion of an audio file.

	The fileplayer:play([repeatCount]) call needs to be invoked with a repeatCount value of 0 (infinite looping), or 2 or greater in order for the looping action to happen. 

	start and end are specified in seconds. If end is omitted, the end of the file is used. If the function loopCallback is provided, it is called every time the player loops, with the fileplayer as the first argument and the optional arg argument as the second.

	https://sdk.play.date/inside-playdate/#m-sound.fileplayer.setLoopRange
]]
---@generic T
---@param startOffset number
---@param endOffset? number
---@param loopCallback? fun(filePlayer: playdate.sound.fileplayer, arg?: T)
---@param arg? T
function playdate.sound.fileplayer:setLoopRange(startOffset, endOffset, loopCallback, arg) end

--[[
	Sets a function to be called every time the fileplayer loops. The fileplayer object is passed to this function as the first argument, and arg as the second.

	The fileplayer:play([repeatCount]) call needs to be invoked with a repeatCount value of 0 (infinite looping), or 2 or greater in order for the loop callback to be invoked.

	https://sdk.play.date/inside-playdate/#m-sound.fileplayer.setLoopCallback
]]
---@generic T
---@param callback fun(filePlayer: playdate.sound.fileplayer, arg?: T)
---@param arg? T
function playdate.sound.fileplayer:setLoopCallback(callback, arg) end

--[[
	Sets the buffer size for the fileplayer, in seconds. Larger buffers protect against buffer underruns, but consume more memory. Calling this function also fills the output buffer if a source file has been set. On success, the function returns true; otherwise it returns false and a string describing the error.

	https://sdk.play.date/inside-playdate/#m-sound.fileplayer.setBufferSize
]]
---@param seconds number
function playdate.sound.fileplayer:setBufferSize(seconds) end

--[[
	Sets the playback rate for the file. 1.0 is normal speed, 0.5 is down an octave, 2.0 is up an octave, etc. Unlike sampleplayers, fileplayers can’t play in reverse (i.e., rate < 0).

	https://sdk.play.date/inside-playdate/#m-sound.fileplayer.setRate
]]
---@param rate number
function playdate.sound.fileplayer:setRate(rate) end

--[[
	Gets the playback rate for the file. 1.0 is normal speed, 0.5 is down an octave, 2.0 is up an octave, etc. Unlike sampleplayers, fileplayers can’t play in reverse (i.e., rate < 0).

	https://sdk.play.date/inside-playdate/#m-sound.fileplayer.getRate
]]
---@return number
function playdate.sound.fileplayer:getRate() end

--[[
	Sets the signal to use as a rate modulator, added to the rate set with playdate.sound.fileplayer:setRate().

	https://sdk.play.date/inside-playdate/#m-sound.fileplayer.setRateMod
]]
---@param signal playdate.sound.signal
function playdate.sound.fileplayer:setRateMod(signal) end

--[[
	Sets the playback volume (0.0 - 1.0). If a single value is passed in, both left side and right side volume are set to the given value. If two values are given, volumes are set separately. The optional fadeSeconds specifies the time it takes to fade from the current volume to the specified volume, in seconds. If the function fadeCallback is given, it is called when the volume fade has completed. The fileplayer object is passed as the first argument to the callback, and the optional arg argument is passed as the second.

	https://sdk.play.date/inside-playdate/#m-sound.fileplayer.setVolume
]]
---@generic T
---@param left number
---@param right? number
---@param fadeSeconds? number
---@param fadeCallback? fun(filePlayer: playdate.sound.fileplayer, arg?: T)
---@param arg? T
function playdate.sound.fileplayer:setVolume(left, right, fadeSeconds, fadeCallback, arg) end

--[[
	Returns the current volume for the fileplayer, a single value for mono sources or a pair of values (left, right) for stereo sources.

	https://sdk.play.date/inside-playdate/#m-sound.fileplayer.getVolume
]]
---@return number left, number right
function playdate.sound.fileplayer:getVolume() end

--[[
	Sets the current offset of the fileplayer, in seconds. This value is not adjusted for rate.

	https://sdk.play.date/inside-playdate/#m-sound.fileplayer.setOffset
]]
---@param seconds number
function playdate.sound.fileplayer:setOffset(seconds) end

--[[
	Gets the current offset of the fileplayer, in seconds. This value is not adjusted for rate.

	https://sdk.play.date/inside-playdate/#m-sound.fileplayer.getOffset
]]
---@return number
function playdate.sound.fileplayer:getOffset() end

--#endregion

--#region Control Signal

-- TODO: Need to find out the property for value and interpolate. My best guess is "number" and "boolean" respectively?
-- When this is identified, need to update controlsignal:methods as well.
---@alias ControlSignalEvent { step: integer, value: any, interpolate: any|nil }

--[[
	https://sdk.play.date/inside-playdate/#C-sound.controlsignal
]]
---@class playdate.sound.controlsignal : playdate.sound.signal
---@field events ControlSignalEvent[] The signal’s event list is modified by getting and setting the events property of the object. This is an array of tables, each containing values for keys step and value, and optionally interpolate.
playdate.sound.controlsignal = {}

--[[
	Creates a new control signal object, for automating effect parameters, channel pan and level, etc.

	https://sdk.play.date/inside-playdate/#f-sound.controlsignal.new
]]
---@return playdate.sound.controlsignal
function playdate.sound.controlsignal.new() end

--[[
	addEvent is a simpler way of adding events one at a time than setting the entire events table. Arguments are either the values themselves in the given order, or a table containing values for step, value, and optionally interpolate.

	https://sdk.play.date/inside-playdate/#m-sound.controlsignal.addEvent2
]]
---@param step integer
---@param value any
---@param interpolate? any
---@overload fun(event: ControlSignalEvent)
function playdate.sound.controlsignal:addEvent(step, value, interpolate) end

--[[
	Clears all events from the control signal.

	https://sdk.play.date/inside-playdate/#m-sound.controlsignal.clearEvents
]]
function playdate.sound.controlsignal:clearEvents() end

--[[
	Sets the midi controller number for the control signal, if that’s something you want to do. The value has no effect on playback.

	https://sdk.play.date/inside-playdate/#m-sound.controlsignal.setControllerType
]]
---@param number integer
function playdate.sound.controlsignal:setControllerType(number) end

--[[
	Control signals in midi files are assigned a controller number, which describes the intent of the control. This function returns the controller number.

	https://sdk.play.date/inside-playdate/#m-sound.controlsignal.getControllerType
]]
---@return integer
function playdate.sound.controlsignal:getControllerType() end

--#endregion

--#region Track

--[[
	https://sdk.play.date/inside-playdate/#C-sound.track
]]
---@class playdate.sound.track : Object
playdate.sound.track = {}

--[[
	Creates a new playdate.sound.track object.

	https://sdk.play.date/inside-playdate/#f-sound.track.new
]]
---@return playdate.sound.track
function playdate.sound.track.new() end

---@alias TrackNote { step: integer, note: number, length: number, velocity: number }

--[[
	Adds a single note event to the track, letting you specify step, note, length, and velocity directly. The second format allows you to pack them into a table, using the format returned by getNotes(). The note argument can be a MIDI note number or a note name like "Db3". length is the length of the note in steps, not time—​that is, it follows the sequence’s tempo. The default velocity is 1.0.

	Alternatively, adds a single note event to the track. Specify step, note, length, and velocity in a table, using the format returned by getNotes(). The note argument can be a MIDI note number or a note name like "Db3". length is the length of the note in steps, not time—​that is, it follows the sequence’s tempo. The default velocity is 1.0.

	See setNotes() for the ability to add more than one note at a time.

	https://sdk.play.date/inside-playdate/#m-sound.track.addNote2
]]
---@param step integer
---@param note number
---@param length number
---@param velocity number
---@overload fun(table: TrackNote)
function playdate.sound.track:addNote(step, note, length, velocity) end

--[[
	Set multiple notes at once, each array element should be a table containing values for the keys The tables contain values for keys step, note, length, and velocity.

	The tables contain values for keys step, note, length, and velocity. If step is given, the function returns only the notes at that step; if both step and endstep are set, it returns the notes between the two steps (including notes at endstep). n.b. The note field in the event tables is always a MIDI note number value, even if the note was added using the string notation.

	https://sdk.play.date/inside-playdate/#m-sound.track.setNotes
]]
---@param list TrackNote[]
function playdate.sound.track:setNotes(list) end

--[[
	Returns an array of tables representing the note events in the track.

	The tables contain values for keys step, note, length, and velocity. If step is given, the function returns only the notes at that step; if both step and endstep are set, it returns the notes between the two steps (including notes at endstep). n.b. The note field in the event tables is always a MIDI note number value, even if the note was added using the string notation.

	https://sdk.play.date/inside-playdate/#m-sound.track.getNotes
]]
---@param step integer
---@param endstep integer
---@return TrackNote[]
function playdate.sound.track:getNotes(step, endstep) end

--[[
	Returns the length, in steps, of the track—​that is, the step where the last note in the track ends.

	https://sdk.play.date/inside-playdate/#m-sound.track.getLength
]]
---@return integer
function playdate.sound.track:getLength() end

--[[
	Returns the current number of notes active in the track.

	https://sdk.play.date/inside-playdate/#m-sound.track.getNotesActive
]]
---@return integer
function playdate.sound.track:getNotesActive() end

--[[
	Returns the maximum number of notes simultaneously active in the track. (Known bug: this currently only works for midi files)

	https://sdk.play.date/inside-playdate/#m-sound.track.getPolyphony
]]
---@return integer
function playdate.sound.track:getPolyphony() end

--[[
	Sets the playdate.sound.instrument that this track plays. If inst is a playdate.sound.synth, the function creates an instrument for the synth.

	https://sdk.play.date/inside-playdate/#m-sound.track.setInstrument
]]
---@param inst playdate.sound.instrument
function playdate.sound.track:setInstrument(inst) end

--[[
	Gets the playdate.sound.instrument that this track plays.

	https://sdk.play.date/inside-playdate/#m-sound.track.getInstrument
]]
---@return playdate.sound.instrument|nil
function playdate.sound.track:getInstrument() end

--[[
	Mutes or unmutes the track.

	https://sdk.play.date/inside-playdate/#m-sound.track.setMuted
]]
---@param flag boolean
function playdate.sound.track:setMuted(flag) end

--[[
	Adds a playdate.sound.controlsignal object to the track. Note that the signal must be assigned to a modulation input for it to have any audible effect. The input can be anywhere in the sound engine—​it’s not required to belong to the track in any way.

	https://sdk.play.date/inside-playdate/#m-sound.track.addControlSignal
]]
---@param s playdate.sound.controlsignal
function playdate.sound.track:addControlSignal(s) end

--[[
	Returns an array of playdate.sound.controlsignal objects assigned to this track.

	https://sdk.play.date/inside-playdate/#m-sound.track.getControlSignals
]]
---@return playdate.sound.controlsignal[]
function playdate.sound.track:getControlSignals() end

--#endregion

--#region Mic Input

--[[
	buffer should be a Sample created with the following code, with secondsToRecord replaced by a number specifying the record duration:

	local buffer = playdate.sound.sample.new(_secondsToRecord_, playdate.sound.kFormat16bitMono)

	completionCallback is a function called at the end of recording, when the buffer is full. It has one argument, the recorded sample.

	https://sdk.play.date/inside-playdate/#f-sound.micinput.recordToSample
]]
---@param buffer playdate.sound.sample
---@param completionCallback fun(sample: playdate.sound.sample)
function playdate.sound.micinput.recordToSample(buffer, completionCallback) end

--[[
	Stops a sample recording started with recordToSample, if it hasn’t already reached the end of the buffer. The recording’s completion callback is called immediately.

	https://sdk.play.date/inside-playdate/#f-sound.micinput.stopRecording
]]
function playdate.sound.micinput.stopRecording() end

--[[
	Starts monitoring the microphone input level.

	https://sdk.play.date/inside-playdate/#f-sound.micinput.startListening
]]
function playdate.sound.micinput.startListening() end

--[[
	Stops monitoring the microphone input level.

	https://sdk.play.date/inside-playdate/#f-sound.micinput.stopListening
]]
function playdate.sound.micinput.stopListening() end

--[[
	Returns the current microphone input level, a value from 0.0 (quietest) to 1.0 (loudest).

	https://sdk.play.date/inside-playdate/#f-sound.micinput.getLevel
]]
function playdate.sound.micinput.getLevel() end

--[[
	Returns the current microphone input source, either "headset" or "device".

	https://sdk.play.date/inside-playdate/#f-sound.micinput.getSource
]]
---@return "headset"|"device"
function playdate.sound.micinput.getSource() end

--#endregion

--#region Audio Output

--[[
	Returns a pair of booleans (headphone, mic) indicating whether headphones are plugged in, and if so whether they have a microphone attached. If changeCallback is a function, it will be called every time the headphone state changes, until it is cleared by calling playdate.sound.getHeadphoneState(nil). If a change callback is set, the audio does not automatically switch from speaker to headphones when headphones are plugged in (and vice versa), so the callback should use playdate.sound.setOutputsActive() to change the output if needed.

	Equivalent to playdate->sound->getHeadphoneState() in the C API.

	https://sdk.play.date/inside-playdate/#f-sound.getHeadphoneState
]]
---@param changeCallback? fun()
---@return boolean headphone, boolean mic
function playdate.sound.getHeadphoneState(changeCallback) end

--[[
	Forces sound to be played on the headphones or on the speaker, regardless of whether headphones are plugged in or not. (With the caveat that it is not actually possible to play on the headphones if they’re not plugged in.) This function has no effect in the simulator.

	Equivalent to playdate->sound->setOutputsActive() in the C API.

	https://sdk.play.date/inside-playdate/#f-sound.setOutputsActive
]]
---@param headphones boolean
---@param speaker boolean
function playdate.sound.setOutputsActive(headphones, speaker) end

--#endregion

--#region Audio Device Time

--[[
	Returns the current time, in seconds, as measured by the audio device. The audio device uses its own time base in order to provide accurate timing.

	Equivalent to playdate->sound->getCurrentTime() in the C API.

	https://sdk.play.date/inside-playdate/#f-sound.getCurrentTime
]]
---@return number
function playdate.sound.getCurrentTime() end

--[[
	Resets the audio output device time counter.

	https://sdk.play.date/inside-playdate/#f-sound.resetTime
]]
function playdate.sound.resetTime() end

--#endregion

--#region Synth

---@class playdate.sound.synth : playdate.sound.source
playdate.sound.synth = {}

---@alias SynthWaveform
---|`playdate.sound.kWaveSine`
---|`playdate.sound.kWaveSquare`
---|`playdate.sound.kWaveSawtooth`
---|`playdate.sound.kWaveTriangle`
---|`playdate.sound.kWaveNoise`
---|`playdate.sound.kWavePOPhase`
---|`playdate.sound.kWavePODigital`
---|`playdate.sound.kWavePOVosim`

--[[
	Returns a new synth object to play a Sample. An optional sustain region defines a loop to play while the note is on. Sample data must be uncompressed PCM, not ADPCM.

	Alternatively, returns a new synth object to play a waveform. See playdate.sound.synth:setWaveform for waveform types.

	https://sdk.play.date/inside-playdate/#f-sound.synth.new.sample
	https://sdk.play.date/inside-playdate/#f-sound.synth.new.waveform
]]
---@param sample playdate.sound.sample
---@param sustainStart? number
---@param sustainEnd? number
---@return playdate.sound.synth
---@overload fun(waveform: SynthWaveform): playdate.sound.synth
function playdate.sound.synth.new(sample, sustainStart, sustainEnd) end

--[[
	Returns a copy of the given synth.

	https://sdk.play.date/inside-playdate/#m-sound.synth.copy
]]
---@return playdate.sound.synth
function playdate.sound.synth:copy() end

--[[
	Plays a note with the current waveform or sample.

	The function returns true if the synth was successfully added to the sound channel, otherwise false (i.e., if the channel is full).

	If pitch is zero, this function calls noteOff() instead of potentially adding a non-zero sample, or DC offset, to the output.

	https://sdk.play.date/inside-playdate/#m-sound.synth.playNote
]]
---@param pitch number the pitch value is in Hertz. If a sample is playing, pitch=261.63 (C4) plays at normal speed in either function, a string like Db3 can be used instead of a number
---@param volume? number 0 to 1, defaults to 1
---@param length? number in seconds. If omitted, note will play until you call noteOff()
---@param when? number seconds since the sound engine started (see playdate.sound.getCurrentTime). Defaults to the current time.
function playdate.sound.synth:playNote(pitch, volume, length, when) end

--[[
	Identical to playNote but uses a note name like "C4", or MIDI note number (60=C4, 61=C#4, etc.). In the latter case, fractional values are allowed.

	https://sdk.play.date/inside-playdate/#m-sound.synth.playMIDINote
]]
---@param note string|number
---@param volume? number
---@param length? number
---@param when? number
function playdate.sound.synth:playMIDINote(note, volume, length, when) end

--[[
	Releases the note, if one is playing. The note will continue to be voiced through the release section of the synth’s envelope.

	https://sdk.play.date/inside-playdate/#m-sound.synth.noteOff
]]
function playdate.sound.synth:noteOff() end

--[[
	Stops the synth immediately, without playing the release part of the envelope.

	https://sdk.play.date/inside-playdate/#m-sound.synth.stop
]]
function playdate.sound.synth:stop() end

--[[
	Returns true if the synth is still playing, including the release phase of the envelope.

	https://sdk.play.date/inside-playdate/#m-sound.synth.isPlaying
]]
---@return boolean
function playdate.sound.synth:isPlaying() end

--[[
	Sets the attack time, decay time, sustain level, and release time for the sound envelope.

	https://sdk.play.date/inside-playdate/#m-sound.synth.setADSR
]]
---@param attack number
---@param decay number
---@param sustain number
---@param release number
function playdate.sound.synth:setADSR(attack, decay, sustain, release) end

--[[
	Sets the signal to use as the amplitude modulator.

	https://sdk.play.date/inside-playdate/#m-sound.synth.setAmplitudeMod
]]
---@param signal playdate.sound.signal
function playdate.sound.synth:setAmplitudeMod(signal) end

--[[
	Sets the attack time, in seconds.

	https://sdk.play.date/inside-playdate/#m-sound.synth.setAttack
]]
---@param time number
function playdate.sound.synth:setAttack(time) end

--[[
	Sets the decay time, in seconds.

	https://sdk.play.date/inside-playdate/#m-sound.synth.setDecay
]]
---@param time number
function playdate.sound.synth:setDecay(time) end

--[[
	Sets a function to be called when the synth stops playing.

	https://sdk.play.date/inside-playdate/#m-sound.synth.setFinishCallback
]]
---@param fun fun()
function playdate.sound.synth:setFinishCallback(fun) end

--[[
	Sets the signal to use as the frequency modulator.

	https://sdk.play.date/inside-playdate/#m-sound.synth.setFrequencyMod
]]
---@param signal playdate.sound.signal
function playdate.sound.synth:setFrequencyMod(signal) end

--[[
	Sets whether to use legato phrasing for the synth. If the legato flag is set and a new note starts while a previous note is still playing, the synth’s envelope remains in the sustain phase instead of starting a new attack.

	https://sdk.play.date/inside-playdate/#m-sound.synth.setLegato
]]
---@param flag boolean
function playdate.sound.synth:setLegato(flag) end

--[[
	Some synth types have extra parameters: The square wave’s one parameter is its duty cycle; the TE synths each have two parameters that change some quality of the sound. Parameter numbers start at 1. value ranges from 0 to 1.

	https://sdk.play.date/inside-playdate/#m-sound.synth.setParameter
]]
---@param parameter integer
---@param value number
function playdate.sound.synth:setParameter(parameter, value) end

--[[
	Sets the signal to modulate the parameter.

	https://sdk.play.date/inside-playdate/#m-sound.synth.setParameterMod
]]
---@param parameter integer
---@param signal playdate.sound.signal
function playdate.sound.synth:setParameterMod(parameter, signal) end

--[[
	Sets the release time, in seconds.

	https://sdk.play.date/inside-playdate/#m-sound.synth.setRelease
]]
---@param time number
function playdate.sound.synth:setRelease(time) end

--[[
	Sets the sustain level, as a proportion of the total level (0.0 to 1.0).

	https://sdk.play.date/inside-playdate/#m-sound.synth.setSustain
]]
---@param level number
function playdate.sound.synth:setSustain(level) end

--[[
	Sets the synth volume. If a single value is passed in, sets both left side and right side volume to the given value. If two values are given, volumes are set separately.

	Volume values are between 0.0 and 1.0.

	https://sdk.play.date/inside-playdate/#m-sound.synth.setVolume
]]
---@param left number
---@param right? number
function playdate.sound.synth:setVolume(left, right) end

--[[
	Returns the current volume for the synth, a single value for mono sources or a pair of values (left, right) for stereo sources.

	Volume values are between 0.0 and 1.0.

	https://sdk.play.date/inside-playdate/#m-sound.synth.getVolume
]]
---@return number left, number|nil right
function playdate.sound.synth:getVolume() end

--[[
	Sets the waveform or Sample the synth plays. If a sample is given, its data must be uncompressed PCM, not ADPCM.

	https://sdk.play.date/inside-playdate/#m-sound.synth.setWaveform
]]
---@param waveform SynthWaveform|playdate.sound.sample
function playdate.sound.synth:setWaveform(waveform) end

--#endregion

--#region LFO

---@alias LFOType
---|`playdate.sound.kLFOSquare`
---|`playdate.sound.kLFOSawtoothUp`
---|`playdate.sound.kLFOSawtoothDown`
---|`playdate.sound.kLFOTriangle`
---|`playdate.sound.kLFOSine`
---|`playdate.sound.kLFOSampleAndHold`

---@class playdate.sound.lfo : playdate.sound.signal
playdate.sound.lfo = {}

--[[
	Returns a new LFO object, which can be used to modulate sounds. See playdate.sound.lfo:setType() for LFO types.

	https://sdk.play.date/inside-playdate/#f-sound.lfo.new
]]
---@param type? LFOType
---@return playdate.sound.lfo
function playdate.sound.lfo.new(type) end

--[[
	Sets the waveform of the LFO. Valid values are
		playdate.sound.kLFOSquare
		playdate.sound.kLFOSawtoothUp
		playdate.sound.kLFOSawtoothDown
		playdate.sound.kLFOTriangle
		playdate.sound.kLFOSine
		playdate.sound.kLFOSampleAndHold

	https://sdk.play.date/inside-playdate/#m-sound.lfo.setType
]]
---@param type LFOType
function playdate.sound.lfo:setType(type) end

--[[
	Sets the LFO type to arpeggio, where the given values are in half-steps from the center note. For example, the sequence (0, 4, 7, 12) plays the notes of a major chord.

	https://sdk.play.date/inside-playdate/#m-sound.lfo.setArpeggio
]]
---@param ... integer
function playdate.sound.lfo:setArpeggio(...) end

--[[
	Sets the center value of the LFO.

	https://sdk.play.date/inside-playdate/#m-sound.lfo.setCenter
]]
---@param center number
function playdate.sound.lfo:setCenter(center) end

--[[
	Sets the depth of the LFO’s modulation.

	https://sdk.play.date/inside-playdate/#m-sound.lfo.setDepth
]]
---@param depth number
function playdate.sound.lfo:setDepth(depth) end

--[[
	Sets the rate of the LFO, in cycles per second.

	https://sdk.play.date/inside-playdate/#m-sound.lfo.setRate
]]
---@param rate number
function playdate.sound.lfo:setRate(rate) end

--[[
	Sets the current phase of the LFO, from 0 to 1.

	https://sdk.play.date/inside-playdate/#m-sound.lfo.setPhase
]]
---@param phase number
function playdate.sound.lfo:setPhase(phase) end

--[[
	If an LFO is marked global, it is continuously updated whether or not it’s attached to any source.

	https://sdk.play.date/inside-playdate/#m-sound.lfo.setGlobal
]]
---@param flag boolean
function playdate.sound.lfo:setGlobal(flag) end

--[[
	If retrigger is on, the LFO’s phase is reset to 0 when a synth using the LFO starts playing a note.

	https://sdk.play.date/inside-playdate/#m-sound.lfo.setRetrigger
]]
---@param flag boolean
function playdate.sound.lfo:setRetrigger(flag) end

--[[
	Sets an initial holdoff time for the LFO where the LFO remains at its center value, and a ramp time where the value increases linearly to its maximum depth. Values are in seconds.

	https://sdk.play.date/inside-playdate/#m-sound.lfo.setDelay
]]
---@param holdoff number
---@param ramp number
function playdate.sound.lfo:setDelay(holdoff, ramp) end

--#endregion

--#region Envelope

---@class playdate.sound.envelope : playdate.sound.signal
playdate.sound.envelope = {}

--[[
	Creates a new envelope with the given (optional) parameters.

	https://sdk.play.date/inside-playdate/#f-sound.envelope.new
]]
---@param attack number
---@param decay number
---@param sustain number
---@param release number
---@return playdate.sound.envelope
---@overload fun(): playdate.sound.envelope
function playdate.sound.envelope.new(attack, decay, sustain, release) end

--[[
	Sets the envelope attack time to attack, in seconds.

	https://sdk.play.date/inside-playdate/#m-sound.envelope.setAttack
]]
---@param attack number
function playdate.sound.envelope:setAttack(attack) end

--[[
	Sets the envelope decay time to decay, in seconds.

	https://sdk.play.date/inside-playdate/#m-sound.envelope.setDecay
]]
---@param decay number
function playdate.sound.envelope:setDecay(decay) end

--[[
	Sets the envelope sustain level to sustain, as a proportion of the maximum. For example, if the sustain level is 0.5, the signal value rises to its full value over the attack phase of the envelope, then drops to half its maximum over the decay phase, and remains there while the envelope is active.

	https://sdk.play.date/inside-playdate/#m-sound.envelope.setSustain
]]
---@param sustain number
function playdate.sound.envelope:setSustain(sustain) end

--[[
	Sets the envelope release time to attack, in seconds.

	https://sdk.play.date/inside-playdate/#m-sound.envelope.setRelease
]]
---@param release number
function playdate.sound.envelope:setRelease(release) end

--[[
	Sets scale values to the envelope. The transformed envelope has an initial value of offset and a maximum (minimum if scale is negative) of offset + scale.

	https://sdk.play.date/inside-playdate/#m-sound.envelope.setScale
]]
---@param scale number
function playdate.sound.envelope:setScale(scale) end

--[[
	Sets scale and offset values to the envelope. The transformed envelope has an initial value of offset and a maximum (minimum if scale is negative) of offset + scale.

	https://sdk.play.date/inside-playdate/#m-sound.envelope.setOffset
]]
---@param offset number
function playdate.sound.envelope:setOffset(offset) end

--[[
	Sets whether to use legato phrasing for the envelope. If the legato flag is set, when the envelope is re-triggered before it’s released, it remains in the sustain phase instead of jumping back to the attack phase.

	https://sdk.play.date/inside-playdate/#m-sound.envelope.setLegato
]]
---@param flag boolean
function playdate.sound.envelope:setLegato(flag) end

--[[
	If retrigger is on, the envelope always starts from 0 when a note starts playing, instead of the current value if it’s active.

	https://sdk.play.date/inside-playdate/#m-sound.envelope.setRetrigger
]]
---@param flag boolean
function playdate.sound.envelope:setRetrigger(flag) end

--[[
	Triggers the envelope at the given velocity. If a length parameter is given, the envelope moves to the release phase after the given time. Otherwise, the envelope is held in the sustain phase until the trigger function is called again with velocity equal to zero.

	https://sdk.play.date/inside-playdate/#m-sound.envelope.trigger
]]
---@param velocity number
---@param length? number
function playdate.sound.envelope:trigger(velocity, length) end

--[[
	If an envelope is marked global, it is continuously updated whether or not it’s attached to any source.

	https://sdk.play.date/inside-playdate/#m-sound.envelope.setGlobal
]]
---@param flag boolean
function playdate.sound.envelope:setGlobal(flag) end

--#endregion

--#region Bitcrusher

--[[
	https://sdk.play.date/1.12.3/Inside%20Playdate.html#C-sound.bitcrusher
]]
---@class playdate.sound.bitcrusher : playdate.sound.effect
playdate.sound.bitcrusher = {}

--[[
	Creates a new bitcrusher filter.

	https://sdk.play.date/inside-playdate/#f-sound.bitcrusher.new
]]
---@return playdate.sound.bitcrusher
function playdate.sound.bitcrusher.new() end

--[[
	Sets the wet/dry mix for the effect. A level of 1 (full wet) replaces the input with the effect output; 0 leaves the effect out of the mix.

	https://sdk.play.date/inside-playdate/#m-sound.bitcrusher.setMix
]]
---@param level number
function playdate.sound.bitcrusher:setMix(level) end

--[[
	Sets a signal to modulate the mix level.

	https://sdk.play.date/inside-playdate/#m-sound.bitcrusher.setMixMod
]]
---@param signal playdate.sound.signal
function playdate.sound.bitcrusher:setMixMod(signal) end

--[[
	Sets the amount of crushing to amt. Valid values are 0 (no effect) to 1 (quantizing output to 1-bit).

	https://sdk.play.date/inside-playdate/#m-sound.bitcrusher.setAmount
]]
---@param amt number
function playdate.sound.bitcrusher:setAmount(amt) end

--[[
	Sets a signal to modulate the filter level.

	https://sdk.play.date/inside-playdate/#m-sound.bitcrusher.setAmountMod
]]
---@param signal playdate.sound.signal
function playdate.sound.bitcrusher:setAmountMod(signal) end

--[[
	Sets the number of samples to repeat; 0 is no undersampling, 1 effectively halves the sample rate.

	https://sdk.play.date/inside-playdate/#m-sound.bitcrusher.setUndersampling
]]
---@param amt number
function playdate.sound.bitcrusher:setUndersampling(amt) end

--[[
	Sets a signal to modulate the filter level.

	https://sdk.play.date/inside-playdate/#m-sound.bitcrusher.setUndersamplingMod
]]
---@param signal playdate.sound.signal
function playdate.sound.bitcrusher:setUndersamplingMod(signal) end

--#endregion

--#region Ring Modulator

--[[
	https://sdk.play.date/1.12.3/Inside%20Playdate.html#C-sound.ringmod
]]
---@class playdate.sound.ringmod : playdate.sound.effect
playdate.sound.ringmod = {}

--[[
	Creates a new ring modulator filter.

	https://sdk.play.date/inside-playdate/#f-sound.ringmod.new
]]
---@return playdate.sound.ringmod
function playdate.sound.ringmod.new() end

--[[
	Sets the wet/dry mix for the effect. A level of 1 (full wet) replaces the input with the effect output; 0 leaves the effect out of the mix.

	https://sdk.play.date/inside-playdate/#m-sound.ringmod.setMix
]]
---@param level number
function playdate.sound.ringmod:setMix(level) end

--[[
	Sets a signal to modulate the mix level.

	https://sdk.play.date/inside-playdate/#m-sound.ringmod.setMixMod
]]
---@param signal playdate.sound.signal
function playdate.sound.ringmod:setMixMod(signal) end

--[[
	Sets the ringmod frequency to f.

	https://sdk.play.date/inside-playdate/#m-sound.ringmod.setFrequency
]]
---@param f number
function playdate.sound.ringmod:setFrequency(f) end

--[[
	Sets a signal to modulate the ringmod frequency.

	https://sdk.play.date/inside-playdate/#m-sound.ringmod.setFrequencyMod
]]
---@param signal playdate.sound.signal
function playdate.sound.ringmod:setFrequencyMod(signal) end

--#endregion

--#region One Pole Filter

--[[
	The one pole filter is a simple low/high pass filter, with a single parameter describing the cutoff frequency: values above 0 (up to 1) are high-pass, values below 0 (down to -1) are low-pass.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#C-sound.onepolefilter
]]
---@class playdate.sound.onepolefilter : playdate.sound.effect
playdate.sound.onepolefilter = {}

--[[
	Returns a new one pole filter.

	https://sdk.play.date/inside-playdate/#f-sound.onepolefilter.new
]]
---@return playdate.sound.onepolefilter
function playdate.sound.onepolefilter.new() end

--[[
	Sets the wet/dry mix for the effect. A level of 1 (full wet) replaces the input with the effect output; 0 leaves the effect out of the mix.

	https://sdk.play.date/inside-playdate/#m-sound.onepolefilter.setMix
]]
---@param level number
function playdate.sound.onepolefilter:setMix(level) end

--[[
	Sets a signal to modulate the mix level.

	https://sdk.play.date/inside-playdate/#m-sound.onepolefilter.setMixMod
]]
---@param signal playdate.sound.signal
function playdate.sound.onepolefilter:setMixMod(signal) end

--[[
	Sets the filter’s single parameter (cutoff frequency) to p.

	https://sdk.play.date/inside-playdate/#m-sound.onepolefilter.setParameter
]]
---@param p number
function playdate.sound.onepolefilter:setParameter(p) end

--[[
	Sets a modulator for the filter’s parameter.

	https://sdk.play.date/inside-playdate/#m-sound.onepolefilter.setParameterMod
]]
function playdate.sound.onepolefilter:setParameterMod(m) end

--#endregion

--#region Two Pole Filter

--[[
	https://sdk.play.date/inside-playdate/#C-sound.twopolefilter
]]
---@class playdate.sound.twopolefilter : playdate.sound.effect
playdate.sound.twopolefilter = {}

---@alias TwoPoleIIRFilter
---|`playdate.sound.kFilterLowPass`
---|`playdate.sound.kFilterHighPass`
---|`playdate.sound.kFilterBandPass`
---|`playdate.sound.kFilterNotch`
---|`playdate.sound.kFilterPEQ`
---|`playdate.sound.kFilterLowShelf`
---|`playdate.sound.kFilterHighShelf`
---|"lowpass"
---|"lopass"
---|"highpass"
---|"hipass"
---|"bandpass"
---|"notch"
---|"peq"
---|"lowshelf"
---|"loshelf"
---|"highshelf"
---|"hishelf"

--[[
	Creates a new two pole IIR filter of the given type:
		playdate.sound.kFilterLowPass (or the string "lowpass" or "lopass")
		playdate.sound.kFilterHighPass (or "highpass" or "hipass")
		playdate.sound.kFilterBandPass (or "bandpass")
		playdate.sound.kFilterNotch (or "notch")
		playdate.sound.kFilterPEQ (or "peq")
		playdate.sound.kFilterLowShelf (or "lowshelf" or "loshelf")
		playdate.sound.kFilterHighShelf (or "highshelf" or "hishelf")
	
	https://sdk.play.date/inside-playdate/#f-sound.twopolefilter.new
]]
---@param type TwoPoleIIRFilter
---@return playdate.sound.twopolefilter
function playdate.sound.twopolefilter.new(type) end

--[[
	Sets the wet/dry mix for the effect. A level of 1 (full wet) replaces the input with the effect output; 0 leaves the effect out of the mix.

	https://sdk.play.date/inside-playdate/#m-sound.twopolefilter.setMix
]]
---@param level number
function playdate.sound.twopolefilter:setMix(level) end

--[[
	Sets a signal to modulate the mix level.

	https://sdk.play.date/inside-playdate/#m-sound.twopolefilter.setMixMod
]]
---@param signal playdate.sound.signal
function playdate.sound.twopolefilter:setMixMod(signal) end

--[[
	Sets the center frequency (in Hz) of the filter to f.

	https://sdk.play.date/inside-playdate/#m-sound.twopolefilter.setFrequency
]]
---@param f number
function playdate.sound.twopolefilter:setFrequency(f) end

--[[
	Sets a signal to modulate the filter frequency.

	https://sdk.play.date/inside-playdate/#m-sound.twopolefilter.setFrequencyMod
]]
---@param signal playdate.sound.signal
function playdate.sound.twopolefilter:setFrequencyMod(signal) end

--[[
	Sets the resonance of the filter to r. Valid values are in the range 0-1. This parameter has no effect on shelf type filters.

	https://sdk.play.date/inside-playdate/#m-sound.twopolefilter.setResonance
]]
---@param r number
function playdate.sound.twopolefilter:setResonance(r) end

--[[
	Sets a signal to modulate the filter resonance.

	https://sdk.play.date/inside-playdate/#m-sound.twopolefilter.setResonanceMod
]]
---@param signal playdate.sound.signal
function playdate.sound.twopolefilter:setResonanceMod(signal) end

--[[
	Sets the gain of the filter to g. Gain is only used in PEQ and shelf type filters.

	https://sdk.play.date/inside-playdate/#m-sound.twopolefilter.setGain
]]
---@param g number
function playdate.sound.twopolefilter:setGain(g) end

--[[
	Sets the type of the filter to type.

	https://sdk.play.date/inside-playdate/#m-sound.twopolefilter.setType
]]
---@param type TwoPoleIIRFilter
function playdate.sound.twopolefilter:setType(type) end

--#endregion

--#region Overdrive

---@class playdate.sound.overdrive : playdate.sound.effect
playdate.sound.overdrive = {}

--[[
	Creates a new overdrive effect.

	https://sdk.play.date/inside-playdate/#f-sound.overdrive.new
]]
---@return playdate.sound.overdrive
function playdate.sound.overdrive.new() end

--[[
	Sets the wet/dry mix for the effect. A level of 1 (full wet) replaces the input with the effect output; 0 leaves the effect out of the mix.

	https://sdk.play.date/inside-playdate/#m-sound.overdrive.setMix
]]
---@param level number
function playdate.sound.overdrive:setMix(level) end

--[[
	Sets a signal to modulate the mix level.

	https://sdk.play.date/inside-playdate/#m-sound.overdrive.setMixMod
]]
---@param signal playdate.sound.signal
function playdate.sound.overdrive:setMixMod(signal) end

--[[
	Sets the gain of the filter.

	https://sdk.play.date/inside-playdate/#m-sound.overdrive.setGain
]]
---@param level number
function playdate.sound.overdrive:setGain(level) end

--[[
	Sets the level where the amplified input clips.

	https://sdk.play.date/inside-playdate/#m-sound.overdrive.setLimit
]]
---@param level number
function playdate.sound.overdrive:setLimit(level) end

--[[
	Sets a signal to modulate the limit level.

	https://sdk.play.date/inside-playdate/#m-sound.overdrive.setLimitMod
]]
---@param signal playdate.sound.signal
function playdate.sound.overdrive:setLimitMod(signal) end

--[[
	Adds an offset to the upper and lower limits to create an asymmetric clipping.

	https://sdk.play.date/inside-playdate/#m-sound.overdrive.setOffset
]]
---@param level number
function playdate.sound.overdrive:setOffset(level) end

--[[
	Sets a signal to modulate the offset value.

	https://sdk.play.date/inside-playdate/#m-sound.overdrive.setOffsetMod
]]
---@param signal playdate.sound.signal
function playdate.sound.overdrive:setOffsetMod(signal) end

--#endregion

--#region Delay Line Tap

--[[
	playdate.sound.delaylinetap is a subclass of playdate.sound.source. Note that a tap can be added to any channel, not just the channel the tap’s delay line is on.

	https://sdk.play.date/1.12.3/Inside%20Playdate.html#C-sound.delaylinetap
]]
---@class playdate.sound.delaylinetap : playdate.sound.source
playdate.sound.delaylinetap = {}

--[[
	Sets the position of the tap on the delay line, up to the delay line’s length.

	https://sdk.play.date/inside-playdate/#m-sound.delaylinetap.setDelay
]]
---@param time number
function playdate.sound.delaylinetap:setDelay(time) end

--[[
	Sets a signal to modulate the tap delay. If the signal is continuous (e.g. an envelope or a triangle LFO, but not a square LFO) playback is sped up or slowed down to compress or expand time.

	https://sdk.play.date/inside-playdate/#m-sound.delaylinetap.setDelayMod
]]
---@param signal playdate.sound.signal
function playdate.sound.delaylinetap:setDelayMod(signal) end

--[[
	Sets the tap’s volume.

	https://sdk.play.date/inside-playdate/#m-sound.delaylinetap.setVolume
]]
---@param level number
function playdate.sound.delaylinetap:setVolume(level) end

--[[
	Returns the tap’s volume.

	https://sdk.play.date/inside-playdate/#m-sound.delaylinetap.getVolume
]]
---@return number
function playdate.sound.delaylinetap:getVolume() end

--[[
	If set and the delay line is stereo, the tap outputs the delay line’s left channel to its right output and vice versa.

	https://sdk.play.date/inside-playdate/#m-sound.delaylinetap.setFlipChannels(flag)
]]
---@param flag boolean
function playdate.sound.delaylinetap:setFlipChannels(flag) end

--#endregion

--#region Delay Line

---@class playdate.sound.delayline : playdate.sound.effect
playdate.sound.delayline = {}

--[[
	Creates a new delay line effect, with the given length (in seconds).

	https://sdk.play.date/inside-playdate/#f-sound.delayline.new
]]
---@param length integer
---@return playdate.sound.delayline
function playdate.sound.delayline.new(length) end

--[[
	Sets the wet/dry mix for the effect. A level of 1 (full wet) replaces the input with the effect output; 0 leaves the effect out of the mix, which is useful if you’re using taps for varying delays.

	https://sdk.play.date/inside-playdate/#m-sound.delayline.setMix
]]
---@param level number
function playdate.sound.delayline:setMix(level) end

--[[
	Sets a signal to modulate the mix level.

	https://sdk.play.date/inside-playdate/#m-sound.delayline.setMixMod
]]
---@param signal playdate.sound.signal
function playdate.sound.delayline:setMixMod(signal) end

--[[
	Returns a new playdate.sound.delaylinetap on the delay line, at the given delay (which must be less than or equal to the delay line’s length).

	https://sdk.play.date/inside-playdate/#m-sound.delayline.addTap(delay)
]]
---@param delay number
---@return playdate.sound.delaylinetap
function playdate.sound.delayline:addTap(delay) end

--[[
	Sets the feedback level of the delay line.

	https://sdk.play.date/inside-playdate/#m-sound.delayline.setFeedback(level)
]]
---@param level number
function playdate.sound.delayline:setFeedback(level) end

--#endregion
