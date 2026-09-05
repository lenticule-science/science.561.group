---
title: "Predication Categories"
description: "The categorical study of bilattice- and quantale-valued predication structures: predicate categories of (s, p, o) cells, their fibrational refinements as predication hyperdoctrines, Priestley-dual cohomology of the resulting bitopological sites, and moduli of these systems."
component-of: categories
---


The categorical study of *predication structures* — bilattice- or quantale-valued $(s, p, o)$ relation cells fibered over a predicate category, refined to predication hyperdoctrines, dualized via Priestley correspondence onto bitopological sites, and stratified by the cohomology and moduli of the resulting settling dynamics.

The chief application that drove predication categories' development is **spatiotemporal knowledge**: the modeling of relations between entities whose epistemic state varies in space and time. The central object of that application — the [predication settling](objects/predication-settling.md) — is one named construction inside predication categories; it is not predication categories' frame. Other applications (CRDTs and distributed-systems causal histories, [predication fibers as paraconsistent linear-logic models](narratives/predication-fibers-as-linear-logic-models.md), the proof-theoretic and cultural sides of [ludics](../../../../../sociology/theories/ludics/)) sit inside the same categorical apparatus.

This entry is **not** organized as a sequence of papers. It is a working library of mathematical material — concepts, objects, morphisms, theorems, narratives, examples, questions, references, plus formal verification (Lean 4) and computational tools. Papers, when produced, are derived outputs; the structure here is the source.

## Convention

Every note is a Markdown file with YAML frontmatter. One mathematical entity per file. Filenames are active, lower-kebab-case slugs (e.g. `predication-hyperdoctrine.md`, `closure-2-monad.md`).

The directories below each correspond to one note type. Frontmatter declares the type explicitly (so a misfiled note still reports its true type) and carries the relations described in the next section.

```yaml
---
type: concept | definition | morphism | theorem | conjecture | question | example | narrative | reference
class: set | entity | predication | function | category | ...  # class-of-thing classifier (DAG navigation)
symbol: E                                               # canonical mathematical symbol for this term
status: draft | sketch | proved | open | refuted        # theorems & conjectures
lean: <Module>.<lemma> | [<Module>.<lemma>, ...]        # optional Lean proof(s), validated at build time
explores: [...]                                         # questions — entities the question is inquiring into
realizes: [knowledge, truth, ...]                       # objects/morphisms — concepts realized
depends-on: [bilattice, predicate-category, ...]        # strict logical dependency
closes: <object-slug>                                   # morphism that closes a chapter
chapters: [...]                                         # Part narratives — chapter ordering
see-also: [...]                                         # non-ordering cross-reference
introduces: [...]                                       # narratives — placed before first listed item
recaps: [...]                                           # narratives — placed after last listed item, inline
discusses: [...]                                        # narratives — placed at end of region
instantiates: [...]                                     # examples — placed after named items
---
```

`grep` is the primary index for navigation.

## Frontmatter relations

Each relation is a composable rule describing how the note relates to others. Together they form the data model the renderer uses to topologically sort the corpus into a sound mathematical reading order.

| Relation | Where it applies | Rendering rule |
|---|---|---|
| `depends-on: [...]` | any | Every listed item must appear *before* this note. Strict logical dependency — what the soundness of proofs and the determinacy of derivations rests on. |
| `realizes: [...]` | objects, morphisms | Names which concepts this structure realizes. Used for grouping and cross-reference; does not constrain linear order beyond what `depends-on:` gives. |
| `see-also: [...]` | any | Non-ordering. Produces hyperlinks/footnotes in a render but no topological constraint. For "this connects to..." remarks that are not logical dependencies. |
| `introduces: [...]` | narratives | Place this narrative immediately *before* the first listed item's appearance in the linear render. Used for introductions, motivations, outlines, and previews that orient toward what follows. |
| `recaps: [...]` | narratives | Place this narrative immediately *after* the last listed item, inline with the surrounding material. Used for section summaries, revisitations, and informal interpretations that gather what was just established. |
| `discusses: [...]` | narratives | Place this narrative *after* the last listed item, grouped at the end of the surrounding region. Used for chapter-end discussions, bridges to outside literature or other regions of the corpus, and forward-pointing outlook narratives. |
| `instantiates: [...]` | examples | Place this example *after* every listed item. An example follows the thing it exemplifies. |
| `closes: <slug>` | morphisms | Marks this morphism as the chapter-closing operator/functor for `<slug>` — the structural move that completes the chapter `<slug>` anchors. Used by the renderer to position the morphism at the end of that chapter. |
| `chapters: [...]` | Part narratives | Declares the ordered list of chapter narratives belonging to this Part. Used by the renderer to assemble Parts in the book. |
| `explores: [...]` | questions | Names the entities a question is inquiring into. Treated as outgoing-graph edges; questions are exempted from orphan-detection if `explores:` is non-empty. |
| `class: <class>` | concepts, objects, theorems, … | Classifier for the class of mathematical thing this is (e.g. `set`, `entity`, `algebra`, `operator`, `category`). Provides typed DAG edges: a query like "all things of `class: entity`" returns every term in that family. Not an ordering relation. |
| `symbol: <s>` | concepts, objects, morphisms | The canonical mathematical symbol denoting this term — `E` for an entity set, `p` for a predicate, $\Phi$ for a predication set. The symbol appears in formulas and at the moment of introducing the term in prose ("an element of a predicate set, denoted $p$"). Outside formulas and term-introductions, prose refers to the term by its linked name, never by bare symbol. Symbols should be **unique across the corpus** — the validator surfaces collisions as soft warnings, since two notes claiming the same canonical symbol breaks the disambiguation guarantee. Where a class of related morphisms naturally shares a symbol (e.g. the four predicate-category generators all written `f` in their definitions), pick distinguishing decorations (`f_\mathrm{spec}`, `f_\mathrm{conv}`, …) so the symbols stay distinct. |

The three narrative relations differ only in positioning — `introduces:` before-first, `recaps:` after-last-inline, `discusses:` after-last-grouped. A single narrative can carry more than one relation when it does more than one job (e.g. introducing some items and recapping others), though in practice most narratives have a single role. The semantic kind of narrative (introduction vs. motivation vs. summary vs. comparison vs. outlook) is body content, not frontmatter; the relation determines positioning, the body determines voice.

The relations are designed to compose. A topological sort respecting `depends-on:`, `introduces:`, `recaps:`, `discusses:`, and `instantiates:` produces a sound reading order; ties — siblings with no mutual dependency — are broken deterministically by the renderer (alphabetical by slug, say) and overridden case-by-case if reading flow requires it. `realizes:` and `see-also:` impose no order constraint.

The set is deliberately minimal. If a future case needs a relation not on this list (e.g. a `position-after:` for soft ordering between siblings), add it then; do not pre-emptively scaffold relations we do not yet need.

## Layout

Note types:

- `concepts/` — semantic anchors that recur across predication categories (truth, knowledge, observation, agreement, consistency, …). Not mathematical objects in themselves; objects *realize* them. Concept notes describe the role and discuss how it is realized differently across constructions.
- `objects/` — definitions of mathematical structures (presheaves, hyperdoctrines, bilattices, fibrations, the predication settling among them, …).
- `morphisms/` — functors, natural transformations, adjunctions, 2-cells. Morphisms get their own type because in predication categories many of them carry as much content as objects do (e.g. closure operators, dualization functors).
- `theorems/` — claims with proofs, sketches, or stated-only status. One claim per file.
- `questions/` — open questions, conjectures with no current attempt, and structure-shaping questions about what to construct next.
- `examples/` — worked examples and concrete instances.
- `narratives/` — short rhetorical documents (≈500–3000 words) that walk a path through the material, linking objects, theorems, and concepts into a story. Not authoritative for the math; multiple narratives can cover the same objects from different angles. This is where the through-line work happens.
- `references/` — one file per cited work, with annotation. Source PDFs in `references/sources/`.

Supporting infrastructure:

- `lean/` — a Lake project mirroring selected theorems as Lean 4 proofs. Notes carrying a `lean:` frontmatter ref are validated against this project at build time.
- `tools/` — Python scripts for validation, dependency audit, monograph build, and per-construction computation (regime classifier, Verdier dual, Anderson–Putnam cohomology, benchmark runners, …). Each tool lives under its own subdirectory with its own data; one-off computations and their inputs/outputs go here, not in `/tmp/`.
- `publications/` — rendered outputs (the monograph and any derived papers).
- `references.bib` — canonical BibTeX record for cited works.
- `research.toml` — toolkit configuration (corpus dirs, validator settings, build target).

## Why this shape

Two pressures shaped it.

First, organizing by paper forced every idea into "which paper does this belong to" rather than "what is this thing mathematically." Atomizing by type removes that distortion: an object lives in exactly one place and accumulates refinement there.

Second, atomization on its own loses narrative. The fix is to treat narrative as its own artifact (`narratives/`) and to treat recurring semantic anchors like *truth* and *knowledge* as their own type (`concepts/`) so that the through-line of "is this still the same truth?" is checkable rather than implicit.

The convention is designed for a much larger theory than what currently exists. Adding a new construction means adding files; it never means restructuring.
