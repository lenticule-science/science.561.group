---
name: three layer architecture stratifies fragment lattice
description: The three-layer hierarchical safety architecture from the predicated-drone-swarm sub-theory (foundation-model / optimization-control / certified-safety-shield) stratifies through the linear-logic fragment lattice MLL ⊂ MALL ⊂ {ILL, CLL} ⊂ LL. The composite is a *-autonomous functor traversing the lattice top-down; the strict-regime cap is the lattice-bottom property.
status: draft
---

# Three-layer hierarchical safety architecture stratifies the fragment lattice

**Claim.** The predicated-drone-swarm sub-theory's three-layer hierarchical safety architecture is structurally a stratification through the linear-logic fragment lattice $\mathrm{MLL} \subset \mathrm{MALL} \subset \{\mathrm{ILL}, \mathrm{CLL}\} \subset \mathrm{LL}$ (per the theory-of-computing's [`typed-subtheory-lattice-is-linear-logic-fragment-lattice`](../../../theories/engineering/theories/tech/theories/computing/prose/learning/claims/typed-subtheory-lattice-is-linear-logic-fragment-lattice.md)). Each layer is positioned at a specific level of the lattice; the composite cobordism in $\mathrm{Cob}_\mathrm{settling}$ is a $*$-autonomous functor traversing the lattice top-down.

- **Layer 1 — foundation-model**, foreign-interior bulk. Position: the full ambient $\mathbf{CGS}$ or its non-deterministic extension. The LLM/learned model duplicates inputs and discards intermediates — both contraction and weakening — which is the full LL fragment with the $!$-comonad acting freely. Action distributions have unbounded entropy.
- **Layer 2 — optimization-control**, deterministic bulk (CBF/MPC/QP). Position: ILL — Kleisli of $!$ on a $*$-autonomous model. Cartesian closed structure is recovered; the bulk is replay-byte-identical. This is the level of typed deterministic computation: PCF, System F, Martin-Löf type theory.
- **Layer 3 — certified-safety-shield**, strict-regime bulk, $H^1 = 0$ structurally. Position: MALL or MLL — no $!$ comonad, no copying, finite case-enumeration. Resources are linear; the safety shield uses each input exactly once. The strict regime in the four-regime dichotomy ($\kappa < \omega$) corresponds to the MLL/MALL fragments where cohomology vanishes trivially.

The composite $S_3 \circ S_2 \circ S_1$ is a $*$-autonomous functor traversing the lattice top-down: $\mathrm{LL}/\text{foreign} \to \mathrm{ILL} \to \mathrm{MALL/MLL}$.

## Argument

The fragment lattice is settled by [`typed-subtheory-lattice-is-linear-logic-fragment-lattice`](../../../theories/engineering/theories/tech/theories/computing/prose/learning/claims/typed-subtheory-lattice-is-linear-logic-fragment-lattice.md): each inclusion is a full $*$-autonomous embedding, with the lattice corresponding to the typed subtheories of $\mathbf{CGS}$. MLL is bare resource-sensitivity (each hypothesis used once); MALL adds deterministic choice via additive connectives; ILL adds the $!$-comonad recovering CCC structure on $\mathcal{Kl}(!)$; CLL adds game-semantic duality; LL is the full ambient.

The predicated-drone-swarm sub-theory's three-layer architecture has three structural properties that correspond to fragment-lattice positions:

- *Foundation-model's foreign-interior bulk* — non-deterministic, unbounded copying and discarding — has the structural signature of full LL with `!` acting freely (or its non-deterministic extension above LL). The bulk is opaque to the substrate because the substrate is at a lower fragment than the bulk operates in.
- *Optimization-control's deterministic bulk* — computable, replay-byte-identical, typed — has the structural signature of ILL ($\mathcal{Kl}(!)$). PCF and System F live here as standard examples; CBF/MPC/QP solvers are operationally in the same class (typed deterministic computation).
- *Certified-safety-shield's strict-regime bulk* — finite case-enumeration, $H^1 = 0$ structurally — has the structural signature of MLL/MALL. No copying (resources used exactly once); no $!$-comonad available. Strict regime in the four-regime dichotomy is exactly the regime where $H^1$ vanishes (per [`strict-regime-cohomology-vanishing`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/strict-regime-cohomology-vanishing.md)), which is precisely the MLL/MALL fragment.

The composite cobordism $S_3 \circ S_2 \circ S_1$ in $\mathrm{Cob}_\mathrm{settling}$ has closure ordinal equal to the ordinal sum $\kappa_1 + \kappa_2 + \kappa_3$. The strict-regime layer 3 *caps* the composite at the layer-3 ordinal if layers 1 and 2 are bounded — because MLL's lattice-bottom position structurally forces vanishing in $H^1$.

## Significance

The three-layer architecture's engineering reading is "the unsafe model proposes, the safe shield disposes." The structural reading the present claim adds: this is a $*$-autonomous functor that *descends* through the fragment lattice, with each layer's bulk-vocabulary structurally more restrictive than the layer above. The descent is what guarantees the composite's safety: whatever the LL-bulk emits as proposed action, the MLL/MALL-bulk shield refuses anything that would push the composite's safety-critical $H^1$-sectors away from zero, because the shield's own fragment cannot produce non-vanishing cohomology in those sectors.

The kyriarchical-agentics realization uses this architecture as the substrate-algebraic shape of MHC-compliant dispatch (see [`kyriarchical-agentics-may-2026`](../surveys/kyriarchical-agentics-may-2026.md), §5). The captain's accountability over the composite is tractable because the shield's strict-regime cap makes the composite's safety-critical cohomology computable.

## Position

Connects the predicated-drone-swarm sub-theory's three-layer architecture (kyriarchical-governance engineering structure) to the theory-of-computing's linear-logic fragment lattice (general categorical structure). The connection was implicit in the sub-theory's positioning of the layers; the present claim makes the fragment-lattice mapping explicit. Surfaced in the FAdRS-swarms survey, §6.6; promoted here to standalone claim.
