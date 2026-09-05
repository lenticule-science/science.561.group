---
type: concept
class: structural
status: settled
depends-on:
  - note.md
  - ../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md
see-also:
  - staging-area.md
  - ../specifications/theory-discipline.md
  - questions/what-makes-a-directory-a-theory.md
  - ../morphisms/theory-promotion.md
  - ../../teaching/explanations/directory-tree-carries-meaning.md
---

# Theory-directory

A **theory-directory** is a directory that has earned the canonical layout — `_index.md` plus `concepts/`, `objects/`, `morphisms/`, `theorems/`, `questions/`, `narratives/`, `examples/`, `references/` — and the right to declare `depends-on:` against other theories at the `_index.md` level.

A theory-directory is *not* simply a folder of related notes; it is a folder that satisfies the [theory-discipline](../specifications/theory-discipline.md) — committed subject, own concepts, own objects-and-morphisms, own claims, visible open work, front door. The discipline is exclusionary: most directories under `theories/` are *not* theory-directories — they are [staging-areas](staging-area.md) on the way to becoming one, or domain *containers* whose `_index.md` organizes child theories without itself being one.

## The promotion criterion

A directory becomes a theory-directory by promotion (see [theory-promotion](../morphisms/theory-promotion.md)), not by declaration. The criterion is that the discipline's six requirements hold *at the time of promotion*; a directory may carry an `_index.md` and the canonical sub-directories without being a theory if the requirements aren't met (the layout is a *necessary* but not sufficient condition).

The corollary is that the corpus contains directories at three structural levels:

1. **Container.** An `_index.md` that names a domain and lists child theories. Has no own concepts/objects/morphisms/theorems. `humanities/_index.md` is a container for the humanities domain.
2. **Staging-area.** A directory accumulating notes toward potential theory status. May carry typed notes, may declare some `depends-on:`, but does not yet satisfy the full discipline. Most child directories of containers are staging-areas.
3. **Theory-directory.** A directory that has met the discipline. Its `_index.md` may declare `depends-on:` against other theories; its content is auditable against the discipline's spec.

## Position in the substrate

A theory-directory is a [closure-rule-system](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) at the markdown-vault substrate: it commits to a closed vocabulary (its concepts), a fixed set of operators (its morphisms), a body of asserted claims (its theorems with their proofs), and a settled state (the relation graph among them) that closure-rule application stabilizes. The discipline's conformance rules are the closure-rule system's invariants applied at the file-tree level.
