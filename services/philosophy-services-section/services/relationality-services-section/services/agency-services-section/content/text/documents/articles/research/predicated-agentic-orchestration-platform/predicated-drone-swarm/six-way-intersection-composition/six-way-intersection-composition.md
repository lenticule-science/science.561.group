---
type: theorem
status: sketch
class: composition-theorem
depends-on: [settling-cobordism-category, tqft-structure, predicated-drone-collective-fails-classical-stigmergy, embodied-cost-quantale-extends-monetary, safe-envelope-precheck-as-bilattice-modal-suspension, meaningful-human-control-as-charter-c3-extension, coordination-across-handedness-asymmetric-participants]
see-also: [verify-certifiability-sectors]
proof-target: subsequent-session
title: Six-way intersection composition
description: "The May 2026 surveys identify the hardest unsolved intersection: learned, partially observed, communication-constrained, adversarial multi-agent control with certifiable guarantees and realistic airspace compliance."
---

# Six-way intersection composition

The May 2026 surveys identify *the hardest unsolved intersection*: **learned, partially observed, communication-constrained, adversarial multi-agent control with certifiable guarantees and realistic airspace compliance**.
This theorem establishes that PyFARS's substrate algebra composes the existing techniques for each of the six axes via cobordism composition in [`Cob_settling`](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md).
The composition theorem is the substrate-algebraic content of "certifying that they compose."

## Statement

**Theorem (six-way intersection composition).** *Let the six axes of the unsolved intersection be:*

1. *Learned $L$ — learned components inside the polity's decision loops.*
2. *Partially observed $P$ — agents with partial-observability sensor access.*
3. *Communication-constrained $C$ — bounded-bandwidth, lossy, event-triggered communications.*
4. *Adversarial $A$ — paraconsistent inconsistency, GNSS-spoofing, sensor adversarial conditions.*
5. *Certifiable $X$ — explicit safe sets, theorem-backed guarantees.*
6. *Airspace-compliant $R$ — civil/defense regulatory anchors (FAA Remote ID, EASA U-space, DoD 3000.09, etc.).*

*Each axis admits a cobordism in $\mathrm{Cob}_\mathrm{settling}$:*

- $S_L : \mathcal{B}_\mathrm{policy-input} \to \mathcal{B}_\mathrm{policy-output}$ — *layer-1 cobordism with foreign-interior bulk; the LLM/learned model's bulk is non-deterministic, only the boundary is substrate-resident.*
- $S_P : \mathcal{B}_\mathrm{world} \to \mathcal{B}_\mathrm{observation}$ — *partial-observability cobordism with $\forall$-block antecedent in closure-rule language; transfinite-bounded regime.*
- $S_C : \mathcal{B}_\mathrm{observation} \to \mathcal{B}_\mathrm{shared-observation}$ — *communication-constrained cobordism whose closure ordinal depends on the protocol-family taxonomy.*
- $S_A : \mathcal{B}_\mathrm{shared-observation} \to \mathcal{B}_\mathrm{filtered-observation}$ — *adversarial-filter cobordism implementing W-MSR Byzantine consensus + secure state estimation; the residuated-restriction's paraconsistent authority $a = \top$ is identity-on-payloads, with intrusion detection at the bilattice-network-sheaf-consensus level.*
- $S_X : \mathcal{B}_\mathrm{intent} \to \mathcal{B}_\mathrm{certified-action}$ — *certifiable cobordism with strict-regime bulk; $H^1 = 0$ structurally; substrate-decidable in bare-Π₁ + <.*
- $S_R : \mathcal{B}_\mathrm{certified-action} \to \mathcal{B}_\mathrm{compliant-actuation}$ — *charter-tier-discipline cobordism; regulatory-anchor records in the predicate category serve as charter-fragment authorities.*

*Then the composite cobordism*

$$S_R \circ S_X \circ S_A \circ S_C \circ S_P \circ S_L \;:\; \mathcal{B}_\mathrm{world} \to \mathcal{B}_\mathrm{compliant-actuation}$$

*exists in $\mathrm{Cob}_\mathrm{settling}$ and has closure ordinal equal to the ordinal sum $\kappa_L + \kappa_P + \kappa_C + \kappa_A + \kappa_X + \kappa_R$ (per [settling-cobordism-category §Composition](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md)).
The composite is settling-cobordism-equivalent to the six-step trajectory; its TQFT functor image $Z(S_R \circ \ldots \circ S_L)$ is the partition-function product per [tqft-structure](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-frobenius-structure/references/tqft-structure.md) clause 1 (functoriality on composition).*

*The composite cobordism is **certifiable** iff each component cobordism is certifiable and the composition's strict-regime layer ($S_X$) caps the composite's closure ordinal — i.e., layers $L$ and $P$ are bounded ($\kappa_L, \kappa_P < \omega_1$) and the composite's $H^1_{\chi_-}$ and $H^1_{\chi_{\sim\circ-}}$ remain zero through the composition.*

## Why this matters

The Pass-1 [verify-certifiability-sectors](../../../../../../../../../../../../../engineering-science-services-section/services/technology-science-services-section/content/text/documents/articles/notes/undated/verify-certifiability-sectors.md) closure rule gates dispatch on $H^1_{\chi_-} = 0$ and $H^1_{\chi_{\sim\circ-}} = 0$ for the *projected* cobordism.
The pre-dispatch projection requires anticipating the K₄-grading of the composite cobordism that the dispatched action would produce.
This theorem provides the algebra: the composite's K₄-grading is the K₄-graded ordinal sum of the components' gradings, and the strict-regime layer's $H^1 = 0$ structural property is what makes the composite's safety-critical sectors zero whenever the layer is reached without inconsistency injection along the way.

The Pass-3 implementation of `verify-certifiability-sectors` uses the composition formula here to anticipate the projected cohomology before the dispatch fires.

## Why six sub-theorems with composition rather than one mega-theorem

Per the theory-gap question §"The single hardest unsolved intersection" Q12 and the answer in §"Six-way intersection: the theorem decomposes via Cob_settling composition": the cobordism-category structure *is* the composition theorem.
Six sub-theorems with a composition theorem is the substrate-coherent path.
The mega-theorem alternative (one monolithic claim) is structurally less informative because each component's certification is independently load-bearing — a deployment may need certifiability for $L+P+C$ without $A+X+R$ (e.g., a non-adversarial environment with no airspace-compliance requirement), and the per-component theorems remain applicable while the mega-theorem would not.

## Proof sketch

The composition exists by [`Cob_settling`'s composition rule](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md#composition): identify the out-boundary of one with the in-boundary of the next; glue along the shared boundary; the bulk is the union and the trajectory is the concatenation.
The boundary-identifications hold by the components' explicit boundary types ($\mathcal{B}_\mathrm{policy-output} = \mathcal{B}_\mathrm{intent}$, etc.).

The closure-ordinal sum is by [settling-cobordism-category §Composition](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md).
The TQFT-functor image is by [tqft-structure](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-frobenius-structure/references/tqft-structure.md) clause 1.

The certifiability claim follows from each component's per-axis theorem ([predicated-drone-collective-fails-classical-stigmergy](../predicated-drone-collective-fails-classical-stigmergy/predicated-drone-collective-fails-classical-stigmergy.md) for classical-stigmergy regime, [coordination-across-handedness-asymmetric-participants](../embodied-handedness/coordination-across-handedness-asymmetric-participants/coordination-across-handedness-asymmetric-participants.md) for the H¹ bounds, [safe-envelope-precheck-as-bilattice-modal-suspension](../safety-envelope-cell/safe-envelope-precheck-as-bilattice-modal-suspension/safe-envelope-precheck-as-bilattice-modal-suspension.md) for $S_X$'s structural $H^1 = 0$, [meaningful-human-control-as-charter-c3-extension](../meaningful-human-control/meaningful-human-control-as-charter-c3-extension/meaningful-human-control-as-charter-c3-extension.md) for $S_R$'s charter-tier discipline).
The composition's certifiability is the conjunction.

The full proof depends on: - Per-component cobordism specifications in each component's substrate-record (drone-record, control-layer-handoff, etc., authored as Pass-2 objects). - The polity's strict-regime cap (per [aperiodicity-characterization](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodicity-characterization.md): drone-swarm settlings are structurally never aperiodic). - The composition rule's preservation of K₄-grading sector counts under cobordism gluing.

∎-sketch

## Position

Central composition theorem of the sub-theory.
Resolves the Pass-1 deferral on `verify-certifiability-sectors`'s pre-dispatch anticipation algorithm.
Pass-3 implementation reads from this theorem.

## Open

- The exact substrate-cell representation of "anticipated cobordism composition" — whether the polity carries a *projected-cobordism cell* before enactment that the certifiability-sectors closure rule reads, or whether the projection is computed inline at rule firing.
- The relationship between this composition theorem and the *domain-specific* composition decisions a particular deployment makes (e.g., a deployment that doesn't include $S_A$ because the environment is non-adversarial).
  Likely the composition is parameterized by which axes are active; the per-axis certification certificates compose along the active subset.
- Per-axis theorem proofs are deferred to subsequent sessions.
  Each component's load-bearing claim is stated above; the proofs are theory-research deliverables.
