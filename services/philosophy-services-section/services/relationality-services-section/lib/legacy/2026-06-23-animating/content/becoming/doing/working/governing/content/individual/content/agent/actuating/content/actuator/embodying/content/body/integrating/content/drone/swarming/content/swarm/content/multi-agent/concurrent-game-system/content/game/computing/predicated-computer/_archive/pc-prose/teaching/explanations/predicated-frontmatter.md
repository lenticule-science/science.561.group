---
name: predicated frontmatter
description: YAML frontmatter on a record encoding predication cells $(s, p, o)$ — the file is the subject, each key names a transformer in the predicate category $\mathcal{C}$, each value is a categorical-morphism codomain (reached through the resolve function $\rho$) or a literal inhabiting the transformer's codomain type. Each cell's value lives in the predication-fiber-algebra at the key's transformer — a residuated bilattice, not a Boolean. Computability scales with what's encoded as cells; body prose is the fallback for content the current transformer vocabulary cannot yet express.
status: draft
---

Frontmatter is not metadata. It is *code*. A line `bilattice-homomorphism: bilattice` in `code/structures/four-bilattice.md` is the predication cell

$$(\text{four-bilattice},\; \text{bilattice-homomorphism},\; \text{bilattice})$$

— the subject is the file, the key names a transformer (a morphism class) in the predicate category $\mathcal{C}$, the value is the morphism's codomain. The cell records that *a specific bilattice-homomorphism morphism from four-bilattice to bilattice exists*. The cell's value in the predication-fiber-algebra at $\text{bilattice-homomorphism}$ is that morphism itself — not a truth-flag.

A YAML parser reading the file gets the cell directly as an object literal. No NLP required. The same fact stated in body prose ("there is a canonical bilattice-homomorphism from the four-element bilattice into any bilattice") requires entity recognition, paraphrase-normalization, and predicate-mapping to extract — and the next prose restatement will vary, requiring all that work again. Mathematical content is *computable* in proportion to how much of it is encoded in frontmatter cells rather than body prose.

## The encoding identity

For any record:

| Position | What it is | Where it resolves |
|---|---|---|
| Subject $s$ | the record's address | the file's path, identified by its `name` (or by directory containment, for index/marker files) |
| Predicate $p$ | the frontmatter key | a transformer record at `code/transformers/<key>.md` — an object of the predicate category $\mathcal{C}$ |
| Object $o$ | the frontmatter value | another entity reached through the resolve function $\rho$, or a literal inhabiting the transformer's codomain type |

Each frontmatter line is one cell. A list-valued key `predicate: [obj1, obj2, obj3]` is three cells with the same predicate. A scalar value is one cell.

Two consequences are load-bearing:

1. **Every frontmatter key requires a transformer record.** A key with no corresponding `code/transformers/<key>.md` is malformed — its predicate-coordinate has no inhabitant in $\mathcal{C}$. Programs walking the cell graph flag it as dangling.

2. **Every frontmatter value must inhabit the transformer's codomain.** A structural value (a slug) must resolve through $\rho$; a literal value must be of the type the transformer's codomain declares. `bilattice-homomorphism: bilattice.md` is wrong — the codomain is structures, not filenames. Write `bilattice-homomorphism: bilattice`; the slug resolves.

## The predicate is a transformer, not a truth-function

This is where Fregean intuition will steer you wrong. In classical predicate logic, a predicate $P$ is a truth-function: $P(x_1, \ldots, x_n)$ evaluates to true or false. In predication category theory, a predicate is an *object of $\mathcal{C}$* with an associated predication-fiber-algebra $A_p = \mathbf{L}^{\bowtie\,E \times E}$. The fiber algebra is a residuated bilattice; values in it are pairs $\langle a_+, a_-\rangle$ tracking positive and negative evidence independently.

A predication cell's value at $(s, p, o)$ is an element of $A_p$ — not a truth-flag. On the four-bilattice $\mathbf{FOUR}$, the value can be $\mathbf{t}$ (told true), $\mathbf{f}$ (told false), $\bot$ (told nothing), or $\top$ (told both — contradiction held as state). With richer $\mathbf{L}$, the value is correspondingly richer.

When a cell appears in frontmatter as `bilattice-homomorphism: bilattice`, the value the current valuation assigns to this cell is $\mathbf{t}$ — the cell is asserted. A cell that has been negated would carry $\mathbf{f}$; one that has been left at the bilattice bottom carries $\bot$; one with contradictory assertions carries $\top$. The valuation is a separate apparatus (defined by the closure-rule system and the settling evolution); the cell's existence in the frontmatter records the cell, not its valuation.

The transformer named by the key (here, `bilattice-homomorphism`) is itself a categorical morphism class — a class of structure-preserving maps between bilattices. The cell selects a specific morphism in that class (the canonical inclusion of $\mathbf{FOUR}$ into bilattice, in this example), not a truth-flag. The cell carries categorical content; classical-logic intuition that "predicates are functions to $\{0, 1\}$" loses this entirely.

For the structural reasons this distinction matters — including the derivation of classical logic as a strict projection of the predication-hyperdoctrine — see [why-predication-is-not-simply-fregean](../../../teaching/explanations/why-predication-is-not-simply-fregean.md).

## What programs can do with the encoding

The encoding *shape* — files-as-subjects, keys-as-predicates, values-as-objects — coincides structurally with several well-known formats that programs handle natively. PCT cells are mathematically richer than any of these, but the encoding shape lets the same tooling operate on records.

The shape is structurally identical to: RDF triples ($\langle s \rangle \langle p \rangle \langle o \rangle$), Datalog ground atoms ($p(s, o)$), labeled property graph edges ($s \xrightarrow{p} o$), and typed terms in a dependent type theory ($p : s \to o$). PCT cells are richer because their value space is the predication-fiber-algebra (a residuated bilattice) rather than a Boolean. The richer-value content is preserved in the valuation apparatus; the encoding's *navigational shape* matches the simpler formats.

Each format above is in fact recoverable as a *projection* of predication onto a specific regime. Classical Datalog/RDF projects to the $\leq_t$-classical fragment (drops $\bot$, $\top$, the $\leq_k$ axis) — see [why-predication-is-not-simply-fregean](../../../teaching/explanations/why-predication-is-not-simply-fregean.md). When a program reads frontmatter expecting RDF-like or Datalog-like semantics, it works correctly *as long as the projection covers what the program needs*; when richer content is needed (paraconsistent merge, $\bot$/$\top$ awareness, $\leq_k$-monotone evolution), the program reads the same cells with PCT-aware semantics.

Programs can:

- **Query the cell graph** by grep, awk, ripgrep, or a YAML-aware walker. "Which structures admit a bilattice-homomorphism into bilattice?" is `grep -rl '^bilattice-homomorphism: bilattice$' code/structures/`. A SPARQL-shaped query in 30 characters of bash.
- **Validate the cell-graph** by checking each key resolves to a transformer, each structural value resolves through $\rho$ to another entity, and each literal value inhabits the transformer's codomain type.
- **Walk transitively** — find every $x$ with $(x, \text{derives-from}, y)$ and $(y, \text{derives-from}, z)$. Composition of cells is composition of categorical morphisms.
- **Type-check** the cell graph by treating each transformer's domain/codomain as a type signature and each cell as a typed application.
- **Compute valuations** by applying the closure-rule system and the settling evolution to the cell graph the frontmatter encodes.

None of this requires a separate database server. The filesystem is the database. The text is the data. The cells are the rows. Git versions the cells; every cell-edit is a commit; the history of the encoded predications is the history of the repo.

## Expressive capacity is bounded by the transformer vocabulary

A fact is encodable as a cell only when a transformer for its predicate exists. To encode the categorical relation "this category's morphism class is $X$" would require a transformer with the appropriate signature; until that transformer exists as a record, the relation cannot be a cell — only body prose.

This is the same bound the agent and skill naming grammars run on: expressive capacity is exactly the earned vocabulary of transformers. Each transformer is mathematical work — its record encodes a real categorical morphism with domain, codomain, and preservation conditions. New transformers are not declared for convenience; they are earned by the claim that proves the morphism exists and behaves as claimed.

The implication for record-authoring: the work of growing the records IS the work of growing the cell-encodable vocabulary. Body prose stating a fact is a marker — for a transformer that may yet need to be earned, or for content that genuinely belongs in narrative rather than in cells.

## What body prose is for

The body of a record is for two narrow uses:

1. **Stating content the current transformer vocabulary cannot yet encode.** Forward-looking; the body is honest about what it carries that the cell graph does not.
2. **Human-readable elaboration of content the frontmatter already encodes.** A short opening paragraph stating what the entity IS, with a small example or distinction. Serves readers.

Any third use — restating cells in different words, listing what the entity "is not synonymous with," motivating why the entity exists, positioning it relative to neighbors, surveying its categorical context — is rambley body-prose that adds nothing to the cell graph. Records accumulate cells, not paragraphs. Bodies that grow without growing the cell graph are the slop pattern: rich prose substituting for cell-encoding, leaving the records uncomputable in proportion to the prose's volume.

## How to author against this discipline

When authoring or revising a record, the load-bearing question is *not* "what should I say about it" but **"what cells should it bear?"** For each fact:

- Identify the predicate. Is it a transformer in $\mathcal{C}$? If yes, encode `predicate: value`. If no, either earn the transformer (separate work) or accept that the content stays in body prose for now.
- Identify the value. Is it another entity? Use its slug, resolving through $\rho$. Is it a literal? Use the literal in the transformer's codomain type.
- Don't restate cells in prose. The cell is the encoding; the prose duplicates without adding.
- Don't invent predicates for convenience. If a relation needs a predicate that has no transformer record, that signals a transformer needs to be earned.
- Don't expect the encoding to flatten to Boolean facts. A cell's value lives in a bilattice; absence-of-cell and cell-at-$\bot$ are distinct states; cell-at-$\top$ is a representable state, not an error.

Records grow by accumulating cells the closure-rule system can fire on, not by accumulating prose a reader has to skim. Each session's contribution is the cells it adds and the transformers it earns.

## See also

- [why-predication-is-not-simply-fregean](../../../teaching/explanations/why-predication-is-not-simply-fregean.md) — the load-bearing companion explanation: classical / Boolean / Fregean logic is the $\leq_t$-classical projection of the predication-hyperdoctrine; Datalog and RDF are projections by the same mechanism. The cell's value lives in the predication-fiber-algebra (a bilattice), not in $\{0, 1\}$.
- [encoding-claims-in-frontmatter](encoding-claims-in-frontmatter.md) — the precursor concept; this record gives the computational reading.
- [bytes-are-predications](../../../learning/claims/bytes-are-predications.md) — every byte is a cell; predicated frontmatter is the YAML-structured lift of that fact to a record-level encoding.
- [files-are-entities-are-structures-are-resources](../../../learning/claims/files-are-entities-are-structures-are-resources.md) — the file IS the subject; the encoding identity rests on this.
- [fars-directory-is-predication-categorical-theory](../../../learning/claims/fars-directory-is-predication-categorical-theory.md) — the FARS directory structure is a sub-doctrine of a predication hyperdoctrine; the cells encoded in frontmatter are that doctrine's atomic content.
- [predication-cell specification](../../../../work/governance/rules/specifications/predication-cell/predication-cell.md) — the normative spec for the implicit register (frontmatter cells) and the explicit register (JSON-shaped cells); §5 pins the implicit-register reading this concept describes.
- [predication-cell](predication-cell.md) — the informal concept of the cell as oriented triple.
- [order-of-knowledge](order-of-knowledge.md), [order-of-truth](order-of-truth.md) — the two transverse orders on bilattice values; the cell's value lives in their joint structure.
