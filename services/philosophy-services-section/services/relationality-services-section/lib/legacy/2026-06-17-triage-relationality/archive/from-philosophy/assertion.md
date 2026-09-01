---
title: "Assertion"
description: "An Assertion is a four-tuple (S, p, A, t) — a speaker S, a proposition p ∈ H_t, an audience A, and a history t — where S submits p as a candidate for H*_t: claims p is true, commits to p's truth, and invites A to update on p. The sincerity condition: S believes p at t. The commitment condition: S is accountable for p's truth. The normative effect: S is committed to p in all downstream histories until retraction or defeat."
instance-of: act
produces: commitment
requires: [speaker, proposition, audience, history]
enables: trust
date-created: 2026-03-20
date-modified: 2026-03-20
---


## Formal definition

An **Assertion** is a four-tuple $(S, p, A, t)$:

$$(S : \mathrm{Person},\; p \in H_t,\; A : \mathrm{Audience},\; t \in T)$$

where:
- $S$ is the **speaker** — the agent who asserts; $S$ is accountable for the truth of $p$; asserting is an authored act (an [Act](act.md) with $\alpha = \mathrm{assert}$)
- $p \in H_t$ is the **proposition** — the content of the assertion; $p$ is in the fiber $H_t$ at assertion-history $t$; it need not be in $H^*_t$ (assertions are typically of non-settled propositions; settled ones need no assertion)
- $A$ is the **audience** — the party to whom the assertion is addressed; $A$ is the party whose epistemic position $S$'s assertion is directed at; $A$ may be a single agent, a group, or the public record
- $t \in T$ is the **history-context** — the history at which the assertion is made; determines which $H_t$ contains $p$

**Three conditions on a sincere assertion.** $(S, p, A, t)$ is a *sincere* assertion if and only if:

1. **Sincerity**: $S$ believes $p$ at $t$ — $p \in H_t$ registers in $S$'s accessible sub-fiber as credible
2. **Commitment**: $S$ accepts accountability for $p$'s truth; if $p$ is false, $S$ has asserted something false and owes correction or retraction
3. **Evidence norm**: $S$ has adequate epistemic backing for $p$; asserting without backing is an assertion norm violation even if $p$ happens to be true (Grice's maxim of quality; Williamson's knowledge norm of assertion)

An *insincere* assertion satisfies the surface form without the conditions — it is a lie if $S$ believes $\neg p$, or a *bluff* if $S$ has no relevant belief.

## Nuclear reading

**Definitions.** At history $t$: $p \in H_t$ is the asserted proposition. Generically $p \notin H^*_t$ — assertions are typically of unsettled propositions (settled ones need no assertion, since they are already in the record). The assertion act is the step $s_A$ generating $t' = s_A \star t$.

**Proposition 1 (Immutability — assertions generate histories, not nucleus modifications):** The speaker's assertion of $p$ at $t$ does not modify $\sigma_t$ or $\Delta_t$. The act $s_A$ generates a new history $t'$; the new nucleus $\sigma_{t'}$ may settle $p$ where $\sigma_t$ did not.

*Proof.* $\sigma_t$ is determined by restriction maps of the presheaf $H$ at $t$; $s_A$ is a history step that generates $t'$ with a distinct nucleus $\sigma_{t'}$. The assertion is an event in history, not a modification of the current fiber's nucleus. □

*Consequence.* "After assertion is accepted: $\sigma_t(p) = p$" is a category error. The correct formulation: after assertion is accepted, the history advances to $t'$ where $\sigma_{t'}(p) = p$. The nucleus at the original history $t$ is unchanged.

**Proposition 2 (Saturation gap = epistemic distance outstanding):** $\sigma_t(p) \geq p$ always (extensiveness). The saturation gap $[p, \sigma_t(p)]$ is non-trivial iff $p \notin \mathrm{Fix}(\sigma_t)$: the restriction profile demands a strictly larger proposition than $p$ provides. The gap measures the epistemic distance between what $S$ asserts and what the accumulated history fully constitutes.

*Proof.* By extensiveness of $\sigma_t$ and the definition of $\mathrm{Fix}(\sigma_t)$. □

**Proposition 3 (Successful assertion closes the saturation gap at the new history):** If the assertion of $p$ is accepted at $t'$ — meaning the assertion-step $s_A$ generates a history $t'$ whose restriction profile fully constitutes $p$ — then $p \in \mathrm{Fix}(\sigma_{t'})$: $\sigma_{t'}(p) = p$.

**Proposition 4 (Retraction generates a history where p is not saturation-fixed):** Retraction is the act of asserting $\neg p$ at $t''$, generating history $t''' = s_{\neg p} \star t''$. At $t'''$, if the retraction is accepted, the history now includes both the assertion-step (at $t'$) and the retraction-step (at $t'''$); the restriction profile of $p$ to $t''' > t''$ may fail the maximality condition, so $\sigma_{t'''}(p) > p$: the proposition is no longer saturation-settled at $t'''$.

*Consequence.* "Retraction moves $p$ away from Fix(σ_t)" is incorrect — $\mathrm{Fix}(\sigma_t)$ at the original history $t$ is immutable. Retraction generates a later history at which a different nucleus does not settle $p$. This is the correct temporal account: nuclear stability is history-indexed, not modified retroactively.

**Proposition 5 (Conjunction of accepted assertions is accepted):** If $p, q \in \mathrm{Fix}(\sigma_{t'})$ (both assertions accepted at $t'$), then $p \wedge q \in \mathrm{Fix}(\sigma_{t'})$.

*Proof.* By meet-preservation of $\sigma_{t'}$: $\sigma_{t'}(p \wedge q) = \sigma_{t'}(p) \wedge \sigma_{t'}(q) = p \wedge q$. □

## Assertion vs. related acts

| Act | Output | Normative effect |
|---|---|---|
| **Assertion** | $p \in H_t$ | $S$ is committed to $p$'s truth; $A$ is invited to update |
| **[Commitment](commitment.md)** | $\varphi \in H^*_t$ | $S$ is obligated to perform $\varphi$; already execution-settled |
| **Declaration** (StatusFunctionDeclaration) | institutional fact | $p$ is constituted as true by the act of saying so |
| **Report** | findings differential | author is accountable for accuracy; recipient is the designated uptake |

The key distinction: an assertion claims truth; a declaration *creates* truth (within an institutional context).
"I hereby name this ship *Victory*" is a declaration — the naming is constituted by the speech act.
"This ship is named *Victory*" is an assertion — the claim is true or false independently of whether it is asserted.

## Assertion and record

An assertion that enters the Record acquires a stronger status: it becomes a committed fact, anchored to a history marker.
The record assertion is evidence — it can be cited, relied on, and holds even if the speaker retracts.
The Clerk's act of recording is what transitions an assertion from a speaker-committed proposition to an institution-committed one.

## Speech act structure

Following Austin (*How To Do Things With Words*, 1962) and Searle (*Speech Acts*, 1969):

- **Locutionary act**: the act of uttering $p$ with its content
- **Illocutionary act**: the act of asserting $p$ (as opposed to asking, ordering, promising $p$)
- **Perlocutionary act**: the effect on the audience — their coming to believe $p$

The [Act](act.md) tuple $(S, \mathrm{assert}, t, p)$ captures the illocutionary act.
The perlocutionary effect is not in the act tuple; it is a downstream fact in the audience's fiber.
The gap between illocution and perlocution is where communication can fail: the assertion is made but the audience does not update.

## Open questions

- Whether the sincerity condition "S believes p at t" can be formalized in the fiber algebra — whether S's belief is a sub-fiber of $H_t$ accessible to $S$, and the sincerity condition is $p \in H^S_t$ (the fiber accessible to $S$).
- Whether the knowledge norm of assertion (Williamson: assert only what you know) corresponds to the condition $p \in H^*_t$ restricted to $S$'s accessible sub-fiber — whether knowing $p$ is exactly $p$ being in $S$'s settled fiber, and whether asserting from outside one's settled fiber is the precise formalization of asserting without knowledge.
- Whether assertions have a decay function — whether a proposition asserted at $t$ but not acted on or repeated loses its claim to $\mathrm{Fix}(\sigma_t)$ as $t$ grows, corresponding to the pragmatic phenomenon of stale assertions requiring renewal.
