---
title: "Note types"
---

# Note types

The corpus admits eight note types. Every typed note in `theories/` SHOULD declare its type explicitly via `type:` frontmatter and SHOULD live in the corresponding directory of its theory. The two are independent guarantees: the directory tells a human reader where to find the note; the frontmatter tells the toolkit what shape to expect, even if the note is misfiled.

## The eight types

| `type:` value | Directory | Purpose |
|---|---|---|
| `concept` | `concepts/` | A semantic anchor — a recurring word or phrase the theory needs to fix the meaning of. Not a thing in itself; objects realize it. See [concept](concept.md). |
| `definition` | `objects/` | A definition introducing a thing the theory commits to: a mathematical structure, a record type, a substrate entity. See [object](object.md). |
| `morphism` | `morphisms/` | A definition introducing an operator, function, functor, natural transformation, or other structure-preserving map. Why morphisms get their own type: in many theories the operators carry as much content as the objects do. See [morphism](morphism.md). |
| `theorem` | `theorems/` | A claim with a status (`proved`, `sketch`, `draft`, `open`, `refuted`) and a proof or proof reference. One claim per file. `conjecture` is admissible as a `type:` value when the claim is asserted without serious proof attempt. See [theorem](theorem.md). |
| `question` | `questions/` | An open research question, structurally decomposed. Cites the theorems / morphisms / examples that bound and witness it. See [question](question.md). |
| `narrative` | `narratives/` | A 500–3000 word rhetorical document that walks a path through the material. Multiple narratives can cover the same objects from different angles. See [narrative](narrative.md). |
| `example` | `examples/` | A concrete instance or worked example that exercises one or more theorems / objects / morphisms end-to-end. See [example](example.md). |
| `reference` | `references/` | A citation to an external work, with annotation. One file per cited work. See [reference](reference.md). |

## What is *not* a note type

- **`text`** — the older free-form vocabulary uses `type: text` for general prose. New work SHOULD NOT use `text`; it has no schema and no machine-checkable role. Existing text notes are migration candidates per [term-to-typed-migration](../term-to-typed-migration.md).
- **`term`** — the older lexical vocabulary; see [term-to-typed-migration](../term-to-typed-migration.md). New work SHOULD use `concept`, `object`, or `morphism` instead, depending on what is being introduced.
- **`people`, `software`, `card`, ...** — domain-specific kinds that exist in pockets of the corpus. These are not first-class note types; they are local extensions that SHOULD be lifted to the typed vocabulary when their structural role becomes clear.

## What every typed note must have

Independent of type, every typed note MUST:

- Live as a markdown file with YAML frontmatter at the top.
- Declare `type:` as the first or near-first frontmatter key.
- Have a stable, lower-kebab-case slug as its filename (e.g. `predication-settling.md`, not `Predication Settling.md`).
- Carry exactly one entity. Two concepts SHALL NOT share a file; two theorems SHALL NOT share a file. If the body has multiple `# H1` headings, it is at least two notes.
- Have an `# H1` heading whose text is the entity's display name.
- Sit in the directory matching its type, in a theory that has earned the [theory layout](../theory-discipline.md).

Per-type requirements are stated in the per-type spec.

## Reading order

The per-type specs are written to be read in any order; the order in the table above is roughly "the order in which a new theory typically grows them": concepts before objects before morphisms before theorems; questions and narratives weave through the rest; examples land late; references accumulate alongside the work.
