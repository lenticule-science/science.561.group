---
description: Printing a copy only after it is ordered rather than in an advance bulk run, extended to bound books through imposition and, in a digital library, through a reader-facing bookbuilder.
identity: print-on-demand
name: Print-on-Demand
date-created: 2026-09-08
references:
  lulu2026:
    authors:
      - Lulu Press, Inc.
    title: How does Print-On-Demand work?
    publisher: Lulu Press
    year: 2026
    url: https://help.lulu.com/en/support/solutions/articles/64000255305-how-does-print-on-demand-work-
  printninja2016:
    authors:
      - PrintNinja
    title: Imposition and Pagination Printing Guide
    publisher: PrintNinja
    year: 2016
    url: https://printninja.com/printing-resource-center/printing-academy/pre-press-production/imposition-pagination/
    note: Published 2016-03-29, updated 2026-04-28 per the page itself, observed 2026-09-08
---
Print-on-demand is a method for printing books, and other products, at the time of purchase rather than in an advance bulk print run (Lulu Press, 2026). Because each copy is produced only after it is ordered, print-on-demand removes the fixed cost and the storage burden of a print run sized in advance: a title can stay available indefinitely at the cost of one copy at a time, rather than going out of print when a fixed run sells out or is remaindered.

Print-on-demand for a bound book depends on imposition: the arrangement of individual pages onto press sheets, called parent sheets, so that once a sheet is folded into a signature and trimmed, its pages read in the correct order (PrintNinja, 2016/2026). A digital library whose source format compiles directly to an imposed, print-ready PDF — as amusewiki's Muse source compiles to 'A4 imposed PDF' and 'Letter imposed PDF' outputs alongside its screen formats — folds bookbuilding into the same pipeline as reading: amusewiki's own bookbuilder tool lets a reader assemble a custom imposed PDF or EPUB from one or several texts before sending it to a print-on-demand service or a home printer.

Because imposition is a mechanical transform of a laid-out page, not a separate authoring step, a digital library that generates its screen formats from one structured source can add an imposed print format without asking a contributor to re-lay-out a single page — the same fact that lets a single Muse-marked-up source compile to plain text, HTML, EPUB, and imposed PDF alike.
