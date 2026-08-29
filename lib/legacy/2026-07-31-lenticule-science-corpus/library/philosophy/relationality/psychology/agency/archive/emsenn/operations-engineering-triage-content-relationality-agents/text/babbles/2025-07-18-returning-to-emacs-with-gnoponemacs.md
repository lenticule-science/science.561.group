---

title: Returning to Emacs with GnoponEmacs
author: emsenn
date-created: 2025-07-18
keywords:
  - babble
  - emacs
  - tooling
publish-to:
  - emsenn-net
---

After too long dealing with other text editors, I'm finally returning to Emacs. A critical first step in this is dusting off my old Emacs configuration, which I'd named InfoPonEmacs.

Since then (2021ce), I've gotten more particular in my neologisms, specifically about mixing Latin and Greek influences, and have also significantly developed my interest in philosophy, epistemology, etc. (See emsean thought).

So, one of the first things I'm doing, to more than dust off the system, is renaming it *GnoponEmacs*.

From there, I want to tweak a lot of how the system is implemented, in line with the things I've been learning in other ways over the past few years.

I want to make it so there is, in the root directory of our Gnoponograph, a script for starting GnoponEmacs, specifically, rather than having InfoPonEmacs take over the users' Emacs configuration.

Additionally, I want to rely more on placing snippets of configuration (i.e. capture templates) into a directory (or set of subdirectories) that the relevant configurations look into. That way, the main source file doesn't have to have a bunch of stuff about my personal capture templates in there, and the whole thing can be a little more modular.

So, a user runs a script that starts Emacs and, if necessary, runs the GnoponEmacs installation script, creating the directories that it needs for itself (a directory for YASnippet snippets, for example).

From there, they use Org-mode/-roam capture templates and Org-roam node lookups to create Gnoponograms and navigate the resultant Gnopolology.

Another thing I want to set up is a way to do audio input, and I do want to look into integrating large language model conversations, in some way.

