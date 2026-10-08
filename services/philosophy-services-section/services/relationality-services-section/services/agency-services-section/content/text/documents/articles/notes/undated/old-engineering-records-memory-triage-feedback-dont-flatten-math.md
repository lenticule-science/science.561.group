---
name: feedback_dont-flatten-math
description: Historic issue — implementations collapse deep algebraic towers into shallow approximations. Curry-Howard-Lambek is real here, not analogy.
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: feedback_dont-flatten-math
---

When implementing the voidmath/relationality mathematics, we historically flatten many-layered algebraic structures into simpler math that can't actually support the needed complexity. The algebra closes and becomes the terms of another language, which has its own geometry — nested at every level. This is genuine Curry-Howard-Lambek: proofs = programs = morphisms, at every stratum of the tower.

**Why:** The captain has seen this happen repeatedly across years of implementation attempts. The temptation is to say "this is like X" and implement the simpler X, losing the tower structure that makes the math novel and powerful. The voidmath earns its complexity through forced derivation — each level is compositionally necessary. Simplifying to "vibes" loses the structural guarantees.

**How to apply:** When implementing anything from the triage math specs:
1. Check if you're collapsing multiple algebraic levels into one
2. If the spec says "the algebra of X becomes the terms of language Y which has geometry Z" — that's three distinct levels, not one
3. The EAVT graph should preserve stratum information, not flatten fibers into attributes
4. When in doubt, implement the full tower and let the simpler view be a projection, not a replacement
5. The Curry-Howard-Lambek correspondence means every type we define is also a logic and a space — don't lose any face
