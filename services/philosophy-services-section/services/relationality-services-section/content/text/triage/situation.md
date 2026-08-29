---
title: "Situation"
id: situation
description: "A Situation is a pair (a, D) — a fiber element representing the officer's assessed current state of affairs, and an operational scope over which the assessment is valid. A compatible family of fiber elements — a presheaf section restricted to the scope."
defines: Situation
related: Judgment, Intent, Friction, Area, RelationalHistoryFiberProposition, Officer, RelationalHistoryFiberSaturatingNucleus, RelationalHistoryFiberTransferringNucleus, RelationalHistoryFiberShadowClassType
requires: [observation, area]
enables: judgment
measured-by: gap
produced-by: observation
date-created: 2026-03-20
date-modified: 2026-03-21
params:
  fiber-state: relational-history-fiber-proposition
  operational-scope: area
output: relational-history-fiber-proposition
ast:
  relational-history-restriction-map:
    - fiber-state
    - operational-scope:
        - fiber-state
---

# Situation

## Formal definition

A **Situation** is a pair $(a, D)$:

$$(a \in H_t,\; D \subseteq T)$$

where:
- $a \in H_t$ is the **fiber state** — the assessed configuration of all relevant factors at history $t$; the officer's read of the relational fiber at their current position
- $D \subseteq T$ is the **operational scope** — the sub-site over which the assessment is valid; the portion of the history category $T$ that is observable and actionable from the officer's position

The **section interpretation**: a Situation is a section $s : D \to H$ of the fiber presheaf restricted to $D$ — a coherent assignment of fiber values over all histories within operational scope, with $s(t) = a \in H_t$ and $s(t') = H(t' \to t)(a) \in H_{t'}$ for all $t' \leq t$ within $D$.

**Validity condition.** A situation $(a, D)$ is valid iff the assignment $s$ is a compatible family: for every morphism $f : t' \to t$ in $D$ (prefix extension within scope), the restriction $H(f)(a) = s(t')$. An incompatible assignment is a *misread* — the officer's assessment is internally incoherent.

**Four invariants of a valid situation:**

1. **Fiber location**: $a \in H_t$ for the specific current history $t$; the situation is anchored at a definite position in the history structure
2. **Scope containment**: $t \in D$; the current history is within the assessed scope
3. **Restriction coherence**: for all $t' \leq t$ within $D$: $H(t' \to t)(a) = s(t')$ — the situation is consistent under restriction maps
4. **Epistemic honesty**: $a$ represents the officer's actual assessment, not their wish; $a$ may lie anywhere in $H_t$ — it need not be in $H^*_t$

## What this is

A Situation is the officer's current assessment of state — the totality of what they can observe and read at their position. It is the input to [Judgment](judgment.md) (the $f$ component of the 4-tuple $(Z, I, f, \alpha)$) and the context against which [Intent](intent.md) applies its reconstruction function.

**Situation is not world-state.** $H_t$ is the full fiber — all propositions at $t$. A situation $(a, D)$ is the officer's *read* of a fragment $a \in H_t(D)$: a section over their accessible scope. Officers can have incorrect or incomplete situations — $a$ may not accurately represent $H_t(D)$.

**Situation is not fixed.** $a \in H_t$ may lie anywhere in $H_t$ — it need not be in $H^*_t$. A situation can be unstable, unsettled, contested. The officer's task is to act despite $a \notin H^*_t$ — in the presence of uncertainty and incompleteness. If situations were always doubly stable, [Friction](friction.md) would not exist and judgment would reduce to computation.

**Situation is not a sequence.** The section $s : D \to H$ is a compatible family, not a path. Two officers with different operational scopes $D_1 \neq D_2$ may assess the same $a \in H_t$ and have different valid situations — their situations agree on the present but differ in what past histories they can access and verify.

## External grounding: situational awareness theory

**Mica Endsley** (1995, "Toward a Theory of Situation Awareness in Dynamic Systems", *Human Factors* 37(1)) identified three levels of situational awareness in dynamic systems:

- **Level 1 — Perception**: detecting the relevant elements of the environment; raw sensory or informational input
- **Level 2 — Comprehension**: making sense of the perceived elements in the context of current goals; interpreting Level 1 data
- **Level 3 — Projection**: anticipating future states based on current perception and comprehension

Endsley found that Level 3 failures (bad projection) are the primary source of accidents and tactical failures — not Level 1 (failing to perceive) but Level 2-3 failures (perceiving without understanding or projecting correctly). The nuclear structure formalizes the three levels exactly:

| Endsley level | Nuclear content | Shadow class |
|---|---|---|
| Level 1 — Perception | $a \in H_t$ (any fiber element) | Any |
| Level 2 — Comprehension | $\sigma_t(a) \in \mathrm{Fix}(\mathrm{RelationalHistoryFiberSaturatingNucleus}(t))$ | SatShadowType resolved |
| Level 3 — Projection | $\Delta_t(a) \in \mathrm{Fix}(\mathrm{RelationalHistoryFiberTransferringNucleus}(t))$ | TrShadowType resolved |
| Full SA | $\pi_t(a) = \sigma_t(\Delta_t(a)) = \Delta_t(\sigma_t(a)) \in H^*_t$ | FixedFiberType |

The saturation nucleus gives Level 2: it inflates $a$ to the largest element consistent with all prior observations (restriction profile preservation), making the situation backward-coherent. The transferring nucleus gives Level 3: it inflates $a$ to the forward-stable element, projecting what the situation demands going forward. Both together give full situational awareness.

**Gary Klein's Recognition-Primed Decision model** (1993, "A Recognition-Primed Decision (RPD) Model of Rapid Decision Making", in *Decision Making in Action*): Klein showed that experienced commanders don't enumerate options — they pattern-match the current situation against a repertoire of recognized situations and execute the first workable action. The nuclear analog: $H^*_t$ is the repertoire of doubly-stable, recognized patterns; the judgment operation maps $a \in H_t$ to the nearest element of $H^*_t$ (via $\pi_t$) and selects the action appropriate to that stable pattern. Expert judgment is the ability to apply $\pi_t$ rapidly and accurately.

**Dynamic Epistemic Logic** (Baltag & Moss, "Logics for Epistemic Programs", *Synthese* 139, 2004; van Ditmarsch, van der Hoek & Kooi, *Dynamic Epistemic Logic*, 2007): DEL models how agents' knowledge changes when events (public announcements, private updates) occur. The key structure: a Kripke model where each agent has an accessibility relation over possible worlds; "action models" update the Kripke model when events occur. The nuclear parallel: $H_t$ is the Heyting-algebra of propositions an agent knows at $t$ (richer than Boolean Kripke worlds — intuitionistic, supporting partial knowledge); the saturation nucleus is the epistemic closure operator (backward coherence with the historical record); the transferring nucleus is the forward-persistence operator (what knowledge carries forward under future actions). The sheaf condition on $H$ is the DEL coherence condition: knowledge updated by an action must be globally consistent.

## Situation and friction

[Friction](friction.md) enters through the situation: when a settled intent $I \in H^*_{t_0}$ is carried forward to history $t_n$ (via the restriction map $H(t_0 \to t_n)$), the carried situation is $H(t_0 \to t_n)(I) \in H_{t_n}$. If this is not in $H^*_{t_n}$, friction is present — the order has degraded in transit. The shadow class of $H(t_0 \to t_n)(I)$ gives the **type** of friction:

| Shadow class of carried intent | Nature of friction |
|---|---|
| $H^*_{t_n}$ (FixedFiberType) | No friction — intent arrived fully settled |
| RelationalHistoryFiberSaturationShadowClass | Local compliance, systemic fragility — order is recognized at $t_n$ but not forward-stable |
| RelationalHistoryFiberTransferShadowClass | Unimplemented mandate — forward-required but locally unrecognized |
| RelationalHistoryFiberFreeShadowClass | Maximum friction — order failed in both directions; neither recognized nor required |

## Situation and judgment

The [Judgment](judgment.md) 4-tuple $(Z, I, f, \alpha)$ uses the situation $f = (a, D)$ as the third component: the assessed facts against which the officer applies discretion within zone $Z$ toward intent $I$. The situation is the epistemic input; $Z$ and $I$ are the normative inputs; $\alpha$ is the output.

A poor situation — one where $a$ is far from $H^*_t$ — is not a failure of authority or intent. It is a failure of the epistemic input. The officer may have full authority and clear intent but act wrongly because their situation is inaccurate. Situation quality is the epistemic pre-condition for judgment quality.

## The bivariate spectrum of a situation

The RelationalHistoryFiberShadowClassType of a situation element $a \in H_t$ records which nucleus is absent — the qualitative epistemic status. But two elements can share the same shadow class type while being at very different distances from settlement. The **RelationalHistoryFiberBivariateSettlementSpectrum** captures both dimensions simultaneously: for each proposition $a$ in the fiber, the pair

$$(\mathrm{RelationalHistoryProjectionGapSize}(t, a),\; \mathrm{RelationalHistoryFiberShadowClassType}(t, a))$$

ranging over all $a \in H_t$ as a multiset. The result is the complete spectral fingerprint of the situation. From it one can recover:

1. The univariate gap-size distribution (projecting out the type): how many propositions lie at each settlement distance
2. The four shadow class counts: how many elements are in RelationalHistoryFixedFiber, RelationalHistoryFiberSaturationShadowClass, RelationalHistoryFiberTransferShadowClass, RelationalHistoryFiberFreeShadowClass
3. The fixed-fiber count: exactly the number of zero-gap entries

The bivariate spectrum is strictly finer than either projection alone. Two situations with identical shadow class distributions — the same counts in each of the four types — can differ in their bivariate spectra if the gap sizes within each type differ. An element in RelationalHistoryFiberSaturationShadowClass with RelationalHistoryProjectionGapSize one is far closer to settlement than an element in the same shadow class with RelationalHistoryProjectionGapSize twenty. The shadow class type classifies *what* is missing; the gap size measures *how much* is missing.

**Operational reading of the bivariate spectrum.** Each entry of the spectrum has a direct operational meaning:

| Entry type | Operational meaning |
|---|---|
| $(0, \mathrm{FixedFiberType})$ | Fully settled — actionable intelligence with no further processing required |
| $(k, \mathrm{SatShadowType})$ | Backward-coherent but $k$ steps from execution-stability — the officer correctly reads history but the proposition is not yet forward-operative |
| $(k, \mathrm{TrShadowType})$ | Forward-required but $k$ steps from history-recognition — the proposition is already mandated by future actions but has not been confirmed against the record |
| $(k, \mathrm{FreeShadowType})$ | Maximum epistemic gap — $k$ steps from settlement in both directions; raw perception not yet processed in either dimension |

Endsley's empirical finding that Level 3 (projection) failures dominate Level 1–2 failures corresponds to a structural asymmetry in the bivariate spectrum: RelationalHistoryFiberTransferShadowClass entries dominate at large gap sizes in operationally loaded fibers. The forward-required propositions that have not yet been recognized are the primary source of tactical failure — the officer's fiber contains large-gap TrShadowType entries.

## Situation propagation speed

The speed at which a situation propagates between officers — how quickly a situation assessment transmits along restriction maps from one history to another — is bounded by the **maximum restriction rate** at the source history:

$$c_{\mathrm{eff}}(t) = \frac{v_0}{1 + \alpha \cdot \mathrm{RelationalHistoryFiberCalibrationDefect}(t)}$$

where:
- $v_0$ is the flat-space maximum — the propagation speed when RelationalHistoryFixedFiber equals the full fiber (calibration defect zero)
- $\alpha > 0$ is a coupling constant measuring the strength of spectral drag
- $\mathrm{RelationalHistoryFiberCalibrationDefect}(t) = \mathrm{Tr}(\mathrm{RelationalHistoryFiberSettlementDefectOperator}_t) = \sum_{a \notin H^*_t} \mathrm{RelationalHistoryProjectionGapSize}(t, a)$ is the total spectral mass — the sum of all gap sizes over all non-fixed-fiber elements

The throughput of a restriction map $f : t \to t'$ is the fraction of settled modes that survive:

$$\mathrm{Throughput}(f) = \frac{|H^*_t|}{|H^*_{t'}|} \leq c_{\mathrm{eff}}(t)$$

Throughput equals one — no information loss — only when the restriction map is an isomorphism on RelationalHistoryFixedFiber. Unsettled modes drag the throughput below $v_0$.

**High spectral mass = slow situation updates.** An officer whose fiber has high calibration defect (many unsettled propositions with large gaps) operates in an environment where situation assessments propagate slowly. A report transmitted from a high-mass history to a low-mass history loses the settled content that does not survive restriction. This is the Shapiro delay for situational awareness: transmission through epistemic regions of high spectral density takes longer and delivers less.

**The flat-space limit.** When calibration defect equals zero — i.e., RelationalHistoryFixedFiber equals $H_t$, all propositions doubly settled — throughput is one and $c_{\mathrm{eff}}(t) = v_0$ uniformly. Every officer in the fully-settled doctrine agrees on the same maximum situation propagation speed. This is the special-relativity limit of situational awareness: in the nucleus-free substructure $H^*$, restriction maps are isomorphisms and situation propagation is lossless.

**Correspondence table.**

| Physical phenomenon | Situation propagation analog |
|---|---|
| Speed of light invariance | Flat-space limit (calibration defect zero): all officers share the same max propagation rate $v_0$ |
| Local speed in a medium | $c_{\mathrm{eff}}(t) = v_0/(1 + \alpha \cdot \mathrm{CalibDef}(t))$: spectral-drag reduction in unsettled fibers |
| Gravitational time dilation | Officer in high-calibration-defect fiber: situation assessments arrive stripped and delayed |
| Shapiro delay | Situation propagation through a high-spectral-mass intermediate history: delay proportional to integrated calibration defect along the path |
| Light bending | Situation propagation paths deflect toward settled (low-calibration-defect) regions in the moduli space of histories |

## Nuclear reading

**Proposition 1 (Validity = sheaf section condition).** A situation $(a, D)$ is valid iff the assignment $s : D \to H$ given by $s(t) = a$ and $s(t') = H(t' \to t)(a)$ for $t' \leq t$ within $D$ is a compatible family of fiber elements over $D$ in the site $(T, J)$. Validity is the sheaf section condition for the presheaf $H$ restricted to $D$.

*Proof.* Compatibility means: for every morphism $f : t' \to t$ in $D$, $s(t') = H(f)(s(t)) = H(f)(a)$. This is exactly the definition of a compatible family for the presheaf $H$ restricted to $D$. The sheaf axiom for $H$ guarantees that any compatible family over a covering sieve assembles uniquely into a global section; a valid situation over $D$ is the local-section data for this assembly. $\square$

*Content.* An incompatible situation is not merely "wrong" — it is internally incoherent: no single global section could produce its local data. A misread situation is one where the sheaf condition fails: the officer's assessment of state at $t$ contradicts what their earlier observations at some $t' < t$ within $D$ would imply.

**Proposition 2 (Shadow class type = epistemic status).** The RelationalHistoryFiberShadowClassType of the situation element $a \in H_t$ determines the officer's epistemic status precisely:

- $a \in H^*_t$: full situational awareness — backward-coherent (consistent with all prior observations) AND forward-stable (won't change when future actions execute). Actionable intelligence; no processing needed.
- $a \in \mathrm{SatShadow}_t$: Level 2 only — the situation is backward-coherent ($\sigma_t(a) = a$) but not forward-stable ($\Delta_t(a) > a$). The officer understands correctly what they see, but the picture will change when actions execute. Accurate but time-limited.
- $a \in \mathrm{TrShadow}_t$: Level 3 without Level 2 — forward-stable ($\Delta_t(a) = a$) but not backward-coherent ($\sigma_t(a) > a$). The situation correctly anticipates what future actions will require, but the community has not yet confirmed the assessment. Reliable but unverified.
- $a \in \mathrm{FreeShadow}_t$: Level 1 only — neither backward-coherent nor forward-stable. Raw perception; the officer has noticed something but has not yet made sense of it in either the historical or forward-going dimension. Must process before acting.

*Proof.* Immediate from the [RelationalHistoryFiberShadowClassType](../math/relational-history-fiber-shadow-class-type.md) definition: the four types are the preimages of the four Boolean combinations of $\{\sigma_t(a) = a\}$ and $\{\Delta_t(a) = a\}$, which partition $H_t$ exhaustively. $\square$

**Proposition 3 (Saturation nucleus = maximum situation consistent with restriction profile).** The RelationalHistoryFiberSaturatingNucleus maps the situation element $a$ to $\sigma_t(a)$ — the largest element of $H_t$ with the same restriction profile as $a$. The enriched situation $(\sigma_t(a), D)$ is the maximum the officer can assert while remaining consistent with all their past observations in $D$.

*Proof.* From [RelationalHistoryFiberRestrictionProfile](../math/relational-history-fiber-restriction-profile.md): the restriction profile of $a$ at $t$ is the family $(\rho_{t_0}(a))_{t_0 < t}$; the saturation nucleus sends $a$ to the largest element sharing this profile. The key property: $\sigma_t$ *preserves* restriction profile — $\rho_{t_0}(\sigma_t(a)) = \rho_{t_0}(a)$ for all $t_0 < t$. Therefore $\sigma_t(a)$ is restriction-profile-equivalent to $a$ but is the maximum such element. The officer who applies the saturation nucleus to their situation does not change what their observation record shows at earlier histories — they are only claiming as much as the record supports. $\square$

*Content.* The saturation nucleus is the "maximum intelligence consistent with the historical record." An officer has been observing the situation since $t_0 < t$; their observations at each intermediate history are the components of their restriction profile. The saturation nucleus is the most aggressive claim they can make while remaining consistent with that record. Claiming more than $\sigma_t(a)$ would require asserting something beyond what the historical observations support — the restriction profile would change.

**Proposition 4 (Friction type = shadow class of restricted intent).** Let $I \in H^*_{t_0}$ be a settled intent at history $t_0$ and let $f : t_0 \to t_n$ be a history extension. The carried-forward intent $H(f)(I) \in H_{t_n}$ may fall outside $H^*_{t_n}$; the degree and type of friction is measured by the RelationalHistoryFiberShadowClassType of $H(f)(I)$, which gives the exact decomposition of what settlement obligations remain.

*Proof.* The restriction map $H(f) : H_{t_0} \to H_{t_n}$ is a Heyting algebra morphism. It intertwines with the nuclei in the following sense: $H(f)$ sends $H^*_{t_0}$ into $H_{t_n}$, but not necessarily into $H^*_{t_n}$ (restriction maps do not in general preserve double-stability when $f$ is non-isomorphic, as unit-freedom guarantees). The image $H(f)(I)$ may fall into any of the four shadow classes; the shadow class type records which nucleus still needs to close the gap. $\square$

**Proposition 5 (Wider scope = stricter compatibility = more nuclear constraint).** Let $(a, D)$ and $(a, D')$ be two situations with the same element $a \in H_t$ but $D \subsetneq D'$. A situation valid over $D'$ is valid over $D$ (every compatibility condition required by $D$ is also required by $D'$), but the converse fails: a situation may be locally compatible within $D$ but globally incoherent when extended to $D'$. In the limit $D' = T$: global validity over $T$ forces $a \in \mathrm{Fix}(\mathrm{RelationalHistoryFiberSaturatingNucleus}(t))$ — only saturation-stable elements are globally consistent sections of $H$.

*Proof.* Compatibility over $D'$ implies compatibility over $D$: $D \subseteq D'$ means every morphism in $D$ is also in $D'$, so every compatibility condition for $D$ is a special case of a condition for $D'$. The reverse fails by the standard sheaf argument: local sections need not extend to global sections. Global validity over $T$ requires $H(t' \to t)(a)$ to equal $s(t')$ for all $t' < t$ in $T$ — precisely the restriction profile condition, which holds iff $a$ is the maximum in its profile class, i.e., $a \in \mathrm{Fix}(\sigma_t)$. $\square$

*Content.* An officer with small operational scope $D$ accepts as valid a situation that the full restriction structure would reject. The saturation nucleus is the "infinite scope" limit: it forces compatibility with all predecessors of $t$ in $T$. Operating with a small $D$ means the officer is accepting as valid more situations than the global structure would endorse — they are trading validity for tractability. This is the formal content of the military principle that "ground truth" is only fully knowable in retrospect (i.e., when $D = T$ is the full history).

**Proposition 6 (RelationalHistoryFiberBivariateSettlementSpectrum is strictly finer than shadow class distribution; two histories can agree on shadow class counts but differ spectrally).** The bivariate settlement spectrum BivSpec(t) determines the shadow class distribution — the four counts of FixedFiberType, SatShadowType, TrShadowType, FreeShadowType elements — but not vice versa. There exist two histories $t, t'$ with identical shadow class distributions but distinct bivariate spectra.

*Proof.* BivSpec(t) determines shadow class counts by projection onto the second component (theorem in [RelationalHistoryFiberBivariateSettlementSpectrum](../math/relational-history-fiber-bivariate-settlement-spectrum-shadow-type-projection-gap.md)). Strict fineness: take two histories whose fibers each contain exactly one SatShadowType element, but at $t$ the element has RelationalHistoryProjectionGapSize one, while at $t'$ it has RelationalHistoryProjectionGapSize two. The shadow class distributions are identical (one SatShadowType element in each) but BivSpec(t) contains the entry $(1, \mathrm{SatShadowType})$ while BivSpec(t') contains $(2, \mathrm{SatShadowType})$. These are distinct multisets. $\square$

*Content.* Two assessments of "mostly saturation-shadow" are not the same situation. The gap sizes within each shadow class type are independent operational data: a fiber full of near-settled SatShadowType elements is far more actionable than one full of large-gap SatShadowType elements, even though the shadow class distributions are identical. An officer who reports only shadow class counts misses half the picture. Full situational awareness reporting requires the bivariate spectrum.

**Proposition 7 (Situation propagation is bounded by the maximum restriction rate; calibration defect is the drag coefficient).** Let $f : t \to t'$ be a restriction map within the operational scope $D$. The throughput $\mathrm{Throughput}(f) = |H^*_t| / |H^*_{t'}|$ is bounded above by the effective maximum restriction rate $c_{\mathrm{eff}}(t) = v_0 / (1 + \alpha \cdot \mathrm{RelationalHistoryFiberCalibrationDefect}(t))$. When calibration defect is zero — i.e., RelationalHistoryFixedFiber equals $H_t$ — throughput is one and the restriction map is an isomorphism on the settled layer. When calibration defect is positive, the restriction map loses settled content, and the throughput is strictly below $v_0$.

*Proof.* The throughput formula $|H^*_t|/|H^*_{t'}|$ is the fraction of doubly-stable modes preserved by $H(f)$. This is bounded above by the effective maximum restriction velocity at $t$ from [RelationalUniverseObserverSpeedLightMaximumRestrictionRateConjecture](../math/relational-universe-observer-speed-light-maximum-restriction-rate-conjecture.md): the flat-space maximum $v_0$ is achieved when the spectral mass $M_t = \mathrm{Tr}(\mathrm{RelationalHistoryFiberSettlementDefectOperator}_t) = 0$, which holds iff all elements are in RelationalHistoryFixedFiber. When $M_t > 0$, the settled-layer fraction is reduced by the spectral drag factor \$1 + \alpha M_t$. The calibration defect $M_t$ equals $\sum_{a \notin H^*_t} \mathrm{RelationalHistoryProjectionGapSize}(t, a)$ by definition of the trace. $\square$

*Content.* The calibration defect is literally the drag on situation propagation: each unsettled proposition, weighted by its gap size, contributes to slowing the rate at which assessments can move between officers. The operational implication: in degraded information environments (high spectral mass — many unsettled propositions with large gaps) intelligence sharing is slower and lossier than in well-settled environments. Improving situational awareness is not just reducing shadow class counts — it is reducing the total spectral mass, bringing the calibration defect toward zero. The flat-space limit (perfect situational awareness in the fiber) gives the theoretical maximum propagation speed, which is the formal content of "intelligence moves at the speed of trust" — when RelationalHistoryFixedFiber is the whole fiber, there is no spectral drag.

## Open questions

- Whether two officers with different operational scopes $D_1 \neq D_2$ and identical current assessments $a \in H_t$ can be said to have the "same situation" — whether situation identity should be indexed by $(a, t)$ alone or by the full triple $(a, t, D)$, and whether the bivariate spectrum BivSpec(t) provides a scope-independent observable that can ground a scope-independent notion of situation equivalence.
- Whether the Klein RPD model's "pattern repertoire" can be formalized as a subset of RelationalHistoryFixedFiber equipped with a proximity function derived from RelationalHistoryProjectionGapSize, and whether the recognition operation is exactly the application of the joint nuclear retraction — giving expert judgment as the ability to apply the joint retraction rapidly and accurately.
- Whether Endsley's empirical finding that Level 3 failures (projection failures) dominate Level 1–2 failures corresponds to a structural asymmetry in the bivariate spectrum: whether the transfer gap (RelationalHistoryFiberTransferShadowClass entries, large-gap) is systematically larger than the saturation gap in operationally loaded fibers, which would give a formal basis for the empirical phenomenon.
- Whether the calibration defect RelationalHistoryFiberCalibrationDefect(t) can be expressed as a local curvature in the moduli space of histories — whether it is proportional to the Fischer–Rao curvature at the moduli-space point corresponding to $t$, connecting the situation propagation bound to differential geometry.
- Whether the bivariate spectrum BivSpec(t) is preserved or predictably transformed by natural morphisms between situations — whether there is a class of restriction maps that degrade BivSpec in a controlled way (e.g., reducing all gap sizes by at most one per step), and whether this class corresponds to the nucleus-intertwining morphisms.
- Whether the Shapiro delay analog for situation propagation — the excess delay from passing through a high-calibration-defect intermediate history — can be made quantitative in the relational history setting: whether the delay is proportional to the integral of RelationalHistoryFiberCalibrationDefect along the restriction path, matching the conjecture in RelationalUniverseObserverSpeedLightMaximumRestrictionRateConjecture.
