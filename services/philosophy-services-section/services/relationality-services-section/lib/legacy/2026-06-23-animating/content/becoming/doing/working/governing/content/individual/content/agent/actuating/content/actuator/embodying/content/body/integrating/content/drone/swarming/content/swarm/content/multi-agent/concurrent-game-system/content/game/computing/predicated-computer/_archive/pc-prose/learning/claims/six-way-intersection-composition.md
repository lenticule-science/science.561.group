---
name: six-way intersection composition
description: The six-way intersection from the May 2026 drone-swarm surveys (learned + partially-observed + comm-constrained + adversarial + certifiable + airspace-compliant) composes via cobordism composition in Cob_settling, traversing LL/foreign → Eff → CLL → CLL_⊤ → MALL/MLL → MLL_linear-premises through the linear-logic fragment lattice.
status: draft
---

# Six-way intersection composition traverses the fragment lattice

**Claim.** The "hardest unsolved intersection" identified in the May 2026 drone-swarm surveys — **learned, partially observed, communication-constrained, adversarial multi-agent control with certifiable guarantees and realistic airspace compliance** — composes via cobordism composition in $\mathrm{Cob}_\mathrm{settling}$, with each of the six axes occupying a specific position in the linear-logic fragment lattice. The composite traverses the lattice as:
$$\underbrace{\mathrm{LL}/\text{foreign}}_{S_L} \to \underbrace{\mathbf{Eff}\text{-internal}}_{S_P} \to \underbrace{\mathrm{CLL}}_{S_C} \to \underbrace{\mathrm{CLL}_\top}_{S_A} \to \underbrace{\mathrm{MALL/MLL}}_{S_X} \to \underbrace{\mathrm{MLL}_\text{linear-premises}}_{S_R}$$

The composite cobordism $S_R \circ S_X \circ S_A \circ S_C \circ S_P \circ S_L : \mathcal{B}_\mathrm{world} \to \mathcal{B}_\mathrm{compliant\text{-}actuation}$ exists in $\mathrm{Cob}_\mathrm{settling}$ with closure ordinal equal to the ordinal sum across all six axes.

## Per-axis fragment-lattice positions

- **$S_L$ (learned).** Position: LL ambient or its non-deterministic extension. The bulk is the LLM; the bounded-entropy condition for emergence is not satisfied; the cobordism extracts the substrate-resident boundary from the non-deterministic bulk.
- **$S_P$ (partially observed).** Position: $\mathbf{Eff}$'s $\Sigma$-dominance. Partial observability is exactly the $\Sigma \hookrightarrow \Omega_\mathbf{Eff}$ partial-map classifier — semidecidable propositions. The cobordism's $\forall$-block antecedent in closure-rule language is the universally-quantified statement over a semidecidable predicate; transfinite-bounded regime follows because such statements can have arbitrary countable closure ordinals.
- **$S_C$ (communication-constrained).** Position: CLL (classical linear logic) via the Caires-Pfenning correspondence. Bounded-bandwidth, lossy, event-triggered communications *are* session types; session-typed processes correspond to CLL proofs; cut-elimination is the communication step.
- **$S_A$ (adversarial).** Position: paraconsistent CLL — the part of CLL that admits $\top$ internally without trivializing. W-MSR Byzantine consensus is intrusion detection at the bilattice-network-sheaf-consensus level: the cosheaf-side dual of the $K_4$-equivariant cohomology. The paraconsistent authority $a = \top$ is identity-on-payloads because the $\top$-firing is recorded as substrate content, not propagated as contradiction.
- **$S_X$ (certifiable).** Position: strict-regime MLL/MALL — $H^1 = 0$ structurally, substrate-decidable in bare-$\Pi_1$ plus the order relation `<`. The certifiable cobordism is an MLL/MALL program with explicit safe-set arguments.
- **$S_R$ (airspace-compliant).** Position: charter-tier discipline as MLL-level externally-given premises — regulatory anchors (FAA Remote ID, EASA U-space, etc.) are linear hypotheses, used once per dispatch, no copying. The ship's charter is itself an MLL structure: rules apply exactly once per firing.

## Composition algebra

By [`settling-cobordism-category` §Composition](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md): the composite exists in $\mathrm{Cob}_\mathrm{settling}$ with closure ordinal equal to the ordinal sum $\kappa_L + \kappa_P + \kappa_C + \kappa_A + \kappa_X + \kappa_R$. The TQFT-functor image $Z(S_R \circ \ldots \circ S_L)$ is the partition-function product by [`tqft-structure`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/tqft-structure.md) clause 1 (functoriality on composition).

The composite is *certifiable* (in the kyriarchical-governance sense) iff each component is certifiable *and* the strict-regime layer $S_X$ caps the composite: $\kappa_L, \kappa_P < \omega_1$ and the composite's safety-critical $K_4$-sectors remain zero through the composition. This is the lattice-level claim that a composite $*$-autonomous functor is bounded by its strictest-fragment factor when the path through the lattice ends in MLL.

## Significance

The May 2026 surveys' framing of "the hardest unsolved intersection" was the engineering articulation of what the categorical framework now names: certifying that the typed sub-$*$-autonomous-categories of $\mathbf{CGS}$ compose under the cobordism category $\mathrm{Cob}_\mathrm{settling}$, with composite certifiability inherited from the strictest fragment in the composition.

The decomposition has two engineering virtues:

1. *Per-axis applicability.* A particular deployment may need certifiability for only a subset of axes (e.g., $L + P + C$ without $A + X + R$ in a non-adversarial, non-airspace environment); the per-axis claims remain applicable while a mega-theorem would not.
2. *Composite computability.* The strict-regime cap at $S_X$ makes the composite's certifiability computable from the per-axis certificates, because MLL/MALL's $H^1 = 0$ structural property means safety-critical cohomology cannot grow once the path reaches the strict-regime layer.

The general structural fact — composition through the fragment lattice with the strictest factor capping the composite — is the framework's account. The kyriarchical specialization (using this as a dispatch certifiability gate) is in [`kyriarchical-agentics-may-2026`](../surveys/kyriarchical-agentics-may-2026.md), §7.

## Position

Specializes the cobordism-category composition apparatus (predication-categories) to the predicated-drone-swarm sub-theory's six-axis decomposition (predicated-drone-swarm/theorems/six-way-intersection-composition.md, sub-theory authored 2026-05-09), now equipped with the fragment-lattice mapping that the recently-proved theory-of-computing claim makes available. Surfaced in the FAdRS-swarms survey, §6.7; promoted here to standalone claim.
