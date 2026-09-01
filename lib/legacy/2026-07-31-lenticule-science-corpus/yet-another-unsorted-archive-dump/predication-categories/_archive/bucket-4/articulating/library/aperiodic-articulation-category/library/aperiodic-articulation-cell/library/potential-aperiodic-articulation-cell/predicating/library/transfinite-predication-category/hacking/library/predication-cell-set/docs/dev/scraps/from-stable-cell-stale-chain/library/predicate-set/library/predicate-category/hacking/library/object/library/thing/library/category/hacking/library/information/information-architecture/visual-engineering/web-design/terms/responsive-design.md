---
name: responsive design
description: "Responsive design is an approach to web design in which a page's layout and presentation adapt to the size, resolution, and capabilities of the device displaying it. Rather than building separate versions of a site for desktop, tablet, and phone, a single HTML document uses flexible layouts and CSS media queries to rearrange itself for each context."
aliases:
- responsive design
- responsive web design
date-created: 2026-03-01 00:00:00
tags:
- web-design
references:
  - id: marcotte_ResponsiveWebDesign_2011
    type: document
    title: Responsive Web Design
    author:
      - literal: Marcotte
    issued:
      - year: 2011
---

Responsive design is an approach to web design in which a page's layout and presentation adapt to the size, resolution, and capabilities of the device displaying it. Rather than building separate versions of a site for desktop, tablet, and phone, a single HTML document uses flexible layouts and CSS media queries to rearrange itself for each context.

The term was introduced by Ethan Marcotte in a 2010 article for *A List Apart* and expanded in his book *Responsive Web Design* [@marcotte_ResponsiveWebDesign_2011]. Marcotte identified three technical ingredients: fluid grids (layouts sized in proportions rather than fixed pixels), flexible images (images that scale with their container), and CSS media queries (rules that apply only when the display meets certain conditions, such as width or orientation).

[Responsive design](./responsive-design.md) treats the variability of web devices not as a problem to solve but as a fundamental characteristic of the medium. The web is not a fixed canvas; it is an information space viewed through windows of unpredictable dimensions. Designing responsively means accepting that the designer does not control the final rendering — the reader's device, browser, and settings all participate in the outcome.
