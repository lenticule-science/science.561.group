---
type: theorem
class: engineering-claim
status: proved
depends-on: [lock, acquire, release, predication-cell, predication-fiber-algebra, predication-fiber-residuation, twist-product-fusion, twist-product-right-residual, modal-necessity-operator, modal-necessity-basic-properties, bilattice-accessibility-relation, four-bilattice, knowledge-order, refinements-as-paraconsistent-comprehension, capability-non-amplification, governance-as-modal-restriction, independence-implies-confluence, federation-convergence, lorentzian-causal-settling, event-causality-via-lorentzian-settling, consensus-as-h0-construction]
see-also: [channels-as-residuated-rendezvous, evaluation-as-closure-2-monad-algebra, agent-self-queueing-bounded-by-modal-restriction, frobenius-for-fusion-fails]
---

# Locks are a cardinality-refined modal restriction whose merge fails $\vee_k$-confluence

**Claim.** A [lock](teaching/explanations/lock.md) is a fiber $A_{p_L}$ of the substrate's [predication fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) over a substrate-issued *lock predicate* $p_L$, equipped with two structural commitments:

1. *Cardinality refinement.* The fiber's *holder coordinate* admits at most one cell at the truth-designated value $\mathbf{t}$ at any substrate ordinal — a Lawvere comprehension on $A_{p_L}$ in the sense of [refinements-as-paraconsistent-comprehension](refinements-as-paraconsistent-comprehension.md).
2. *Modal-restriction discipline.* Operations against the lock's `resource` are admitted only when [modal necessity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) $\Box_{R_L}$ along the lock's accessibility relation $R_L$ holds — i.e., only at the current holder's world. This is the same modal discipline that grounds [capability-non-amplification](capability-non-amplification.md), specialized to a single-resource accessibility relation.

[Acquire](../morphisms/acquire.md) is the substrate move that establishes the holder cell at $\mathbf{t}$; [release](../morphisms/release.md) retracts it to the residuated-lattice unit $\mathbf{1}$. The acquisition policies (`fair`, `priority`, `preemptive`) are three orderings of the [lorentzian-causal-settling](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/lorentzian-causal-settling.md) on the waiters; per-substrate fairness is the substrate-side restriction of [event-causality-via-lorentzian-settling](../../../theorems/event-causality-via-lorentzian-settling.md). The four operational outcomes (`held`, `waiting`, `timeout`, `invalid-token`) are the four cardinal values of the holder-cell's verdict in the [four-bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md).

Crucially, the cardinality refinement of (1) **fails** the closure-merge commutation that grounds [federation-convergence](../../../theorems/federation-convergence.md): two independent substrates' simultaneous acquires merge to $\top$ on the holder cell under $\vee_k$, violating the cardinality refinement. A lock therefore cannot federate via the substrate's standard CRDT discipline; cross-substrate exclusivity must escalate to the [distributed-coordination-platform](../../distributed-coordination-platform/_index.md) and reach a unique global section via [consensus-as-h0-construction](../../distributed-coordination-platform/theorems/consensus-as-h0-construction.md). The "Locks are not federation-portable" engineering proverb of [lock](teaching/explanations/lock.md) is the structural failure of $\vee_k$-confluence on the cardinality-refined fiber, not an operational compromise.

## Proof

### Part 1 — A lock is a fiber with a cardinality refinement

Per [lock-record](../objects/lock-record.md), a lock is a substrate entity carrying a `resource`, a `holder` (or absent), a `waiters` queue, an `acquisition-policy`, and a `closure-kind`. Per [self-representation](../../teaching/explanations/self-representation.md) and [witness-as-cell](../../../theorems/witness-as-cell.md), every acquire and release event is itself a cell $(s, p_L^{\mathrm{op}}, o)$ — subject the operation's principal, predicate the lock-event predicate, object the lock's resource.

The fiber $A_{p_L}$ is the standard [predication-fiber-algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) over the lock predicate. The holder-coordinate is the slice of $A_{p_L}$ whose subject ranges over candidate holders and whose object is the locked resource. The cardinality refinement is the Lawvere comprehension

$$\{\,v \in A_{p_L} \;:\; |\{s \in E : v(s, \mathrm{resource}) = \mathbf{t}\}| \leq 1\,\}$$

— a refinement-cell on $A_{p_L}$ whose admissible elements are exactly the buffer states with at most one $\mathbf{t}$-holder. Per [refinements-as-paraconsistent-comprehension](refinements-as-paraconsistent-comprehension.md), this refinement composes with the rest of the substrate's discipline using the same $\leq_t$ entailment and $\odot \dashv \Rightarrow$ adjunction; no separate "mutual-exclusion engine" is needed. $\square$ (Part 1)

### Part 2 — Acquire establishes; release retracts; both via the standard adjoint pair

A successful [acquire](../morphisms/acquire.md) by holder $h$ on a free lock is the fusion $b' = \mathbf{t}_h \odot b$ on $A_{p_L}$, where $\mathbf{t}_h$ is the cell that is $\mathbf{t}$ at $(h, \mathrm{resource})$ and $\mathbf{1}$ elsewhere, and $b$ is the prior fiber state (with no $\mathbf{t}$-holder cell). This is the [left-multiplication operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/left-multiplication-operator.md) $\mathrm{L}_{\mathbf{t}_h}$ — the same operator that grounds [send-channel](../morphisms/send-channel.md) per [channels-as-residuated-rendezvous](channels-as-residuated-rendezvous.md), specialized to the lock fiber.

The matching [release](../morphisms/release.md) by the same $h$ is the [right-residuation operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/right-residuation-operator.md) $\mathrm{R}_{\mathbf{t}_h}(b') = \mathbf{t}_h \Rightarrow b'$, recovering $b$ by [predication-fiber-residuation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-residuation.md). The "lock-token" of the operational signature is, structurally, the witness cell binding the prior holder; the holder-only-release invariant is the residuation's uniqueness clause (the right residual is uniquely determined by $\mathbf{t}_h$, so release with a wrong token does not invert the prior fusion).

The acquire/release pair therefore inherits the same fusion/residual machinery as the channel; locks are not a separate algebraic primitive on top of the runtime. $\square$ (Part 2)

### Part 3 — The modal-restriction discipline is the same as capabilities

Let $W$ be the substrate's [world-set](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/world-set.md) and let $R_L : W \times W \to L^\bowtie$ be the lock's accessibility relation: $R_L(w, w')$ is $\mathbf{t}$ iff $w'$ is a world at which the holder of $w$ has performed the protected operation. An operation against the lock's resource at world $w'$ is admissible iff $\Box_{R_L}\, \mathrm{authorized}$ at $w'$ is $\mathbf{t}$ — exactly the [modal necessity operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) of the capability discipline.

Per [modal-necessity-basic-properties](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-necessity-basic-properties.md), $\Box_{R_L}$ preserves $\wedge_t$ and the strong implication, so chained protected operations compose by modal-conjunction. Per [governance-as-modal-restriction](../../agential-orchestration-platform/theorems/governance-as-modal-restriction.md), this is the substrate-wide composition rule for modal authority; the lock is one $R_L$-presentation among many ($R_L$ for locks, $R$ for capabilities, $R_C$ for channels). The substrate's "verify-the-token-matches-the-current-holder" check in [release](../morphisms/release.md) is the $\Box_{R_L}$-check at the release's world, not a lock-specific bespoke check.

A non-holder's attempted operation fails the modal check at its world — produces $\bot$, surfaced as `invalid-token-witness`. Per [capability-non-amplification](capability-non-amplification.md)'s structural argument, $\Box_{R_L}$ is monotone in the holder's authority: a non-holder cannot derive holder-authority by composing modal restrictions, exactly the lock's mutual-exclusion guarantee phrased modally. $\square$ (Part 3)

### Part 4 — Acquisition policies are orderings on the waiters' causal settling

The waiters queue is, structurally, the substrate's set of acquire-attempt cells whose verdict at their issue-world was $\bot$ (waiting) rather than $\mathbf{t}$ (held). Each waiter cell carries a substrate ordinal $\tau$ (when the attempt issued) and, optionally, additional dimensions (priority, deadline) per the lock-record's `acquisition-policy`.

The three documented policies are three orderings on the waiters' [lorentzian-causal-settling](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/lorentzian-causal-settling.md) (per [event-causality-via-lorentzian-settling](../../../theorems/event-causality-via-lorentzian-settling.md)):

- **Fair-FIFO.** The seed relation is $\prec_0 = \{(w_i, w_j) : \tau(w_i) < \tau(w_j)\}$ — wait-event precedes wait-event by substrate ordinal. The settling's transitive closure is the per-substrate total order on waiters; release wakes the $\prec$-minimal pending waiter.
- **Priority.** Augment $\prec_0$ with $\{(w_i, w_j) : \mathrm{priority}(w_i) > \mathrm{priority}(w_j)\}$, lexicographically priority-then-ordinal. The lorentzian-causal-settling now totalizes the augmented relation; release wakes the new $\prec$-minimal.
- **Preemptive.** Permits the $\prec_0$ to admit a *retraction* edge: a higher-priority arrival can wake before the current holder releases, requiring the holder cell to admit a transient $\mathbf{t} \wedge_k \mathbf{f}$ ($\top$) before the new acquirer's $\mathbf{t}$ supersedes. This is the paraconsistent admission per [refinements-as-paraconsistent-comprehension](refinements-as-paraconsistent-comprehension.md): the cardinality refinement is held pending while the substrate adjudicates the contested cell, with the preempted holder's pending operations rolled back per the substrate's repair discipline.

All three policies are presentations of the same lorentzian-causal-settling on a single fiber — not three independent queueing engines. Adding a fourth policy is a new $\prec_0$ presentation, not a new code path. $\square$ (Part 4)

### Part 5 — Mutual exclusion fails $\vee_k$-confluence; locks are not federation-portable

Suppose two substrates $A$ and $B$ each independently complete an acquire of the lock at their respective ordinals — neither having yet observed the other's acquire. Per [independence-implies-confluence](../../../theorems/independence-implies-confluence.md), the substrate's federation-merge of the two updates to the holder fiber is the cellwise [knowledge-order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) join $\vee_k$:

$$v_{A \cup B}(h, \mathrm{resource}) \;=\; v_A(h, \mathrm{resource}) \,\vee_k\, v_B(h, \mathrm{resource}).$$

Two simultaneous acquires by distinct holders $h_A \neq h_B$ produce, on substrate $A$, the holder cell at $(h_A, \mathrm{resource}) = \mathbf{t}$ with $(h_B, \mathrm{resource}) = \mathbf{1}$; symmetrically on $B$. The cellwise $\vee_k$-merge produces $(h_A, \mathrm{resource}) = \mathbf{t}$ **and** $(h_B, \mathrm{resource}) = \mathbf{t}$ — two simultaneous $\mathbf{t}$-holder cells, violating Part 1's cardinality refinement.

The same holder $h_A = h_B = h$ does not exhibit the failure (the merge produces a single $\mathbf{t}$-cell at $(h, \mathrm{resource})$), but distinct holders structurally do. The closure-merge commutation lemma that powers [federation-convergence](../../../theorems/federation-convergence.md) — $\mathrm{cl}_p(\mathrm{cl}_p(X) \vee_k Y) = \mathrm{cl}_p(X \vee_k Y)$ — *commutes* the operations in the unrefined fiber, but the cardinality refinement is **not** preserved by $\vee_k$: the refinement's admissible-cell set is not a $\vee_k$-sub-semilattice of $A_{p_L}$.

This is structural failure, not implementation accident. The cardinality refinement is the lock's defining content; weakening it to admit the $\vee_k$-merged $\{(h_A, \mathbf{t}), (h_B, \mathbf{t})\}$ state would erase mutual exclusion. The structural alignment with [frobenius-for-fusion-fails](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/frobenius-for-fusion-fails.md) is exact: just as that theorem identifies a refinement (Frobenius) that fails because of an absorber misalignment, the cardinality refinement fails $\vee_k$-confluence because of a holder-coordinate misalignment.

The substrate's three responses to the failure are the engineering-policy surface:

1. *Restrict the lock to a single substrate.* The federation envelope is not crossed; $\vee_k$-confluence is not invoked. This is the lock-record's default discipline per the existing [lock](teaching/explanations/lock.md) concept's "Locks are not federation-portable" entry.
2. *Escalate to the distributed-coordination-platform.* Reach a unique cross-substrate holder by [consensus-as-h0-construction](../../distributed-coordination-platform/theorems/consensus-as-h0-construction.md): the Mayer–Vietoris global section $H^0$ is uniquely the $\mathbf{t}$-holder cell, recovering the cardinality refinement at the level of the consensus-decided value rather than the federation merge.
3. *Use a CRDT instead.* Where mutual exclusion isn't structurally required (e.g., a counter), redescribe the operation as a $\vee_k$-confluent CRDT. The substrate's standard discipline applies, no escalation.

Per [lock](teaching/explanations/lock.md)'s existing engineering text, the substrate's discipline is exactly this trichotomy. This theorem identifies the structural source: it is the cardinality refinement's failure to be a $\vee_k$-sub-semilattice. $\square$ (Part 5)

$\square$

## Engineering consequence

- **Locks share machinery with capabilities.** Per Part 3, the modal-restriction discipline of locks and the modal-restriction discipline of capabilities are the *same operator* $\Box$ applied to two different accessibility relations. Implementations that maintain separate "lock-check" and "capability-check" pipelines duplicate structure the substrate's modal operator gives uniformly.
- **Acquisition policy is declarative, not algorithmic.** Per Part 4, the runtime does not implement three queueing algorithms; it presents three orderings on one lorentzian-causal-settling. The preemptive case is correctly distinguished as the only one requiring paraconsistent admission, which makes its implementation cost (transient-$\top$ cells, repair-rollback discipline) structural rather than implicit.
- **The "no federation" rule is structural, not conventional.** Per Part 5, the cardinality refinement's failure of $\vee_k$-confluence is the precise reason locks cannot be CRDT-merged across substrates. A future runtime that wanted to "make locks federate" would have to weaken the cardinality refinement, at which point it would no longer be a lock.
- **Distributed locks are consensus, not "remote locks".** Per Part 5, response (2), a cross-substrate lock is not a local lock with a longer reach; it is a distinct construction (the [distributed-lock-record](../../distributed-coordination-platform/objects/distributed-lock-record.md) of the [distributed-coordination-platform](../../distributed-coordination-platform/_index.md)) whose holder cell is the $H^0$-section of the consensus protocol. The two records ([lock-record](../objects/lock-record.md) and distributed-lock-record) are not refinements of one another — they live in different fibrations.
- **Lock contention is observable as a $\top$-cell on the holder coordinate.** Per Part 4 (preemptive case) and Part 5 (federation conflict), the substrate's $\top$ on the holder cell is exactly the contested-state of the lock — visible to auditors via the witness chain, not a hidden runtime state. The substrate's adjudication discipline (substrate-resident, recorded) is the policy layer that resolves $\top$ to $\mathbf{t}$ at one specific holder.
- **Lock fairness is causal, not temporal.** Per Part 4 (fair-FIFO case), fairness is the per-substrate lorentzian-causal-settling's total order, not "wall-clock fairness." Two waiters from different substrates have no per-substrate causal order between them; cross-substrate fairness is a consensus problem, not a lock-policy choice.

## What the theorem rules out

- **Lock state as a side-table.** A runtime that stores holder/waiter state outside the predication graph (e.g. in OS-level mutex datastructures alone) loses access to the substrate's modal-restriction, witness, refinement, and adjudication machinery on that state. The holder cell must be an element of $A_{p_L}$.
- **CRDT-style "lock" semantics that eventually-converge.** Per Part 5, eventual convergence on a cardinality-refined fiber is incoherent: the $\vee_k$-merge of distinct simultaneous holders structurally violates the refinement. A runtime that ships an "eventually-consistent lock" is shipping an unrefined fiber whose cardinality is uncontrolled — i.e., not a lock.
- **Cross-substrate locks without consensus.** Per Part 5, response (2), is the only structurally valid cross-substrate exclusivity discipline. A runtime that exposes a cross-substrate `acquire` that does not escalate to the distributed-coordination-platform is exposing a primitive that cannot satisfy the cardinality refinement under the substrate's federation merge.
- **Acquisition policy as a free-floating runtime knob orthogonal to the waiters' causal settling.** Per Part 4, all admissible policies are presentations of the same causal-settling; introducing a "random-wake" or "newest-wait-first" policy that is not an ordering on the lorentzian-causal-settling violates Part 6 of [channels-as-residuated-rendezvous](channels-as-residuated-rendezvous.md)'s causal-settling discipline (which the lock inherits as a special case).
- **Implicit lock acquisition.** A runtime that allows operations to acquire locks ambiently (without an [acquire](../morphisms/acquire.md) call) violates the modal-restriction discipline of Part 3 in the same way that ambient capability use violates [capability-non-amplification](capability-non-amplification.md): there is no $\Box_{R_L}$-cell witnessing the holder's authority.

## What the theorem requires

- The substrate's [predication hyperdoctrine](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md) is the one used elsewhere — locks live as fibers in the same fibration as types, refinements, effects, capabilities, channels.
- Per [lock-record](../objects/lock-record.md), every lock is a substrate entity with an explicit holder, waiters queue, and acquisition policy.
- Per [witness-as-cell](../../../theorems/witness-as-cell.md), acquire and release events are themselves cells in the predication graph.
- Cross-substrate exclusivity escalates to [consensus-as-h0-construction](../../distributed-coordination-platform/theorems/consensus-as-h0-construction.md), not to a CRDT-style federation merge of the lock fiber.

## Position

This theorem completes the structural pass over the functional-runtime-platform's concurrency surface, alongside [channels-as-residuated-rendezvous](channels-as-residuated-rendezvous.md). The runtime's seven-coordinate fibration picture is now closed:

| Discipline | Coordinate | Grounding theorem |
|---|---|---|
| Typing | predication-fibration base | [type-soundness](type-soundness.md) |
| Refinement | comprehension along base | [refinements-as-paraconsistent-comprehension](refinements-as-paraconsistent-comprehension.md) |
| Effect | quantale grade | [graded-effects-via-q-enriched-fusion](graded-effects-via-q-enriched-fusion.md) |
| Capability | modal accessibility | [capability-non-amplification](capability-non-amplification.md) |
| Evaluation | closure-2-monad algebra | [evaluation-as-closure-2-monad-algebra](evaluation-as-closure-2-monad-algebra.md) |
| Channel | residuated buffer fiber + rendezvous modal grade | [channels-as-residuated-rendezvous](channels-as-residuated-rendezvous.md) |
| **Lock** | **cardinality-refined holder fiber + lock-modal accessibility** | **this theorem** |

Channels and locks now sit on the same shelf with the rest of the runtime's disciplines, with the channel/lock distinction structurally explained: channels use the residuation adjunction *without* a cardinality refinement (so they $\vee_k$-merge across federation cleanly per [channels-as-residuated-rendezvous](channels-as-residuated-rendezvous.md), Part 6 of the engineering consequence); locks add the cardinality refinement, which forfeits $\vee_k$-confluence and forces consensus escalation. The CRDT-vs-channel-vs-lock trichotomy of [lock](teaching/explanations/lock.md)'s existing concept text — long stated as engineering folklore — is now backed by the structural fact that exactly the cardinality refinement separates lock-discipline from CRDT-discipline.

What remains policy: which $R_L$-presentations the substrate admits (the acquisition-policy menu of Part 4), the deployment policy on whether a given lock is single-substrate (Part 5, response 1) or consensus-backed (response 2), the timeout-policy declaration on the lock-record, and the substrate's adjudication discipline for resolving transient-$\top$ cells under the preemptive policy. These are now properly framed as policy declarations against the structural backdrop, not free-floating engineering choices.
