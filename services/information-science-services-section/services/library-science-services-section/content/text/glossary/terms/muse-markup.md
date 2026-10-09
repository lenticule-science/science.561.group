---
description: The Emacs-Muse-derived, contextual plain-text markup format amusewiki uses as one source compiled into every delivered text format.
identity: muse-markup
name: Muse Markup
date-created: 2026-09-08
references:
  pessotto2016:
    authors:
      - Marco Pessotto
    title: amusewiki
    publisher: GitHub (melmothx/amusewiki); manual at amusewiki.org
    year: 2016
    url: https://github.com/melmothx/amusewiki
relations:
  enables:
    - print-on-demand
---
Muse markup, also called Text::Amuse markup, is the lightweight, contextual plain-text markup format the amusewiki publishing platform uses as a single source format for a text: 'a Muse document uses special, contextual markup rules to determine how to format the output result,' with 'not too many markup rules,' each meant to be simple enough that an author 'can focus on document creation, rather than formatting' (amusewiki manual, in Pessotto 2016). The format derives from Emacs Muse: amusewiki's own manual states plainly that it 'describes Muse, which was written by John Wiegley, then maintained by Michael Olson and heavily edited and partially rewritten for this implementation by Marco Pessotto.'

Muse markup is distinguished from a rendering-target format such as HTML, LaTeX, or EPUB by being authored once and compiled into every delivered format, rather than maintained as a separate document per format: the same Muse source amusewiki's manual describes compiles to plain text, HTML, EPUB, and imposed print PDF alike, and amusewiki's own 'Git backend' keeps that one source, and its revision history, as the canonical record rather than any one rendered output.

Because a single Muse source compiles to every delivered format, a digital library built on Muse markup can add a new output format without re-editing each existing text, and an editorial or moderation review happens once, on the Muse source, rather than once per rendered format the library also happens to publish.
