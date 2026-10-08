---
title: 0.9.5 / ???
---
# 0.9.5 / ???

* Experimental support for running in a terminal.

# 0.9.0 / 2020-10-27

* New alt-x `execute` command.
* Move handlers to `polywell.handlers` and commands to `polywell.cmd` tables.
* Massive deprecations and renames.
* Rewrite mode system to use modules instead of being imperative.
* Rewrite filesystem adapter to interface thru a handful of functions.
* Split out love-specific bits into frontend module.
* Rewrite much of the code in Fennel.

# 0.3.0 / 2018-02-17

* Fix completion for opening files off disk.
* Support reloading polywell from inside polywell.
* Screen splits (choose from 3 hard-coded layouts).
* Rudimentary Clojure mode and nrepl client.
* Add polywell.coroutines for background tasks.
* Support setting mouse cursors on a per-mode basis.
* Allow console's loadstring function to be customized.
* Support drawing minibuffer with custom draw function.
* Better support for drawing non-textual buffers.

# 0.2.0 / 2016-09-13

* Rename event handler functions to match LÖVE naming.
* Write reference manual.
* Add `with_output_to` function to redirect `print` and `write`.
* Add mouse handlers.
* Allow modes to define their own wrap functions for custom undo.
* Add Emacs-style prefix maps for key bindings.

# 0.1.0 / 2016-09-04

* Initial release as a standalone project.
