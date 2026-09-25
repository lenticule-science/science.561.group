---
name: flatfile-federation-equivalence
description: Flatfile-federation equivalence
type: theorem
class: engineering-claim
status: sketch
instantiates: [federation-convergence]
depends-on: [merge-peer, peer-record, federation-envelope-record, compose, settle, federation-convergence, algebra-as-protocol, content-hash-addressing, hash-injectivity-under-canonical-form, ../../../../../../../../../../../../theories/predicated-computing/prose/learning/claims/theory-of-predicated-computing.md, ../../../../../../../../../../../../theories/linear-computation/prose/learning/claims/theory-of-linear-computation.md]
see-also: [transport-tolerance-of-federation, replication-consistency-via-network-sheaf]
title: flatfile-federation-equivalence
---

# Flatfile-federation equivalence

## Claim

Let $A$ and $B$ be two [sovereign nodes](../architecture/sovereign-node/sovereign-node.md) at the FARS substrate (each a [flatfile](../flatfile/flatfile.md) instance with the same value-domain — the four-valued bilattice $\{\bot, t, f, \top\}$).
Let $E_{A \to B} = \{e_1, e_2, \ldots, e_n\}$ be a finite set of [`FederationEnvelopeRecord`](../objects/federation-envelope-record.md)s of `payload.kind: cells` emitted by $A$ to $B$, all admitted at $B$ via [`admit-federation-envelope`](../code/transformers/admit-federation-envelope.md) (signatures verified, vocabulary conformant, none quarantined).
Let $F_B$ be $B$'s fiber state immediately before admitting any envelope in $E_{A \to B}$, and let $F_B'$ be $B$'s fiber state after admitting all envelopes in $E_{A \to B}$ via [`merge-peer`](../code/transformers/merge-peer.md).

**Then:** $F_B'$ is independent of the order in which the envelopes were admitted, and equals the fiber state produced by the parent-theory federation operator (per [federation-convergence](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md)) applied at the same value-domain to the same input fibers and the same closure-rule system $B$ runs.

In notation, writing $\mathrm{merge}_B$ for `merge-peer` at $B$ and $\mathrm{fed}^{B}_{\mathrm{conv}}$ for the parent-theory's federation operator at $B$'s rule-system version:

$$ \mathrm{merge}_B(F_B, e_{\sigma(1)}) \cdot \mathrm{merge}_B \cdot \cdots \cdot \mathrm{merge}_B(\cdot, e_{\sigma(n)}) \;=\; \mathrm{fed}^{B}_{\mathrm{conv}}(F_B, \mathrm{cells}(E_{A \to B})) $$

for every permutation $\sigma$ of $\{1, \ldots, n\}$, where $\mathrm{cells}(E_{A \to B})$ is the union of cells across the envelopes' payloads.

## What this claims

The theorem says two things at once:

1. **Order-independence at the FARS substrate** — the order in which $B$ admits and merges $A$'s envelopes does not affect the final fiber state.
  Two replays of the same envelope set in different orders converge.
2. **FARS conformance to the parent-theory federation discipline** — the FARS-substrate-specific operator `merge-peer` produces the same fiber state as the parent-theory federation-convergence operator.
  The flatfile substrate's instantiation is *correct* relative to the parent theory; it does not introduce substrate-specific semantics that would diverge from `federation-convergence`'s guarantees.

The conjunction of these two is what makes FARS a conformant federation substrate: the engineering-level operator does what the parent-theory's mathematical operator says it should.

## Proof sketch

The proof is by reduction to the parent-theory [federation-convergence](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md) theorem, factored through three lemmas about the FARS-substrate operators.

### Lemma 1 (cells-are-bilattice-values)

Every `cells` envelope's payload (per [federation-envelope-record](../objects/federation-envelope-record.md)) carries cells whose `value` is one of $\{\bot, t, f, \top\}$ — the same four-valued bilattice the parent theory operates on.
Per [content-hash-addressing](../flatfile/content-hash-addressing/content-hash-addressing.md), the cells' canonical form is byte-stable under serialization; per [hash-injectivity-under-canonical-form](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-injectivity-under-canonical-form.md), two cells with the same canonical hash carry the same bilattice value.

*Therefore:* the algebra the FARS substrate operates on at `merge-peer` is exactly the algebra the parent theorem operates on.
There is no value-domain coercion or projection.

### Lemma 2 (merge-peer-is-compose-then-settle)

Per [`merge-peer`](../code/transformers/merge-peer.md)'s operational semantics, the substrate-state transformation it effects is exactly:

1. For each cell in the envelope, apply [`compose`](../morphisms/compose.md) at the local fiber's matching cell.
  Per [`compose`](../morphisms/compose.md)'s definition, this is the bilattice's $\odot$ operation lifted pointwise on cells.
2. Apply [`settle`](../code/transformers/settle.md) on each affected entity's fiber under the local closure-rule system.

The bilattice's $\odot$ is the parent theory's value-domain-extending operation; per the parent theorem [federation-convergence](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md), this extends pointwise to fibers as $\vee_k$ at the knowledge-order; per [`settle`](../code/transformers/settle.md)'s closure discipline, the post-compose settle is the closure operator $\mathrm{cl}_p$ the parent theorem cites.

*Therefore:* `merge-peer`'s substrate-state transformation is exactly the parent theory's $\mathrm{cl}_p \circ \vee_k$ pipeline.

### Lemma 3 (envelopes-are-finite-cell-sets)

Per [federation-envelope-record](../objects/federation-envelope-record.md), each envelope's payload is a finite collection of cells.
The union of cells across a finite envelope set is itself a finite cell set, equivalent to a single envelope's payload up to `compose`-equivalence (since the bilattice's $\odot$ is associative and commutative per [`compose`](../morphisms/compose.md)'s normative invariants).

*Therefore:* admitting envelopes one at a time and admitting their union-as-one-envelope produce the same substrate state.

### Composition

By Lemma 2, `merge-peer` realizes $\mathrm{cl}_p \circ \vee_k$.
By Lemma 3, the envelope set is equivalent to a single accumulated cell-set.
The parent-theory [federation-convergence](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md) theorem says $\mathrm{cl}_p \circ \vee_k$ is order-independent: $\vee_k$ is commutative and associative on the bilattice (Lemma 1), and $\mathrm{cl}_p$ is a closure operator whose fixed point depends only on the input set, not the application order.
Therefore, the FARS-substrate `merge-peer` applied in any order to the envelope set produces the same fiber state, and this fiber state equals the parent-theory federation operator's output applied to the same inputs at the same rule-system version. $\blacksquare$ (sketch)

## What the proof depends on

- **The bilattice's commutative monoid structure** under $\odot$.
  Established in [theory-of-predicated-computing](../../../../../../../../../../../../theories/predicated-computing/prose/learning/claims/theory-of-predicated-computing.md): $\mathbf{FOUR}$ is the twist product $\mathbf{2} \otimes \mathbf{2}$ with $\odot$ as the twist-product fusion operator; commutativity and associativity of $\odot$ follow from the symmetric monoidal structure of the MALL $\otimes$ established in [theory-of-linear-computation](../../../../../../../../../../../logic-services-section/content/text/glossary/concepts/theory-of-linear-computation.md).
- **`settle`'s confluence and determinism** at the bilattice value-domain.
  Established in the parent-theory [settlement-determinism](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md) and [settlement-via-closure-2-monad](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-via-closure-2-monad.md) theorems: the substrate's settlement is the closure 2-monad's iteration to fixed point, lax-idempotent and deterministic in $(\text{event log}, \text{closure-rule system})$.
- **`compose`'s pointwise extension to fibers being $\leq_k$-monotone**.
  Established in the parent-theory [federation-convergence](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md) proof.
- **Canonical-hash injectivity for cells** per [hash-injectivity-under-canonical-form](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-injectivity-under-canonical-form.md).

## What is sketched, not proved

This theorem's `status: sketch` reflects two gaps:

1. **No Lean proof.** The proof above is informal and relies on the parent-theory theorems cited as black boxes.
  A Lean formalization would: (a) instantiate the parent-theory bilattice-and-closure-operator structures at the FARS substrate's specific cell-and-fiber types; (b) prove that `merge-peer`'s implementation is equivalent to the abstract $\mathrm{cl}_p \circ \vee_k$ at those types; (c) discharge the convergence claim by appeal to the parent theorem.
  Lean follow-up is a separate task.
2. **Empirical verification of canonicalization.** The proof assumes [hash-injectivity-under-canonical-form](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-injectivity-under-canonical-form.md) holds for the FARS realization's specific canonicalization (per [content-hash-addressing](../flatfile/content-hash-addressing/content-hash-addressing.md)).
  The parent theorem is general; its instantiation at FARS's frontmatter-markdown canonicalization needs an empirical conformance test that two FARS realizations produce identical hashes for byte-equivalent presentation content.
  The test exists in spec; confirming it across realizations is a follow-up.

## Position

`flatfile-federation-equivalence` is the *correctness claim* for FARS's federation discipline.
It is what makes FARS a *conformant* federation substrate at the parent-theory's discipline: the operator names ([`merge-peer`](../code/transformers/merge-peer.md), [`emit-federation-envelope`](../code/transformers/emit-federation-envelope.md), [`admit-federation-envelope`](../code/transformers/admit-federation-envelope.md), [`replay-from-peer`](../code/transformers/replay-from-peer.md)) and the substrate-record shapes ([federation-envelope-record](../objects/federation-envelope-record.md), [peer-record](../code/structures/peer-record.md)) are FARS-specific; the *semantics* are the parent-theory's, instantiated at the flatfile substrate.

The theorem composes with [transport-tolerance-of-federation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/transport-tolerance-of-federation.md) (which says the carrier doesn't matter) and with [replication-consistency-via-network-sheaf](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/replication-consistency-via-network-sheaf.md) (which says the federation is consistent across the peer graph) to yield the full FARS-federation correctness claim: any two conformant FARS sovereign nodes that exchange the same set of `cells` envelopes through any transport, in any order, end up at substrate-equivalent fiber states for the entities the envelopes asserted on.
