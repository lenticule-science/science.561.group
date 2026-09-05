---
type: theorem
class: fibration-comonad-instantiation
status: sketch
symbol: "\\mathrm{prop}(w) \\;=\\; \\mathrm{descend}_{\\Sigma}(w)"
depends-on: [agent-team-as-bilattice-network-sheaf, witness-as-increment, adjudicate-witness-conflict, capability-fiber-bundle, operations-settling]
realizes: [emmenegger-fibration-comonad, gray-street-fibration-monad, settling-cohomology-vanishing-via-husainov-cech]
---

# Witness-network propagation as fibration-comonad descent

**Witness propagation** — the substrate-algebraic content of *"a witness statement at one node of an agent-team is incorporated into the cell-systems of neighboring nodes through the team's witness-sharing protocol"* — presents as **descent along the fibration comonad** $\Sigma$ of [emmenegger-fibration-comonad](../../../../../../math/theories/categories/theories/predication-categories/theorems/emmenegger-fibration-comonad.md). The witness-network of a team is a cloven fibration $\pi : \mathcal{W} \to \mathcal{T}$ over the team's communication topology $\mathcal{T}$. By the cited theorem, $\pi$ is a pseudo-coalgebra for $\Sigma$ at the fibration-object level, with cleavage data $\gamma_\pi$ supplying canonical transport morphisms along communication channels. A witness submission $w$ at node $t$ is propagation data layered on this structure; propagation to neighbors uses $\gamma_\pi$'s cleavage to transport $w$ along channels, and the global descent question is whether the resulting transports satisfy a triple-overlap cocycle.

Witness propagation is **descent-clean** — the propagated witness produces a globally consistent cell-pattern across the team — exactly when the descent data satisfies the standard cocycle condition; it is **descent-failed** — the propagation produces inconsistent local cell-patterns at different nodes — when the cocycle fails. Inconsistency-recovery (the team's protocol for restoring consistency after a descent failure) is the [adjudicate-witness-conflict](../morphisms/adjudicate-witness-conflict.md) operation; substrate-algebraically, it selects a representative cell-pattern from the cocycle-failure cohomology class.

The substantive claim is that **witness-sharing protocol design is a descent-data design problem** — the practitioner-recognized choices of "broadcast vs. gossip vs. consensus" are choices of how the comonad's comultiplication is implemented over the fibration's communication topology, with measurable consequences for descent-cleanliness and inconsistency-recovery latency.

## Setup: witness-network fibration

Per [agent-team-as-bilattice-network-sheaf](agent-team-as-bilattice-network-sheaf.md), an agent team is a bilattice-network sheaf with the team's communication graph as base. The **witness-network fibration** $\pi : \mathcal{W} \to \mathcal{T}$ has:

- **Base $\mathcal{T}$**: the team's communication topology — nodes are agents, edges are witness-sharing channels (each channel is a relation specifying who can submit witnesses to whom).
- **Total $\mathcal{W}$**: the bundle of local witness cell-systems — each fiber $\mathcal{W}_t$ over node $t$ is the cell-system of witnesses agent $t$ has incorporated into their local view of the operations settling.
- **Projection $\pi$**: forget-the-fiber-content, retain communication topology.

A **witness statement** at node $t$ is a [witness-as-increment](../morphisms/witness-as-increment.md) cell-pattern $w \in \mathcal{W}_t$. **Propagation** takes $w$ and produces a cell-pattern on $\mathcal{W}_{t'}$ for each $t'$ reachable from $t$ in $\mathcal{T}$.

By [emmenegger-fibration-comonad](../../../../../../math/theories/categories/theories/predication-categories/theorems/emmenegger-fibration-comonad.md), the fibration $\pi$ admits a comonad structure $\Sigma$ on the total category whose counit is the projection-to-fiber and whose comultiplication is the duplicate-with-context map. Propagation of $w$ along the fibration is, formally, the descent of the local $\Sigma$-coalgebra $(\mathcal{W}_t, w)$ along the fibration to a descent datum on the bundle.

## Statement

**Theorem (witness propagation as fibration-comonad descent).** *Let $\pi : \mathcal{W} \to \mathcal{T}$ be the witness-network fibration of an agent team, $\Sigma$ the fibration comonad of [emmenegger-fibration-comonad](../../../../../../math/theories/categories/theories/predication-categories/theorems/emmenegger-fibration-comonad.md), and $w$ a witness statement at node $t \in \mathcal{T}$. Then:*

(a) **(Fibration-level pseudo-coalgebra; witness as propagation datum.)** *Per [emmenegger-fibration-comonad](../../../../../../math/theories/categories/theories/predication-categories/theorems/emmenegger-fibration-comonad.md), the cloven fibration $\pi : \mathcal{W} \to \mathcal{T}$ presents — at the **fibration object level**, not at the level of an element in any single fiber — as a pseudo-coalgebra $(\pi, \gamma_\pi)$ for the lax-idempotent 2-comonad $\Sigma = \mathbb{N}$ on $\mathbf{Cat}/\mathcal{T}$. A **witness submission** $w$ at node $t$ is then a separate piece of **propagation data**: a section-like assignment $w : \{t\} \to \mathcal{W}_t$ together with the cleavage data the fibration's pseudo-coalgebra structure $\gamma_\pi$ supplies for transporting $w$ along communication-channel morphisms in $\mathcal{T}$. The witness submission does **not** induce a fiber-level $\Sigma$-coalgebra by itself; it uses the fibration's already-existing pseudo-coalgebra structure to define how the witness moves between fibers.*

(b) **(Propagation as descent datum.)** *Propagation of $w$ to neighboring nodes is the construction of a **descent datum** for $(\mathcal{W}_t, \alpha_w)$ along the fibration $\pi$ — a family $\{(\mathcal{W}_{t'}, \alpha_w^{t \to t'})\}_{t' \in N(t)}$ of $\Sigma$-coalgebras at each neighbor $t'$, together with isomorphisms between them on overlap nodes. The propagation protocol's design is the choice of which descent data to construct.*

(c) **(Descent-clean propagation.)** *Propagation is **descent-clean** — the descent data assemble into a globally consistent $\Sigma$-coalgebra on the bundle — iff the descent data satisfies the standard cocycle condition: for any three nodes $t_1, t_2, t_3$ with shared communication, the propagated coalgebra structures agree on the triple intersection (i.e., $\alpha_w^{t_1 \to t_3} = \alpha_w^{t_2 \to t_3} \circ \alpha_w^{t_1 \to t_2}$ on the relevant restrictions). When this cocycle holds, the propagation produces a single global witness-cell-pattern that all nodes agree on.*

(d) **(Descent failure ⟹ inconsistency-cohomology class.)** *When the cocycle condition fails, the failure is recorded as a non-trivial class in the descent cohomology — equivalently, in the Čech cohomology $\check{H}^1$ of the team's communication cover with values in the witness-network sheaf. By [settling-cohomology-vanishing-via-husainov-cech](../../../../../../math/theories/categories/theories/predication-categories/theorems/settling-cohomology-vanishing-via-husainov-cech.md), this cohomology vanishes in degrees $\geq 2$ on Husainov-acyclic communication covers; descent failures therefore concentrate in $\check{H}^1$ — the "inconsistency degree" — and not in higher degrees.*

(e) **(Adjudication selects a $\check{H}^1$-representative.)** *The [adjudicate-witness-conflict](../morphisms/adjudicate-witness-conflict.md) operation, applied to a descent-failed propagation, selects a representative cell-pattern from the $\check{H}^1$-class of the descent failure. Per [adjudication-modes-and-h1](./adjudication-modes-and-h1.md), the choice of adjudication mode determines which representative is canonical for the team. Different adjudication modes select different representatives; the descent-failure class is the same.*

## Sketch

**(a)** [emmenegger-fibration-comonad](../../../../../../math/theories/categories/theories/predication-categories/theorems/emmenegger-fibration-comonad.md) classifies cloven Grothendieck fibrations over $\mathcal{T}$ as pseudo-coalgebras for the lax-idempotent 2-comonad $\mathbb{N}$ on $\mathbf{Cat}/\mathcal{T}$. The witness-network fibration $\pi$, being cloven by hypothesis, is such a pseudo-coalgebra at the fibration-object level; the structure map $\gamma_\pi$ is the pseudo-coalgebra structure the cited theorem supplies. A witness submission $w$ at node $t$ is propagation data layered on top of this structure: it specifies a cell in $\mathcal{W}_t$ to be transported, and the fibration's cleavage (encoded in $\gamma_\pi$) supplies the canonical morphism along each communication channel in $\mathcal{T}$ for transporting $w$. The cited theorem does **not** assert that an element of a single fiber induces a fiber-level coalgebra; that misreading is avoided here by restricting the coalgebra structure to the fibration object and treating the witness as separate propagation data. $\square$ (Sketch (a))

**(b)** Propagation is, by definition, the production of fiber-coalgebra structures at neighboring nodes $t'$. The fibration's transition functions (along the communication channels in $\mathcal{T}$) supply the candidate isomorphisms between neighboring fibers; the propagation protocol specifies how to use these to construct $\alpha_w^{t \to t'}$ from $\alpha_w$. The collection $\{(\mathcal{W}_{t'}, \alpha_w^{t \to t'})\}$ is a descent datum in the standard fibered-categorical sense. $\square$ (Sketch (b))

**(c)** The cocycle condition is the standard descent condition for a fibration comonad: triple-overlap compatibility of the structure maps. When satisfied, descent theory (per the standard Bénabou–Roubaud / Beck monadicity machinery applied via [emmenegger-fibration-comonad](../../../../../../math/theories/categories/theories/predication-categories/theorems/emmenegger-fibration-comonad.md)) produces a global $\Sigma$-coalgebra on the bundle. The substrate-algebraic interpretation: when neighbors propagate consistently across triple intersections, all nodes assemble the propagated witness into the same global cell-pattern. $\square$ (Sketch (c))

**(d)** Cocycle failure is, by general descent theory, a class in $\check{H}^1$ of the cover with values in the fibration's automorphism sheaf. Applied to the witness-network fibration, this is $\check{H}^1$ of the team's communication cover with values in the witness-cell-system sheaf. The cited [settling-cohomology-vanishing-via-husainov-cech](../../../../../../math/theories/categories/theories/predication-categories/theorems/settling-cohomology-vanishing-via-husainov-cech.md) establishes vanishing in degrees $n \geq 2$ for Husainov-acyclic sites; the team's communication cover, when designed for clean descent (no spurious higher-cocycle structure), inherits this vanishing. So genuine inconsistency-content concentrates in $\check{H}^1$. (Whether a given team's communication topology actually satisfies Husainov-acyclicity is a per-team empirical question; teams with non-acyclic topologies can in principle carry higher-degree descent obstructions, though these correspond to "communication-topology-induced" rather than "witness-content-induced" inconsistencies.) $\square$ (Sketch (d))

**(e)** Per [adjudication-modes-and-h1](./adjudication-modes-and-h1.md), each $H^1$-class corresponds to an adjudication-mode obligation. The adjudicator's choice of mode (default-deference, weighted-aggregation, exhaustive-reconciliation, etc.) selects which representative cell-pattern from the $\check{H}^1$-class is recorded as the team's resolved witness. The class itself — the descent-failure obstruction — is invariant; only the representative differs. $\square$ (Sketch (e))

## Operational consequences

### Witness-protocol design = descent-data design

The (b)-(c) reading reframes the practitioner-recognized choices of witness-sharing protocol — *"broadcast,"* *"gossip,"* *"BFT consensus,"* *"eventual-consistency replication"* — as choices of descent-data construction. Each protocol specifies how propagated coalgebras are assembled at neighbors and what cocycle conditions are checked.

- **Broadcast** ($t$ pushes $w$ identically to all $t'$): trivial transition functions (identity); cocycle holds trivially; descent-clean by construction. Cost: requires every node to be reachable from $t$ in one step.
- **Gossip** (each $t' \in N(t)$ receives $w$, then re-propagates to its own neighbors): non-trivial transition functions composed at each step; cocycle requires gossip-step compositions to commute on triple overlaps; descent failure is realistic when gossip-steps reorder differently at different paths.
- **BFT consensus** (nodes agree on $w$ before incorporation via a Byzantine-fault-tolerant protocol): the consensus step *forces* the cocycle by collective voting; descent-clean by post-hoc enforcement.
- **Eventual consistency** (each node propagates locally, conflicts resolved later): cocycle deliberately not enforced at propagation time; descent failures accumulate as $\check{H}^1$-classes that the eventual-consistency reconciliation resolves.

The substrate-algebraic content: choice of protocol *is* choice of how to manage the descent cohomology — at propagation time (broadcast, BFT) or at reconciliation time (gossip, eventual consistency).

### Inconsistency latency = $\check{H}^1$-decay rate

The (d)-(e) reading identifies the practitioner-recognized notion of *inconsistency latency* — *"how long after a divergent witness submission does the team converge on a consistent state?"* — with the decay rate of the $\check{H}^1$-class under the team's adjudication operations. Substrate-algebraically: each adjudication round selects a $\check{H}^1$-representative and (if the class is now trivial) closes the inconsistency. The rate at which the class becomes trivial (or stays non-trivial) is a measurable team property.

Teams with high inconsistency latency operate persistently with non-trivial $\check{H}^1$ in their witness-network — the multi-agent CRDT analysis of [multi-agent-work-as-crdt](multi-agent-work-as-crdt.md) gives the conditions under which this latency is bounded; the present theorem's $\check{H}^1$-class is the precise cohomological content of the CRDT's "uncommitted divergence."

### Witness loss = fiber acyclicity failure

A node $t$ that loses its local witness store (a crash, a memory wipe) presents as a fiber $\mathcal{W}_t$ that is no longer a $\Sigma$-coalgebra in the propagated bundle — the descent datum has a missing fiber. Recovery is the construction of a new $\alpha_w^{t' \to t}$ from a neighbor's cell-pattern; substrate-algebraically, this is a *re-descent* of the propagated coalgebra into the empty fiber. Such recovery is descent-clean iff some neighbor's cell-pattern, transported to $t$, satisfies the cocycle condition with the team's other propagated cells. When no neighbor's cell-pattern alone suffices, the recovery is a *consensus* operation across multiple neighbors — formally, a higher-order descent computation.

## Status

`sketch` because:

- The fibration-comonad descent machinery of [emmenegger-fibration-comonad](../../../../../../math/theories/categories/theories/predication-categories/theorems/emmenegger-fibration-comonad.md) is established for general fibrations on the predication-category setting; the specialization to the witness-network fibration assumes the witness-network is in fact a fibration (which holds when communication channels are functorial transition maps — the typical operational case but not invariant under all team-structure changes).
- The Husainov-acyclicity hypothesis of (d) on the communication cover is stated as a sufficient condition for vanishing in degrees $\geq 2$; the *necessary* conditions, and what teams commonly violate them, are open empirical questions.
- The descent-cohomology / $\check{H}^1$ identification is correct in the standard fibered-categorical setting but the specific bilattice-valued cohomology computation deserves explicit treatment for the bitopological-site structure of [bilattice-network-sheaf-consensus](../../../../../../math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md).
- The protocol-design reading of operational consequences is correct in direction but each protocol's precise descent-data construction would benefit from explicit specification.

The directional content — that witness propagation is fibration-comonad descent, descent-clean propagation requires cocycle-compatible transition functions across triple-overlap nodes, and inconsistency obstructions live in $\check{H}^1$ resolvable by adjudication-mode-selecting an $H^1$-representative — is the substantive proposal of this sketch.

## Where used

- [agent-team-as-bilattice-network-sheaf](agent-team-as-bilattice-network-sheaf.md) — supplies the team-as-network-sheaf structure on which the witness-network fibration is built.
- [witness-as-increment](../morphisms/witness-as-increment.md) — supplies the cell-pattern submitted at $t$ that becomes the $\Sigma$-coalgebra structure.
- [adjudicate-witness-conflict](../morphisms/adjudicate-witness-conflict.md) — the operation that selects a $\check{H}^1$-representative from a descent-failed propagation; per (e).
- [adjudication-modes-and-h1](./adjudication-modes-and-h1.md) — the adjudication-mode taxonomy whose modes correspond to $H^1$-representative-selection policies.
- [multi-agent-work-as-crdt](multi-agent-work-as-crdt.md) — the CRDT analysis is the coarse-grained version of the present theorem; the present theorem refines it by exhibiting the fibration-comonad-descent structure underlying the CRDT's eventual-consistency convergence.
- [audit-as-cech-resolution-of-operations-settling](./audit-as-cech-resolution-of-operations-settling.md) — multi-auditor audits use the same descent-cohomology machinery; the auditor-team is itself a witness-network whose audit-witness-propagation is descent-along-the-fibration.

## Open downstream

- *Witness-network topology change.* When the team's communication topology changes (a node leaves, a new channel opens), the fibration changes, and previously-clean descent data may become incomplete or over-determined. The substrate-algebraic content of "team reorganization invalidates prior witnesses" is exactly this fibration-change effect; the precise transformation rules deserve treatment.
- *Cross-team witness-import.* When one team imports a witness from another (a federated multi-team scenario), the import is a base-change along the team-axis inclusion, composed with descent on the importing team's fibration. The combined operation's descent-cleanliness depends on both the import base-change and the local descent — a Beck-Chevalley analysis applies (per [capability-grant-as-base-change-along-grant-inclusion](./capability-grant-as-base-change-along-grant-inclusion.md)).
- *Adversarial witness submission.* When a node submits witnesses designed to maximize $\check{H}^1$ class proliferation — a Byzantine-fault scenario — the descent failures escalate. Whether the team's adjudication modes can handle adversarial $\check{H}^1$ growth (and at what BFT-style guarantees) is open territory at the intersection of this theorem and the BFT consensus literature.
