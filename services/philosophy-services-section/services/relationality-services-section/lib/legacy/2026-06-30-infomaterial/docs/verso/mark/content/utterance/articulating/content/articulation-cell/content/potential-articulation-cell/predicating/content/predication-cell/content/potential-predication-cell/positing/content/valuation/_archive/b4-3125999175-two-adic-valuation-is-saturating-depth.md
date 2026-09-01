---
type: theorem
status: verified
depends-on: [collatz-settlement, settling-endofunctor, saturating]
---

# The 2-adic valuation is the saturating-shadow depth

A number-theory function falls out of the settlement as the run-length of one nucleus shadow.

## Statement

In the Collatz (or affine) settlement, immediately after each **transferring-shadow** step
(`n` odd → `3n+1`, an expansion), the orbit takes a maximal run of consecutive **saturating-shadow**
steps (halvings) before the next odd value. That run-length equals the 2-adic valuation:

$$\#\{\text{consecutive saturating-shadow steps after } n\mapsto 3n+1\} \;=\; v_2(3n+1).$$

Verified for all expansions in the orbits of seeds 7, 27, 97 in
`two-adic-valuation-is-saturating-depth.test.mjs`.

## Why

`v_2(3n+1)` counts how many times 2 divides `3n+1` — i.e. how many `n/2` contractions apply before
an odd residue is exposed. Each contraction is a saturating-shadow step (σ, backward-facing). So the
arithmetic invariant `v_2` is not primitive here; it is the **depth of the saturating nucleus shadow**
at that point of the orbit. This is the orbit-level reflection of `arithmetic-nuclear-computation`'s
claim that the saturation nucleus `σ_n` acts as divisor-lattice inflation with depth equal to the
prime-power exponent (for `p=2`, `v_2`).

## Consequence

The shortcut map `n ↦ (3n+1)/2^{v_2(3n+1)}` — the standard accelerated Collatz — is exactly
"one transferring-shadow followed by a full saturating-shadow run." The shortcut is the orbit with
each saturating run collapsed to a single move, and the run-lengths it collapses ARE the `v_2` values
whose distribution (geometric, p=1/2) the prior work measured. The 2-adic structure of Collatz is the
saturating shadow, seen at the resolution of runs.
