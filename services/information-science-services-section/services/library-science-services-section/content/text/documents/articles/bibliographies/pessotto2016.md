---
type: bibliography
key: pessotto2016
reference-type: software
authors:
- Pessotto, Marco
year: 2016
title: 'amusewiki'
publisher: 'GitHub (melmothx/amusewiki); manual at amusewiki.org'
url: 'https://github.com/melmothx/amusewiki'
note: 'LICENSE states copyright (c) 2016-2024 by Marco Pessotto; manual pages undated as observed 2026-09-08'
description: Read at the GitHub URL above and its linked manual pages (https://amusewiki.org/library/manual), 2026-09-08.
---

# Pessotto 2016 — amusewiki

Read at the GitHub URL above and its linked manual pages
(https://amusewiki.org/library/manual), 2026-09-08.

## Why this is central

amusewiki is the software The Anarchist Library runs, and its manual is
the primary source
[muse-markup](../../../glossary/terms/muse-markup.md) is required to cite.
The README states the platform's own shape: "This is a wiki engine using
the Text::Amuse markup (based on and mostly compatible with Emacs Muse)
and a Git backend." The manual states Muse markup's own lineage: "This
document describes Muse, which was written by John Wiegley, then
maintained by Michael Olson and heavily edited and partially rewritten for
this implementation by Marco Pessotto." And its own working description:
"A Muse document uses special, contextual markup rules to determine how to
format the output result... there are not too many markup rules, and all
of them strive to be as simple as possible so that you can focus on
document creation, rather than formatting."

The same manual page states amusewiki's output-format set, relevant to
[print-on-demand](../../../glossary/terms/print-on-demand.md): "AMuseWiki
generates multiple output formats from a single source document: PDF
variants — Plain PDF, A4 imposed PDF, and Letter imposed PDF; EPUB... HTML...
Plain text source" plus a XeLaTeX source file — one Muse source compiling
to every delivered format, imposed-for-print variants included. The
bookbuilder tutorial (https://amusewiki.org/library/bookbuilder-tutorial)
documents the reader-facing tool that assembles a custom PDF/EPUB from one
or several texts, with font, page-size, and other formatting options.

## What it does not settle

The manual documents the software's own git-backed storage
(https://amusewiki.org/mirror/o/oe/offline-editing-via-git.html: "Amusewiki
fully supports offline editing," with an example remote
`ssh://amusewiki.org/var/lib/amusewiki/shared/repo/amw.git`) and its
moderation roles (https://amusewiki.org/library/roles: an "open wiki"
where "Humans can add new texts, edit them, and the result is published
right away. Revisions are kept in the git," versus a "moderated wiki"
where "approvals and publishing is reserved to the librarians") — but the
manual is silent on amusewiki's own project governance, funding, or
maintenance capacity beyond Marco Pessotto's authorship, and on whether any
particular site's git remote is publicly cloneable (that is a per-site
operator decision, not a software-level guarantee).

## Bridges

- To [muse-markup](../../../glossary/terms/muse-markup.md).
- To [print-on-demand](../../../glossary/terms/print-on-demand.md) — imposed
  PDF and the bookbuilder as one real implementation of the general
  practice.
