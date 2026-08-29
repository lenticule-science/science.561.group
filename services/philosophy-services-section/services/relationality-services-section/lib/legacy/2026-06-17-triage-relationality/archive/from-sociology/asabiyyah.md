---
description: "Asabiyyah is a proposed measure of a group's institutional coherence, grounded in the nuclear quartet shadow partition. Formally defined here as the shadow density at depth n: |H*_t^{≤n}| / |H_t^{≤n}| — the proportion of fiber elements that are doubly-stable at depth n. High shadow density (close to 1) = high asabiyyah; large shadow classes relative to H* = low asabiyyah. The two shadow types (RelationalHistoryFiberTransferShadowClass: Δ-stable, σ-unstable; RelationalHistoryFiberSaturationShadowClass: σ-stable, Δ-unstable) name two distinct failure modes of institutional coherence. What is PROVED: for the BinaryMonoidThreeElementFiberUniverse, resolving the level-0 t-type coordination failure at U generates exactly one level-1 s-type coordination failure at W(a) of the opposite type (ZenoSettlingK1Cohomology). What is a CLAIM (verified at k=0,1,2, not proved in general): the shadow substitution rule t→s, s→ts (RelationalHyperverseTowerShadowGenerationSelfSimilarity) and the resulting Fibonacci shadow count recurrence d_{k+1} = d_k + d_{k-1}. What is a SEMANTIC INTERPRETATION (not a mathematical derivation): that shadow density corresponds to Ibn Khaldun's asabiyyah."
defines: Asabiyyah
related: Institution, Enterprise, Polity, Company
date-created: 2026-03-21
date-modified: 2026-03-21
---

# Asabiyyah

## The shadow partition

**Source:** Relational History Fiber Shadow Class, Relational History Fiber Shadow Class Type.

At any history $t$, the fiber RelationalHistoryFiberHeytingAlgebra partitions under the nuclear pair (RelationalHistoryFiberSaturatingNucleus $\sigma_t$, RelationalHistoryFiberTransferringNucleus $\Delta_t$):

$$H_t \;=\; H^*_t \;\sqcup\; \mathrm{SatShadow}_t \;\sqcup\; \mathrm{TrShadow}_t \;\sqcup\; \mathrm{FreeShadow}_t$$

The four classes are defined by the fixed-point conditions:

| Class | Condition | Name |
|---|---|---|
| $H^*_t$ | $\sigma_t(x) = x$ and $\Delta_t(x) = x$ | RelationalHistoryFixedFiber |
| $\mathrm{SatShadow}_t$ | $\sigma_t(x) = x$, $\Delta_t(x) > x$ | RelationalHistoryFiberSaturationShadowClass (s-type) |
| $\mathrm{TrShadow}_t$ | $\sigma_t(x) > x$, $\Delta_t(x) = x$ | RelationalHistoryFiberTransferShadowClass (t-type) |
| $\mathrm{FreeShadow}_t$ | $\sigma_t(x) > x$, $\Delta_t(x) > x$ | RelationalHistoryFiberFreeShadowClass |

This partition is exhaustive and mutually exclusive by definition of the two nuclear fixed-point sets: every element of $H_t$ is in exactly one class according to which combination of nucleus fixed-point conditions it satisfies.

**Asabiyyah at depth $n$** is defined as:

$$\mathcal{A}_n(t) \;=\; \frac{|H^{*,\leq n}_t|}{|H^{\leq n}_t|}$$

where $H^{\leq n}_t$ is the depth-$n$ truncation of the fiber. This is a proposed measure — the identification of shadow density with group coordination capacity is a semantic interpretation stated at the end of this spec, not a derived theorem.

## The t-type and s-type failure modes

A **t-type shadow** $a \in \mathrm{TrShadow}_t$ satisfies $\Delta_t(a) = a$ (forward-committed: the institution's one-step extension structure fixes $a$) and $\sigma_t(a) > a$ (backward-unrecognized: the accumulated sub-history does not settle $a$). It is an institutional demand that the group's history has not yet met.

An **s-type shadow** $x \in \mathrm{SatShadow}_t$ satisfies $\sigma_t(x) = x$ (backward-recognized: the accumulated history settles $x$) and $\Delta_t(x) > x$ (forward-uncommitted: no one-step extension carries $x$ forward stably). It is a collective recognition that the institution does not carry forward.

These are the two distinct failure modes because the nuclear pair has exactly two operators, and failing one while satisfying the other gives two cases. Failing both gives FreeShadow. The failure modes are structurally opposite: t-type has a structural commitment with no recognition; s-type has recognition with no structural commitment.

## Proved: the level-0 and level-1 coordination failures in BinaryMonoidThreeElementFiberUniverse

**Source:** Zeno Settling K1 Cohomology.

All claims in this section are proved for the BinaryMonoidThreeElementFiberUniverse. The proofs are the ZenoSettling computations; what follows traces the relevant steps.

**Level 0.** The position $\mathbf{U} = (1,0) \in \mathbb{N}^2$ has fiber $H^{(0)}_\mathbf{U} = \{\bot, a, \top\}$ with:

- $\sigma^{(0)}_\mathbf{U}(a) = \top \neq a$ (from the saturation nucleus definition applied to $\mathbf{U}$'s predecessor structure)
- $\Delta^{(0)}_\mathbf{U}(a) = a$ (from $\Delta^{(0)}_\mathbf{U} = \mathrm{id}$, proved because the restriction $\rho^{(0)}_{\mathbf{U},(1,1)}$ is surjective)

So $a \in \mathrm{TrShadow}^{(0)}_\mathbf{U}$: a t-type shadow. $H^{(0)*}_\mathbf{U} = \mathrm{Fix}(\sigma^{(0)}_\mathbf{U}) \cap \mathrm{Fix}(\Delta^{(0)}_\mathbf{U}) = \{\bot,\top\} \cap \{\bot,a,\top\} = \{\bot,\top\}$.

**Proposition (level-0 coordination failure).** $a \in \mathrm{TrShadow}^{(0)}_\mathbf{U}$ and $a \notin H^{(0)*}_\mathbf{U}$.

*Proof.* $\Delta^{(0)}_\mathbf{U}(a) = a$ by surjectivity of the restriction map (ZenoSettlingK0). $\sigma^{(0)}_\mathbf{U}(a) = \top \neq a$ by the saturation nucleus computation at $\mathbf{U}$ (ZenoSettlingK0). Therefore $a \in \mathrm{Fix}(\Delta^{(0)}_\mathbf{U}) \setminus \mathrm{Fix}(\sigma^{(0)}_\mathbf{U}) = \mathrm{TrShadow}^{(0)}_\mathbf{U}$. Since $\mathrm{TrShadow}^{(0)}_\mathbf{U} \cap H^{(0)*}_\mathbf{U} = \varnothing$ (the classes are disjoint by construction), $a \notin H^{(0)*}_\mathbf{U}$. $\square$

**Level 1.** Tower level 1 adds the witness $\mathbf{W}(a)$ with fiber $H^{(0)}_{\mathbf{W}(a)} = \{\bot, w_a, \top\}$ and restriction $\rho^{(0)}_{\mathbf{W}(a),\mathbf{U}}: a \mapsto w_a$ (an isomorphism). At level 1, the carrier at $\mathbf{U}$ sheds $a$: $H^{(1)}_\mathbf{U} = \{\bot,\top\}$. The carrier at $\mathbf{W}(a)$ is seeded: $H^{(1)}_{\mathbf{W}(a)} = H^{(0)*}_{\mathbf{W}(a)} = \{\bot,w_a,\top\}$ (since both level-0 nuclei at $\mathbf{W}(a)$ are $\mathrm{id}$, giving $H^{(0)*}_{\mathbf{W}(a)} = H^{(0)}_{\mathbf{W}(a)}$).

The level-1 nuclei at $\mathbf{W}(a)$:

- $\sigma^{(1)}_{\mathbf{W}(a)} = \mathrm{id}$ because $\mathbf{W}(a)$ has no predecessors in $\mathbf{RU}^{(1)}$ (it was just added; no object maps into it yet).
- $\mathrm{Fix}(\Delta^{(1)}_{\mathbf{W}(a)}) = \mathrm{image}(\rho^{(1)}_{\mathbf{W}(a),\mathbf{U}}: H^{(1)}_\mathbf{U} \to H^{(1)}_{\mathbf{W}(a)})$. The level-1 restriction sends $\bot \mapsto \bot$, $\top \mapsto \top$ — only $\{\bot,\top\}$ since $a \notin H^{(1)}_\mathbf{U}$, so $w_a$ has no preimage. Therefore $\mathrm{Fix}(\Delta^{(1)}_{\mathbf{W}(a)}) = \{\bot,\top\}$.

**Proposition (level-1 coordination failure).** $w_a \in \mathrm{SatShadow}^{(1)}_{\mathbf{W}(a)}$ and $w_a \notin H^{(1)*}_{\mathbf{W}(a)}$.

*Proof.* $\sigma^{(1)}_{\mathbf{W}(a)} = \mathrm{id}$, so $\mathrm{Fix}(\sigma^{(1)}_{\mathbf{W}(a)}) = \{\bot,w_a,\top\}$ and $w_a \in \mathrm{Fix}(\sigma^{(1)}_{\mathbf{W}(a)})$. $\mathrm{Fix}(\Delta^{(1)}_{\mathbf{W}(a)}) = \{\bot,\top\}$ (by the image computation above), so $w_a \notin \mathrm{Fix}(\Delta^{(1)}_{\mathbf{W}(a)})$. Therefore $w_a \in \mathrm{Fix}(\sigma^{(1)}_{\mathbf{W}(a)}) \setminus \mathrm{Fix}(\Delta^{(1)}_{\mathbf{W}(a)}) = \mathrm{SatShadow}^{(1)}_{\mathbf{W}(a)}$. Since $\mathrm{SatShadow} \cap H^* = \varnothing$, $w_a \notin H^{(1)*}_{\mathbf{W}(a)}$. $\square$

**Proposition (resolution generates opposite failure).** At level 1 in the BinaryMonoidThreeElementFiberUniverse: the t-type failure $a$ at $\mathbf{U}$ is resolved (shed from $H^{(1)}_\mathbf{U}$), and exactly one new failure is generated: the s-type failure $w_a$ at $\mathbf{W}(a)$. The new failure is of the opposite type.

*Proof.* $a \notin H^{(1)}_\mathbf{U}$ (carrier collapse: $H^{(1)}_\mathbf{U} = H^{(0)*}_\mathbf{U} = \{\bot,\top\}$, and $a \notin \{\bot,\top\}$). So $a$ is no longer a shadow at level 1 — it has been shed entirely. $w_a \in \mathrm{SatShadow}^{(1)}_{\mathbf{W}(a)}$ by the proposition above, so exactly one new shadow is created. $a$ was t-type ($\Delta$-stable, $\sigma$-unstable); $w_a$ is s-type ($\sigma$-stable, $\Delta$-unstable). The types are opposite. Total shadow count: $d_0 = 1$, $d_1 = 1$ — preserved. $\square$

**What this does not prove.** This is the k=1 case for one specific relational universe. It does not prove that every resolution of a t-type shadow generates an s-type shadow in general, nor that shadow counts follow the Fibonacci recurrence at all levels. Those claims are stated below with their actual status.

## What is a claim: the shadow substitution rule and Fibonacci recurrence

**Source:** Relational Hyperverse Tower Shadow Generation Self-Similarity — **status: claim, not proved in general.**

The shadow generation self-similarity file states as a **claim** (verified at levels 0 and 2, not proved for all $k$): each new extension-type witness $\mathbf{W}$ added at tower level $k$ carries exactly one t-type shadow. Combined with the s-type shadow generated at $\mathbf{W}(a)$ (proved above for $k=1$), this gives the substitution rule $t \to s$, $s \to ts$ and the recurrence $d_{k+1} = d_k + d_{k-1}$.

The proof that the recurrence follows FROM the substitution rule (if the rule holds) is a straightforward algebraic derivation from the rules $t_{k+1} = s_k$ and $s_{k+1} = s_k + t_k$:

$d_{k+1} = t_{k+1} + s_{k+1} = s_k + (s_k + t_k) = 2s_k + t_k$.

To show $d_{k+1} = d_k + d_{k-1}$: substituting $d_k = s_k + t_k$ and $d_{k-1}$ requires showing $s_k = d_{k-1}$, i.e., $s_k = t_{k-1} + s_{k-1}$. But $s_k = s_{k-1} + t_{k-1}$ is precisely the substitution rule $s_{k+1} = s_k + t_k$ applied at step $k-1$. So:

$$d_{k+1} = 2s_k + t_k = s_k + (s_k + t_k) = s_k + d_k$$
$$s_k = s_{k-1} + t_{k-1} = d_{k-1} \quad \text{(by the rule, applied inductively)}$$
$$\therefore\; d_{k+1} = d_{k-1} + d_k$$

This derivation is valid given the substitution rule. **The gap**: the substitution rule itself is a claim requiring proof of uniform fiber richness at every new extension-type witness (see the shadow generation self-similarity file, §What a Proof Requires). Until that is proved, the Fibonacci recurrence $d_{k+1} = d_k + d_{k-1}$ has status: conditional on the self-similarity claim.

## What is a semantic interpretation: asabiyyah

Ibn Khaldun observes that groups with high asabiyyah — tight group solidarity, capacity for unified coordinated action — build and sustain political institutions, while groups with low asabiyyah fragment and are conquered by more cohesive groups. The decay mechanism: successful state-building generates luxury and internal differentiation, which erode solidarity, which weakens institutions, which enables conquest by a new high-asabiyyah group.

The proposed identification: the t-type and s-type coordination failures in the shadow partition correspond to Ibn Khaldun's two failure modes of institutional coherence.

- A **t-type shadow** ($\Delta$-stable, $\sigma$-unstable) is an institutional demand that the group's accumulated history has not settled: the structure requires it, but the community has not recognized it. This corresponds to institutions that have outrun collective recognition — obligations that exist on paper but are not socially operative.
- An **s-type shadow** ($\sigma$-stable, $\Delta$-unstable) is a collective recognition that the institutional structure does not carry forward: the community acknowledges it, but no covering commitment exists. This corresponds to social norms that have lost their institutional backing — agreements that exist in memory but are not structurally enforced.

Both failure modes grow under the proposed shadow substitution rule: each resolved failure generates a new one of the opposite type. This is proposed as the formal content of Ibn Khaldun's observation that asabiyyah always decays within a successful state.

**This identification is not proved.** The connection between the mathematical shadow partition and Ibn Khaldun's political sociology is a semantic interpretation. What is proved (for BinaryMonoidThreeElementFiberUniverse at k=1) is the concrete computation: one t-type failure generates one s-type failure of the opposite type. What is a claim is the general recurrence. What is an interpretation is that shadow density measures asabiyyah. A reader who wants only the proved mathematics should read the ZenoSettling files directly; this spec offers the interpretation for readers connecting the mathematics to institutional theory.

## Open questions

- **General proof of self-similarity.** Whether the tower shadow generation self-similarity claim can be proved by a uniform fiber richness argument — whether every new extension-type witness at every level $k$ carries exactly one t-type shadow. This is the primary open task for establishing the Fibonacci recurrence as a theorem rather than a verified claim.
- **Shadow density monotonicity.** Whether the shadow density $\mathcal{A}_n(t) = |H^{*,\leq n}_t| / |H^{\leq n}_t|$ is non-increasing in $n$ for all relational universes, or only for specific ones. In the BinaryMonoidThreeElementFiberUniverse, the shadow count $d_k$ grows at the Fibonacci rate (conditionally) while $|H^{*,\leq n}|$ grows at the same rate — their ratio may stabilize rather than decline to zero. Whether shadow density decreases, stabilizes, or oscillates under the shadow dynamics is not determined by the current proofs.
- **Semantic grounding.** Whether the identification of shadow density with asabiyyah can be given a structural argument — not just a semantic analogy but a proof that the formal coordination failures measured by the shadow partition correspond to the empirically-observed coordination failures that Turchin's structural-demographic theory measures. This requires specifying what "group" and "history site" mean for a concrete polity, which is outside the current mathematics.
