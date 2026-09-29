---
title: Research on the management-thought corpora across the whole tree
date: 2026-07-15
type: note
kind: research
about: management-thought
description: "A non-sampling survey of /home/emsenn/info for prior art on how to organize, inventoried as consolidatable corpora rather than as file mentions."
provenance:
  recorded-by: rom-keldar/management-thought-survey
  recorded-on: 2026-07-15
---

# Research on the management-thought corpora

## What this is

A survey of the whole tree for prior art on how to organize, run in service of
consolidating that prior art into `lib/emsenn/lib/management-thought/<tradition>/`
node micro-enterprises. It inventories **corpora** — coherent bodies of material
that could each become one ME — rather than counting files that mention a word.

## Method, and its limits

Six passes, each with deliberately different vocabulary, over all tracked
markdown outside `node_modules`.

**Denominator.** 52,884 tracked `.md` files. 50,180 of them (94.9%) are under an
`archive/` or `_archive/` path; only 2,704 are live. The archive is the corpus,
not a footnote.

**Two method errors were made and corrected**, recorded here because both would
have produced confident wrong numbers:

1. Pass 1 used `rg -ril`, which parses as `--replace=il`, not as
   "recursive/insensitive/files-with-matches". Every Pass 1 figure was a *line*
   count with the matched text substituted, not a file count. All Pass 1 numbers
   were discarded, not adjusted.
2. `xargs dirname` split on whitespace; filenames in the archive contain spaces,
   producing a phantom "211 files at `.`" row.

**Collection did NOT reach a fixed point.** The stopping rule is two consecutive
full passes adding nothing new. Passes 2, 3 and 6 each added strata the prior
passes could not reach — Pass 2 found the `tiospaye` spelling (Pass 1 searched
only `tiyospaye|thiyospaye` and missed 46 files) and a Stafford Beer stratum;
Pass 6 found `predicated-work`/`predicated-governance` entirely. **Every count
below is a lower bound.** Further passes should be expected to find more.

## The corpora

### Live (essentially nothing)

| Corpus | Files | Note |
|---|---|---|
| `management-thought/huidu-guanli` | 11 | Chinese/Huawei glossary |
| `management-thought/rendanheyi` | 21 | Haier glossary, written 2026-07-15 |
| `561-group/content/offices` | 10 | the working office system |
| `561-group/content/glossary` | 4 | only 4 terms total |

Live management thought is ~46 files against ~50,000 archived. The firm is
operating on almost none of what it has earned.

### Archived (large, and organized by nobody's decision)

| Corpus | Files | Tradition |
|---|---|---|
| `_archive/library/social-sciences/sociology` | 1,380 | work studies, critical theory, anarchism |
| `_archive/library/social-sciences/governing` | 809 | politics/governance, Ostrom |
| `_archive/library/social-sciences/working` | 559 | work studies incl. 502-file `discipline-intake` |
| `_archive/animating/.../endeavor/organizing` | 414 | Western org ontology |
| `_archive/existence/lakota` | 318 | Lakota, incl. governance + politics |
| `pyfars/governance` (in `src/archive`) | 152 | a prior *implemented* office system |

### The traditions actually present

Seven distinguishable bodies, not two:

1. **Chinese management** — huidu-guanli (live, 11) + rendanheyi (live, 21).
   The only tradition currently in ME shape.
2. **Lakota governance** — `_archive/existence/lakota/.../lakotaean-governance`
   (62 files, philA/philB) and `.../lakotaean-politics` (55). Contains structures
   (`tiyospaye`, `oyate`, `naca-office`, `omniciye-council`, `blotahunka`,
   `wakichunza-office`, `akicita-band`, `wolakhota-closure-system`,
   `heyokha-vocation`, `zuya`) and transformers (`generosity-firing`,
   `gift-economy-redistribution`, `hunkapi-citizenship`,
   `banishment-as-relation-severance`, `iyuha-sni-withdrawal`). This is the
   "lakotean-management-thought scattered into other documents."
3. **Western organization theory** — the `organizing/` ontology (414) plus the
   `discipline-intake` (502): Drucker, Deming, Taylor, Fayol, Mintzberg (301
   files), Coase/Williamson/transaction cost (25).
4. **Cybernetic management** — Stafford Beer, viable system model, syntegrity,
   algedonic (139); Ashby/requisite variety (172). Concentrated under a
   `cybernetic-postliberalism` node. Not previously named as a tradition here.
5. **Anarchist / mutual-aid organization** — mutual aid + Kropotkin (1,141),
   concentrated in `sociology/critical-theory/anarchism`, with a substantial
   `disaster-response` / `emergent-disaster-response` sub-corpus.
6. **Commons governance** — Ostrom, common-pool, polycentric (52). Small.
7. **The firm's own predicated governance** — `predicated-work` (351) and
   `predicated-governance` (230), plus `pyfars/governance` (152) as an
   implementation with charter, offices, duties, and incumbents. Only **4** live
   mentions remain. This is the firm's own native answer and it is effectively
   dead in the live tree.

## Findings that bear on the plan

**"Western" is not one tradition.** It is at least three — organization theory,
cybernetic management, and anarchist/commons organization — with different
premises and no common vocabulary. A single `western-management-thought` ME
would re-create the murk rather than resolve it.

**Duplication is real but modest.** Of 2,005 files matching management
vocabulary, 1,707 hashes are distinct: ~15% are exact duplicates. This is a
floor, since re-filings with edited frontmatter do not hash-match. The earlier
guess that the material was massively (4×) re-filed was wrong and is withdrawn.

**The most valuable corpus is the firm's own, and it is the one closest to
lost.** `predicated-governance` + `predicated-work` + `pyfars` is prior art the
firm paid for, and unlike Drucker or Beer it cannot be re-acquired from the
outside world if it rots.

**pyfars is prior art on this exact question.** It is an implemented office
system with a charter, offices, duties, and named incumbents — including a duty
called `maintain-enterprise-from-degeneration`. Any office/ME design here should
read it before re-deriving it.

## Recommended consolidation order

Named against the "don't boil the ocean" constraint:

1. `management-thought/lakotaean-governance/` — 62+55 files, already
   structure/transformer-shaped, and the tradition the institution actually *is*.
2. `management-thought/predicated-governance/` — rescue the firm's own, cite
   pyfars.
3. `management-thought/cybernetic-management/` — Beer/Ashby; small, coherent,
   directly about node/recursion structure.
4. Western organization theory — last, and split rather than lumped. It is the
   largest, the murkiest, and the only one re-acquirable from outside.

## Open

Collection is not closed. The next pass should try: Chinese-language terms in
the archive, `wolakhota` variants beyond those tried, the
`2026-07-05-561-group/working/hacking/composting/` tree (which appears to hold
re-filed copies of several corpora), and the git history for deleted governance
material.
