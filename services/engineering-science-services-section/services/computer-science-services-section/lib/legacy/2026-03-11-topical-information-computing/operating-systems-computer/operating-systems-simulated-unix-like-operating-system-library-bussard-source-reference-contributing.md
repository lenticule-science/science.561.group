# Contributing

Discussion happens mostly in the `#bussard` channel on Freenode, but the [issue tracker](https://gitlab.com/technomancy/bussard/issues) is useful for that too.

Contributions are preferred as GitLab merge requests on feature branches.
Emailing patches is OK too.

For the most part, new modules will be in Fennel and older code remains in Lua.

TODO: lore/story/world contributions?

## Lua Code style

* Three-space indent.
  No tabs.
* Use `snake_case` for all the things.
* Don't leave out parentheses just because they're technically optional.
* Unused arguments should be named `_` or start with `_`.
* Try to keep code under 80 columns unless breaking would be awkward (usually strings for output).
* Lume is great; learn it inside out and use it.
* Pick names for locals that avoid shadowing other locals.
* The `local f = function() ... end` construct is preferred to `local function f() ... end` unless the latter is needed for recursion.

The last rule exists to make recursive functions more obvious.
If you see `local function f()`, you know to pay more attention because a recursive function (or a function that needs self-reference for other reasons) is coming.

There are four different code contexts (at the time of this writing; more may be introduced in the future): engine code, in-ship code, rover code, and OS code.
The standards for the engine code are the strictest; no new globals may be introduced.
Inside the ship or OS sandboxes, it is often OK to introduce new "global" functions because their scope is much more limited.

New to Lua?
This [style guide](http://kiki.to/blog/2014/03/30/a-guide-to-authoring-lua-modules/) has some great advice.
The main difference is that in our code rather than creating the table at the top of the lib and adding to it as you go, we construct a table at the very end that contains all the values we need to expose, because it is more declarative and less imperative.

## Philosophy

The whole game is about exploring a simulated world, pushing up against its boundaries, and breaking through those boundaries.
Allowing the user to explore without fear of screwing something up irreparably is of paramount importance.

In-game documentation written as fictional technical manuals contributes to the hard-science hacker realism.

As much of the game as possible should be implemented in userspace so it's modifiable by any intrepid player, except for places where that would result in cheating.
The other exception is that sometimes we avoid exposing things to userspace (like the table structure behind editor buffers) because it would make it impossible to know if it's safe to make changes to the table structure without breaking user code.

## OS and SSH

The worlds you SSH into mostly run the Orb unix-like operating system, which is found in `os/orb`.
All the scripts that run inside the OS (userspace) are found in `resources` in that directory.
The portals run the `os/lisp` operating system, and the `os/rover` OS will be used for rovers.

All OS code is isolated by running it in separate LÖVE threads.
Each thread can communicate with others only by channels.
The `os.client` module is the bit which is exposed to your ship's sandbox and the main thread, and the `os.server` module runs in the isolated thread and delegates to the appropriate OS for whatever is on the other side.
Each world has an `os.server` thread for accepting connections, and when a new connection is made, a session-specific thread (running `os.rover.session`, etc) is started.

Mostly the communication consists of "standard IO"--lines of text sent and received.
(`op="stdin"` or `op="stdout"`) However, the protocol is simply tables sent and received, and other operations can be invoked.
The code running on the remote OS must occasionally invoke functions on the main thread, (such as cargo transfers or refueling) and this is done by sending `op="rpc"` messages across the channels, which invoke a set of whitelisted RPC-able functions in the top-level `rpcs` module.
All RPC functions have the first two args locked to `ship` and `port`, which is the table for whatever world on which the OS is running.
Each OS exposes a different set of RPC functions to code running in its threads.

The UI side of the SSH client is defined in `data/src/ssh`; it is based on the ship's computer's console mode, but it sends input across the SSH channel rather than eval when you press enter.

## License

By making contributions, you agree to allow your material to be distributed under the terms of the GNU General Public License, version 3 or later; see the file LICENSE for details.
