---
title: "Questions"
description: "Discipline-level open work for sociology — questions whose scope crosses multiple subdomains, structural questions about the discipline's curation, and the explicit charter-alignment work registered against subdomains that need it."
component-of: sociology
---

The discipline-level open work for sociology.
Subdomain-specific questions live in each subdomain's own `questions/` directory; what is held here is the work whose scope crosses multiple subdomains, the structural questions about the discipline's curation, and the explicit charter-alignment work that the audit registered.

The longer-form follow-up plan, with concrete forward steps, lives in the prior sociology curation pass.
The questions here are the typed version of the items that plan registers — short, structural, with explicit pointers to where the answer would live.

The discipline-level convention these questions follow is [theory-discipline.md](../../../science/theories/information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/theories/predicated-markdown-vault-knowledge-system/specifications/theory-discipline.md).

## Open structural questions

- **How should `sociology/concepts/` and `sociology/terms/` relate?** The new concept notes and the older term anchors overlap in subject without overlapping in role.
  A future curation pass should add `realizes:`/`see-also:` edges from terms to concepts and decide whether the terms layer migrates, aliases, or persists in parallel.
- **Where does Black-feminist analysis belong as its own front door?** The discipline currently routes Black-feminist analysis through `black-radical-tradition/` and `queer/theories/kyriarchism/`.
  A `feminism/theories/black-feminism/` subdomain would give the analysis its own structural location.
- **What does an Indigenous-political-thought subdomain look like?** Indigenous political traditions are distributed across `indigenous-anarchism/` (under anarchism), `settler-colonialism/` (under povinellian), and (incompletely) the references-to-Coulthard-and-Simpson scattered across the discipline.
  The structural question is whether they belong as a sibling subdomain at the sociology level rather than as descendants of the European frameworks that engaged them.
- **Which subdomains are ready to graduate from staging-area to theory?** The audit classifies most sociology subdomains as staging-areas.
  The structural question — when does each one earn theory status under [theory-discipline.md](../../../science/theories/information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/theories/predicated-markdown-vault-knowledge-system/specifications/theory-discipline.md) — is the curation backbone of subsequent passes.

## Charter-alignment open work

- **Black-radical-tradition expansion.** The lineage carries body and terms but no `texts/`, no per-figure subdomains, no `questions/`.
  The most consequential charter work in sociology is here.
- **Indigenous-anarchism substance.** Beyond the body added in this pass, the subdomain needs named figures, references, and a connection to the contemporary land-defense corpora.
- **Cybernetic-postliberalism ↔ charter wiring.** The school's named key figures should include Black-radical and Indigenous figures alongside the affect-theory and cybernetics figures it currently lists.

## Where the corresponding answers would live

These are pointers to the subdomain or directory in which an answer to the question above would be developed:

- Curation questions → this directory and the prior sociology curation pass.
- Black-feminist front door → a new `theories/critical-theory/theories/feminism/theories/black-feminism/`.
- Indigenous-political-thought front door → either `theories/indigenous-political-thought/` (sibling at sociology level) or expanded `indigenous-anarchism/` and `settler-colonialism/`.
- Per-subdomain promotion → each subdomain's own `_index.md` and `questions/_index.md`.
