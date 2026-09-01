---
name: relation-to-relational-calculus
type: narrative
class: cross-vault-relationship
discusses: [ritm, cohesive-quadruple, kz-comonad-G, recursive-realization, filter-induced-restriction-of-ritm]
depends-on:
  - ritm
  - cohesive-quadruple
  - kz-comonad-G
  - "../../../../../relational-calculus/triage/_index.md"
---

The [relational-calculus pilot](../../../../../relational-calculus/triage/_index.md) is the *philosophical-narrative* layer of the relational program. It names every concept this subtheory types — [RITM](../../../../../relational-calculus/triage/concepts/ritm.md), [cohesive chain](../../../../../relational-calculus/triage/concepts/cohesive-chain.md), [Flow](../../../../../relational-calculus/triage/concepts/flow.md), [Stratifying](../../../../../relational-calculus/triage/concepts/stratifying.md), [Generative Closure](../../../../../relational-calculus/triage/concepts/generative-closure.md), [Discipline / Regime / Filter / Profile](../../../../../relational-calculus/triage/concepts/discipline-regime-filter-profile.md) — but does not type them as objects with formal frontmatter.

This subtheory's job is the typing. Each pilot concept has a corresponding typed object, morphism, or theorem here:

| Pilot concept | Typed here as |
|---|---|
| `ritm` (concept) | [`ritm`](../objects/ritm.md) (object: definition) |
| `cohesive-chain` (concept) | [`cohesive-quadruple`](../morphisms/cohesive-quadruple.md) (morphism: adjoint-quadruple) |
| `flow` (concept) | [`kz-comonad-G`](../morphisms/kz-comonad-G.md) (morphism: 2-comonad) |
| `stratifying` (concept) | [`stratified-directed-infinity-site`](../objects/stratified-directed-infinity-site.md) + [`constructibility`](../teaching/explanations/constructibility.md) |
| `generative-closure` (concept) | [`recursive-realization-theorem`](../theorems/recursive-realization-theorem.md) (the geometric face of the same fixed-point pattern) |
| `filter-induced-reflexive-reconstruction` (theorem) | [`filter-induced-restriction-of-ritm`](../theorems/filter-induced-restriction-of-ritm.md) (the geometric-side restriction) |
| `heyting-closure-of-movement-i` (theorem) | [`heyting-closure-shadow`](../theorems/heyting-closure-shadow.md) (the geometric source of the algebraic statement) |

The relationship is asymmetric: the pilot is *upstream* in the philosophical sense (it provides the names and the philosophical motivation); this subtheory is *upstream* in the formal sense (it provides the typed structures the pilot's narrative relies on for its claims to be coherent).

A reader who arrives at this subtheory from the pilot should read the pilot's narrative for the *why* of each construct, then read this subtheory's typed notes for the *what* and the *how*. A reader who arrives here from predication categories should read this subtheory for the *cohesive-∞-topos lift of bilattice-fibrations*, then optionally consult the pilot for the philosophical framing.

One slug collides: `ritm` is both a pilot concept and a local typed object. The collision is intentional and documented in [`dependency-audit.md`](../dependency-audit.md). The collision is also the most concise possible statement of the typing relationship: the same name covers the philosophical concept and its formal type.
