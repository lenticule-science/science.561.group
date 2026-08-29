---
title: "Quality"
id: quality
description: "A Quality is a triple (Q, X, V) — a quality-name, an object-type presheaf, and a value-presheaf — realized by a natural transformation assigning quality values compatibly with restriction maps. A compatible family of valuations across all histories."
defines: Quality
related: Gap, Measure, Fitness, Situation, Observation, Evaluation, RelationalHistoryFiberSaturatingNucleus, RelationalHistoryFiberTransferringNucleus, RelationalHistoryFiberShadowClassType
acts-on: entity
produces: evaluation
measured-by: gap
requires: [object-type, value-presheaf]
date-created: 2026-03-20
date-modified: 2026-03-21
params:
  object-type: relational-universe
  value-presheaf: relational-universe
  quality-map: relational-universe-morphism
output: relational-universe-morphism
ast:
  relational-universe-morphism:
    - quality-map:
        - object-type
        - value-presheaf
    - value-presheaf:
        - object-type
---

# Quality

## Formal definition

A **Quality** is a triple $(Q, X, V)$:

$$Q_\bullet : X \Rightarrow V \quad (\text{natural transformation of presheaves on } T)$$

where:
- $X : T^{\mathrm{op}} \to \mathbf{Set}$ is the **object-type presheaf** — the type of objects being evaluated; $X(t)$ is the set of objects of type $X$ at history $t$
- $V : T^{\mathrm{op}} \to \mathbf{Set}$ is the **value-presheaf** — the codomain of the quality; $V(t)$ is the set of possible quality values at $t$; often $V = H$ (the fiber Heyting algebra) or $V = \mathbb{R}$ (a real-valued scale)
- $Q_t : X(t) \to V(t)$ is the **quality map at $t$** — the valuation of objects of type $X$ at history $t$; $Q_t(x)$ is the quality of $x$ at $t$

**Naturality condition.** For every history morphism $f : t \to s$ in $T$, the following square commutes:

$$Q_t \circ X(f) = V(f) \circ Q_s$$

That is: evaluating quality at the extended history $s$ and then restricting to $t$ gives the same result as restricting the object first and then evaluating at $t$. A quality must be *compatible with the history structure*: it cannot depend on the path taken to arrive at the subject. This is the meaningfulness condition.

## What this is

A Quality is what makes an object *register as something* in a particular dimension — what it IS in terms of some axis of evaluation. Qualities are the vocabulary of description: settled, stable, compliant, fit-for-purpose, authority-bearing.

**The naturality condition is the content.** A map $Q$ from objects to values that fails naturality would claim: the quality of an object depends on which historical path you took to arrive at it. That is incoherent for a genuine attribute. Naturality enforces that quality-assignments are *path-independent* — a requirement that goes back to Aristotle's distinction between genuine qualities (stable, intrinsic) and relational appearances (path-dependent, perspectival).

**Scale structure.** The structure of the value-presheaf $V$ determines what kind of quality $Q$ is:
- $V = \Omega$ (the subobject classifier): $Q$ is a **predicate** — yes/no membership
- $V = H$ (the fiber Heyting algebra): $Q$ is a **proposition-valued predicate** — the quality is a proposition, partially settleable by the nuclei
- $V = \{0,1,2,3\}$ (a four-element nominal set): $Q$ is a **classification** — assigns one of four categories
- $V = [0,1]$ (unit interval, ordered): $Q$ is a **measure** — assigns a degree

The shadow class type [RelationalHistoryFiberShadowClassType](../math/relational-history-fiber-shadow-class-type.md) is a quality with $V = \{\mathrm{FixedFiberType}, \mathrm{SatShadowType}, \mathrm{TrShadowType}, \mathrm{FreeShadowType}\}$ — a nominal quality. The gap quality is an ordered-pair quality with $V = H \times H$ — a vector measure.

## Nuclear qualities

The two most fundamental qualities on fiber elements are the nuclei themselves:

**Saturation quality** (RelationalHistoryFiberSaturatingNucleus): the natural endomorphism $\sigma : H \Rightarrow H$ assigning to each $a \in H_t$ its saturation $\sigma_t(a)$ — the smallest element of Fix(RelationalHistoryFiberSaturatingNucleus) at or above $a$. This is an endoquality satisfying three special axioms: extensiveness ($a \leq \sigma_t(a)$), idempotence ($\sigma_t(\sigma_t(a)) = \sigma_t(a)$), and [RelationalHistoryFiberNucleusMeetPreservation](../math/relational-history-fiber-nucleus-meet-preservation.md) ($\sigma_t(a \wedge b) = \sigma_t(a) \wedge \sigma_t(b)$). No general quality has all three; these axioms make the saturation quality a **nucleus**.

**Transfer quality** (RelationalHistoryFiberTransferringNucleus): analogously. $\Delta_t(a)$ is the smallest element of Fix(RelationalHistoryFiberTransferringNucleus) at or above $a$, satisfying the same three axioms.

**Fixed-fiber membership quality**: $\chi_{H^*} : H \Rightarrow \Omega$, where $\chi_{H^*,t}(a) = 1$ iff $a \in H^*_t$. This is the binary quality of being fully settled — doubly fixed by both nuclei.

**Shadow class type quality**: [RelationalHistoryFiberShadowClassType](../math/relational-history-fiber-shadow-class-type.md) assigns each $a \in H_t$ one of four types depending on which nuclei fix it. This is the finest-grained nuclear quality: it does not measure how far $a$ is from settlement but which settlement obligations remain.

## External grounding: measurement theory

**Aristotle** (*Categories*, c. 350 BCE) identified quality (*poiotes*) as one of the ten predicament-categories and distinguished four species: (1) habits and dispositions — qualities that are stable vs. easily disturbed; (2) natural capacities; (3) affective qualities; (4) shape and form. The saturation quality is a disposition in Aristotle's sense: a stable tendency of an element toward its settled state, not a contingent relational property.

**S.S. Stevens** (1946, "On the Theory of Scales of Measurement", *Science*) classified measurement scales by their invariance group — what transformations preserve the scale's essential structure:
- **Nominal**: invariant under any bijection; quality as classification only
- **Ordinal**: invariant under monotone transformation; quality as ordering, ratios meaningless
- **Interval**: invariant under affine transformation; differences meaningful, ratios not
- **Ratio**: invariant under scaling; full arithmetic structure

The nuclear qualities fit Stevens' hierarchy: the shadow class type is a **nominal** quality (four categories, no ordering), the gap quality is an **ordinal** quality (measures relative distance to $H^*_t$ within the lattice order), and the nucleus application count (steps to reach $H^*_t$) is an **ordinal-interval** quality.

**Representational measurement theory** (Suppes & Zinnes 1963; Krantz, Luce, Suppes, Tversky, *Foundations of Measurement*, 1971) defines a quality as **meaningful** iff its value is invariant under admissible transformations of the scale. The key theorem: a quality assignment is meaningful iff it is a homomorphism from the empirical relational system into the numerical relational system — exactly the condition that the assignment be a natural transformation. The naturality condition in this spec IS the meaningfulness condition of representational measurement theory. A quality that fails naturality is not a genuine measurement — it is a measurement that changes value depending on how the subject is observed.

## Qualities and roles

A [Role](role.md) specifies a capability-signature — a set of required qualities with minimum thresholds. Filling a role is exhibiting the required quality values at or above threshold: for each quality $Q_i$ with threshold $q_i^{\min}$, having $Q_{i,t}(x) \geq q_i^{\min}$. This makes role-filling a quality-matching problem. The preorder of roles (role subsumption) is induced by quality requirement inclusion: $R_2 \geq R_1$ iff $R_2$ requires at least as much as $R_1$ on every quality dimension.

Each role $R$ with quality requirements induces a **threshold nucleus** on the quality space: the smallest element above $x$ in $H_t$ that satisfies all of $R$'s quality requirements. Fitness for role $R$ is the nuclear fixed-point condition: $x \in \mathrm{Fix}(n_R)$ — the subject already satisfies the threshold, so the threshold nucleus does not move it.

## Nuclear reading

**Proposition 1 (Nuclear operators are endoqualities satisfying three axioms).** The RelationalHistoryFiberSaturatingNucleus and RelationalHistoryFiberTransferringNucleus are natural endomorphisms $Q : H \Rightarrow H$ of the fiber presheaf satisfying:

1. *Extensiveness*: $a \leq Q_t(a)$ for all $a \in H_t$
2. *Idempotence*: $Q_t(Q_t(a)) = Q_t(a)$ for all $a \in H_t$
3. *Meet-preservation*: $Q_t(a \wedge b) = Q_t(a) \wedge Q_t(b)$ for all $a, b \in H_t$

These three axioms characterize exactly the nuclear structure; together they determine that $\mathrm{Fix}(Q_t)$ is a sub-Heyting-algebra of $H_t$. No general quality has all three — a quality that is extensive, idempotent, and meet-preserving is necessarily a nucleus.

*Proof.* Each property follows from the definition of the nucleus as a meet-preserving closure operator. Fix(Q_t) is a sublattice: closed under meets by meet-preservation; closed under joins because Q_t extensive and idempotent implies Q_t is a left adjoint to the inclusion Fix(Q_t) → H_t; and inherits the Heyting implication by the general theory of nuclei on Heyting algebras. $\square$

**Proposition 2 (Naturality = history-coherence; failure = quality incoherence).** A quality $Q : X \Rightarrow V$ is natural iff for every prefix extension morphism $f : t \to s$ in $T$: $Q_t \circ X(f) = V(f) \circ Q_s$. Failure of naturality means: evaluating quality at the extended history $s$ and restricting gives a different value than restricting and evaluating at the base $t$. This is quality incoherence — the quality "remembers" which path was taken, making it path-dependent rather than a genuine attribute. The RelationalHistoryFiberSaturatingNucleus is natural: its restriction-profile classes are defined precisely by the restriction maps, so saturation and restriction commute.

*Proof.* The naturality square commutes iff restriction-then-evaluate equals evaluate-then-restrict. For the saturation nucleus: the restriction-profile class of $a \in H_s$ is the equivalence class $\{b \in H_s : H(f)(b) = H(f)(a) \text{ for all } f\}$; the nucleus sends $a$ to the maximum of its class. Restriction maps send the maximum of the class in $H_s$ to the maximum of the corresponding class in $H_t$ (by the intertwining property proved in [RelationalHistoryFiberSaturatingNucleusTransferStableFiberRestriction](../math/relational-history-fiber-saturating-nucleus-transfer-stable-fiber-restriction.md)). $\square$

**Proposition 3 (Shadow class type is a quality; partition theorem).** The RelationalHistoryFiberShadowClassType is a quality:

$$\mathrm{RelationalHistoryFiberShadowClassType}(t, -) : H_t \to \{\mathrm{FixedFiberType},\; \mathrm{SatShadowType},\; \mathrm{TrShadowType},\; \mathrm{FreeShadowType}\}$$

Its preimage partition is:

$$H_t = H^*_t \;\sqcup\; \mathrm{SatShadow}_t \;\sqcup\; \mathrm{TrShadow}_t \;\sqcup\; \mathrm{FreeShadow}_t$$

The partition is exhaustive and disjoint: for any $a \in H_t$, exactly one of the four Boolean combinations of $\{\sigma_t(a) = a\}$ and $\{\Delta_t(a) = a\}$ holds. This is the finest-grained nuclear quality — it tells you which settlement obligations remain, not how far the element is from settlement.

*Proof.* For any $a \in H_t$: $\sigma_t(a) = a$ or $\sigma_t(a) \neq a$ (decidable equality in the fiber); $\Delta_t(a) = a$ or $\Delta_t(a) \neq a$ (decidable). The four Boolean combinations are mutually exclusive and collectively exhaustive. $\square$

**Proposition 4 (Gap quality is the product of nuclear qualities).** The gap quality $\mathrm{Gap}_t : H_t \to H_t \times H_t$ defined by $\mathrm{Gap}_t(a) = (\sigma_t(a), \Delta_t(a))$ is the product natural transformation $\langle \sigma, \Delta \rangle : H \Rightarrow H \times H$. By the universal property of products of presheaves, the pairing of two natural transformations is natural. Moreover, the gap quality is **idempotent on RelationalHistoryFixedFiber**: for $a \in H^*_t$, $\mathrm{Gap}_t(a) = (a, a)$, and applying the product nucleus componentwise to $(a,a)$ gives $(\sigma_t(a), \Delta_t(a)) = (a,a)$ — the gap quality already reaches its fixed point on active elements.

*Proof.* Products of natural transformations are natural (componentwise check). Idempotence on $H^*_t$: if $a \in H^*_t$, then $\sigma_t(a) = a$ and $\Delta_t(a) = a$ by definition; hence $\mathrm{Gap}_t(a) = (a,a)$; applying again gives the same result. $\square$

*Content.* The gap quality and the shadow class type quality together provide complete nuclear information: the shadow class type records *which* settlement obligations are outstanding; the gap quality records *what* the obligations demand. They are complementary axes of the same nuclear structure.

**Proposition 5 (Non-adjointness of nuclear pair = quality separation = Fibonacci growth).** The RelationalHistoryFiberSaturatingNucleus and RelationalHistoryFiberTransferringNucleus are not in Galois connection in either direction:

$$\mathrm{RelationalHistoryFiberSaturatingNucleus}(t) \not\dashv \mathrm{RelationalHistoryFiberTransferringNucleus}(t) \quad \text{and} \quad \mathrm{RelationalHistoryFiberTransferringNucleus}(t) \not\dashv \mathrm{RelationalHistoryFiberSaturatingNucleus}(t)$$

The witnesses: both RelationalHistoryFiberTransferShadowClass and RelationalHistoryFiberSaturationShadowClass are non-empty. This means the two nuclear qualities are **independent measurement axes** — neither subsumes the other, and no scalar combination of them collapses either shadow class to empty. This independence is the algebraic precondition for the Fibonacci growth recurrence: the depth count of RelationalHistoryFiberFreeShadowClass elements satisfies $d_t(n+1) = d_t(n) + d_t(n-1)$ because each of the two independent quality axes contributes exactly one summand.

*Proof.* From [RelationalHistoryFiberNuclearPairNonAdjointness](../math/relational-history-fiber-nuclear-pair-non-adjointness.md): if the nuclear pair were adjoint, one shadow class would be forced to be empty. The shadow count identity $|\mathrm{TrShadow}_t(n)| = d_t(n-1) > 0$ for $n \geq 1$ shows non-emptiness of the transfer shadow class; symmetrically for the saturation shadow class. Non-emptiness of both classes = both quality dimensions are genuinely independent. If either adjunction held, the recurrence would degenerate to $d_t(n+1) = d_t(n)$ — linear growth, not Fibonacci. $\square$

## Open questions

- Whether every quality in the system corresponds to a natural transformation between presheaves, or whether there are "local qualities" defined at a single history with no coherent extension across the prefix order — and whether such local qualities are genuine properties or pathologies of incomplete specification.
- Whether the value-presheaf $V$ must be internally a complete lattice at each $t$ to support quality-meets and quality-joins, or whether partial orders suffice — and what the minimal structure on $V$ is that supports the quality-measure distinction.
- Whether there is a quality of qualities — a meta-quality $M : \mathrm{Quality}(X, V) \to \Omega$ that evaluates whether a given quality is nuclear (extensive, idempotent, meet-preserving) — and whether this meta-quality is itself a quality in the technical sense.
- Whether the four shadow class types, once established as a nominal quality, support a natural refinement to an ordinal or interval quality that measures "distance to FixedFiberType" independently along the saturation and transfer axes, giving a two-dimensional quality vector that decomposes the gap quality into orthogonal components.
- Whether Stevens' scale hierarchy (nominal/ordinal/interval/ratio) has an internal characterization in terms of the nucleus structure — whether ratio qualities are exactly those invariant under the full automorphism group of $H_t$, and whether this recovers Stevens' classification from the fiber algebra alone.
