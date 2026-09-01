---
title: "Theorem notes"
---


A *theorem note* (frontmatter `type: theorem`, directory `theorems/`) carries one claim with a status and a proof or proof reference. One claim per file is non-negotiable: a file with two claims is two files. The claim is the unit of accountability for the theory.

The frontmatter `type:` accepts:

- `theorem` — for proved or substantively-attempted claims.
- `conjecture` — for claims asserted without serious proof attempt. The status field still applies; a conjecture can be `open`, `refuted`, or upgraded to `theorem` once a proof exists.

## Required frontmatter

```yaml
---
type: theorem
status: <draft | sketch | proved | open | refuted>
---
```

`status:` is mandatory and SHOULD be the most honest reading of the proof's actual state:

- **`proved`** — full proof in the body, or a Lean reference that compiles. The reader can audit the argument from end to end.
- **`sketch`** — the proof's structure is given but at least one step is hand-waved or has an explicit gap.
- **`draft`** — the statement is firm but the proof is in early stages (skeleton only, or under active development).
- **`open`** — the statement is firm but no proof has been attempted.
- **`refuted`** — a counterexample exists; the statement is false. The body cites the counterexample.

## Recommended frontmatter

- `realizes: [...]` — the concepts the theorem establishes things about.
- `depends-on: [...]` — the objects, morphisms, and prior theorems the proof cites. A theorem whose proof uses lemma X MUST list X here.
- `symbol:` — when the theorem is named after a canonical formula or invariant.
- `lean:` — the Lean 4 module path the proof mirrors. The build validates that the cited Lean module compiles; a theorem with `status: proved` and a `lean:` reference is *machine-checked*.
- `closes: <slug>` — when the theorem is the chapter-closing claim for a chapter (rare; most theorems are intermediate).
- `see-also: [...]` — non-load-bearing related theorems.

## Body conventions

A theorem note SHOULD have this shape:

```
# <Display name>

<Statement. Phrased as a theorem statement: "Let X be ... Then ..." or
"For every X, Y holds." Precise enough that it is unambiguous what is being
claimed. Mathematical theorems use display math; engineering theorems use
prose with cited types and operators.>

## Proof                                  (when status is proved or sketch)

<The proof. For Lean-verified theorems, a one-paragraph English summary plus
a pointer to the Lean module suffices ("See `<Module>.<lemma>` for the formal
proof; the structure is..."). For non-Lean-verified theorems, the proof is
spelled out, with each step justified by citation to a prior result.>

$\square$                                 (proved theorems end with the QED marker)

## Proof sketch                           (when status is sketch)

<As above, but with explicit gaps marked. Each gap names what would be needed
to close it. Sketches SHOULD describe the gap precisely enough that another
contributor can take the gap as a question and work it.>

## Why it matters                         (recommended)

<One paragraph on the theorem's structural role in the theory: what it
enables, what depends on it.>
```

The `$\square$` marker at the end of a proved theorem is the corpus convention; the FARS `proofs` lint rule checks for it on `status: proved` notes that lack a `lean:` reference.

## When to use `theorem` vs. alternatives

- Use `theorem` for any claim the theory proves, attempts to prove, or commits to as a target.
- Use `conjecture` (still under `type: theorem` at frontmatter level, with `status: open`) for an asserted-but-unattempted claim — except when the claim's status is the *content* of an open question, in which case use [question](question.md).
- Use [question](question.md) when the open work is structural — what to construct, how to characterize, which decomposition to take. A question is a research direction; a theorem is a single claim.
- Use [example](example.md) when the content is a concrete construction that witnesses or illustrates a theorem.

## Validation rules (informal — some enforced by FARS)

- A theorem note MUST declare `type: theorem` (or `conjecture`) and `status:`.
- A theorem note MUST contain exactly one `# H1` heading with the theorem's display name.
- A theorem with `status: proved` MUST have either a `$\square$` marker in the body OR a `lean:` reference (or both). The FARS `proofs` rule enforces this.
- A theorem with `status: sketch` SHOULD explicitly mark each gap (e.g. "**Gap:** the converse direction requires ...").
- A theorem's `depends-on:` set MUST resolve to existing notes in the corpus. Dangling references are diagnostics.
- A theorem-cluster forming a cycle in `depends-on:` is a soundness diagnostic.

## Examples

- Engineering theorem: [settlement-determinism](../../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/settlement-determinism.md). Predicated-computing's commitment that settling produces the same result given the same inputs.
- Sketch with named gaps: most of the `realizability-...-realizability` theorems referenced from [realizability-of-cohomology-classes](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/questions/realizability-of-cohomology-classes.md).
