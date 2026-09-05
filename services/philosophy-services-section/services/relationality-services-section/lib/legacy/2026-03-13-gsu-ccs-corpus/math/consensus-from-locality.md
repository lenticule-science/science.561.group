---
id: consensus-from-locality
name: ConsensusFromLocality
description: "the sheaf condition on commutation covers is a distributed consensus protocol — local agreement on independent components determines a unique global section."
---

### Theorem — Consensus from Locality {#consensus-from-locality}

*The Axiom of Locality (§locality) is a consensus theorem: covering families are
quorum systems, and sheaf amalgamation is agreement.*

#### Setup {#consensus-setup}

A **distributed system** over a history $t$ is a commutation partition
$t = t^{(1)} \star \cdots \star t^{(n)}$ (§commutation-topology), where each
$t^{(i)}$ is a causally independent component — a node that can execute
concurrently with every other node in the partition. The fiber $H_{t^{(i)}}$
is the local state at node $i$: the Heyting algebra of propositions observable
from that node's causal history alone.

A **local report** is a family $(a_i)_{i=1}^n$ with $a_i \in H_{t^{(i)}}$.
The family is **compatible** if $H(\epsilon_{t^{(i)}})(a_i) = H(\epsilon_{t^{(j)}})(a_j)$
in $H_{t^{(i)} \wedge t^{(j)}}$ for all $i, j$ — local reports agree on the
data visible from their causal overlap. For commutation covers, the pieces
have disjoint step-sets, so $t^{(i)} \wedge t^{(j)} = \varepsilon$ and
compatibility is vacuous (§commutation-topology): for commutation covers, the pieces have disjoint step-sets, so their pairwise meets are the empty history $\varepsilon$ and agreement on overlaps is automatic.

#### The Theorem {#consensus-theorem}

**Theorem.** Let $\{u_i : t^{(i)} \to t\}$ be a commutation cover in $J(t)$.
For any compatible family $(a_i)_{i=1}^n$ with $a_i \in H_{t^{(i)}}$, there
exists a unique $a \in H_t$ such that $H(u_i)(a) = a_i$ for all $i$.

*Proof.* This is the Axiom of Locality (§locality) applied to the commutation
cover. $\square$

The content is not the proof — which is immediate from the axiom — but
the interpretation.

#### Consensus Interpretation {#consensus-interpretation}

The sheaf condition on commutation covers is the abstract form of a
**consensus protocol** over causally independent nodes:

| Distributed systems | Relational universe |
|---------------------|---------------------|
| Node $i$ | Independent component $t^{(i)}$ |
| Local state at node $i$ | Element $a_i \in H_{t^{(i)}}$ |
| Quorum (sufficient subset of nodes) | Covering family $\{u_i\} \in J(t)$ |
| Compatibility (no contradictions) | $H(u_i)(a) = H(u_j)(a)$ on overlaps |
| Consensus (unique global agreement) | Unique amalgamation $a \in H_t$ |
| Byzantine fault (corrupted node) | Fiber demon at $t^{(i)}$ |

The commutation topology $J$ determines which subsets of nodes constitute a quorum:
a family is covering if and only if the independent pieces account for
all of $t$'s causal content. A non-covering family — one missing a
causally essential component — cannot determine a unique global section,
just as a non-quorum subset of nodes cannot reach consensus.

#### Locality as Consistency and Totality {#consensus-locality-totality}

The two halves of the sheaf condition correspond to the two requirements
of consensus:

1. **Locality** (§locality, condition 1): if two global states $a, b \in H_t$
   agree on all local projections, then $a = b$. This is **consistency** —
   the global state is determined by local observations, with no hidden
   degrees of freedom.

2. **Gluing** (§locality, condition 2): every compatible local family lifts to
   a global state. This is **totality** — whenever the local nodes
   produce individually consistent reports, a global agreement exists.

Consistency without totality would be a system where global states are
determined by locals but some compatible local configurations have no
global witness — a deadlock. Totality without consistency would be a system
where every local configuration lifts but the lift is not unique — a
non-deterministic consensus. The sheaf condition is both: deterministic and
complete.

#### Covering Redundancy as Fault Tolerance {#consensus-fault-tolerance}

The base-change axiom of the Grothendieck topology (§commutation-topology
§commutation-topology, base-change axiom) ensures that pulling back
a cover along any sub-history produces a cover of the sub-history.
In the consensus reading: restricting a quorum to a smaller causal scope
still yields a quorum for that scope.

When $t$ admits multiple distinct commutation covers — multiple independent
partitions of its causal content — each cover is an independent quorum.
A global section $a \in H_t$ that survives restriction to all covers is
overdetermined: it can be reconstructed from any single cover.
The number of distinct minimal covers of $t$ measures the **redundancy**
of the consensus protocol. This redundancy is bounded below by the
combinatorial width of $J$ at $t$ (§sheaf-erasure-code).

#### Local Settledness Implies Global Settledness {#consensus-local-global-settling}

**Corollary.** Let $\{u_i : t^{(i)} \to t\}$ be a covering family in $J(t)$.
If $a \in H_t$ satisfies $H(u_i)(a) \in H_{t^{(i)}}^*$ for every $i$,
then $a \in H_t^*$.

*Proof.* For each $i$:
$$
H(u_i)(\sigma_t(a)) = \sigma_{t^{(i)}}(H(u_i)(a)) = H(u_i)(a)
$$
where the first equality is commutation of restriction with $\sigma$
(naturality of the nucleus), and the second is the assumption
$H(u_i)(a) \in H_{t^{(i)}}^*$. Since this holds for all $i$, locality
(condition 1) gives $\sigma_t(a) = a$. The identical argument with $\Delta$
gives $\Delta_t(a) = a$. Therefore $a \in H_t^*$. $\square$

In the consensus reading: if every node reports that its local state is
settled — both $\sigma$-stable (confirmed by past) and $\Delta$-stable
(propagating to all futures) — then the global state is settled. No
additional coordination round is needed beyond the covering family.
This is a **distributed termination detection** theorem: local quiescence
at every node in a quorum implies global quiescence.
