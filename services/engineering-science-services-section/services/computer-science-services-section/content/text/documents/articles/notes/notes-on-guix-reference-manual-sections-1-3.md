---
name: notes-on-guix-reference-manual-sections-1-3
specialization: research
title: notes-on-guix-reference-manual-sections-1-3
description: +++ title = "Notes on \"Guix Reference Manual,\" Sections 1-3" author = ["emsenn"] tags = ["Guix"] draft = false +++
aliases:
  - Notes On Guix Reference Manual Sections 1 3
---

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

## 2026-08-28 clarification: channels, modules, and manifests

The early question above—whether Guix is like loading one editable startup
file—mixes together several layers which Guix deliberately separates. A useful
management-level picture is:

```text
channel = where versioned Guix definitions arrive from
module  = one reusable body of Guile definitions
manifest = what one environment should contain
```

More completely:

```text
Git repository = where files and history live
Guile module   = reusable executable definitions
Guix channel   = authenticated, versioned delivery of modules
Guix package   = recipe for one buildable artifact
Guix manifest  = selected artifacts for one environment
Guix profile   = realized generation of that selection
```

### Channel

A Guix channel normally points to a Git repository and selects a branch or
commit containing Guile modules. `guix pull` fetches, authenticates, and
compiles the chosen channel revisions into a new Guix generation. This changes
which definitions Guix knows; it does not install a project's selected tools.

`channels.scm` is consumer configuration: it chooses and can pin the channels
which define the Guix universe. `.guix-channel` is author metadata inside a
repository offered as a channel. The latter does not activate the channel.

### Module

A Guix module is simply a Guile module which defines or uses Guix values. It is
a named namespace that can export packages, services, records, readers,
policies, and transformations. `(phezi ochage atlas)` conventionally maps to
`phezi/ochage/atlas.scm` under a configured load path.

During development, a load-path option such as `-L guix` can expose local
modules directly. A channel is the mechanism for distributing versions of
those modules through `guix pull`.

### Manifest

A manifest is a Guile value selecting package outputs for an environment,
profile, or pack. A conventional `manifest.scm` returns that value. It says
what should be available, not how each package is built and not where its
definition originated.

A manifest is normally symbolic, so it is not a lockfile by itself. Reliable
reproduction needs the manifest together with pinned channel revisions: the
manifest chooses names and outputs; the channels determine exactly what those
choices mean.

### What the likely project-root files would mean

| File | Responsibility | Not its responsibility |
|---|---|---|
| `.guix-channel` | describes this repository when consumed as a channel, including its module directory | subscribing to the channel or fetching only that subdirectory |
| `channels.scm` | pins the channel repositories and commits defining the Guix universe | selecting the tools in a project shell |
| `manifest.scm` | selects tools and outputs for a development or operator environment | defining the packages or cataloging the repository |
| `guix.scm` | conventionally returns the principal project package | defining a channel or the whole institution |
| `guix/phezi/ochage/*.scm` | contains reusable atlas, package, service, and lowering modules | becoming active without a load path or channel |

For the present repository, this means the atlas implementation belongs in
modules; a `guix.scm` can expose the Atlas package; `manifest.scm` can select
the tools needed to develop and operate it; `channels.scm` can pin the
definition universe; and `.guix-channel` can describe how those modules are
distributed. None of those files, alone or together, says that every document,
person, service, or territorial relation is a Guix package.

### Glossary entries

- [Guix channel](../../../../../services/computer-systems-science-services-section/content/text/glossary/terms/guix-channel.md)
- [Guix module](../../../../../services/computer-systems-science-services-section/content/text/glossary/terms/guix-module.md)
- [Guix manifest](../../../../../services/computer-systems-science-services-section/content/text/glossary/terms/guix-manifest.md)
