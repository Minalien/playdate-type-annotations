# Playdate Type Annotations
A set of EmmyLua-style type annotations for the PlayDate Lua SDK, mainly intended for use with the Lua extension in VSCode. Most of the current state of this file is based on the [SDK documentation](https://sdk.play.date/1.12.3/Inside%20Playdate.html).

## Usage
Simply place playdate_type_annotations.lua alongside your other Lua source files, and the sumneko Lua extension should automatically pick up the appropriate type annotations in your other source files.

**You should not import this file anywhere. Only its presence is required, and it will not be compiled when running pdc.**

## Contributing
Feel free to file issues or make Pull Requests. Where possible, please try to verify the types of your changes at runtime to verify accuracy when the SDK documentation is unclear.

## License
Consider this file public domain; I made it for my own sake, and I'm happy to share it to help others in the community.
