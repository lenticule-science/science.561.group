---
type: theorem
class: engineering-claim
status: proved
depends-on: [port, stepping, settlement-determinism, crdt-convergence, predication-fiber-algebra, closure-operator]
see-also: [step, federation-convergence]
---

# Independent steps commute, producing confluent settlement

**Claim.** Let $s_1$ and $s_2$ be two port-typed messages declared *independent* by the [port](teaching/explanations/port.md)'s independence relation $I$. Then for any substrate state at history $t$, the [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) at $t \cdot s_1 \cdot s_2$ equals the settling at $t \cdot s_2 \cdot s_1$, cellwise in every fiber, with the same canonical-form hash and the same witness-chain (modulo step-ordinal labeling).

The substrate's confluence is the engineering content of the port's independence relation: declared-independent message pairs really do commute, and the substrate's runtime can rely on this for parallelization, batched admission, and federation merge.

## Why this holds

The argument has three parts. The substrate-level confluence is a consequence of the same closure-merge commutation lemma that powers [crdt-convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence.md) — independence is the structural condition under which the lemma's consequence becomes the engineering claim "step ordering doesn't matter."

**Part 1: Independence is a port-level structural commitment.** Per [port](teaching/explanations/port.md), the independence relation $I$ is part of the substrate's published [arena](../objects/predicated-arena.md). When the port declares $(s_1, s_2) \in I$, the substrate is committing that admitting these messages in either order produces the same effect — i.e., the same successor valuation in the predication settling. The commitment is verifiable: the substrate can detect violations by replaying both orderings and comparing canonical-form hashes; a substrate that violates a declared independence is non-conforming.

**Part 2: Closure-merge commutation gives the substrate-level confluence.** Per the closure-merge commutation lemma (the technical heart of [crdt-convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence.md)),

$$\mathrm{cl}_p(\mathrm{cl}_p(X) \vee_k Y) \;=\; \mathrm{cl}_p(X \vee_k Y)$$

for any $X, Y \in A_p$. Applied to two messages with increment-contributions $u_{s_1}, u_{s_2}$:

$$\mathrm{cl}_p\!\left(\mathrm{cl}_p(v_t \vee_k u_{s_1}) \vee_k u_{s_2}\right) \;=\; \mathrm{cl}_p(v_t \vee_k u_{s_1} \vee_k u_{s_2}) \;=\; \mathrm{cl}_p\!\left(\mathrm{cl}_p(v_t \vee_k u_{s_2}) \vee_k u_{s_1}\right)$$

— the order of admission does not change the result. **This commutation holds for any pair of messages, independent or not** — it's a property of the closure operator and the join, not a property of the messages.

**Part 3: Independence is the structural redundancy condition.** What the port's independence relation declares is *not* that the math commutation requires it (it doesn't), but that the substrate's runtime is permitted to *exploit* the commutation for parallelism. Two messages that share no closure-rule premises (the structural meaning of independence) can be parallelized without coordination because their settlements touch disjoint regions of the [predication-graph store](../objects/predication-graph-store.md). Two non-independent messages also commute by Part 2, but their settlement effects overlap and cannot be parallelized at the engine level without explicit conflict resolution.

Combining the three: the math always commutes (Part 2), and the port's independence relation declares which pairs the engine may parallelize-or-reorder freely (Parts 1 and 3). The result is confluent settlement under any admissible ordering.

## Engineering consequence

The substrate's confluence under independence is what makes parallel admission *safe*. A substrate's [engine](teaching/explanations/engine.md) can split independent messages across worker processes, accept them in any order from the network transport, batch them in admission groups — all without affecting the substrate's resulting state. Per [substrate-as-stack-composition](teaching/explanations/substrate-as-stack-composition.md), the concurrency stack inherits this guarantee: declared-independent steps parallelize without coordination overhead.

The substrate's *federation-convergence* (per [federation-convergence](federation-convergence.md)) also rests on this. Two federated peers exchanging independent messages in different orders converge to the same state; the federation protocol does not need to enforce a global ordering, only to preserve the dependency structure declared by the port.

The substrate's *replay* is also order-tolerant. An auditor can replay the event log in any order consistent with the port's dependency structure; declared-independent messages may be re-ordered without affecting reconstruction. This makes the [audit-stack](teaching/explanations/substrate-as-stack-composition.md)'s replay tolerant of network reordering, transport buffering, and storage-side compaction.

## What the theorem rules out

Several substrate misbehaviors are violations of the theorem:

- A substrate whose declared-independent steps produce different states under different orderings has either misdeclared the independence relation or has a non-deterministic settlement. Per [settlement-determinism](settlement-determinism.md), the substrate must be deterministic; the resolution is to fix the port declaration or fix the closure-rule system.
- A substrate that requires global ordering for declared-independent messages has lost the parallelization opportunity. The substrate is correct (orderings still produce the same state, just at higher cost) but inefficient.
- A substrate that silently re-orders dependent messages has lost the dependency information. While the math still commutes (Part 2), the engine has lost the structural record of which orderings the runtime intended; replay against such a substrate may produce different states than original execution if the engine relied on dependency information for non-confluence-related reasons (e.g., cost accounting, witness emission ordering).

## What the theorem requires

- The port's independence relation $I$ is correctly declared (declared-independent pairs really have disjoint settlement effects).
- The substrate's closure operator satisfies the four [closure-operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) axioms (monotone in $\leq_k$, inflationary, idempotent, $\mathcal{C}$-natural) — these are the hypotheses of the closure-merge commutation lemma.
- The substrate's value-domain is a [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) (CAI join, bilattice operations).
- The substrate's [hash-discipline](teaching/explanations/hash-discipline.md) produces the same canonical-form hash for canonically-equivalent content regardless of how the content was constructed.

## Connection to Mazurkiewicz traces

The substrate's history monoid quotient under the port's independence relation $I$ is a *Mazurkiewicz trace monoid*. The theorem's content is structurally the Mazurkiewicz-trace property: words modulo independence form a quotient monoid where independent letter-pairs commute. The substrate's adoption of this structure is what makes the engine's parallel scheduling sound — and the substrate-level confluence is grounded in the closure-merge commutation lemma that gives the actual mathematical content of "settlement order doesn't matter."
