# sentence fiber algebra — the parser we deferred

spaCy-style grammatical parsing of a sentence, but the grammar is a **fiber algebra
over the word-tier base**, not a dependency **tree**. This is a design document — it
records a design we reached by studying the kernel on 2026-06-03, not facts derived
about prose. Where it cites the kernel the facts are in `voidmath-notes.md` and in the
kernel scripts named inline; reads it states as design are marked `[design]`.

`architecture.md` deferred this: "delimiter-first, parser-later, same base… a
tagger/parser, if we ever add one, just hangs more predicates (`is-subject`,
`agrees-with`) over the **same** `after`/`inside` base." This is that layer.

## The load-bearing finding (read from the kernel, 2026-06-03)

The kernel's cell-set is **Φ = E × Π × E** — a *binary* relation grid
(`scripts/predicate.mjs`: "emits the cell-set Φ = E × Π × E"). `seed-knowledge.mjs`
materializes the **full E × E grid per predicate**:

```js
assignments: entities.flatMap((subject) => entities.map((object) =>
  ({ cell: { subject, predicate, object }, charge: BOTTOM })))
```

So every fiber-algebra already contains every off-diagonal cell `(a, predicate, b)`
with `a ≠ b`, seeded ⊥. koine's current `descend.mjs` charges and reads back **only the
diagonal** (`subject === object`) and drops the rest as "noise"
(`descend.mjs:71`). An off-diagonal cell `(head, relation, dependent)` **is a dependency
arc.** The structure to hold a sentence's grammar is already in the kernel; koine has
only been using the unary (diagonal) half.

## The mapping

- **Entities E** = the words of one sentence (word-tier spans already articulated).
- **Predicates Π**, two kinds:
  - **part-of-speech** — diagonal cells `(word, is-noun, word)` charged `t`/`f`/⊥.
    One fiber-algebra per tag: `is-noun`, `is-verb`, `is-det`, `is-adj`, `is-adv`,
    `is-prep`, `is-pron`, `is-conj`, `is-aux`.
  - **dependency relation** — off-diagonal cells `(head, nsubj, dependent)` charged
    `t`. One fiber-algebra per relation: `det`, `amod`, `advmod`, `nsubj`, `dobj`,
    `pobj`, `prep`, `aux`, `cop`, `root`, …

## Why a sheaf and not a tree — the whole point

A dependency parser is a function "token → its one head": the output is a **tree**, and
the parser must commit to a single head per word even when the sentence is ambiguous.
That forced commitment is why cheap rule-based parsers produce garbage.

A fiber-algebra over Φ imposes **no** one-head constraint. So:

- The parser proposes **every arc its rules license** — overlapping, non-committal.
- Agreeing proposals settle to `t`; the undecided residue stays `⊥`.
- Where two analyses force **contradictory** roles on one cell, the kernel's
  `join-knowledge` yields **⊤** — the paraconsistent value. Genuine syntactic
  ambiguity (PP-attachment: "saw the man with the telescope") is **recorded**, not
  guessed away, and `report` routes it to a human. `[design]` No mainstream parser
  does this; it is the "weird but it keeps working" property, applied to grammar.

`[design]` This is what makes a cheap, deterministic, zero-dependency parser viable
where a cheap *tree* parser would not be: it is allowed to be non-committal **because
the lattice, not the parser, resolves competition.**

## Getting the grammar without a trained model

spaCy uses a trained neural parser; this repo rederives from the ground up, so no
trained weights. Instead:

1. **Tagger** (`construing/library/tagging/`). Closed-class words by **table**
   (determiners, prepositions, pronouns, conjunctions, auxiliaries, copulas — finite,
   listable sets). Open-class by **morphology + position** (suffix heuristics: `-ly`→adv,
   `-tion/-ness`→noun, `-ed/-ing`→verb-ish; capitalization; position after a
   determiner → noun-ish). A word the tagger cannot decide gets **multiple** tags or
   ⊥ — honest, and the lattice carries it.
2. **Attachment rules** (`construing/library/relating/`). Small, local, delimiter- and
   POS-driven arc proposers, e.g.:
   - determiner immediately before a noun → `det(noun, determiner)`
   - adjective immediately before a noun → `amod(noun, adjective)`
   - noun before a finite verb → `nsubj(verb, noun)`
   - noun after a finite verb → `dobj(verb, noun)`
   - preposition + following noun → `pobj(prep, noun)`; that prep attaches to the
     nearest preceding verb **and** the nearest preceding noun → two `prep` arcs that
     compete (the PP-attachment ⊤).
   Each rule proposes; none commits. Overlap is expected and desired.

## What it buys the linter

The checks `architecture.md` listed as **lost** without a tagger re-enter as predicates
over the same base:

- **true passive voice** — `nsubj` of a `be`-aux'd past participle, with the real
  subject identified (replaces the surface regex `passive-voice` rule).
- **subject–verb agreement** — `nsubj` arc + number features on head/dependent.
- **split infinitive** — `to` + `advmod` + verb.
- **dangling modifier**, **a/an** (already pure adjacency), etc.

These are new rule families hanging off `construing`'s output; the existing corpus is
untouched.

## Module tree (proposed)

```
construing/                                          # grammar as fiber algebra, not tree
├── scripts/construe.mjs                             # sentenceSpan, base -> { tags:[cell…], arcs:[cell…] } charged
└── library/
    ├── tagging/scripts/tag.mjs                      # wordSpan -> [{tag, charge}]  (may be MANY → ambiguity)
    │   └── library/lexicon/scripts/closed-class.mjs # the finite function-word sets
    │   └── library/lexicon/scripts/morphology.mjs   # open-class suffix/position heuristics
    ├── relating/scripts/relate.mjs                  # tagged words -> [{head, rel, dependent}] arc proposals
    │   └── library/attaching/scripts/*.mjs          # one file per attachment rule (det, amod, nsubj, dobj, pobj…)
    └── library/charging/scripts/cells.mjs           # tags+arcs -> kernel cells (diagonal POS + off-diagonal arcs)
```

## The one kernel-bridge change required

`descend.mjs` must **keep the off-diagonal cells** — overlay charges on
`(head, rel, dependent)` and read them back — instead of discarding `subject !== object`.
The diagonal path (today's behavior) stays for unary POS and for the style rules. This
is the only change to existing code; everything else is additive under `construing/`.

## Build phases (each ends green via a check in `_run_tests.mjs`)

- **P1 — foundation.** Teach `descend` to carry off-diagonal cells.
  *Check:* `check-arc-survives-descent` — overlay `nsubj(saw, dog)`=t on a 2-word base,
  settle, read `t` back off the off-diagonal cell.
- **P2 — tagger.** `tag.mjs` + closed-class table + morphology. *Check:*
  `check-tags-a-sentence` (function words exact; open-class plausible; undecidable → many/⊥).
- **P3 — arcs.** `relate.mjs` + attachment rules + `cells.mjs`. *Check:*
  `check-construes-a-simple-sentence` ("The dog saw the cat" → det, nsubj, dobj arcs).
- **P4 — ambiguity is ⊤.** PP-attachment fixture through the real pipeline. *Check:*
  `check-pp-attachment-is-top` ("saw the man with the telescope" → competing `prep`
  arcs JOIN to ⊤, routed to a human).
- **P5 — grammar rules.** Re-implement `passive-voice` over real `nsubj`+participle;
  add subject–verb agreement. *Check:* `check-real-passive-voice`.

## Open decisions

- Relation inventory: start with the ~10 above (a Universal-Dependencies subset), grow
  as rules need them. `[design]` start small.
- Whether arc composition (head-of-head) uses the base's `converse`/projection slots
  (the deep version) or stays plain off-diagonal cells in v0. **v0: plain cells.**
- Whether POS ambiguity (`bank` = noun|verb) should be ⊤ or just two `t` tags in two
  fiber-algebras (different predicates, no conflict). `[design]` two `t`s — different
  predicates don't conflict; conflict is reserved for one cell getting t and f.
