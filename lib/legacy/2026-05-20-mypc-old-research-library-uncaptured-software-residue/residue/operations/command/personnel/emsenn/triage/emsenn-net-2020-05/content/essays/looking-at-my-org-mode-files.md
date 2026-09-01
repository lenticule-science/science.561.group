+++
title = "Looking at my Org-mode Files"
author = ["emsenn"]
tags = ["OrgMode", "writing"]
draft = false
+++

I've been using _Org-mode_ more and more heavily for the past... year, or so.

In that time, I've shuffled a lot of files around in my org-mode directory, but without always making sure older parts continued to make sense. Most importantly, I have a lot of little _Org-mode macros_ scattered across different projects, which means every time I export anything from that project, it has to load all the macros, and that takes time.

So, as I said, I have a a directory named `org/` in my home directory.

That directory in turn contains these directories:

-   `clients/`
-   `personal/`
-   `projects/`
-   `triage/`

The `clients/` directory contains a directory for each of my current clients, as well as a directory called `archive/` that contains a directory for each of my past clients. Client directories are similar in layout to a project directory.

The `personal/` directory is also laid out like a project, which is, it contains two subdirectories, `pub/` and `src/`. `src/` is where the _Org-mode_ files themselves are located, and `pub/` is where any exported reports go, such as logs I've rendered exported to PDF to print out.

The `projects/` directory has most of my stuff - and when I say that, I mean it; almost everything I make is one or more _Org-mode_ files. Explaining why is outside the scope of this essay.

Each project has a `src/` and `pub/` directory. Here is a list of other files and directories my projects might have:

-   `src/setup.inc/` which would contain project-wide _Org-mode_ configurations. It would be used by other source files in that project.
-   `src/index.org/` which would be the project's "homepage," if the project is rendered as any sort of collection of, or individual, HTML documents - which it almost certainly will be.

I'm honestly not able to think of anything else that is common between different projects.

Finally, the `triage/` directory contains _Org-mode_ files that I haven't decided a better place for yet - such as a new piece of writing that I'm unsure if it'll be a letter, post, or what. For example, the file I'm writing this text in is in `triage/looking-at-my-org-mode-files.org`.

Having written most of it, though, I'll probably move it into `projects/posts/src/looking-at-my-org-mode-files.org`.

Anyway, that's the layout of my Org-mode directory, as it currently stands.