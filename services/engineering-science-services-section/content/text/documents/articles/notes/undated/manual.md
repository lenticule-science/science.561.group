---
title: Polywell Manual
description: Polywell is at its core a library for creating programmable textual and graphical interfaces where keystrokes are bound to functions and operate on buffers.
---
# Polywell Manual

Polywell is at its core a library for creating programmable textual
and graphical interfaces where keystrokes are bound to functions and
operate on buffers.

It also ships with some code which uses this functionality to
construct a text editor and repl, (in the `config` dir) but you
can just as well replace those bits with your own code or define a new
mode which defines a
[simulated SSH client](https://gitlab.com/technomancy/bussard/blob/master/data/src/ssh) or
[platformer level editor](https://gitlab.com/technomancy/liquid-runner/blob/master/level_edit.lua).

Polywell is in the process of being ported from Lua to Fennel and still
has some significant Lua parts, but the API uses kebab-case for its
function names.

## Usage

Polywell has a bunch of handlers which need to be wired into the
`love` table; usually in your `love.load` function:

```lisp
(set love.keyreleased polywell.handlers.keyreleased)
(set love.keypressed polywell.handlers.keypressed)
(set love.textinput polywell.handlers.textinput)

-- if you want polywell to handle mouse events too:
(set love.wheelmoved polywell.handlers.wheelmoved)
(set love.mousepressed polywell.handlers.mousepressed)
(set love.mousereleased polywell.handlers.mousereleased)
(set love.mousemoved polywell.handlers.mousemoved)
(set love.mousefocus polywell.handlers.mousefocus)
```

But of course you can set the `love` handlers to your own functions
which can intercept events before they are sent to the Polywell
handlers too:

```lisp
(fn love.keypressed [key]
  (if (= key "escape")
    (do-escape)
    (polywell.handle_key key)))
```

You also will need to either set `love.draw` to `polywell.draw` or
call `polywell.draw` from within your own drawing function.

Your `love.load` function will probably want to call
`love.graphics.setFont`, `love.keyboard.setTextInput`, and
`love.keyboard.setKeyRepeat`, and you will also want to load the
config to create modes and key bindings: `(require :config)`.

Whatever config gets loaded is responsible for initializing the editor
at some point by calling the `polywell.init` function, which takes an
buffer name, mode, and list of strings to populate the initial buffer
with. You can pass a final `fs` arg representing the filesystem if you
want to use Polywell with a simulated in-game filesystem instead of
the actual system disk.

The `polywell` module contains the public API for Polywell; other
modules are internal and shouldn't be used from external code.

## Buffers and Modes

Every file you open in Polywell has a buffer associated with it, and
you can also have buffers like `*repl*` which aren't backed by a file
at all. You can use the `polywell.open` function to open a new
buffer. It takes the file's path as the first argument and a mode as
the second argument, but you can omit the mode if you want polywell to
figure out the mode for itself. If you are making a buffer like
`*repl*` which doesn't correspond to a file, pass true as the third
argument, and use a path which has `*` around the name.

Every buffer has a mode associated with it which determines how
keystrokes will be interpreted. It's recommended that each mode should
be its own module. In that case you can create a mode like so:

```lisp
(fn complete []
 ...)

{:name "clam-mode"
 :parent "edit"
 :map {"tab" complete}
 :ctrl {"n" (fn [] (editor.print "you pressed ctrl-n!"))}
 :props {:activate (fn [] (global clam true))
         :deactivate (fn [] (global clam false))}}
```

And then add it with this code:

```lisp
(local editor (require :polywell))

(editor.add-mode (require :config.clam-mode))
```

The `:map` table contains functions to handle various key presses.
The handlers for ctrl/alt combinations are kept in the `:ctrl` and
`:alt` entries. Setting `:parent` in a mode means that if a key
binding isn't defined in the key maps you've provided, it will
delegate to another mode and look it up in those key maps. You
probably want your `:parent` set to `"edit"` if you're making a
textual mode.

### Properties

Each mode has a table of properties that can contain functions or
other values which override its behaviour. Buffers can also have
properties set which take precedence over mode properties.

Currently these properties are used:

* `on-change`: a function which is called every time a change is made.
* `read-only`: a boolean indicating whether edits should be allowed; this
  can be sidestepped by the `polywell.suppress-read-only` function,
  which takes a function as an arg to run with `read-only` checks disabled.
* `wrap`: every time a command is run, it is run inside the wrap
  function which handles bookkeeping for undo; providing your own wrap
  allows you to implement your own undo.
* `render-lines`: a table of lines in LÖVE's print format (color,
  string, color, string, etc) which is used instead of the raw lines
  table during rendering if present; used by syntax highlighting.
* `activate`: (mode property only) a function called when a mode activates.
* `deactivate`: (mode property only) a function called when a mode deactivates.
* `draw`: a function to render the buffer instead of the default textual rendering.
* `update`: a function which is run on every tick with a `dt`
  parameter, assuming `polywell.update` is called from `love.update`.

You can get and set properties on the current buffer with
`polywell.get-prop` and `polywell.set-prop`, while mode properties are
defined by the `:props` key in the table returned by the mode module.

## Reading Input

The `polywell.read-line` function allows you to prompt the user for a
line of input. It takes a prompt and a callback function. The callback
function takes the string value which was input as its first argument.

```lisp
(fn go-to-line []
  (editor.read-line "Go to line: "
                    (fn [line]
                      (editor.go_to (tonumber line)))))
```

When you read input, you can also offer live feedback as you type,
like when you invoke the buffer switcher with `ctrl-alt-b`. The `read_line`
function takes as a third argument a properties table, and if you provide
a "completer" function, it will be called with the input string whenever the
input changes. It must return a table of possible completion matches.
You can use the `polywell.completion.for` function to calculate
completion candidates; it takes a table of possible candidates and an
input string.

See `editor.find-file` in `polywell/commands.fnl` for an example of
how this can be used.

## Syntax Highlighting

Currently Polywell ships with syntax highlighting for both Fennel code
and Lua code. You can add support for new languages, but new
language syntax highlighting support is limited to defining a new set
of keywords and to-EOL comment markers for the language; the
colorization of strings and numbers cannot be changed, nor can new
constructs be added. See `config/fennel-mode.fnl` for an example.

## Useful Functions

Most text editing commands should be fairly self-explanatory; see
`config/edit-mode.fnl` for a listing.

The `polywell.print` and `polywell.write` functions print to the
`*console*` buffer unless it is run within a call to `with-output-to`,
which accepts an alternate buffer to which to redirect output and a
function to run with the redirection potential. For messages that do not
need to stick around, use `polywell.echo` which just shows at the
bottom of the screen until the next command.

The `polywell.point` function returns the point and line number. The
line number obviously tells you which line you're on, and the point
tells you how far over the cursor is in that line. You can use
`polywell.get-line` to get a specific line as a string.

Use `polywell.activate-mode` to change the mode for the current
buffer. The `polywell.change-buffer` function will switch to an
existing buffer if it exists and do nothing if not, while
`polywell.open` will switch or create if it's not found. The
`polywell.with-current-buffer` function takes a buffer name and and
function to run with that buffer potential; it switches back to the
original buffer when that function returns.
