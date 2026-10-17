---
type: concept
class: substrate
status: sketch
depends-on: [witness, provenance, event-log, green-et-al2007]
see-also: [witness-chain-as-proof-object, recursive-query-closure]
---

# Provenance semiring as witness algebra companion

The substrate's [witness](witness.md) chain composes under closure-rule application in a manner structurally identical to the *how-provenance* semiring of [Green–Karvounarakis–Tannen (2007)](references/green-et-al2007.md). The companion-relation makes precise what the substrate's witnesses are doing, algebraically: each derived predication carries a record of the closure rules and prior predications that produced it, and that record composes under derivation the way how-provenance polynomials compose under join.

Three structural identifications:

- **Witness annotates predication.** Each substrate predication carries a witness identifier in the [event log](../objects/event-log.md) recording its origin (admitted external message, closure-rule derivation, federation merge). This is the semiring-annotation pattern Green–Karvounarakis–Tannen formalize: each tuple in a $K$-relation carries an element of a commutative semiring $K$ recording its provenance.
- **Closure-rule firing as semiring product.** When a closure rule fires with antecedents $\phi_1, \ldots, \phi_n$ producing conclusion $\psi$, $\psi$'s witness records the conjunction (multiplicatively, in the semiring sense) of the antecedents' witnesses plus the rule identifier. This is the *join* case of how-provenance: a tuple derived from $n$ source tuples carries the product of their provenance polynomials.
- **Federation merge as semiring sum.** When two substrates federate and exchange predications, a predication present at both substrates from different witness chains carries the sum (additively, in the semiring sense) of both chains. This is the *union* case of how-provenance: a tuple in two relations' union carries the sum of the contributing provenance polynomials.

The substrate generalizes the framework in two engineering-significant ways:

- **The value domain is bilattice, not annotated-set.** The substrate's value-domain join is the four-valued bilattice's cellwise $\vee_k$, not a commutative semiring's $+$. The witness records the *closure rule* and the *antecedent predications* that fired, which composes algebraically the way how-provenance polynomials do, but the *truth value* of the conclusion is the bilattice join of the antecedent values processed by the rule's specific operator (extension or restriction). The substrate's witness algebra is therefore *richer* than a single-semiring annotation: each witness carries both an algebraic-derivation record (the polynomial) and a value-domain effect (the bilattice operation applied).
- **Witnesses are substrate entities, not annotations.** The annotations Green–Karvounarakis–Tannen formalize are external metadata attached to relational tuples. The substrate's witnesses are substrate-graph entities per [self-representation](self-representation.md): editable, queryable, replicable, signable. The substrate provides an audit-by-traversal capability the semiring framework doesn't (the semiring framework treats the annotation as opaque from the database's perspective; the substrate treats it as another predication subject to the substrate's same operators).

The concept is *sketch* status: it names the algebraic relationship between the substrate's witness chain and the provenance-semiring tradition so the [upstream-predication-logic](teaching/explanations/upstream-predication-logic.md) narrative has an atomized referent. A theorem-level statement (that the substrate's witness algebra restricted to a $\mathbf{2}$-valued sub-region with no value-domain effect *is* the how-provenance semiring) is left for follow-up work. The [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md) theorem covers the proof-theoretic side; this concept covers the algebraic-semiring side.
