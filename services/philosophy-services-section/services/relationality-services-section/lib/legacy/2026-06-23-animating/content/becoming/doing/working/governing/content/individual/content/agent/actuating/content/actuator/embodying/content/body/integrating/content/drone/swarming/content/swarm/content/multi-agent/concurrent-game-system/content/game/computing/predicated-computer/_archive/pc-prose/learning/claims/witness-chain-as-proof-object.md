---
type: theorem
class: engineering-claim
status: proved
depends-on: [witness, settling-as-computation, settlement-via-closure-2-monad, hash-injectivity-under-canonical-form, predication-settling, predication-fibration, determinism-via-fiber-functoriality]
see-also: [canonical-form-via-settling-quiescence, settlement-determinism]
---

# The witness chain is the substrate's Curry-Howard proof object

**Claim.** For any substrate computation that produces a [witness](teaching/explanations/witness.md) chain $\mathrm{hash}(v_0) \to \mathrm{hash}(v_1) \to \dots \to \mathrm{hash}(v_n)$ (with operator identifiers and rule identifiers between consecutive states), the witness chain is *structurally a proof object* in the substrate's [Curry-Howard correspondence](teaching/explanations/settling-as-computation.md): the chain encodes a derivation in the substrate's predication-fibration, with input values as premises, closure-rule applications as inference steps, intermediate values as derived propositions, and the final settled value as a conclusion in normal form. Per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md), the derivation is structurally complete and reproducible; per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), the hash chain is a faithful fingerprint of the proof.

Replaying the witness — re-running the operators on the recorded inputs and verifying the canonical hashes match — is exactly *proof-checking*.

## Why this holds

Per [settling-as-computation](teaching/explanations/settling-as-computation.md), the substrate identifies:

| Curry-Howard | Predicated substrate |
|---|---|
| Term constructor (variable, abstraction, application, fixpoint) | Predication-cell admission |
| Type constructor | [Predicate](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predicate.md) |
| Type judgment $\Gamma \vdash t : A$ | Predication carrying a value in the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) at predicate $A$ |
| β-reduction | A [closure-rule application](../morphisms/closure-rule-application.md) |
| Substitution | The [extend-restrict adjoint](teaching/explanations/extend-restrict-adjoint.md) / [twist-product fusion](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) |
| Normal form | Settled / quiescent value |
| Proof object | Witness chain |
| Proof-checking | Witness replay |

A substrate computation produces:

- An *input value* $v_0 \in A_p$ — premise of the derivation.
- A sequence of *closure-rule applications* $u_1, \dots, u_n$ — inference steps.
- A sequence of *intermediate values* $v_i = \mathrm{cl}(v_{i-1} \vee_k u_i)$ — derived propositions at each step.
- A *settled value* $v_n$ at quiescence — conclusion in normal form.

The witness chain records:

$$\mathrm{hash}(v_0), [\text{op}_1, \mathrm{hash}(u_1)], \mathrm{hash}(v_1), \dots, [\text{op}_n, \mathrm{hash}(u_n)], \mathrm{hash}(v_n)$$

— the proof object's structural data, encoded as canonical hashes.

Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), each hash uniquely determines its content (modulo collision-resistance); the chain is a faithful encoding of the derivation. Per [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md), each operator's $f^*$ application is functorial; replay produces the same intermediate hashes as the original computation.

The chain is therefore a *proof object* in the substrate's logical content: it encodes the sequence of derivations, and re-deriving along it must produce the same chain (or fail).

## Engineering consequence

- **Audit is proof-checking.** An auditor verifies a witness by re-running the operators on the recorded inputs and comparing canonical hashes. Per the Curry-Howard correspondence, this is exactly proof-checking — re-deriving the proof object's steps and verifying each derived proposition.
- **Witness compactness.** A witness chain is hash-cited, not content-cited. The chain's size is $O(n)$ in the number of operations, not $O(\mathrm{state\ size})$. The auditor reconstructs full content from the substrate's content-addressed store as needed.
- **Witness composability.** Per [closure-conditions-composability](closure-conditions-composability.md), composing operators corresponds to composing their witness chains (concatenation with hash-equality at the join point). The proof-object structure is preserved under composition.
- **Witness federation.** Per [federation-convergence](federation-convergence.md), federated substrates exchanging witnesses verify each other's proof objects: same hash chains mean same derivations. Disagreement is detectable byte-for-byte, no semantic coordination required.
- **Proof-irrelevance for non-witnessed details.** The witness records the proof structure, not arbitrary host-runtime state. Two implementations producing the same canonical-hash chain are structurally equivalent — implementation differences (memory layout, caching strategy, parallelism) don't appear in the proof object.

## What the theorem rules out

- **Witness without hash-injectivity.** A witness that records non-canonical bytes loses the faithful-encoding property — different content can hash the same, or same content can hash differently. Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), the substrate refuses such witnesses.
- **Witness without determinism.** A witness for a non-deterministic operator records *one* of many possible proof objects — replay may produce a different (also valid) proof, but the witness's hashes won't match. Per [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md), substrate operators are deterministic; non-deterministic operators are not substrate operators.
- **Witness with elided steps.** A witness that omits intermediate hashes is an incomplete proof object — the auditor cannot verify the elided steps. The substrate's discipline is full-chain witnesses; per [event-log](../objects/event-log.md), each step in the chain is recorded.
- **Witness without operator identity.** A witness that doesn't identify which operator produced each step cannot be replayed — the auditor doesn't know which functor to apply. Per the witness's structural content, operator identifiers are required.

## What the theorem requires

- The substrate identifies computation with closure-rule application (per [settling-as-computation](teaching/explanations/settling-as-computation.md)).
- The substrate's value-domain admits the Curry-Howard correspondence (per [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md)).
- Operators are deterministic functors (per [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md)).
- Canonical-form is faithful (per [canonical-form-via-settling-quiescence](canonical-form-via-settling-quiescence.md)) and hashing is injective (per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md)).

## Position

This theorem grounds the substrate's audit discipline in the Curry-Howard correspondence at the predication-fibration level. The substrate's [event log](../objects/event-log.md) is the cumulative proof object of the substrate's computational history; replay is proof-checking; federation is shared-proof-object exchange. Together with [canonical-form-via-settling-quiescence](canonical-form-via-settling-quiescence.md) and [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md), the substrate's content-identity-determinism-and-audit triad is grounded in the bilattice-Priestley-fibration structural foundation.
