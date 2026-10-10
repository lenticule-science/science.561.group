---
name: links in a file
description: The set of markdown link references appearing in a file's body — pairs of (display text, target) extracted from markdown link syntax.
---

Links in a file is the multiset of `[text](target)` references parsed from a markdown file's body.
Each entry pairs a display text and a target.
Targets are either repository-local (a path or path fragment to another file) or external (`http://`, `https://`, `mailto:`, etc.).
The multiset is the image of an extraction function applied to a regular-file.

The form is observational: the markdown body either contains a link or it does not.
Two files have identical links-in-a-file iff their bodies emit the same `[text](target)` sequences after markdown parsing.
Targeting and resolution are separate operations on this data — `links-in-a-file` is the source data; whether a given target resolves to a file on disk is the output of a `resolving` morphism applied to it.
