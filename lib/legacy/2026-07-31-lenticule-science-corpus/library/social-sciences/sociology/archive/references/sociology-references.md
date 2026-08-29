---
title: "References"
description: "Sociology-discipline references — one annotated note per cited work, with a status field declaring whether the source has been read locally, skimmed, or cited via the secondary literature."
component-of: sociology
---

References for the sociology discipline. One markdown note per cited work, named `<surname><year>.md` (or `<surname1>-<surname2><year>.md`, `<surname1>-et-al<year>.md`). The notes here annotate works whose citations recur across sociology's subdomains.

The convention follows [predication-categories' references README](../../math/theories/categories/theories/predication-categories/references/README.md): each note declares `type: reference`, `authors`, `year`, `title`, `venue` in frontmatter, then in the body gives full citation, status (read / skimmed / abstract / via citation network / pending direct read), annotation (what the work contributes to our use of it), and optional "where used" pointers.

Source PDFs (when permitted and available) live in `sources/` named to match the cite-key.

## What is here

This pass adds notes for nine works already cited inline by sociology subdomains' frontmatter — Berlant 2011, Massumi 2002, Ahmed 2004, Davis 2003, Gilmore 2007, Kropotkin 1902, Graeber 2004, Horkheimer 1937, Marx 1867 — plus *pending direct read* stubs for canonical figures whose works recur in sociology's analytical vocabulary and for whom no annotated reference yet existed at the discipline level. A subsequent pass adds the four founding works of the [`black-feminism`](theories/critical-theory/theories/feminism/theories/black-feminism/_index.md) subdomain: [`combahee1977`](combahee1977.md) (the Combahee Statement), [`lorde1984`](lorde1984.md) (*Sister Outsider*), [`collins1990`](collins1990.md) (*Black Feminist Thought*), and [`spillers1987`](spillers1987.md) (*Mama's Baby, Papa's Maybe*). Where a figure's analytical contribution rests on more than one canonical work, the stubs are paired:

- W.E.B. Du Bois: [`dubois1903.md`](dubois1903.md) (*The Souls of Black Folk*) and [`dubois1935.md`](dubois1935.md) (*Black Reconstruction in America*)
- Max Weber: [`weber1904.md`](weber1904.md) (*The Protestant Ethic and the Spirit of Capitalism*) and [`weber1922.md`](weber1922.md) (*Economy and Society*)
- Émile Durkheim: [`durkheim1893.md`](durkheim1893.md) (*The Division of Labor in Society*), [`durkheim1895.md`](durkheim1895.md) (*The Rules of Sociological Method*), and [`durkheim1912.md`](durkheim1912.md) (*The Elementary Forms of Religious Life*)
- Pierre Bourdieu: [`bourdieu1972.md`](bourdieu1972.md) (*Outline of a Theory of Practice*) and [`bourdieu1979.md`](bourdieu1979.md) (*Distinction*)
- Erving Goffman: [`goffman1959.md`](goffman1959.md) (*The Presentation of Self in Everyday Life*) and [`goffman1974.md`](goffman1974.md) (*Frame Analysis*)
- C. Wright Mills: [`mills1959.md`](mills1959.md) (*The Sociological Imagination*)
- Charles Tilly: [`tilly1984.md`](tilly1984.md) (*Big Structures, Large Processes, Huge Comparisons*)

The pending stubs declare what the work is, why sociology needs it, and explicitly note that the annotation has not yet been written from a direct read. They are *honest stubs*: better to register the canonical reference than to leave the discipline silent about it.

## Person-level references

The `library/references/people/` directory at the repository root carries person-level reference notes (one per author) covering many figures sociology cites: Berlant, Povinelli, Mbembe, Gramsci, Han, Hochschild, Wiener, Beer, Ashby, Goldman, Malatesta, Glissant, Coulthard, Simpson, Spillers, Moten, Tuck, hooks, Butler, Marx, Foucault, Fanon, and others. Person-level notes there cover biography and corpus; work-level notes here annotate specific cited works.

Where a sociology subdomain cites a work whose author has a person-level note in `library/references/people/`, the convention is: the work-level note in this directory carries the annotation and citation, and the person-level note in `library/references/people/` is linked from the work note's body.
