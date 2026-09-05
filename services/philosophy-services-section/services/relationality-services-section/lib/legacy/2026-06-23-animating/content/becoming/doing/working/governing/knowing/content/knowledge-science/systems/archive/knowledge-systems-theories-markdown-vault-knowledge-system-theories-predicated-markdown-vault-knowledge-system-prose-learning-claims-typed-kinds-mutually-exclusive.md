---
type: theorem
status: sketch
depends-on:
  - ../teaching/explanations/note-type.md
  - ../specifications/note-types/_index.md
see-also:
  - questions/concept-vs-object-disambiguation.md
---

# The typed kinds are mutually exclusive (sketch)

**Theorem.** Let $T = \{\mathrm{concept}, \mathrm{object}, \mathrm{morphism}, \mathrm{theorem}, \mathrm{question}, \mathrm{narrative}, \mathrm{example}, \mathrm{reference}\}$ be the typed-note family the discipline admits. Under the discrimination rules stated in [specifications/note-types/](../specifications/note-types/), every well-formed typed note has *exactly one* type — the discrimination rules partition the space of well-formed typed notes.

## Proof sketch

The proof is by case-analysis on the discrimination rules; we sketch the eight pairwise exclusions whose conjunction with the rules' completeness gives the partition.

**concept vs. object.** A `concept` is a semantic anchor — its body says what role the anchor plays and how various objects realize it. An `object` (frontmatter `type: definition`) is a mathematical structure — its body gives a definition and may instantiate a concept via `realizes:`. The discrimination is: *does anything `realize` this note?* If yes, it is a concept (concepts are realized; objects realize). The rule is sharp: an object cannot realize itself, and a concept whose body gives a definition rather than a role-statement is mis-typed.

**concept vs. theorem.** A `concept` does not make a claim with proof-or-evidence; a `theorem` does. The discrimination is the body shape: theorems have `## Statement / ## Proof` (or a `status: sketch` proof outline); concepts have role-and-realization prose.

**object vs. morphism.** An `object` is a static structure (a definition); a `morphism` is an operation on structures. The discrimination is: *does the body specify a transformation taking an input to an output?* If yes, morphism; if no, object.

**theorem vs. example.** A `theorem` makes a general claim; an `example` exhibits a particular instance. The discrimination is the body: theorems prove a quantified statement, examples present a concrete instance and trace its substrate-properties.

**question vs. theorem.** A `question` states an open problem with position-and-stake and acceptance criteria; a `theorem` states a closed claim. The discrimination is `status:`: an open `theorem` is `status: sketch`; a `question` is `status: open` (or `closed` after a settling decision). A question has `explores:` edges; a theorem does not.

**narrative vs. concept.** A `narrative` walks a path through other notes; its load-bearing relations are `introduces:`, `recaps:`, `discusses:`, `chapters:`. A concept does not walk; it sits at one anchor. The discrimination is the relation pattern.

**reference vs. example.** A `reference` is bibliographic — a pointer to an external work with annotation. An `example` is internal — a concrete instance built within the corpus. The discrimination is: *does this note point at an external source?* Yes → reference; no → example.

**reference vs. narrative.** A `reference` is annotation of one external source. A `narrative` is internal exposition. Discrimination as above plus body shape.

**Completeness.** Every typed note has a `type:` field naming exactly one of the eight kinds (the frontmatter rule); the eight pairwise exclusions cover every pair. By induction over the type-family the partition holds. $\square$

## Corollaries

**(C1) The validation rule "exactly one `type:` field, drawn from $T$" is load-bearing.** Without it, the partition argument fails — a note declaring `type: [concept, theorem]` would belong to two cells of the partition.

**(C2) Multi-typed content goes in multiple notes.** A single substrate role that is "part concept, part object" is two notes that have not yet been split. The discipline's response to a contributor's "this is both a concept and a definition" is "factor the concept out, add a `realizes:` edge from the object to it."

**(C3) The 8-element family is closed by the discipline, not by mathematics.** New types are added only when a structural role appears that none of the existing types can carry. The corpus has not added a new typed kind since predication-categories established the family; the partition is stable for current work.

## What this theorem buys

The mutual exclusion is the structural fact that lets the corpus's validation and rendering treat the typed family as a discrete classification: a note belongs to *one* category; the renderer can place it in *one* canonical location; the relation-graph's typing rules can refer to a single source-type and target-type per edge. Without the partition, every typing rule would require a multi-type case split, and the discipline's pragmatic clarity (one note → one role → one audience) would dissolve.

The hardest case in practice — concept vs. object — is the subject of the open question [concept-vs-object-disambiguation](questions/concept-vs-object-disambiguation.md), which holds the boundary cases this theorem's proof sketch passes over. The theorem is `status: sketch` until those cases are resolved.

