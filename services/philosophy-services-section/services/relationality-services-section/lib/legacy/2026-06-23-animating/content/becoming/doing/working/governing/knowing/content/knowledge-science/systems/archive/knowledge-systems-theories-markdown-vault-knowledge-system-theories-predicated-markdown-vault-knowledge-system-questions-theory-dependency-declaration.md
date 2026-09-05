---
type: question
class: scoping
status: open
explores:
  - depends-on
  - theory-directory
  - component-of
see-also:
  - ../specifications/theory-discipline.md
  - ../specifications/frontmatter-relations.md
---

# What does it mean for one theory to depend on another?

The corpus has theories at varying depths of nesting; some theories use results from theories far away in the file tree (this theory uses both predication-categories under `humanities/math/categories/` and predicated-computing under `engineering/tech/computing/`). Currently there are at least three distinct ways inter-theory dependence is expressed:

1. **`component-of:`** in a theory's `_index.md` — names the *parent* theory the directory is a part of. Structural / containment relation.
2. **`depends-on:`** with relative paths — names theories whose results this theory uses.
3. **Implicit dependency by import** — a note inside this theory cites a note inside another theory via a relative-path link in body or `see-also:`, without the parent theories declaring anything.

The question: how should inter-theory dependency be declared, what does the declaration commit to, and how is it validated?

## Why it matters

Theory-to-theory dependency is what makes the corpus more than a pile of independent topic directories. A clean dependency graph enables reading orders, scope-of-impact analysis, validation that a theory's claims are well-founded relative to what it imports. A messy dependency graph produces unreproducible reading orders and silent breakage when an upstream theory changes.

## Sub-questions

1. **Granularity.** Does a theory `A` depending on theory `B` mean *every* note in `A` depends on theory `B`, or only the notes inside `A` that explicitly cite something in `B`? The first is theory-level dependency; the second is note-level dependency that is *summarized* at theory level.
2. **What gets imported.** When `A` declares `depends-on: B`, does that license notes in `A` to cite *any* note in `B` by bare slug, or do specific re-exports need to be declared? Programming languages handle this with explicit import statements; the corpus has not yet decided.
3. **Versioning.** Theories evolve. If `B` changes a definition, does `A`'s dependency need to declare which version of `B` it was written against? The corpus is currently unversioned. Is unversionedness sustainable?
4. **Cycle detection.** `depends-on:` is supposed to be acyclic. What does FARS do on a cycle? What is the recovery path when two theories grow into mutual dependence (which sometimes is just truth — bilattice and predicate-category co-evolved in predication-categories)?
5. **The `component-of:` / `depends-on:` distinction.** A subtheory is `component-of:` its parent. Is it also automatically `depends-on:` its parent? Inspection suggests usually-yes-but-not-always (a subtheory may be a *specialization* that the parent does not depend on, but the subtheory depends on the parent's general framing). Should one relation imply the other under stated conditions?
6. **The cross-discipline case.** This theory under `science/information/.../knowledge-systems/...` depends on a humanities/math theory and an engineering/tech/computing theory. The path traversal `../../../../../humanities/...` is awkward and brittle to directory moves. Should the corpus introduce a discipline-relative or globally-resolvable theory identifier?

## What an answer would look like

A small but complete inter-theory dependency specification: declaration syntax, semantics of declaration (note-level vs. theory-level), import scope (open re-export vs. explicit), versioning policy, cycle policy, and resolution rules across deep nesting.

The answer should also state how it interacts with `component-of:` and how it interacts with the `realizes:` edges that cross theory boundaries (an `object` in this theory `realizes:` a `concept` in this theory; can it `realizes:` a `concept` in a different theory? Probably yes; what does that commit to?).

## What is at stake in the wrong answer

A wrong answer makes theory composition silently broken or punishingly explicit. The right answer makes theory composition the natural way to grow the corpus.
