---
type: morphism
class: operator
realizes: [dispatch]
depends-on: [dispatch, twist-product-fusion, predication-fiber-algebra, truth-order, quantale-enriched-sheaf, q-fuzzy-equivalence]
see-also: [skill-invocation, dispatch-table, dispatch-as-closure-rule-system, dispatch-composes-authorization, graded-dispatch-via-q-enriched-fusion]
title: Dispatch matching
description: The operator that, given an incoming message and the current dispatch table, computes a quantale-graded match-strength between the message and each candidate agent-skill pair via twist-product fusion $\odot$, and selects the strongest…
---

# Dispatch matching

The operator that, given an incoming message and the current [dispatch table](../dispatch-table/dispatch-table.md), computes a *quantale-graded* match-strength between the message and each candidate agent-skill pair via [twist-product fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) $\odot$, and selects the strongest match in the platform's value-domain.

The substrate's match-strength is *not* a Boolean (match / no match) and *not* merely a four-valued bilattice tag.
It is a value in a [quantale-enriched](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/content/quantale-enriched-sheaf/quantale-enriched-sheaf.md) [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md): a quantale element $q \in \mathsf{Q}$ that records *how strongly* the agent matches, paired with the bilattice tag that records *what kind of evidence* supports the match.
Per [graded-dispatch-via-q-enriched-fusion](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/graded-dispatch-via-q-enriched-fusion.md), the substrate's match operation is the q-enriched analogue of $\odot$ on the fiber's complete weighted lattice structure.

## Hyperdoctrinal structure

Given:

- **Required-capability predication** $r$ for the message — an element of the fiber over predicate $p$ (the work-type predicate)
- **Agent capability predication** $u_a$ for candidate agent $a$ — an element of the same fiber

The dispatch match operator computes:

$$\mathrm{match}(r, a) \;=\; r \odot u_a \;\in\; A_p$$

where $\odot$ is [twist-product fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md).
On a quantale-enriched fiber, the result decomposes into:

- A *bilattice tag* $\tau \in \mathbf{L}^\bowtie$ — $\mathbf{t}$ (full match), $\mathbf{f}$ (negated match — absorbing), $\bot$ (unknown), or $\top$ (contested)
- A *quantale grade* $q \in \mathsf{Q}$ — measuring strength-of-match in the platform's chosen quantale

Per [graded-dispatch-via-q-enriched-fusion](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/graded-dispatch-via-q-enriched-fusion.md), $\odot$ on the q-enriched fiber respects the quantale's multiplicative composition: combining two match contributions multiplies their grades.
Per [q-fuzzy-equivalence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/q-fuzzy-equivalence.md), two match outcomes are *q-fuzzy-equivalent* if their quantale-graded difference is bounded below by $q$ — the substrate uses this to decide when two candidates are "close enough" to require a tie-break.

## What the four bilattice tags mean operationally

- **$\mathbf{t}$ — full match.** The agent has the required capabilities; nothing contradicts.
  Quantale grade $q$ records the strength (e.g., $q = 1$ for exact-fit, $q < 1$ for adequate-but-not-perfect).
- **$\mathbf{f}$ — negated match.** Explicit incompatibility. $\mathbf{f}$ is absorbing for $\odot$, so this rules out the candidate regardless of other affirming capabilities.
  The quantale grade is meaningless here — the bilattice tag dominates.
- **$\bot$ — unknown.** The agent's capabilities are unrecorded for this work-type.
  The dispatch should escalate or seek further evidence; the substrate refuses to guess.
- **$\top$ — contested.** The agent has both affirming and contradicting capabilities.
  Per [agent-community-consensus](../../agent/agent-community/agent-community-consensus/agent-community-consensus.md), the dispatch may surface this as a [network-sheaf-consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) reconciliation request rather than picking arbitrarily.

## Selection rule

The selection rule combines the bilattice tag and quantale grade per the dispatch table's match-policy:

1. **Filter** — drop candidates with $\tau = \mathbf{f}$ (absorbed) and $\tau = \bot$ (unless the policy explicitly admits unknown matches with escalation).
2. **Rank** — among $\tau \in \{\mathbf{t}, \top\}$ candidates, sort by quantale grade $q$ in $\mathsf{Q}$.
3. **Tie-break** — among candidates within q-fuzzy-equivalence of the top, apply the policy's secondary rule (canonical hash, declared priority predication, round-robin, etc.).
4. **Compose if needed** — when no single candidate has $\tau = \mathbf{t}$ at adequate $q$, the operator may $\vee_k$-join multiple agents' partial matches into a multi-agent runbook (per [agent-community-consensus](../../agent/agent-community/agent-community-consensus/agent-community-consensus.md), this composition is structurally a network-sheaf consensus).

## Engineering properties

- **Local.** The match computation reads only the message's required-capability predications and the candidate agents' capability predications — not the global graph.
  The candidate set is bounded by the work-type-to-capability mapping in the dispatch table.
- **Witness-recorded.** Every dispatch produces a [witness](../../../objects/witness.md): the message identity, the candidate set, the (bilattice tag, quantale grade) per candidate, the chosen agent-skill pair (or composed multi-agent dispatch).
  Per [graded-dispatch-via-q-enriched-fusion](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/graded-dispatch-via-q-enriched-fusion.md), the grade is reproducible from the recorded predications.
- **Decomposable.** Multi-agent dispatch is first-class: the substrate decomposes a work item into per-agent partial matches and composes via $\vee_k$.
  The composition's quantale grade respects the quantale's join.
- **Federation-stable.** Per [federation-path-metrics-multiplicative](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-path-metrics-multiplicative.md), dispatch grades crossing federation edges multiply along the federation accessibility — match grade decays predictably with federation distance.

## Why quantale-graded, not Boolean or four-valued

A Boolean dispatch can only say "this agent matches or does not."
A four-valued bilattice can additionally say "match, contradiction, no info, contested."
The quantale grade adds the substrate's expression of *how good a match is among matching candidates* — the dimension that distinguishes "this agent has the required skill at expert level" from "this agent has the required skill at trainee level" without conflating it with the bilattice tag.

The quantale structure (per [quantale-enriched-sheaf](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/content/quantale-enriched-sheaf/quantale-enriched-sheaf.md)) is what lets the substrate compose grades multiplicatively across federation edges, dispatch chains, and skill compositions — and per [q-fuzzy-equivalence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/q-fuzzy-equivalence.md), it is what gives the substrate a principled notion of "two matches are equivalent up to grade $q$."

The structural claim made by dispatch matching is that *agential matching is a graded value, not a decision*: the platform records *how strongly* an agent matches, in *what kind of way*, with full ability to compose and audit.
The substrate's audit can ask "why was agent $A$ not chosen?" and answer with the (bilattice tag, quantale grade) of $A$'s match — exact structural detail rather than a binary refusal.
