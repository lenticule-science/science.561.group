---
name: substrate layer stigmergy
description: The substrate is a stigmergic trace field at the MALL-coordination layer in the technical sense of swarm-intelligence theory; evaporation is sublocale-nucleus evolution plus K4-sector migration, not value decay.
status: draft
depends-on:
  - ../../teaching/explanations/sector-selective-stabilization.md
---

# The substrate is a stigmergic trace field at the MALL-coordination layer

**Claim.** The FARS substrate satisfies the structural conditions of an environment trace field in the technical sense of swarm-intelligence theory, at the substrate-coordination layer. Specifically:

- *Location space* $L$ = the directory tree, with adjacency given by `_index.md` parent-child relations and by frontmatter relation predicates.
- *Value space* $V$ = $\mathbf{FOUR}$, intrinsic to $\mathbf{Eff}$ via the double-negation nucleus ([`four-is-image-of-omega-under-double-negation`](../../../theories/engineering/theories/tech/theories/computing/prose/learning/claims/four-is-image-of-omega-under-double-negation.md)).
- *Deposition* = the `admit` morphism in the predicated-computing operators.
- *Field-state evolution* = closure 2-monad iteration in $\mathcal{Kl}(!_\mathbf{CGS})$.
- *Evaporation* = sublocale-nucleus evolution plus $K_4$-sector migration (the $\mathrm{Cl}^*$-coalgebra counit and the equivariant cohomology dynamics).
- *Boundedness* = $\top, \bot$ bounds in $\mathbf{FOUR}$ and $H^{\geq 2} = 0$ in the cohomology.

The classical $O(N + |L|)$ cost-decoupling bound of [`stigmergy-decouples-coordination-cost`](../../../theories/engineering/theories/tech/theories/computing/theories/continuous-computation/theories/artificial-intelligence/theories/swarm-intelligence/theorems/stigmergy-decouples-coordination-cost.md) transfers verbatim when coordination cost is measured in substrate-layer MALL operations and consultation cost is held separate at the agent-layer LL/foreign position.

## Argument

The classical swarm-intelligence framework's `environment-trace-field` object specifies four well-behavedness conditions: boundedness below, boundedness above, monotone evaporation between deposition events, bounded deposition. The substrate satisfies the first two structurally ($\bot, \top$ in $\mathbf{FOUR}$). The substrate's deposition is bounded by the cell-cost-per-write being $O(1)$. The substrate's evaporation analog needs explanation, because $\leq_k$-monotonicity forbids value decay.

The substrate has two structural analogs of evaporation:

1. *Sublocale-nucleus evolution.* From any application's point of view, cells fade from visibility as the application's nucleus tightens. The cell remains in storage; the application's substrate view loses it. The cell-side $\leq_k$-monotonicity is preserved; the *visibility-decay relative to an application* is the analog of trace evaporation. The `retraction` morphism's sublocale-bounded mode (`theories/.../predicated-computing/morphisms/retraction.md`) names exactly this: a nucleus change is recorded as a substrate event, not a deletion. Categorically, this is the dualized closure 2-comonad's counit $\epsilon^* : \mathrm{Cl}^*(\mathcal{E}^*) \to \mathcal{E}^*$ — the projection that forgets coalgebra structure when it becomes redundant ([`closure-algebra-coalgebra-correspondence`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-algebra-coalgebra-correspondence.md)).
2. *$K_4$-sector migration.* Under the equivariant cohomology decomposition (`theories/.../predication-categories/theorems/equivariant-cohomology-decomposition.md`), cells migrate between isotypic sectors $H^1_\mathrm{id}, H^1_{\chi_\sim}, H^1_{\chi_-}, H^1_{\chi_{\sim\circ-}}$ as new evidence arrives. A cell's content stays the same; its sector membership can shift, changing its operational role. This bounds the cell's influence-over-time cohomologically.

Both are substrate-content events (witnessed in the event log), independent of participant count, and bounded. They satisfy the technical role of classical evaporation — *information that no longer matters becomes invisible to the response* — without violating $\leq_k$-monotonicity.

## Cost-decoupling

The classical cost-decoupling theorem assumes $O(1)$ per-agent cost. For agentic swarms whose participants are LL-cost-dominated, this fails at the agent layer. But at the *substrate layer*, per-participant cost is $O(1)$ (one cell write, one bounded-wavefront read). The classical theorem transfers when coordination cost is measured in substrate-layer (MALL) operations:

- $O(|L|)$ closure-rule application — substrate-layer, MALL, cell-wise, independent of participant count.
- $O(N)$ depositions — each participant emits one witness at $O(1)$ substrate-layer cost.
- $O(N)$ reads — each participant's bounded wavefront read at $O(1)$ substrate-layer cost.
- Plus $O(N \cdot c_\text{LL})$ agent-layer consultation cost, *additive* and *separable* per the [aperiodicity-as-tractability](aperiodicity-as-tractability.md) claim's aim-frontier discipline.

The substrate is a stigmergic trace field at the substrate layer. The fact that its operators are LLM-cost-dominated at the agent layer is a separate matter, governed by the aim-frontier ratio.

## Proof obligations for promotion to proved-status

- That sublocale-nucleus evolution satisfies all four well-behavedness properties of the classical `environment-trace-field` under the categorical translation given here.
- The bounded-wavefront read at $O(1)$ substrate-layer cost regardless of $|L|$ — depends on the [`wavefront-locality-via-cohomology-vanishing`](../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/wavefront-locality-via-cohomology-vanishing.md) theorem.
- A formal statement of the substrate-layer/consultation-layer cost separation as a corollary of the $\mathbf{Eff} \cap \mathrm{MALL}$ vs. LL/foreign categorical split.

## Position

Resolves the prior open question of whether the substrate constitutes a stigmergic trace field in the technical sense. The resolution combines: `retraction`'s two-mode discipline (predicated-computing), the closure-algebra-coalgebra correspondence under Jung-Rivieccio duality (predication-categories), the $K_4$-equivariant cohomology decomposition (predication-categories), and the categorical positioning of substrate vs. agent layers (theory-of-predicated-computing). Surfaced in the FAdRS-swarms survey, §7.1; promoted here to standalone claim.
