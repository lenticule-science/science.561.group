---

name: "Appeal"
description: "An Appeal is a quadruple (J₁, J₂, φ, λ) — a lower jurisdiction J₁, an appellate jurisdiction J₂ at a higher depth level, a judgment φ ∈ H*_{t*}^(n) settled at depth n, and an appeal standing λ held by the appellant. The appeal carries φ from J₁'s fiber at depth n to J₂'s fiber at depth k ≥ n via the depth-filtration fiber level transition map ι_{n,k}(t). The defining structure: the appellate fiber at depth k is richer than J₁'s fiber at depth n — it contains more distinguished propositions, more fine-grained normative distinctions, and higher institutional authority. The transferring nucleus asymmetry (ι_{n,k} preserves σ-fixed points exactly but not Δ-fixed points) means that on appeal, propositions settled at the lower level remain provisionally present but propositions that transferred at the lower level may be re-examined. Formally: the appeal is the composition of ι_{n,k} with the appellate forum's adjudication act."
date-created: 2026-03-20
---

## Formal definition

An **Appeal** is a quadruple $\mathcal{P} = (J_1, J_2, \phi, \lambda)$:

$$\mathcal{P} = (J_1 : \mathrm{Jurisdiction},\; J_2 : \mathrm{Jurisdiction},\; \phi \in H^{*(n)}_{t^*},\; \lambda : \mathrm{Standing})$$

where:
- $J_1$ is the **originating jurisdiction** — the forum that issued the judgment $\phi$; $J_1$ operates at depth $n$ in the filtration tower; its fiber $H^{(n)}_{t^*}$ is the domain from which the appeal originates
- $J_2$ is the **appellate jurisdiction** — the forum with authority to review $\phi$; $J_2$ operates at depth $k \geq n$; its fiber $H^{(k)}_{t^*}$ is richer, containing the full depth-$n$ context plus additional normative distinctions
- $\phi \in H^{*(n)}_{t^*}$ is the **judgment being appealed** — a proposition that is $\sigma$-settled at depth $n$ (meaning-settled by $J_1$'s nucleus) but whose $\Delta$-status at depth $k$ is not yet determined
- $\lambda$ is the **appeal standing** — the appellant's Hohfeldian privilege plus correlative claim-recognition in $J_2$; without $\lambda$, $J_2$'s $\sigma$-nucleus does not process the appellant's submissions

The **appeal morphism** is the composition:

$$\mathcal{P} : H^{*(n)}_{t^*} \xrightarrow{\iota_{n,k}(t^*)} H^{(k)}_{t^*} \xrightarrow{J_2\text{-adjudication}} H^{*(k)}_{t^*}$$

where $\iota_{n,k}(t^*)$ is the **depth-filtration fiber level transition map** ([Relational History Depth Filtration Fiber Level Transition Map](../../../humanities/domains/math/relational-history-fiber-depth-filtration-transition-map.md)) that carries propositions from depth-$n$ to depth-$k$.

**Four invariants.** $\mathcal{P}$ is a valid appeal iff:

1. **Depth ordering**: $k \geq n$ — the appellate jurisdiction is at least as deep (at least as authoritative) as the originating jurisdiction. An appeal to a lower-depth forum is not an appeal but a collateral challenge. The depth ordering is the institutional hierarchy: higher courts are higher in the filtration tower.

2. **Judgment existence**: $\phi \in H^{*(n)}_{t^*}$ — the judgment must be settled by $J_1$'s nucleus before the appeal is available. Appealing an unsettled matter (a proceeding that has not reached judgment) is either premature (interlocutory appeal, a special case) or a request for original jurisdiction in $J_2$ (not an appeal).

3. **Standing**: $\lambda$ — the appellant must have standing in $J_2$; specifically: (a) the appellant was a party to the $J_1$ proceeding or has a legally cognizable interest in the judgment $\phi$; (b) the appellant has a claim that $J_1$ erred; (c) the error, if established, would produce a different judgment. In formal terms: $\lambda$ is the appellant's section in $J_2$'s standing fibration — the appellant is in $J_2$'s recognized actor class.

4. **Transition coherence**: $\iota_{n,k}(t^*)$ carries $\phi$ coherently — the transition map preserves $\phi$'s $\sigma$-fixed-point status: $\sigma^{(k)}_{t^*}(\iota_{n,k}(\phi)) = \iota_{n,k}(\phi)$ (the proposition that was settled at depth $n$ remains provisionally present at depth $k$). The appellate court receives the judgment as a starting point; the question is whether it is also $\Delta$-fixed at depth $k$ — whether it transfers to the settled-and-transferred layer of the higher fiber.

## The transferring nucleus asymmetry

The key mathematical fact ([Relational History Depth Filtration Fiber Level Transition Map](../../../humanities/domains/math/relational-history-fiber-depth-filtration-transition-map.md)):

> "It preserves RelationalHistoryFiberSaturatingNucleus-fixed points exactly, while RelationalHistoryFiberTransferringNucleus-fixed points are NOT preserved in general."

In institutional terms:

- **σ-fixed points** (meaning-settled propositions) are preserved by $\iota_{n,k}$: a judgment that was given settled meaning at depth $n$ retains that meaning-content when viewed from depth $k$. The appellate court sees the same proposition the lower court saw.

- **Δ-fixed points** (transfer-settled propositions — those that have completed their normative transfer and are in the doubly-quiescent layer $H^*$) are **not** preserved: a judgment that was in $H^{*(n)}$ (doubly settled at depth $n$) may not be in $H^{*(k)}$ after the transition. The appellate fiber has a different Δ-nucleus, and what transferred at depth $n$ may not be fully transferred at depth $k$.

This asymmetry is the formal expression of **appellate review**: the appellate court accepts the lower court's factual findings ($\sigma$-settlements preserved) but may re-examine the legal conclusions ($\Delta$-fixed points not preserved). "Questions of law" are the Δ-layer of the lower court's judgment; "questions of fact" are the $\sigma$-layer. De novo review = $\iota_{n,k}$ is applied without any deference to the lower court's Δ-settlements. Clear error / abuse of discretion review = the Δ-settlements from depth $n$ are given some weight in the depth-$k$ adjudication (a qualified deference to the lower fiber's nuclear determinations).

## Standards of review

The standard of appellate review is the formal parameter that determines how much weight $J_2$ gives to $J_1$'s Δ-settlements:

| Standard | Formal meaning |
|---|---|
| **De novo** | $J_2$ applies $\iota_{n,k}$ and then reapplies $\Delta^{(k)}$ from scratch; $J_1$'s Δ-fixed points have no deference weight |
| **Clear error** | $J_2$ accepts $J_1$'s Δ-fixed points unless they are outside the range that $\Delta^{(k)}$ could produce; a strong prior toward the lower fiber's Δ-settlements |
| **Abuse of discretion** | $J_2$ accepts $J_1$'s judgment $\phi$ unless $J_1$'s selection of $\phi$ from the admissible range fails the minimum nucleus condition; the strongest deference |
| **Manifest weight** | $J_2$ overturns only if $J_1$'s $\sigma$-fixed points are clearly wrong on the record; near-complete deference to the lower fiber |

In the formal framework: the standard of review is a weighting morphism $w : H^{*(n)}_{t^*} \to H^{(k)}_{t^*}$ applied before $J_2$'s adjudication; more deferential standards weight $J_1$'s Δ-fixed points more heavily in $J_2$'s adjudication.

## Historical ground: appellate jurisdiction

**Roman law**: the *provocatio* (appeal from magistrate to the popular assembly or emperor), developed into the *appellatio* under the Principate — a formal request to a higher magistrate to review a lower magistrate's judgment. Ulpian (Dig. 49.1.1): "It is permitted to appeal from the sentences of all judges; whether they are sitting judges or arbitrators or those who have jurisdiction... from the emperor alone there is no appeal, nor from those who judge with his authority."

The depth-filtration structure: from the local judge (depth 1) to the praetor (depth 2) to the emperor (depth $\infty$ — the terminal appellate authority). The emperor's judgment settles at the deepest available fiber and is therefore $\Delta$-fixed at all depths — not appealable because there is no depth $k > n_{\mathrm{emperor}}$.

**Common law**: writ of error (direct challenge to the record — $\sigma$-layer review), certiorari (discretionary appellate review — $J_2$ selects which $\Delta$-questions to examine), habeas corpus (collateral attack — a new proceeding, not an appeal in the strict sense; uses a different fiber entirely, not a transition map).

**US federal courts**: three-tier hierarchy (District Court → Court of Appeals → Supreme Court) is a three-level filtration tower: depth $n = 1$ (trial), depth $k = 2$ (circuit review), depth $k = 3$ (Supreme Court review of federal questions). *Marbury v. Madison*, 5 U.S. 137 (1803): the Supreme Court's review of constitutional questions is depth-3 adjudication — the Court's Δ-fixed points on constitutional questions cannot be further appealed within the domestic system.

## Appeal vs. collateral attack

| Mechanism | Jurisdiction relation | Uses transition map | Judgment effect |
|---|---|---|---|
| Appeal | $J_2$ reviews $J_1$; $k \geq n$ | $\iota_{n,k}$ (depth transition) | Judgment affirmed, modified, or reversed |
| Collateral attack | $J_3$ independently adjudicates same facts in a separate proceeding | No transition map; new forum | Original judgment stands; new judgment created in parallel |
| Habeas corpus | $J_4$ reviews legality of $J_1$'s jurisdiction | No depth transition; addresses $J_1$'s authority (its standing fiber), not its judgment content | Original judgment may be voided for $J_1$'s jurisdictional defect |

A collateral attack does not use $\iota_{n,k}$: it initiates a new proceeding in $J_3$ with a fresh section in $J_3$'s jurisdiction. The depth-filtration transition map is specific to the appeal relationship (vertical review within a hierarchy); collateral attacks are horizontal — they originate in a separate position in the topology of jurisdictions.

## Open questions

- Whether the terminal appellate authority (no further appeal available) corresponds to a maximum-depth fiber in the tower — a fiber $H^{*(N)}_{t^*}$ above which no further $\iota_{N,k}$ exists — and whether the maximum depth is reached at the point where $\sigma^{(N)} = \Delta^{(N)}$ (the nuclei coincide: there is no more transfer to do, only settlement).
- Whether the three standards of review (de novo, clear error, abuse of discretion) can be derived from a single formal parameter (a deference weight $w \in [0,1]$) applied to the depth-transition map, and whether the special case $w = 0$ (de novo) gives a functorial relationship between the depth-$n$ and depth-$k$ fibers.
- Whether a chain of appeals $J_1 \to J_2 \to J_3$ (appeal, then appeal of the appellate judgment) is the composition $\iota_{n,k} \circ \iota_{k,m}$ of depth-transition maps, and whether the composite $\iota_{n,m}$ produces the same result as appealing directly from $J_1$ to $J_3$ — i.e., whether the depth-filtration transition maps satisfy the transitivity $\iota_{k,m} \circ \iota_{n,k} = \iota_{n,m}$.
