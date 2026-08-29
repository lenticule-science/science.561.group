---
type: concept
class: substrate-primitive
depends-on: [bilattice-accessibility-relation, world-set, modal-necessity-operator, predication-fiber-algebra, four-bilattice, twist-product-right-residual, self-representation, hash-discipline]
see-also: [governance-as-modal-restriction, trust-boundary-modal-validity, federation-trust-bilattice-graded, capability-non-amplification, authentication-as-modal-restriction, agent-self-queueing-bounded-by-modal-restriction, modal-restriction-as-substrate-authorization-primitive]
---

# Substrate accessibility relation

The substrate's *one [bilattice accessibility relation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md) $R$* — the unified $\mathbf{L}^\bowtie$-valued relation on the substrate's [world set](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/world-set.md) that serves as the input to every $\Box_R$ evaluation in the substrate's authorization discipline. In the substrate's hyperdoctrine setting, $R$ is *one substrate-recorded object*, queried by [governance](theories/agential-orchestration-platform/concepts/governance.md), [trust-boundary](trust-boundary.md), [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md), [capability-passing](theories/functional-runtime-platform/concepts/capability-passing.md), [authentication-flow](theories/interactive-application-platform/concepts/authentication-flow.md), and [agent-self-queued-work](theories/agential-orchestration-platform/concepts/agent-self-queued-work.md) — six engineering surfaces, one structural relation.

Per [modal-restriction-as-substrate-authorization-primitive](../theorems/modal-restriction-as-substrate-authorization-primitive.md), $\Box_R$ on the substrate's content fibers is the substrate's *single authorization primitive*; the surfaces correspond to different sub-regions of $R$, but the relation itself is one substrate-content object.

## Why this concept exists

Six PredComp theorems each apply $\Box_R$ to the substrate's authorization machinery: governance authority, trust-boundary admission, federation peer trust, call-graph capability, user-session capability, agent self-queueing capability. Each theorem treats $R$ as if it were local to its surface — `R` for governance, `R` for federation, `R` for authentication, etc. But these are *the same relation*. A substrate doesn't have six independent accessibility relations; it has one, with multiple sub-regions accessed by different surfaces.

This concept names the unification, makes $R$'s substrate-content structure explicit, specifies how its sub-regions compose, and states what closure rules govern its updates.

## Hyperdoctrinal grounding

Per [bilattice-accessibility-relation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md), an accessibility relation is

$$R : W \times W \to \mathbf{L}^\bowtie$$

from ordered world-pairs to bilattice values. The substrate's $R$ has:

- **The world set $W$** consisting of (substrate-instance, scope, governance-context, principal, time-window) tuples — every distinguishable position the substrate can talk about as a "world" in its modal calculus.
- **The bilattice $\mathbf{L}^\bowtie$** is the substrate's value-domain (typically $\mathbf{FOUR}$ per [bilattice-operation-table](bilattice-operation-table.md)).
- **The relation function** maps each pair to a value: $\mathbf{t}$ (admitted), $\mathbf{f}$ (denied), $\bot$ (uninformed), $\top$ (contested).

Per [self-representation](self-representation.md), $R$ is substrate content: each cell $R(w_1, w_2)$ is a predication on the (world, world) pair. The substrate stores the relation as ordinary cells; per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), each cell has a canonical-form hash; per [self-representation](self-representation.md), an auditor can query "what is $R(w_1, w_2)$?" via standard substrate traversal.

## Sub-regions of R, by engineering surface

Different substrate operations consult different sub-regions of $R$:

### Governance sub-region $R_\mathrm{gov}$

Per [governance-as-modal-restriction](theories/agential-orchestration-platform/theorems/governance-as-modal-restriction.md), governance accessibility is the sub-relation indexed by (office-world, agent-world) pairs. $R_\mathrm{gov}(o, a)$ records "in office $o$'s world, may agent $a$ act?"

### Trust-boundary sub-region $R_\mathrm{trust}$

Per [trust-boundary-modal-validity](../theorems/trust-boundary-modal-validity.md), trust-boundary accessibility is the sub-relation indexed by (interior-world, exterior-world) pairs. $R_\mathrm{trust}(w_\mathrm{ex}, w_\mathrm{in})$ records "may content from $w_\mathrm{ex}$ enter $w_\mathrm{in}$?"

### Federation sub-region $R_\mathrm{fed}$

Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), federation accessibility is the sub-relation indexed by (peer-substrate, peer-substrate) pairs. $R_\mathrm{fed}(p_1, p_2)$ records "do these peers trust each other, and to what grade?"

### Call-graph sub-region $R_\mathrm{call}$

Per [capability-non-amplification](theories/functional-runtime-platform/theorems/capability-non-amplification.md), call-graph accessibility is the sub-relation indexed by (caller-world, callee-world) pairs. $R_\mathrm{call}(f, g)$ records the capability admission along the call edge.

### Authentication sub-region $R_\mathrm{auth}$

Per [authentication-as-modal-restriction](theories/interactive-application-platform/theorems/authentication-as-modal-restriction.md), authentication accessibility is the sub-relation indexed by (account-world, user-agent-world) pairs. $R_\mathrm{auth}(a, u)$ records "via what authentication strength does user-agent $u$ act as account $a$?"

### Agent-self-queueing sub-region $R_\mathrm{self}$

Per [agent-self-queueing-bounded-by-modal-restriction](../theorems/agent-self-queueing-bounded-by-modal-restriction.md), agent-self-queueing accessibility is the sub-relation indexed by (agent-world, agent-world) pairs (the agent's own world, since self-queueing is a self-edge). $R_\mathrm{self}(a, a)$ records the agent's own capability bound for its self-queued work.

## R is one relation, sub-regions are not independent

A naive view would treat the six sub-regions as independent. But they share structure:

- An agent's session capability ($R_\mathrm{auth}$) bounds the agent's self-queueing capability ($R_\mathrm{self}$). The session can't grant self-queueing authority beyond what authentication established.
- An agent's call-graph capability ($R_\mathrm{call}$) is bounded by its session capability ($R_\mathrm{auth}$). A function called by the agent can't use authority the agent doesn't have.
- A federation peer's trust ($R_\mathrm{fed}$) bounds what governance decisions ($R_\mathrm{gov}$) the peer can witness across the federation.
- A trust-boundary admission ($R_\mathrm{trust}$) bounds what authority can cross the boundary, which then composes with the receiver's $R_\mathrm{gov}$ for downstream operations.

These compositions are structural per the substrate's modal calculus. Per [modal-restriction-as-substrate-authorization-primitive](../theorems/modal-restriction-as-substrate-authorization-primitive.md), $\Box_R$'s monotonicity ensures that composing sub-regions never *amplifies* — a chain of $\Box_R$ evaluations is bounded by the weakest grade in the chain.

## R's lifecycle

$R$ is a substrate-content relation that updates as the substrate operates:

- **Admission** — a new $R(w_1, w_2)$ cell is admitted when a new accessibility is established (a peer is admitted to the federation, an authentication produces a session, a governance decision authorizes an action).
- **Strengthening** — a cell at $\bot$ moves to $\mathbf{t}$ when verification passes (a peer's signature verifies, a federation handshake succeeds).
- **Weakening** — a cell at $\mathbf{t}$ moves to $\mathbf{f}$ when revocation happens (a peer is removed, a session is revoked, a key is compromised).
- **Conflict** — a cell moves to $\top$ when contradictory information is admitted (two governance operators issued conflicting decisions about a peer). Per [repair-as-top-cell-resolution](../theorems/repair-as-top-cell-resolution.md), the $\top$-cell surfaces for resolution.

Per [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md), every change to $R$ produces a witness — auditors can trace when an accessibility was established, by what authority, against what evidence.

## Federation-wide R

Different federation peers have different $R$s — each substrate maintains its own. Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), federation $R_\mathrm{fed}$ is the sub-region of *each substrate's* $R$ recording trust toward the other.

Two federation peers may disagree on a third party's accessibility — peer $A$ trusts peer $C$ at $\mathbf{t}$, peer $B$ trusts peer $C$ at $\bot$. This is structurally fine per the bilattice — different worlds, different accessibility. The federation discipline doesn't require global agreement on $R$; it requires *consistent local evaluation* of $\Box_R$ at each peer.

## What the discipline rules out

- **Independent per-surface accessibility relations.** A substrate that maintains six independent accessibility relations (one per surface, with no shared structure) is implementing a more complex thing than the substrate's unified $R$. Per [modal-restriction-as-substrate-authorization-primitive](../theorems/modal-restriction-as-substrate-authorization-primitive.md), the substrate's authorization is structurally one relation; multiplying it is wasteful.
- **Out-of-substrate accessibility data.** $R$ stored externally (in a separate access-control system, a directory service, etc.) breaks the substrate's structural coherence — federation peers can't audit, replays can't reconstruct authorization decisions. Per [self-representation](self-representation.md), $R$ is substrate content.
- **Implicit accessibility derived from runtime state.** A substrate that derives accessibility from current process membership, current network topology, current time-of-day in ways not represented as substrate predications has lost determinism. Per [determinism-via-fiber-functoriality](../theorems/determinism-via-fiber-functoriality.md), authorization decisions must depend only on substrate content.
- **Boolean $R$.** Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), the bilattice values are structurally needed — Boolean accessibility loses $\bot$ (uninformed) vs $\mathbf{f}$ (denied) and $\top$ (contested) vs $\mathbf{t}$ (admitted) distinctions that real federation/governance scenarios depend on.

## Position

The substrate accessibility relation is the substrate's *single authorization data structure*. Per [modal-restriction-as-substrate-authorization-primitive](../theorems/modal-restriction-as-substrate-authorization-primitive.md), the substrate's authorization machinery is one phenomenon — $\Box_R$ on $R$ — at multiple engineering surfaces. The surfaces vary in *which sub-region of $R$ they read* and *what they compute against*, but they share the same modal calculus on the same substrate-content relation.

The concept composes with all six modal-authorization theorems, with [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md) (the federation sub-region of $R$ is recorded there), with [witness](witness.md) (every $R$ change is witnessed), with [self-representation](self-representation.md) ($R$ is substrate content), and with [governance-decision-modal-decidability](../theorems/governance-decision-modal-decidability.md) (every $\Box_R$ evaluation on $R$ is decidable in PSPACE).
