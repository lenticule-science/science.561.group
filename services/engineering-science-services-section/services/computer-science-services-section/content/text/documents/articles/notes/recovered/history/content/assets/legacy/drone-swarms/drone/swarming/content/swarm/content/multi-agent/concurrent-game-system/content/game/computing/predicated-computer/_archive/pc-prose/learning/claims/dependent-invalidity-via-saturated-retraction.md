---
type: theorem
class: engineering-claim
status: proved
depends-on: [stratified-cell-atom, witness, witness-chain-as-proof-object, settlement-determinism, closure-rule-system-realizes-closure-2-monad, sigma-delta-pass-decomposition]
math-depends-on: [saturation-respects-asserted-monotonicity, stratified-predication-fiber, canonical-firing-trajectory-via-lex-order]
see-also: [acknowledged-resolution-preserves-top-cell-membership, repair-as-top-cell-resolution, federation-trust-bilattice-graded]
---

# Dependent invalidity via saturated retraction

**Claim.** When the substrate retracts an asserted cell atom $x$ at coordinate $a_x = (s_x, p_x, o_x)$ — by an explicit retraction `cell` event from a sender with the relevant capability per the dev spec's [stratified-facts](../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/kernel/stratified-facts.md) §3 — the σ-pass MUST emit a stratum-`"saturated"` retraction-cell at every coordinate whose witness graph transitively includes $x$ as a stratum-`"asserted"` leaf, and MUST NOT emit a retraction at any other coordinate. Specifically, writing $D(x) \subseteq \mathrm{Atoms}(A^{\flat}_p)$ for the *dependent-invalidity set*

$$
D(x) \;:=\; \bigl\{\,c \in A^{(1)}_p \;:\; x \in \mathrm{deps}^*(c)\,\bigr\},
$$

the σ-pass:

1. **Computes $D(x)$ in time linear in $|D(x)|$ by walking the witness graph of stratified cell atoms** — without re-running settlement, without comparing pre- and post-retraction saturated sets, and without consulting the closure-rule system except to identify which witness edges to follow.
2. **Emits exactly one stratum-`"saturated"` retraction-cell at each coordinate** whose every saturated atom in $D(x)$ admits no alternative witness chain rooted in surviving asserted atoms. Coordinates whose saturated atoms are partly-in and partly-out of $D(x)$ — i.e., the coordinate has *some* derivation surviving — receive no coordinate-level retraction; the substrate's default-projection at that coordinate continues to expose the surviving derivation's value.
3. **Triggers a cascading stratum-`"settled"` retraction-cell at coordinates whose Δ-pass output depended on a now-retracted saturated atom.** The cascade is bounded by the witness graph's depth; it terminates without re-running settlement.

The conjunction is the structural correctness statement of the substrate's σ-pass dependent-invalidity discipline: retraction is mechanically computable from the witness chain alone, in time linear in the affected witness sub-graph, and with no false positives or false negatives at the coordinate level.

## Why this holds

**Part 1 — math gives the set, witness chain gives the algorithm.** Per [saturation-respects-asserted-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/saturation-respects-asserted-monotonicity.md), with $X = Y \setminus \{x\}$ for the post-retraction asserted set,

$$
\mathrm{cl}^{\mathcal{S}}(Y) \,\setminus\, \mathrm{cl}^{\mathcal{S}}(X) \;=\; \{c \in \mathrm{cl}^{\mathcal{S}}(Y) \,:\, x \in \mathrm{deps}^*(c)\} \;=\; D(x).
$$

The math identifies the dependent-invalidity set with the witness-graph reachable-from-$x$ set. Algorithmically, the substrate computes $D(x)$ by reverse-walking the stored `derived_from` edges from $x$:

```
push x onto worklist
while worklist non-empty:
    pop atom a from worklist
    for each c with a in c.derived_from:
        if c not in D(x):
            D(x).add(c)
            push c onto worklist
```

The reverse-edge index `{a → {c : a ∈ c.derived_from}}` is a structural index the substrate maintains over the cell store; per the wire-form schema in [stratified-cell-atom](teaching/explanations/stratified-cell-atom.md), `derived_from` is part of every stratum-$1$ atom's canonical bytes, so the reverse-edge index is well-defined. The traversal visits each atom at most once and each `derived_from` edge at most once, giving $O(|D(x)|)$ time.

**Part 2 — coordinate-level retraction requires every-derivation-killed.** A cell coordinate $a$ may carry multiple stratum-$1$ atoms in $A^{\flat}_p$, each with a distinct witness chain. The default-projection at $a$ exposes the value derived from these atoms (after Δ-stabilization). If only *some* of the atoms at $a$ are in $D(x)$, the surviving atoms still derive a value at $a$, and the coordinate's default-projected value is unchanged in $\le_k$ — possibly different in *content* (one derivation's value may differ from another's), but not retracted.

The σ-pass therefore walks the stratum-$1$ atoms at each candidate coordinate $a$ in $D(x)$ and emits a coordinate-retraction iff every stratum-$1$ atom at $a$ is in $D(x)$. Per [stratified-cell-atom](teaching/explanations/stratified-cell-atom.md)'s atom-not-modified-in-place discipline, the surviving-derivations check is a constant-time per-coordinate inspection: enumerate the cell store's atoms at $a$, check membership in $D(x)$.

A coordinate-retraction is itself a *new* cell atom at stratum `"saturated"` with `derived_from = []` (the retraction is not derived from any surviving premise; it is the σ-pass's bookkeeping that no surviving derivation exists), `derived_via = "dependent-invalidity"`, and a value that retracts the prior derivation per the substrate's settling-monotonicity-respecting retraction discipline.

**Part 3 — Δ-pass cascade.** A stratum-$2$ atom $c'$ at coordinate $a'$ has `derived_from` listing the stratum-$1$ (and possibly stratum-$0$) atoms whose values were composed in the Δ-pass per-cell $T_{a'}$-orbit at $a'$. If any of $c'.\text{derived\_from}$ is in $D(x)$ — equivalently, if $c'$ is reached by extending the Part 1 traversal one more layer through stratum-$2$ atoms — then the $T_{a'}$-orbit's input has changed, and $c'$ is invalid.

The cascade is computed by extending the Part 1 traversal into stratum-$2$ atoms. The traversal still visits each atom and each edge at most once; the cascade is bounded by the witness graph's depth (at most one layer of stratum-$2$ atoms per `respond` invocation, since stratum-$2$ atoms do not derive other stratum-$2$ atoms within an invocation per [sigma-delta-pass-decomposition](teaching/explanations/sigma-delta-pass-decomposition.md)).

## Engineering consequence

- **Retraction is $O(\text{affected witness sub-graph})$, not $O(|\text{rule system}| \cdot |\text{seed}|)$.** A naive substrate that responds to an asserted retraction by clearing all saturated content and re-running the σ-pass against the surviving asserted set pays the full settlement cost. The witness-chain algorithm pays only the cost of the dependent sub-graph, which in typical workloads is exponentially smaller than the full saturated set.
- **The reverse-edge index on `derived_from` is structurally required.** Without a reverse-edge index over the cell store, the witness-graph traversal degrades to a linear scan of all stratum-$1$ atoms per worklist pop, giving $O(|D(x)| \cdot |A^{(1)}_p|)$ time. The substrate maintains the reverse-edge index as part of its per-fiber storage layout (per the dev's `presheaf-storage` reference).
- **Capability for retraction is per-asserted-cell, not per-saturated-cell.** Per the dev spec's §3, a saturated cell is *not* directly retractable — only its asserted ancestors are. A sender wishing to retract a derived conclusion does so by retracting the asserted premise that justifies it; the σ-pass propagates the retraction. This is the structural reason the substrate's capability fiber per [capability-not-acl](../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/docs/dev/decisions/capability-not-acl.md) gates retraction at the asserted layer; saturated-cell capability does not exist.
- **Federation receivers must demote-then-saturate, not preserve-then-retract.** When a peer's asserted cell is absorbed by a receiver and used as a premise in the receiver's σ-pass, a later retraction by the peer triggers the witness-chain traversal at the receiver. Per the federation peer-stratum policy, the peer's stratum-$1$ atoms are not absorbed without `derivation-trust`; if they were, the receiver would need to maintain witness chains rooted in *peer-asserted* atoms, complicating the retraction discipline. Demotion-then-saturate at receive time keeps the witness chains rooted locally.

## What the theorem rules out

- **A substrate that re-saturates on retraction.** Re-saturating the σ-pass against the surviving asserted set produces the *same* dependent-invalidity set per Part 1 of the math, but at the cost of the full σ-pass. The dev's discipline is the witness-graph traversal; re-saturation is a (very expensive) implementation that produces correct results but fails the linear-time commitment.
- **Retraction without coordinate-level validation.** A substrate that emits a coordinate-retraction whenever *any* atom at the coordinate enters $D(x)$ — without checking for surviving derivations — produces spurious retractions. The default-projected value at the coordinate flips from the surviving derivation's value to the retracted value, which is incorrect in $\le_k$. Part 2's surviving-derivations check is structural.
- **Witness chains pruned to non-asserted leaves.** A substrate that prunes `derived_from` chains to retain only the *immediate* premise atoms (rather than the transitive closure) cannot run the Part 1 traversal: the reverse-edge index from $x$ would not reach indirect dependents. The discipline is full witness-chain retention through every stratum-$> 0$ atom; pruning is admissible only after archival via [compaction-via-cosettling-equivalence-class](compaction-via-cosettling-equivalence-class.md).
- **Δ-pass output retained when its σ-pass input is retracted.** A substrate that retracts saturated atoms in $D(x)$ but leaves stratum-$2$ atoms whose `derived_from` includes them produces a *stratum-violating* fiber: the stratum-$2$ atom is no longer derivable from any surviving stratum-$\le 1$ atom. Per Part 3, the cascade is mandatory; partial cascades produce inconsistent stratification.

## What the theorem requires

- The substrate maintains stratified cell atoms per [stratified-cell-atom](teaching/explanations/stratified-cell-atom.md) with `derived_from` populated on every stratum-$> 0$ atom.
- The substrate maintains a reverse-edge index over `derived_from` (typically as part of the cell store's per-fiber index).
- The σ-pass is monotone per [closure-rule-system-realizes-closure-2-monad](closure-rule-system-realizes-closure-2-monad.md).
- The lex-canonical [firing trajectory](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/canonical-firing-trajectory-via-lex-order.md) is in force, so each saturated atom has a unique deterministic witness chain.
- Asserted-retraction capability is gated per the dev's capability discipline; saturated- and settled-stratum atoms are not directly retractable by external senders.

## Position

This theorem is the engineering correctness statement of the substrate's σ-pass dependent-invalidity discipline — the most operationally expensive structural commitment in the dev spec's [stratified-facts](../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/kernel/stratified-facts.md) §3. Without it, the substrate either pays full re-settlement cost on every retraction (correct but slow) or produces inconsistent stratification (fast but wrong). With it, the substrate retracts in time linear in the affected witness sub-graph, with structural correctness at the coordinate and Δ-cascade levels.

The theorem is also the structural justification for the witness chain being *required* on every stratum-$> 0$ atom rather than optional metadata. The dev spec's `PCC_MISSING_WITNESS` invariant is not a bookkeeping nicety; it is the structural prerequisite for retraction to be efficient and correct. A substrate that admits stratum-$> 0$ atoms without `derived_from` cannot run the Part 1 traversal, and degrades to re-saturation on retraction. The witness-chain-required discipline is what makes the substrate *retractable in production*, not just in theory.
