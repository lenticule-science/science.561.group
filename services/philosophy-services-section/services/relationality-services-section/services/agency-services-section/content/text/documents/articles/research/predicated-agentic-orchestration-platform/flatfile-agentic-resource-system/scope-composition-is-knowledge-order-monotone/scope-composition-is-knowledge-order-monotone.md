---
name: scope-composition-is-knowledge-order-monotone
description: Effective scope composition is monotone in the knowledge-order
type: theorem
class: engineering-claim
status: proved
depends-on:
  - teaching/explanations/scope-as-fiber.md
  - teaching/explanations/modal-restriction.md
  - ../morphisms/compose.md
  - ../morphisms/check-authorization.md
  - ../objects/fiber.md
  - ../objects/agent-record.md
  - ../objects/office-record.md
  - ../objects/mode-record.md
  - ../../../teaching/explanations/scope.md
  - ../../../../teaching/explanations/knowledge-order.md
  - ../../../../teaching/explanations/predication-fiber-algebra.md
  - ../../../../../theorems/conformance-implies-substrate-properties.md
  - ../../../../../../../../../../../../theories/predicated-computing/prose/learning/claims/theory-of-predicated-computing.md
  - ../../../../../../../../../../../../theories/linear-computation/prose/learning/claims/theory-of-linear-computation.md
see-also:
  - teaching/explanations/validation-as-settlement.md
  - ../../../../morphisms/mode-transition.md
  - ../../../../theorems/dispatch-composes-authorization.md
  - flatfile-federation-equivalence.md
title: scope-composition-is-knowledge-order-monotone
---

# Effective scope composition is monotone in the knowledge-order

**Claim.** In FARS, the effective scope fiber $\sigma_{\mathrm{eff}}$ of a session is the pointwise $\odot$-composition of three contributing fibers — agent-level scope $\sigma_A$, office-level scope $\sigma_O$, and mode-level restriction $\sigma_M$:

$$\sigma_{\mathrm{eff}} = \sigma_A \odot \sigma_O \odot \sigma_M$$

This composition is monotone in the knowledge-order $\leq_k$ in each factor: if any contributing fiber moves up in $\leq_k$ (a capability predication is strengthened toward $t$, a previously-unknown position becomes known), the effective scope fiber moves up or stays fixed in $\leq_k$.
If any contributing fiber moves down or to $\top$ (a restriction is added, a contradiction introduced), the effective scope moves down or to $\top$.

Formal statement: for fixed $\sigma_O$, $\sigma_M$, if $\sigma_A \leq_k \sigma_A'$ cellwise, then $\sigma_A \odot \sigma_O \odot \sigma_M \leq_k \sigma_A' \odot \sigma_O \odot \sigma_M$ cellwise.
The same holds with $\sigma_O$ or $\sigma_M$ as the varying factor.

## Why this holds

**Part 1: $\odot$ is $\leq_k$-monotone in both factors.** The twist-product fusion $\odot$ on the four-bilattice $\{\bot, t, f, \top\}$ is defined pointwise on cells and is monotone in each argument under $\leq_k$: if $v \leq_k v'$ then $v \odot w \leq_k v' \odot w$ for all $w$, and symmetrically.
This is established in [theory-of-predicated-computing](../../../../../../../../../../../../theories/predicated-computing/prose/learning/claims/theory-of-predicated-computing.md): the twist-product fusion $\odot$ on $\mathbf{FOUR} = \mathbf{2} \otimes \mathbf{2}$ inherits $\leq_k$-monotonicity in both arguments from the symmetric monoidal structure of the MALL $\otimes$ (established in [theory-of-linear-computation](../../../../../../../../../../../logic-services-section/content/text/glossary/concepts/theory-of-linear-computation.md), where $\otimes$ is monotone by the cut rule of MALL).

The knowledge-order $\leq_k$ on the four-bilattice places $\bot$ at the bottom (no information), $t$ and $f$ incomparable at mid-level (told-true and told-false are equally informative), and $\top$ at the top (overdetermined — too much information).
Moving up in $\leq_k$ means gaining information; $\odot$ is monotone in this sense: gaining information in one factor does not lose information in the composition.

**Part 2: Scope fibers are pointwise compositions.** Per [scope-as-fiber](../scope-as-fiber/scope-as-fiber.md), the effective scope fiber is the pointwise $\odot$ of the three contributing fibers.
Each cell in $\sigma_{\mathrm{eff}}$ is:

$$\sigma_{\mathrm{eff}}(p) = \sigma_A(p) \odot \sigma_O(p) \odot \sigma_M(p)$$

for each predicate $p$ (e.g., the `reads` predicates declaring read-admissible channels, the `writes` predicates declaring write-admissible channels).
Since $\odot$ is $\leq_k$-monotone per Part 1, each cell of $\sigma_{\mathrm{eff}}$ is $\leq_k$-monotone in each factor.
Monotonicity of the pointwise composition follows cellwise.

**Part 3: Authorization decisions read $\sigma_{\mathrm{eff}}$.** Per [`check-authorization`](../code/transformers/check-authorization.md), authorization decisions query the session's effective scope fiber: "is predicate $p$ in the `writes` set?" reads $\sigma_{\mathrm{eff}}(\text{writes}, p)$ and accepts if the value is $t$.
Since $\sigma_{\mathrm{eff}}(\text{writes}, p)$ is $\leq_k$-monotone in the contributing factors, and acceptance is monotone in the value (acceptance requires $t$; $t$ is above $\bot$ in $\leq_k$), authorization decisions are monotone in the contributing fibers.

## The direction of each contributing fiber's effect

**Agent-level scope $\sigma_A$:** The agent's own scope predicates.
Adding a predication here (e.g., granting a `writes: channel-X` predication) moves $\sigma_A(\text{writes}, \text{channel-X})$ from $\bot$ (absent) to $t$ (asserted), which is a $\leq_k$-increase.
By monotonicity, $\sigma_{\mathrm{eff}}(\text{writes}, \text{channel-X})$ moves up in $\leq_k$ — making it more likely to resolve to $t$ in the composition.
Revoking a predication moves $\sigma_A$ down in $\leq_k$, potentially reducing $\sigma_{\mathrm{eff}}$.

**Office-level scope $\sigma_O$:** The inhabited office's scope bounds.
An office typically *narrows* the agent's scope — the office's scope predications are the $\odot$-factor that restricts what the broader agent-level scope makes available.
If the office's scope predication for a channel is $f$ (explicitly denying), then regardless of the agent's assertion $\sigma_A = t$, the composition $t \odot f = f$ — the channel is denied.
This is the algebraic content of "offices narrow scope": $\odot$ with $f$ is $f$-absorbing, so an office's explicit denial overrides an agent's grant.

**Mode-level restriction $\sigma_M$:** Per [modal-restriction](../modal-restriction/modal-restriction.md), a mode is a further restriction atop the agent + office composition.
A mode that removes write predicates sets $\sigma_M(\text{writes}, p) = f$ for the relevant $p$, composing as $f$-absorbing through $\odot$.
Entering a mode is therefore a $\leq_k$-decrease in $\sigma_{\mathrm{eff}}$ for the restricted predicates — more restrictive, less information admitted.

## Engineering consequences

**Capability grants are immediate and monotone.** When a governance act grants a new capability to an agent or office (a substrate edit per [apply-edit](../code/transformers/apply-edit.md)), the next session opening recomputes $\sigma_{\mathrm{eff}}$ with the new predication.
By monotonicity, only the cells touched by the new predication change; the rest of $\sigma_{\mathrm{eff}}$ is unchanged.
There is no authorization-system reload and no side-effects on unrelated predicates.

**Office denial cannot be circumvented by agent grant.** An office that explicitly denies a predicate ($\sigma_O(p) = f$) produces $\sigma_{\mathrm{eff}}(p) = f$ regardless of $\sigma_A(p)$, because $\odot$ is $f$-absorbing.
An agent that inhabits an office with an explicit scope denial cannot circumvent the denial by having a broader agent-level scope.
The algebra enforces containment.

**Mode transitions are safe.** Per [mode-transition](../../mode/mode-transition/mode-transition.md), entering a mode inserts a mode-restriction predication; exiting a mode retracts it.
By the monotonicity theorem: entering a mode moves $\sigma_{\mathrm{eff}}$ down in $\leq_k$ for restricted predicates (fewer operations admissible); exiting a mode moves $\sigma_{\mathrm{eff}}$ back up for those predicates.
Mode transitions cannot arbitrarily widen authorization — they can only move the effective scope in the directions the contributing fibers allow.

**Scope conflicts surface as $\top$-cells.** When two contributing fibers assert conflicting scope values for the same predicate — agent says `reads: channel-X` ($t$) and office says `denies-reads: channel-X` ($f$) — the composition $t \odot f$ passes through the bilattice to produce a value in $\{\top\}$ at that cell.
Per [validation-as-settlement](../settlement/validation-as-settlement/validation-as-settlement.md), the $\top$-cell surfaces as a substrate coherence issue: the agent's scope and the office's scope-bound are contradictory.
The authorization decision for that predicate is $\top$ (contested), not $t$ or $f$.
This requires repair — either the agent's scope or the office's bound must be revised.
The substrate makes the conflict visible rather than silently picking a winner.

**Federation-coherent authorization.** Two FARS instances that federate share the same bilattice value-domain and the same $\odot$ operator.
If both instances receive the same contributing scope fibers (via federation), their effective scope computations are identical by the determinism of $\odot$.
Authorization decisions across federated FARS instances are cross-realization comparable — auditors in instance A can verify authorization decisions recorded in instance B.

## What the theorem requires

- The substrate's value-domain is the four-bilattice with $\odot$ (twist-product fusion) $\leq_k$-monotone in both arguments.
- The effective scope computation is implemented as pointwise $\odot$ across the three contributing fibers, as declared in [scope-as-fiber](../scope-as-fiber/scope-as-fiber.md).
- Authorization checks read the effective scope fiber's values directly, without a separate permission-table lookup that could bypass the fiber computation.

## What the theorem does not claim

The theorem establishes monotonicity in $\leq_k$.
It does not claim:

- **Monotonicity in $\leq_t$.** Adding a capability predication may produce a $\top$-cell (if the new predication conflicts with an existing denial), which is not a $\leq_t$-increase.
  The theorem concerns $\leq_k$ (information order), not $\leq_t$ (truth order).
- **That all scope expansions are safe.** Monotonicity says the effective scope moves in the direction of the contributing-fiber change.
  A mistaken capability grant (granting too broad a scope) produces a correct $\leq_k$-monotone outcome — the effective scope correctly widens.
  Whether the widening is *intended* is a governance question outside the theorem's scope.
