---
name: four-directory-structure
description: The derivation that a FARS filestore has exactly four mandatory top-level directories — prose, code, governance, and theories — corresponding to the four values of the FOUR bilattice under the cycle that appears in commutative diamonds, predication hyperdoctrines, and the four-regime dichotomy.
title: four-directory-structure
---

A [filestore](../../code/structures/filestore.md) encoding a predication fibration $(\mathbf{FOUR}, \mathcal{C}, E)$ has exactly four mandatory top-level directories.
These four are not organizational convention — they are the four values of $\mathbf{FOUR}$, forced by the same pattern that appears in the KZ-lax-idempotent diamond of the temporal 2-category, the Beck–Chevalley square of a predication hyperdoctrine, and the four-regime dichotomy of settling convergence.

## The pattern

The **FOUR** bilattice carries the Klein-four symmetry $K_4 = \langle \sim, - \rangle$ (negation and conflation).
This creates two orbits: the *knowledge-definite* pair $\{\mathbf{t}, \mathbf{f}\}$ (swapped by $\sim$, fixed by $-$) and the *knowledge-indefinite* pair $\{\bot, \top\}$ (fixed by $\sim$, swapped by $-$).
In the diamond:

```
        ⊤  (told both — synthesis)
       / \
      t   f  (told true / told false)
       \ /
        ⊥  (told nothing — origin)
```

The top/bottom pair $\{\bot, \top\}$ are dyads to each other (swapped by conflation); the left/right pair $\{\mathbf{t}, \mathbf{f}\}$ are dyads to each other (swapped by negation).
The cycle that drives the diamond is:

$$\bot \;\to\; \mathbf{t} \;\to\; \mathbf{f} \;\to\; \top \;\to\; [\bot \text{ of next level}]$$

This cycle is simultaneously **3**, **4**, and **5**: four positions in the diamond, three productive transitions within a level (the $\top \to \bot'$ step is the recursive boundary), and five canonical nodes when you count both sides of that boundary separately ($\bot^1, \mathbf{t}^1, \mathbf{f}^1, \top^1 {=} \bot^2, \mathbf{t}^2$).
The same shape appears in:

- The **KZ diamond** of the temporal 2-category: unit $\eta$, counit $\varepsilon$, multiplication $\mu$, comultiplication $\delta$ — four 2-cells from the adjunction $\mathbb{M} \dashv \mathbb{N}$, with the aperiodic regime being the regime where the diamond is "fully alive."
- The **Beck–Chevalley square** of a predication hyperdoctrine: the pullback square gives four corners; coherence at the boundary is the constraint that closes the square.
- The **four-regime dichotomy**: Strict ($\kappa < \omega$), Scott-continuous ($\kappa = \omega$), Transfinite-bounded ($\omega < \kappa < \omega_1$), Aperiodic ($\omega_1 \leq \kappa$) — four strata of the settling convergence function.

## The four directories

The four $\mathbf{FOUR}$ positions map to four mandatory directory kinds in a filestore:

| Position | Bilattice value | Directory | Role |
|---|---|---|---|
| Bottom | $\bot$ (told nothing) | `prose/` | Raw entity descriptions; initial predications not yet formally closed |
| Right | $\mathbf{t}$ (told true) | `code/` | Operative elements; predicates (transformers) and executable capabilities |
| Left | $\mathbf{f}$ (told false) | `governance/` | Constraint/normative layer; what defines invalidity and what bounds the operative layer |
| Top | $\top$ (told both) | `theories/` | Recursive synthesis; sub-theories that accumulate the filestore's full settled state |

The $K_4$ symmetry is productive here: - $\sim$ (negation) maps `prose/` $\leftrightarrow$ `governance/`: governance is the normative negation of prose — prose records what IS, governance records what MUST NOT or MUST be (the constraint dual). - $-$ (conflation) maps `code/` $\leftrightarrow$ `theories/`: a theory is the knowledge-resolved synthesis of its operative layer — when the code's closure operator reaches its fixed point $v^T_\infty$, that settled state is what a sub-theory exports.

The cycle is: prose (raw description) → code (make it operative) → governance (constrain and normalize it) → theories (synthesize into a sub-theory) → the sub-theory becomes the prose of the next level.
This is the snake's tail; it is the researching-then-idealization cycle operating at the substrate level.

## Why governance is necessary

The predication fibration requires a closure-rule system $\mathcal{S}$ to produce the settled state $v^T_\infty$ from $v_0$.
By the agential-self-generation invariant, those closure rules must be substrate entities — they inhabit the filestore, not an external configuration layer.
The layer that declares, validates, and updates the closure-rule system IS the governance layer.
Without governance, the filestore has entities (prose) and predicates (code) but no settling operator: it cannot derive new knowledge from what it has, and it cannot check conformance of its own content.

The governance directory holds: - `governance/rules/specifications/` — conformance rules for each entity kind (what is NOT a valid entity of that kind) - `governance/rules/closure-rules/` — inference rules that generate $v^T_\infty$ from $v_0$ (what the settling operator IS) - `governance/staff/skills/` — registered executable capabilities (what agents MAY do, bounded by modal restriction $\Box_R u_a$) - `governance/staff/characters/` — agent personas with their modal restrictions (what each agent IS NOT authorized to exceed)

Each sub-directory realizes the **f**-position's role: defining invalidity and constraining the operative and prose layers.

## Current approximation

The current nine-directory layout (`structures/`, `transformers/`, `claims/`, `theories/`, `concepts/`, `questions/`, `prose/`, `governance/`, `work/`) is an approximation of the four-directory structure.
The nine directories subdivide `prose/` and `code/` into finer kinds.
Reorganization into the four-directory form is correct in principle but premature until the boundary between `code/` and `prose/` is formally pinned — in particular, it is not yet decided whether `transformers/` belongs under `code/` (the operative predicates) or under `prose/` (the entity-form descriptions of predicates).
The four-directory structure is the destination; the current nine-directory layout is the working state.
