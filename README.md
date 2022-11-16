# Playdate Type Annotations
A set of EmmyLua-style type annotations for the PlayDate Lua SDK, mainly intended for use with the Lua extension in VSCode. Most of the current state of this file is based on the [SDK documentation](https://sdk.play.date/1.12.3/Inside%20Playdate.html).

## Usage
### Setup
Simply place playdate-type-annotations as a git submodule or regular folder outside of your `source` directory, and the sumneko Lua extension should automatically pick up the appropriate type annotations in your other source files.

**You should not import any of these files in your project source code.**

Keeping the playdate_type_annotations folder separate from your `source` directory will ensure these files are not compiled into your .pdx file when running the `pdc` command.

### Type Annotations
These EmmyLua-style type annotations are designed with [sumneko.Lua's type annotation](https://github.com/sumneko/lua-language-server/wiki/Annotations) support in mind. See the sumneko.Lua wiki to learn more about how you can use these on your end.

### Example: Custom Sprite Class
The following examples show how you could create a custom Sprite class using these annotations:
```lua
---@class MySpriteClass : playdate.graphics.sprite
MySpriteClass = {} -- While the .extends() call below will add a global table entry, the VSCode extension really needs this to recognize that there is a table with that name.
class('MySpriteClass', {}).extends(playdate.graphics.sprite)
```

```lua
---@class mynamespace.MySpriteClass : playdate.graphics.sprite
mynamespace.MySpriteClass = {} -- While the .extends() call below will add a global table entry, the VSCode extension really needs this to recognize that there is a table with that name.
class('MySpriteClass', {}, mynamespace).extends(playdate.graphics.sprite)
```

## Contributing
Feel free to file issues or make Pull Requests. Where possible, please try to verify the types of your changes at runtime to verify accuracy when the SDK documentation is unclear.

## License
Consider this file public domain; I made it for my own sake, and I'm happy to share it to help others in the community.
