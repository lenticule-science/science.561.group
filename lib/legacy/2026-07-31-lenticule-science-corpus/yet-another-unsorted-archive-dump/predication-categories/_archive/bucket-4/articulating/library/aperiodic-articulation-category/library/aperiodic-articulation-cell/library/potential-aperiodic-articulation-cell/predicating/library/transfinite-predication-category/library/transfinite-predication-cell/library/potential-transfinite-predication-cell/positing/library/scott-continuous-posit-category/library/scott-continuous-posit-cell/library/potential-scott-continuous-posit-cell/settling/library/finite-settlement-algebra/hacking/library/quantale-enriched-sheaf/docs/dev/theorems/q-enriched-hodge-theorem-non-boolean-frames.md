---
type: theorem
status: sketch
depends-on: [q-enriched-derived-cohomology-boolean-d-frame, lawvere-laplacian-grothendieck-sites, quantale-enriched-sheaf]
---

# Q-enriched Hodge theorem on non-Boolean frames

Extends the [Boolean d-frame Hodge theorem](q-enriched-derived-cohomology-boolean-d-frame.md) from complete Boolean algebras to general frames (e.g., Heyting algebras, the open-set lattice of a non-discrete topological space). The substantive open question: does $\ker(L^n) = H^n$ hold when stalks lack Boolean complements?

## The conjecture

**Conjecture.** *For a $\mathsf Q$-enriched cellular sheaf $F$ with stalks complete frames (not necessarily Boolean) and frame morphisms as restrictions, the cochain cohomology $H^n_{\mathrm{coch}}(F)$ is isomorphic to the suffix-point set $\mathrm{Fix}(L^n)$ of the higher Hodge Laplacian, with each cohomology class containing a unique "harmonic representative" definable in some replacement for the Boolean orthogonal complement.*

## The structural obstruction

The Boolean case's harmonic-representative construction uses the **Boolean orthogonal complement** $S^\perp = \bigwedge_{s \in S} s^c$, where $s^c$ is the Boolean complement. In a general frame $L$, the analog is the **Heyting pseudo-complement** $\neg x := (x \to \bot)$, but pseudo-complement satisfies $x \wedge \neg x = \bot$ only in Boolean algebras; in general $x \wedge \neg x$ can be nonzero.

Consequently, in a Heyting algebra:

- The "orthogonal complement" $S^\perp$ defined via pseudo-complement is not closed under joins (the analog of the Boolean fact $S^\perp$ is a sub-algebra fails).
- The kernel-image relation $\ker(f^*) = \mathrm{image}(f)^\perp$ fails: in a Heyting algebra, $f^*(x) = \bot$ doesn't pin down $x$ uniquely as orthogonal-to-image.
- The harmonic representative $c \wedge S^\perp$ may not be a cocycle (it's not invariant under $\delta^n$ in the Heyting case).

Hence each ingredient of the Boolean Hodge proof breaks. Recovering the Hodge theorem requires either:

1. **A different harmonic-representative construction** that works in general frames (perhaps using regular elements, or a sub-Boolean-algebra of regular opens).
2. **Acceptance that the Hodge theorem fails** in general frames — the three notions of cohomology genuinely diverge, and the corpus's downstream theorems split into two cases (Boolean: three definitions agree; non-Boolean: only the cochain definition holds rigorously).

Structurally, option 1 is the natural research direction; the regular-element construction (where $x$ is **regular** iff $\neg \neg x = x$) gives a sub-Boolean-algebra of any Heyting algebra, on which the Hodge construction recovers. The question is whether cohomology classes admit regular harmonic representatives, which is non-trivial.

## Why this matters for the corpus

The corpus's typical setting is Boolean d-frame data, so the [Boolean d-frame Hodge theorem](q-enriched-derived-cohomology-boolean-d-frame.md) handles every chapter result. But the chapter's frontier extensions involve non-Boolean data:

- *Open-set lattices on continuous Priestley duals.* If the corpus extends to non-discrete Priestley spaces (with continuous topology rather than discrete cellular structure), the stalks become open-set lattices — Heyting algebras, generally not Boolean.
- *Continuous-valued bilattices.* If the bilattice $\mathbf L$ is replaced with a continuous bilattice (e.g., $[0, 1]^\bowtie$ for fuzzy logic), the d-frame structure becomes Heyting-flavored.

In both extensions, the Hodge theorem's status is open via this conjecture.

## What's open

- The conjecture itself.
- The regular-element approach: when can a cohomology class be represented by a regular element of $C^n$?
- The relationship between the regular-element approach and the Lawvere–Tierney topology on a topos (since regular elements generate a sub-topos with Boolean structure).
