+++
title = "Engine Development"
author = ["emsenn"]
layout = "single"
draft = false
+++

The Racket-MUD engine may just be the core features of a MUD engine, but that there's still a lot to it!

I'd love help developing this thing: I'm really new to writing Racket, and I'm only a hobbyist programmer to start with.


## Style Guide {#style-guide}

Figure libraries and engines should follow the same style guide, but y'know if you're making you're own library, you should feel free tod o whatever you want.


### Versioning {#versioning}

This project will use semantic versioning (SemVer: <https://semver.org>) for all versions past version 1.0.0. Each version number has three parts: for version 1.23.4, 1 is the major version, 23 is the minor version, and 4 is the patch. Major versions are incremented when a non-compatible change is made to the software's API, requiring a change in the code of that software which uses it. Minor versions are incremented when compatible changes are made to the API, and patches are incremented when the version upgrade just deals with fixing bugs.

Prior to version 1.0.0, there is no point in history against which the API's compatibility might be measured, so the minor version is incremented any time the API is changed, whether it breaks compatibility or not. It should be assumed that every minor version is incompatible with any previous version. Patches work the same.


### Writing Documentation {#writing-documentation}

-   Write documentation in plural first: we, our, ours.


## Further Reading {#further-reading}

-   <https://github.com/Cheekyshroom/racketMUD/>
-   <https://github.com/vaelen/vaelen-mush/blob/master/server.rkt>
-   <http://faqs.cs.uu.nl/na-dir/games/mud-faq/lp.html>
-   <http://www.topmudsites.com/forums/showthread.php?t=4845>
-   <https://www.raphkoster.com/games/snippets/lpmuds-vs-diku-muds/>