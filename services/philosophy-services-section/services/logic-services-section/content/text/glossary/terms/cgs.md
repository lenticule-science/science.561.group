---
type: structure
status: active
depends-on:
  - dial-eff.md
  - eff.md
see-also:
  - ../prose/learning/claims/f-dial-eff-to-cgs-exists.md
  - ../prose/learning/claims/typed-subtheory-lattice-is-linear-logic-fragment-lattice.md
  - ../code/transformers/f-dial-to-cgs.md
  - ../questions/what-is-the-theory-of-computing.md
references:
  - Rideau-Winskel 2011
  - Castellan-Clairambault-Winskel 2014
  - Castellan-Clairambault-Winskel 2017
  - Hyland-Ong 1996
  - Abramsky-Ghica-Murawski-Ong-Stark 2004
  - Caires-Pfenning 2010
name: CGS — Concurrent Games with Symmetry
description: Concurrent games with symmetry (CGS) is the $$-autonomous category constructed by Rideau-Winskel (2011) and Castellan-Clairambault-Winskel (2014, 2017).
---

# CGS — Concurrent Games with Symmetry

**Concurrent games with symmetry** (CGS) is the $*$-autonomous category constructed by Rideau-Winskel (2011) and Castellan-Clairambault-Winskel (2014, 2017). It is the unified ambient for the typed theory of computing.

## Objects

A CGS object is a *prime event structure with symmetry*: $(E, \leq, \#, \tilde{E})$ where:
- $E$ is a set of *events*
- $\leq$ is a partial order on $E$ (causality: event $e$ must occur before event $e'$)
- $\#$ is an irreflexive symmetric binary relation on $E$ (conflict: $e$ and $e'$ cannot both occur in one play)
- $\tilde{E}$ is a *symmetry groupoid* — a groupoid of bijections on $E$ that preserve $\leq$ and $\#$, encoding which event permutations count as "the same" strategy

Events carry a Player/Opponent polarity label (P-events vs O-events).

## Morphisms

A CGS morphism $\sigma: A \to B$ is an equivalence class of *concurrent strategies* on the compound arena $A^\perp \| B$ (parallel composition with P and O roles of $A$ swapped). A strategy is a map of event structures $\sigma: S \to A^\perp \| B$ satisfying:
- **Receptivity**: O-events in $A^\perp \| B$ not blocked by $\sigma$ are always possible.
- **Innocence**: $\sigma$'s view of past events determines its next move.
- **Symmetry-invariance**: $\sigma$ maps symmetry automorphisms of $A^\perp \| B$ to the identity on equivalence classes.

## *-autonomous structure

$\mathbf{CGS}$ is $*$-autonomous:
- **Dual** $A^\perp$: swap P and O event labels.
- **Tensor** $A \| B$: parallel composition (events of $A$ and $B$ run concurrently, no causality between them).
- **Linear implication** $A \multimap B = A^\perp \| B$.
- **Unit**: the empty event structure.

## What embeds into CGS

All major typed paradigms embed as full sub-$*$-autonomous-categories:

1. **Sequential Hyland-Ong strategies** (1996): deterministic concurrent strategies with trivial symmetry. Full abstraction for PCF is the embedding theorem.
2. **Nominal computation** (AGMOS 2004): arenas with symmetry groupoid $\mathrm{FSym}(\mathbb{A})$ (finite permutations of a countably-infinite name set). Strategy equivalence tracks name-permutation equivariance, exactly the nominal-sets condition. Full abstraction for the $\nu$-calculus.
3. **Session-typed $\pi$-calculus** (Caires-Pfenning 2010): via the Caires-Pfenning correspondence, session-typed processes are CLL proofs; they land in $\mathbf{CGS}$ as the CLL model.
4. **Dialectica / Eff** (via $F$): the $*$-autonomous functor $F: \mathbf{Dial}(\mathbf{Eff}) \to \mathbf{CGS}$ embeds Dialectica objects as concurrent game arenas with trivial symmetry. $\mathbf{Eff}$ embeds via the Kleisli extension $F^!$.

## The theory of computing

$\mathbf{CGS}$ is the answer to "what is the theory of computing?" at the level of the typed theory. $\mathbf{Eff}$ is the answer at the level of discrete Turing computation. The two are related by:

$$\mathbf{Eff} \;\simeq\; \mathcal{Kl}(!_{\mathbf{CGS}})|_{\text{concurrent computable}} \qquad (\text{via } F^!)$$

making $\mathbf{CGS}$ the ambient and $\mathbf{Eff}$ the computable Kleisli fragment. See [f-dial-eff-to-cgs-exists](../concepts/f-dial-eff-to-cgs-exists.md).
