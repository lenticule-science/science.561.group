---
type: definition
class: rewrite-step
status: current
depends-on: [eta-equivalence, lambda-term]
---

# Eta-reduction step

An **eta-reduction step** is a single application of the [eta-equivalence](teaching/explanations/eta-equivalence.md) rule, read in the contracting direction:

$$
\lambda x.\,(M\;x) \;\longrightarrow_\eta\; M \quad (x \notin \mathrm{FV}(M)).
$$

The reverse direction (η-expansion) inserts the redundant binder; both directions belong to η-equivalence.

## Properties

- η respects typing in STLC: if $\Gamma \vdash \lambda x.\,(M\;x) : A \to B$, then $\Gamma \vdash M : A \to B$.
- $\to_{\beta\eta}^* := \to_\beta^* \cup \to_\eta^*$ is confluent in STLC.
- Adding η to a calculus with [sum-types](../objects/sum-type.md) and [identity-types](../objects/identity-type.md) is *delicate* — naive η-rules for these break confluence and are usually replaced by η-equivalences only at the judgmental-equality level.

## Position

η is what makes function types *extensional* at the syntactic level: two functions agreeing on every argument become judgmentally equal. In [dependent-type-theory](../objects/dependent-type-theory.md), η for [pi-types](../objects/pi-type.md) is standard, η for [sigma-types](../objects/sigma-type.md) is standard, η for [identity-types](../objects/identity-type.md) is exactly what the [univalence-axiom](../theorems/univalence-axiom.md) deliberately omits. Reference: [Barendregt 1984](references/barendregt1984.md) §3.3, [Sørensen & Urzyczyn 2006](references/sorensen-urzyczyn2006.md) §2.4.
