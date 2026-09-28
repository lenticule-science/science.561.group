---
title: Note on finding a market gap
date-created: 2026-09-27
type: note
authors: [claude-opus-5-5]
keywords:
  - market-gap
  - formal-concept-analysis
  - demand-evidence
  - supply-census
  - comparable-titles
  - structural-holes
  - attention-arbitrage
  - four
description: "How the Group finds a gap worth writing into: code the existing supply as a formal context (what each work is witnessed to have and to lack), state each demand as a set of wanted qualities carried by dated evidence, and read each demand against the supply with FCA and FOUR, so that a gap is claimed only where even the uncoded works could not fill it, a crowded shelf reads as crowded, and an unknown stays an unknown with a reading list. Includes the guard that separates filling a gap from flooding one."
---

# Note on finding a market gap

Paths below are relative to `lib/emsenn/services/561-group/services/`.

## Why this note exists

On 2026-09-27 the founder asked the Group to "improve our ability to write
content to fill market gaps, by using the best processes we can derive for
finding those market gaps". The first run is fiction: English-language
fiction with C-drama tropes that meets American feeling rules. The method
here is general. The same assay serves a book, a newsletter, a micro-drama
pitch (item 4 of the short-drama lane note), or an API.

## What a gap is

A gap is a combination of qualities that buyers ask for and that no work on
offer is witnessed to have. Three things follow from that definition.

1. **It is a combination.** Gaps are rarely a single missing quality. There is
   plenty of slow-burn romance and plenty of Chinese-inflected fiction; the
   question is whether any work has both, with the rest of what the reader
   asks for. The analysis has to reason over sets of qualities, which is what
   formal concept analysis does.
2. **"Not coded" is not "absent".** A work nobody has read for a quality
   might have it. A method that treats unknown as no will find gaps that are
   really gaps in the researcher's reading. The house rule, "unknown never
   zero", applies.
3. **Demand is evidence, not a wish.** A demand is stated only with dated,
   sourced evidence for it, and whatever evidence cuts against it is kept
   beside it.

## The method

1. **Name the question and the qualities.** Write down the qualities that
   distinguish works in this market, each with a one-line definition. Genre
   choices that exclude each other (contemporary or fantasy) are recorded as
   exclusions.
2. **Code the supply.** Take the works a buyer would compare, the
   comparable titles. For each, record the qualities it is witnessed to have
   and to lack, with the source that shows it. Where the evidence is thin,
   leave the quality uncoded.
3. **State the demands.** Each demand is a set of wanted qualities; a quality
   can be wanted absent (no on-page sex). Attach its evidence for and
   against, each item graded: primary (the buyers' own words, a platform's
   own list or figure), secondary (reporting), or aggregator (a statistics
   compilation).
4. **Assay.** The business research system's market-gap assay
   (`engineering-services-section/.../computer-business-systems-engineering-services-section/services/business-research-system-services-section`)
   reads each demand against the supply using metrologic's formal context,
   the house's one FCA implementation:
   - **witnessed**: works known to have every wanted quality (the extent of
     the demand's intent);
   - **agenda**: works that could still satisfy it, because none of the
     wanted qualities is denied for them. They are the next reading list,
     with the qualities still unknown for each;
   - **missing ingredient**: for each wanted quality, what the supply offers
     if that quality is dropped;
   - **gap reading** (FOUR, truth family): *true* when fewer works than the
     occupancy threshold could satisfy the demand even counting the uncoded,
     *false* when that many are witnessed to, and *neither* while the answer
     depends on works not yet read;
   - **demand reading**: told true by evidence for, false by evidence
     against. *Both* means the market wants it and resists it.
5. **Choose.** Candidates are demands whose gap and demand both read true. A
   demand reading *both* is a design constraint: the work must carry what is
   wanted and shed what is resisted. A gap reading *neither* is not a
   candidate; it is a reading list.
6. **Record it.** The study (`MarketGapStudy`) and its readings
   (`MarketGapReadings`) are records in the science section of the work's
   topic, and the work's evidence packet cites them. After release, the
   measure readout (sales, reviews, reader replies) is new evidence for or
   against the demand: the promote-to-research edge of the publishing note.

## Why this is the right analysis

- **FCA** gives the lattice of combinations the supply actually occupies.
  A demand's intent that closes onto nothing is exactly an unoccupied
  combination, and the per-quality drop shows its nearest occupied
  neighbours. The house already uses FCA to derive qualities from evidence
  rather than declaring them (the short-drama lane note's adaptability
  ranking; SignCraft's hole concepts).
- **Structural holes** (Burt, *Structural Holes*, 1992) explain why such gaps
  persist and pay. Two dense communities that do not talk to each other,
  here C-drama viewers and American romance readers, leave a hole that a
  broker who speaks both can fill.
- **Comparable titles** are how publishers already frame a book's market.
  The difference here is that the comps are coded, with sources, so the
  claim "nothing like this exists" can be checked and falsified.
- **Mental availability** (Sharp, *How Brands Grow*, 2010) warns that a gap is
  worth little if readers have no cue to find it. The demand evidence must
  include the words readers use to ask ("books like C-dramas", "slow burn",
  "closed door"), because those words become the listing's keywords.

## The guard: fill, don't flood

The house research memo on AI slop
(`science-services-section/content/text/documents/articles/notes/2026/08/20/research-memo-ai-slop-as-industrialized-synthetic-attention-arbitrage.md`)
defines slop as a production regime: cheap synthetic content routed to
wherever attention can be arbitraged, whose surface plausibility exceeds its
substance. Gap-finding is the same search that regime runs. What separates
the Group's use of it:

- **One considered work per gap, not volume.** A gap is filled by a work good
  enough that its readers come back, not by many works that exhaust the
  query.
- **The work passes the same gates as any other edition:** a lint, an
  independent proof, an acceptance bound to its bytes.
- **Disclosure.** Retailers and readers are told how it was made (the
  retail-listing AI disclosure, and the shop's "How it was made").
- **The demand evidence is published** with the work's research, so the
  claim that readers wanted it can be checked.

## Limits

- **Small samples.** The first study codes nine works; its gap reading is
  true *in that sample*. A supply census built from a platform's own lists
  (Goodreads shelves, a retailer's category pages) would make the reading
  stronger, and it is the next measurement.
- **Demand evidence is uneven.** Much of it is secondary reporting or a
  statistics aggregator. The grade on each item says so.
- **Coding is judgment.** Two coders can disagree on "slow burn". Disagreement
  is recorded as both readings, never averaged.
