---

title: Babble, 2025-08-28 08:53 – adding Org-cite to GnoponEmacs
author: emsenn
date-created: 2025-08-28
keywords:
  - babble
  - gnoponemacs
  - org-mode
  - citations
publish-to:
  - emsenn-net
---

This morning, I'm planning on adding Org-cite to GnoponEmacs.

I'm reading a series of guides on Org-cite, starting with the announcement post from the Org-mode mailing list, and looking at how it distinguishes between citation interaction and rendering, the role of citation processors (`basic`, `biblatex`, `natbib`, `csl`), and how to hook this into my own bibliography `orgcite.bib`.

I've added an example BibTeX entry for Jens Kipper's *A Two-Dimensionalist Guide to Conceptual Analysis* and verified that `[cite:@Kipper2012]` and `#+print_bibliography:` work in exported text.

From here, there are two things to do:

1. Figure out how I want to add citations to the bibliography.  
2. Figure out how this integrates with Org-roam, especially for sources that already have their own Org-roam nodes.  

The Org-roam manual suggests using `ROAM_REF` for citation keys, which I'll explore next.

