---
name: Witness
description: "The retained thing that shows how a claim holds: in constructive logic the object exhibiting an existential, in an articulation cell the entries that make a side articulated, in a predicated computer the hash chain that replays a settling. Keeping the witness keeps how the claim holds, not just that it holds."
aliases: [witnesses, witnessing, witness chain]
---
A **witness** is the retained thing that shows how a claim holds. Keeping it keeps the *how*: two witnesses can establish the same proposition and still differ in their bounds, paths, agreements or residue, and reducing either to "it holds" loses that.

## In constructive logic

A witness is a specific object satisfying an existential claim. To prove $\exists x.\,P(x)$ intuitionistically one must produce a particular $a$ together with a proof that $P(a)$; the object $a$ is the witness. By the BHK interpretation a proof of $\exists x.\,P(x)$ is the pair $(a, p)$, and under Curry–Howard it is a program computing that pair, so the witness requirement is also an effectiveness requirement: existence is backed by construction. A classical proof by contradiction shows that non-existence is impossible without saying what exists. In model theory the weaker, classical sense is any element satisfying a formula in a structure ([constructive proof](../../../../../../../philosophy-services-section/content/text/glossary/terms/constructive-proof.md)).

## In an articulation cell

A side of an [articulation cell](articulation-cell.md) is articulated exactly when its slot holds a witness. Articulating puts the utterance's own token in the token slot; engaging adds a witness to the claim slot. Slots only grow, so evidence is lossless, and the four corners are the four patterns of witnessed and unwitnessed sides. Stable, both sides witnessed, is the corner in which relating and not-relating are testified to at once, which is where the relationality derivation places the witness.

## In a predicated computer

A witness is the recorded evidence that an operator execution did what its specification says. The run is a settling, a chain of valuations $v_0 \to v_1 \to \dots \to v_n$ with $v_{i+1} = \mathrm{cl}(v_i \vee_k u_{i+1})$, and the witness records it as a chain of canonical hashes $\mathrm{hash}(v_0) \to \dots \to \mathrm{hash}(v_n)$ together with the rule applications $u_i$, the operator's identity and the version of its specification. Under Curry–Howard the input is a premise, each rule application an inference step, each intermediate value a derived proposition, the value at quiescence a conclusion in normal form, and the witness chain the derivation presented linearly; auditing is proof-checking by replay ([witness chain as proof object](../../../../../../../../../engineering-services-section/content/text/glossary/concepts/witness-chain-as-proof-object.md), [settling as computation](../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settling-as-computation.md)).

Three properties make the witness load-bearing:

- **Replayability.** Operators are deterministic, so an auditor with the input and the operator reproduces the chain; agreement is a pass, disagreement a fail.
- **Hash-cited provenance.** Each entry cites the canonical hash of what it records, not a description of it. Equal chains record the same execution; different chains record different executions however alike they read to a person. Citing hashes rather than payloads keeps the witness compact and reveals only what can be verified.
- **Repair is recorded.** A repair is part of the witness: its before and after hashes, the declared repair code and any fuel consumed. A repair missing from the witness did not happen; a witness mentioning a repair the operator did not perform is forged.

The event log is the cumulative witness chain across all operator invocations. Without it a system can only claim to have computed something, with no structural way to check the claim.

## Related

- [Articulation cell](articulation-cell.md)
- [Trace](trace.md)
- [Curry–Howard translation](curry-howard-translation.md)
- [Constructive proof](../../../../../../../philosophy-services-section/content/text/glossary/terms/constructive-proof.md)
- [Decidability](../../../../../../../philosophy-services-section/content/text/glossary/terms/decidability.md)
- [Provenness](../../../../../../../philosophy-services-section/content/text/glossary/terms/provenness.md)
