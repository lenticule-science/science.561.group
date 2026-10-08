---
name: 2026-05-04-validation-failure-is-binary
description: Validation collapses to "permitted" or "loud failure" — no gradient
type: friction-log
class: validator
date: 2026-05-04
status: open
see-also: [2026-05-04-skills-emit-slug-field, 2026-05-04-validate-cross-theory-slug-resolution]
title: 2026-05-04-validation-failure-is-binary
date-created: 2026-05-04
---

# Validation collapses to "permitted" or "loud failure" — no gradient

While fixing slug-weirdness in fars, I considered removing `slug` from `convention.py`'s `META` known-frontmatter-key set.
The set's job is to classify recognized keys; what it permits is what doesn't get flagged on validation.
I left `slug` in the set and wrote up the reasoning to the captain as "removing would make every legacy record (which there are many of) flag a validation warning.
No benefit."

The captain's correction: *"you had to leave slug permitted to avoid 'loud failure' — we should have more gradient of failure methods so we don't have to do that."*

Tried: nothing else.
The available verdicts in fars's current validation surface are "permitted" (silent) or "rule violation" (loud).
I picked silent because the alternative was loud-and-substrate-noisy.

Had to: encode "slug-in-frontmatter is now disavowed but not yet cleaned up" by leaving slug permitted, with the disavowal living in memory and friction logs but not in the validator.
The substrate's own discipline doesn't reflect the convention shift.

Violates: the substrate's commitment that *what's true about the substrate is in the substrate*.
A convention shift the validator can't represent is a convention shift the substrate can't audit, can't measure progress against, and can't produce diagnostics for.
The disavowal lives outside substrate accounting.

Gap: the validator should support a *graded* outcome surface, not a binary permitted/violation.
Sketch of what the gradient might look like:

- **`error`** — substrate-incoherent; CI must fail; humans/agents must fix.
- **`warning`** — convention-violating but not substrate-incoherent; should fix soon; CI passes but counts.
- **`info`** — *legacy noise* / *convention shift in progress* / *FYI signal*; doesn't block anything but is visible in reports and trackable as the migration progresses.
- **`acknowledged`** — known issue with an explicit acknowledgement record; suppressed unless the acknowledgement is revoked.

This pairs naturally with the substrate's bilattice value-domain: `error` is `f-on-truth`, `warning` is `f-with-evidence`, `info` is `t-with-suspicion`, `acknowledged` is `t-with-witness`.
The mapping isn't fully obvious, but the four-level structure is already what the bilattice gives us.

Concrete first move: a third return-class besides "permitted" and "violation" — call it `convention-drift`.
Let `convention.py` mark `slug` as drift rather than permitted, and the validator emit a count rather than failing.
The substrate would then produce a count of "X records with `slug:` field" as visible signal; cleaning them up reduces the number; the migration progresses.

Adjacent: the [`closure/lint/`](../../../../../../../../../../../operations/engineering/fars/src/fars/closure/lint/) tree exists with rules like `fm-key-casing`, `trailing-newline`, etc. Some are arguably "info" rather than "warning" already — meaning the gradient is implicitly there in the codebase, just not explicitly named or carried through the API surface.
