+++
title = "Notes on \"Guix Reference Manual,\" Sections 1-3"
author = ["emsenn"]
tags = ["Guix"]
draft = false
+++

I've just installed the _Guix System Distribution_ on my desktop, and
in an attempt to learn it fully I am going to read the manual and
record notes here.

The full text of the documentation is available at
<https://www.gnu.org/software/guix/manual/en/guix.html>

The manual says _GNU Guix_ is a package management tool, letting
unprivileged users manage packages. It can be installed on an existing
GNU/Linux system, or as a standalone operating system, _Guix System_.
That's what I'm doing.

_Guix_ implements the "'functional package management' discipline,"
apparently pioneered by _Nix_, another Linux distribution.

The package build/install process is a _fuction_. Its inputs are the
build script, the compiler, dependent libraries, and it returns an
installed package.

Packages can only refer to packages and such that were passed as
inputs, and can't modify a system outside of its build and
installation directories.

The results of package build functions is cached in "the Store," under
a folder that has a hash of all the inputs, so it's appropriately
unique. That's pretty clever! It's, by default, under `/gnu/store/`.

So, on to the _Guix System_. It comes with some core packages...

You "declare all aspects of the operating system configuration and
_Guix_ takes care of instantiating the configuration in a
transactional, reproducible, and stateless fashion."

What... does that mean? Is it like _Emacs_, where you write an
initialization file and that gets loaded on startup? And then... it
checks the hash that the inputs of your build function calls against
the packages that are there to see if things need to be installed?

Maybe I'm wrong, but I think that might be it. So, I've installed a
few packages since I started up the system... I wonder where my system
init is.

(Also, isn't that how _Arch_ used to work, back when? A series of
startup scripts that you could just... edit? I miss that; I had a very
speedy netbook because of it.)

The next section of the manual is for how to install _Guix_ ontop of
another Linux, so I'll skip it for now; hopefuly that's fine.

The next section I already read before installing the system, because
it's how to install the _Guix System_.

Well... I didn't read it, as such. I skimmed it. Let me read it
thoroughly now.

So, it starts off with some limitations - that's a good idea. I should
start off my project installation guides with disclosing
limitations/failures of the project. _Logical Volume Management_ is
missing, but I don't know what that is and so I don't think I'll miss
it. KDE is also missing. That's fine, it's never been my preferred
window manager. I'm using MATE right now; I made it all gray and blue
to look like old-school Windows.

It also warns me that wifi support is ify. My wifi chip does work, but
I'm also wired into the router so that's irrelevant to me.

Okay, blah blah, more installation instructions. Nothing that seems
too important: I think I'm ready to start using the system.