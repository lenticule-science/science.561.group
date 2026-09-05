---
title: "Proxy"
description: "A Proxy is a four-tuple (Q, φ, W, ε) — a principal, a specified act-class, a validity window, and an expiration condition. Full substitution of identity for a bounded, specified purpose."
requires: [principal, act-class, validity-window]
produced-by: delegation
restricts: authority
enables: act
date-created: 2026-03-19
date-modified: 2026-03-19
---


## Formal definition

A **Proxy** is a four-tuple $\mathcal{X} = (Q, \varphi, W, \varepsilon)$:

$$\mathcal{X} = (Q : \mathrm{Principal},\; \varphi \subseteq \mathrm{Acts}(Q),\; W = t_0, t_1),\; \varepsilon : \mathrm{Condition} \to \{0,1\})$$

where:
- $Q$ is the **principal** — the party on whose behalf the proxy acts; acts by the proxy within $\varphi$ bind $Q$ as if $Q$ had acted directly
- $\varphi$ is the **specified act-class** — the bounded set of acts the proxy is authorized to perform in $Q$'s name; $\varphi$ must be specified in advance; the proxy has no authority outside $\varphi$
- $W = [t_0, t_1)$ is the **validity window** — the interval during which the proxy authorization is effective; outside $W$, the proxy has no authority
- $\varepsilon$ is the **expiration condition** — a predicate that, when satisfied, terminates the proxy's authority before $t_1$; e.g., $Q$ appearing in person, revocation, completion of the specified act

**Five invariants.** $\mathcal{X}$ is a proxy iff it satisfies:

1. **Act-class specificity**: $\varphi$ must be specified, not open-ended. A proxy for "everything $Q$ might do" is not a proxy — it is an alter ego or a power of attorney in its fullest sense. A proxy is defined by the boundedness of $\varphi$. Outside $\varphi$, the proxy has zero authority.

2. **Full identity substitution within $\varphi$**: within $\varphi$, the proxy does not act *for* $Q$ — they act *as* $Q$. Acts within $\varphi$ by the proxy bind $Q$ with the same legal and normative effect as if $Q$ had acted. This is the deepest structural distinction between proxy and agent: an agent acts for a principal whose identity remains separate; a proxy substitutes for that identity within the specified class.

3. **Temporal boundedness**: the proxy authorization is valid only within $W$. Outside $W$, the proxy has no authority whatsoever, even for acts within $\varphi$. Expiration condition $\varepsilon$ may terminate the window early.

4. **Principal primacy**: $Q$ retains the right to act within $\varphi$ directly during $W$, unless $Q$ has explicitly surrendered that right (rare). The proxy does not displace $Q$; it supplements $Q$'s capacity. $Q$'s direct exercise of an act in $\varphi$ during $W$ may satisfy or supersede the proxy.

5. **Non-subdelegability (default)**: the proxy cannot appoint a sub-proxy for $\varphi$ unless $Q$ has explicitly authorized subdelegation. Proxy authority is borrowed identity, not transferable authority. The person of the proxy is the instrument; that person cannot substitute another person without $Q$'s consent.

## Full substitution vs. delegation

The proxy is distinguished from delegation by the nature of the authority transfer:

| Structure | Acts | Whose identity | Effect binds |
|---|---|---|---|
| **Proxy** | Within $\varphi$ only | Substitutes for $Q$ | $Q$ directly |
| **Agent** (staff) | Within delegated domain | Acts for $Q$; identity separate | $Q$ via agency |
| **Duty officer** | Within watch $W$ | Instantiates $Q$'s position | $Q$'s position |
| **Delegate** | Within granted scope | Acts in $Q$'s name | $Q$ via grant |

The proxy's identity substitution is what makes the corporate law proxy vote work: the proxy votes the shares as if the shareholder were present. The shareholder's vote is cast; the proxy is merely the physical vehicle. In contrast, a staff officer acting "in the commander's name" still acts as an agent — the commander's identity is invoked but not substituted.

## The absence condition

$Q$ appearing in person is the canonical expiration condition $\varepsilon$. The proxy exists precisely because $Q$ cannot or will not be present for $\varphi$. When $Q$ appears, the reason for the proxy dissolves. This is why proxy authority in corporate governance expires when the shareholder appears at the meeting: the proxy was never about transferring power in the general sense, but about ensuring $Q$'s participatory right could be exercised despite $Q$'s absence.

Formally: $\varepsilon(\text{``}Q \text{ present''}) = 1 \Rightarrow$ proxy authority terminates.

## In the nuclear framework

The proxy's act $x \in \varphi$ is discharged when:

$$\sigma_t(\varphi(\mathcal{X})) = \varphi(\mathcal{X}) \;\wedge\; \Delta_t(\varphi(\mathcal{X})) = \varphi(\mathcal{X})$$

and the institutional system recognizes the act as $Q$'s act. The proxy's identity substitution means the recognition condition is: "would this count as $Q$ performing $\varphi$?" — and the answer is yes, if $\mathcal{X}$ is a valid proxy and $W$ is active.

## Tower truth monotonicity: recognition persistence and the expiration frontier

**Source:** [Tower Truth Monotonicity, Tower Nucleus Monotonicity.

TowerTruthMonotonicity establishes two distinct propagation properties for nuclear stability under tower refinement. Applied to the proxy's authority structure, these two properties give the formal content of principal primacy (Invariant 4) and automatic expiration (Invariant 3).

**σ-Stability: recognition is preserved upward.** Once a proxy act within the specified act-class has been meaning-recognized — once the saturation nucleus at some tower level fixes it as an authorized act of Q — that recognition is preserved at all higher tower levels. The saturation nucleus at any level k is computed from the restriction profiles to sub-histories of the current history; by the cover-reflection property, the set of sub-histories relevant to the saturation nucleus is identical at all tower levels at or above the history's depth. Meaning-recognition, once achieved, cannot be withdrawn by contextual refinement.

This is the formal content of the full identity substitution invariant: a proxy act within the specified act-class that has been recognized as Q's act continues to be recognized as Q's act regardless of what further context is added. The institutional fact — that this proxy act is Q's act — is σ-stable.

**Δ-Stability: forward-binding exists in lift form, not element form.** The proxy act's forward-binding effect on Q — that the act is execution-committed, carrying forward in every extension — is not preserved as element identity under tower refinement, only as existence of lifts. This is the correct formal content of the principal primacy invariant: Q's direct exercise of an act within the specified act-class is the canonical stable lift of the proxy act. When Q appears in person and acts directly within the act-class, Q's act is the Δ-stable lift that restricts back to the proxy act. The proxy act is a shadow element; Q's direct act is the stable image.

| Proxy invariant | Nuclear property | Mechanism |
|---|---|---|
| Full identity substitution: proxy act recognized as Q's act | σ-stable: preserved under all tower refinements | Saturation nucleus fixed-point set computed from fixed sub-history set |
| Principal primacy: Q retains direct exercise right | Δ-stable in lift form: Q's direct act = canonical stable lift | DeltaLiftingLemma: stable lift exists and restricts back |
| Non-subdelegability: proxy cannot substitute another | Absence of further restriction: no morphism available that would replace the proxy's fiber with a third party's fiber without Q's explicit authorization | No topology-change morphism available |

**The expiration frontier.** The expiration of the proxy at the end of the validity window W = RelationalHistoryStepInitial, RelationalHistoryStepFinal) is the Δ-defect concentrated at the frontier history RelationalHistoryStepFinal. TowerTruthMonotonicity establishes that Δ-stability fails at the element-identity level at frontier histories: at the frontier, the transfer nucleus that was trivial (every element trivially fixed, since no extensions were visible) becomes non-trivial at the next tower level (extensions become visible and impose genuine constraints). A proxy act that was trivially Δ-stable within W is not element-Δ-stable at the frontier.

This is why proxy authority expires automatically at RelationalHistoryStepFinal without requiring explicit revocation: the proxy's acts at the frontier of W lose their Δ-stability (their execution-commitment) when the frontier is crossed. The expiration condition RelationalHistoryProxyExpirationCondition is the formal acknowledgment that the frontier history is where the Δ-defect is concentrated. Q appearing in person is the canonical expiration condition because Q's presence provides the canonical stable lift — the legitimate Δ-stable element that satisfies the genuine constraints that the proxy's act could not.

**Proposition (Proxy act persistence and expiration).** A proxy act within the specified act-class during the validity window W:
- Has σ-stability (meaning-recognition) that persists across all tower levels at or above the history's depth — the proxy act's status as Q's act is never withdrawn by contextual refinement.
- Has Δ-stability only in existence-of-lifts form within W — Q's direct exercise is the canonical stable lift; the proxy act is a shadow of Q's direct authority.
- Loses Δ-stability at the element-identity level at the frontier of W (the Δ-defect at frontier histories) — the proxy authority expires automatically because the frontier history's transfer-stability conditions are not satisfied by proxy acts beyond that boundary.

*Source.* σ-Monotonicity (proved) from [Tower Truth Monotonicity §The σ-Part. Δ-Lift Existence from §The Δ-Part. Frontier Δ-defect from §What Fails. $\square$

## Open questions

- Whether the power of attorney (general or specific) is a proxy with $\varphi = \mathrm{Acts}(Q)$ — the full act-class — or whether a general power of attorney is a distinct concept that breaks the act-class-specificity invariant.
- Whether proxy and Incumbent are formally dual: the incumbent holds the office over time; the proxy holds the identity for a specific act. Both involve a kind of substitution, but along different axes (temporal vs. act-class).
- Whether the non-subdelegability default is a structural necessity (the proxy's authority is borrowed identity, which is not transferable) or merely a default rule that the principal can waive.
