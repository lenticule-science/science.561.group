---
type: definition
class: substrate-entity
realizes: [leader-election]
depends-on:
  - leader-election
  - identity-record
  - federation-graph
  - witness
  - quorum-record
  - four-bilattice
  - bilattice-accessibility-relation
  - modal-necessity-operator
  - closure-2-monad
  - residuated-restriction-as-authority-gate
  - closure-monad-no-non-trivial-periodic-orbits
  - bigraded-common-knowledge
see-also:
  - quorum-record
  - distributed-lock-record
  - leader-election-termination-via-no-periodic-orbits
  - consensus-achieves-bigraded-common-knowledge
---

# Leader record

A **leader record** is the substrate-entity formal definition of a [leader-election](teaching/explanations/leader-election.md) outcome: which substrate-instance is currently leader for which role, in which term/epoch.

## Structural fields

- **`id`** — kebab-case identifier (typically `leader-${role}-${current-term}`).
- **`description`** — one-line summary.
- **`role`** — what the leader is leader *for* (e.g., `serial-id-generator`, `governance-deliberation`, `audit-log-orderer`).
- **`current-leader`** — *derived* (not destructively-mutated) reference to the [identity-record](../../../objects/identity-record.md) of the substrate-instance currently leading. Per the math grounding below, this field is the cellwise $\bigvee_k$-merge over the cluster's recorded election witnesses for the active term, restricted by the term/lease modal $\Box_{R_{\mathrm{term}}}$ per [modal-necessity-operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md). It is *absent* when no election-witness for the active term is currently term-modally supported, not when the substrate has destructively cleared a prior fact.
- **`term`** / **`epoch`** — monotone-increasing integer; bumped on each successful election.
- **`elected-at`** — substrate ordinal of election.
- **`lease-expires-at`** — for lease-based protocols, the expiration ordinal of the current term/lease window — i.e., the boundary at which $R_{\mathrm{term}}$ collapses to $\mathbf f$ and $\Box_{R_{\mathrm{term}}}$ stops witnessing the leader's authority.
- **`election-protocol`** — `bully`, `raft`, `paxos`, `lease-only`.
- **`participating-substrates`** — references to substrate-instances eligible to be leader for this role.
- **`election-witnesses`** — references to per-term witness chains for past elections; per [quorum-record](quorum-record.md), each is a quorum certificate signed under the term-key.
- **`closure-kind`** — `leader-record`.

## Invariants

- **Single-leader-per-term.** At most one current-leader per (role, term) pair.
- **Monotone term.** Term is monotone non-decreasing; new elections bump term.
- **Substrate-recorded.** Per [self-representation](../../teaching/explanations/self-representation.md), leader state is queryable.

## Math grounding

The leader record's structural fields are not free engineering choices — each is the substrate-content surface of a fixed predication-category construction.

- **`(role, term)` is a cell of a [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md).** The role indexes the predicate $\mathrm{leads\text{-}for}(role) \in \mathcal{C}$; the term is the [knowledge-order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) stratum of that predicate's settling. The `current-leader` field at $(role, term)$ is the value, in [$\mathbf{FOUR}$](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md), of the per-cell predication $\mathrm{leads\text{-}for}(role, m)$ aggregated cellwise across the cluster's [bilattice accessibility relation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md).

- **The term/lease window is the modal sub-region of $R$.** The substrate's lease discipline is one [modal necessity operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) $\Box_{R_{\mathrm{term}}}$ parameterized by the sub-region "current term has not expired." `lease-expires-at` is the substrate-recorded ordinal at which $R_{\mathrm{term}}$ collapses to $\mathbf f$, after which $\Box_{R_{\mathrm{term}}}\,\mathrm{leads\text{-}for}(role, m)$ no longer holds and the leader's recorded authority lapses. This is one specialization of [residuated-restriction-as-authority-gate](../theorems/distributed-lock-as-residuated-authority-gate.md) — leadership is the lease-modal restriction of the role-predicate, exactly as the lock is the lease-modal restriction of the holds-predicate.

- **Single-leader-per-term is a no-non-trivial-periodic-orbits fact.** Per [closure-monad-no-non-trivial-periodic-orbits](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-monad-no-non-trivial-periodic-orbits.md), the [closure 2-monad](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) governing the substrate's closure-rule system admits no non-trivial periodic trajectory in its fixed-point lattice — a fact the substrate's leader-election protocol invokes via [leader-election-termination-via-no-periodic-orbits](../theorems/leader-election-termination-via-no-periodic-orbits.md). The substrate-content witness of this fact is the `term` field's monotone-increasing discipline: oscillation between two would-be leaders without bumping `term` is forbidden by closure-driven monotonicity, and bumping `term` records the substrate as having moved to a strictly higher knowledge-order stratum from which the prior contender cannot be re-instated within the same window.

- **The election-witness chain is the bigraded-common-knowledge surface of the leadership claim.** Per [consensus-achieves-bigraded-common-knowledge](../theorems/consensus-achieves-bigraded-common-knowledge.md) (status: `sketch`), a successful election is analyzed as producing *two* fixed points: a truth-axis fixed point (the cluster commonly knows *who* leads) and a knowledge-axis fixed point (the cluster commonly possesses the signed quorum certificate that elected them). Under that analysis, the `current-leader` field captures the truth-axis fixed point and the `election-witnesses` field captures the knowledge-axis fixed point, and a leader-record with `current-leader` set but no propagated `election-witnesses` is the *learner-lag* pathology the engineering theorem identifies. The substrate's two-field discipline is operationally justified independent of the theorem's eventual promotion: the audit operation reads `election-witnesses` to verify the leader's authority chain, while the cluster's runtime resolution reads `current-leader` to route requests, so the two have distinct substrate-level roles regardless of the bigraded analysis's final form.

## Position in the platform

Leader records are the substrate's *leadership registry*. Per [federation-convergence](../../../theorems/federation-convergence.md), the leader-record is replicated via the substrate's normal CRDT mechanisms once agreed; the agreement itself is via the cited election-protocol, and per the math grounding above, the agreement is structurally a quorum-modal restriction of the role-predicate, not an additional primitive.
