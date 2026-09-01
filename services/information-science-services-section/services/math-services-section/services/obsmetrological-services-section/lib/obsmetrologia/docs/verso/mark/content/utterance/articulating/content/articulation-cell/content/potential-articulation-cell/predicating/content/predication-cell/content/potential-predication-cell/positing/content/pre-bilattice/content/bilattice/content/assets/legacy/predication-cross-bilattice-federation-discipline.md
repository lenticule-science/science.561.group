---
type: question
status: open
explores:
  - ../objects/federation-bridge.md
  - ../theorems/federation-convergence.md
  - teaching/explanations/conformance.md
  - teaching/explanations/closure-rule-wire-format.md
see-also:
  - teaching/explanations/composability-with-predication-categories.md
  - teaching/explanations/federation-as-substrate-join.md
  - teaching/explanations/what-predicated-computing-inherits.md
  - references/almeida-baquero-shapiro2018.md
  - references/shapiro-et-al2011.md
---

# What is the federation discipline when two substrates carry different bilattices?

The substrate's [federation-convergence](../theorems/federation-convergence.md) theorem is proved for *same-bilattice* federation: two substrates with the *same* bilattice value-domain federate convergently because the bilattice's $\otimes_k$ join is commutative-idempotent (per the inherited CRDT framework, [shapiro-et-al2011](references/shapiro-et-al2011.md)). The substrate's [paraconsistency-as-substrate-discipline](../theorems/paraconsistency-as-substrate-discipline.md) admits richer bilattices than Belnap's four-valued (per the [adjoint-structure-spo-bilattice](references/adjoint-structure-spo-bilattice.md) reference), but the federation theorem is silent on what happens when two substrates with *different* bilattices attempt to federate. The composability bridge to predication-categories (Bridge 4 of [composability-with-predication-categories](teaching/explanations/composability-with-predication-categories.md)) records cross-bilattice federation as sketch. The question is what discipline the substrate commits to.

## Statement

> *What substrate-level structural fact fixes when two bilattice-distinct substrates may federate, what content of each substrate's predications is preserved across the federation, what content is lost or coerced, and what does [federation-convergence](../theorems/federation-convergence.md) actually guarantee in the cross-bilattice case?*

## Decomposition

### Sub-question A — When are two bilattices federation-compatible?

The candidate compatibility relations form a hierarchy by structural strength:

- **Identity.** Two bilattices are compatible iff they are equal (Belnap-with-Belnap, fuzzy-with-fuzzy). The discipline is conservative; the cost is that no cross-bilattice federation is admitted.
- **Embedding.** Two bilattices are compatible iff one embeds into the other as a sub-bilattice preserving meets, joins, and the negation (Belnap embeds into any larger bilattice carrying $\bot, \mathbf{t}, \mathbf{f}, \top$ as distinguished elements). The discipline admits federation by lifting the smaller substrate's values into the larger; the cost is asymmetry — the larger substrate's values cannot be shipped to the smaller.
- **Bilattice morphism.** Two bilattices are compatible iff there is a bilattice morphism between them in *some* direction (perhaps lossy). Compatibility admits cross-bilattice federation in either direction with declared loss profiles. The discipline is liberal; the cost is that the federation may silently coerce values.
- **Galois connection.** Two bilattices are compatible iff there is a Galois connection (a left-and-right-adjoint pair) between them. Compatibility admits *retraction-faithful* federation: shipping a value to the other substrate and back returns either the original or a structurally-related approximation. The discipline is the most structurally principled.

The sub-question: which compatibility relation does the substrate commit to as the federation-admissibility criterion, and how is the relation recorded in substrate-resident metadata?

### Sub-question B — How is value coercion recorded in the witness chain?

When two bilattice-compatible substrates federate, every cross-bilattice cell-shipment involves *some* value transformation (an embedding, a morphism, a Galois adjoint). The transformation must be witness-recorded, since otherwise the federated substrate's audit cannot trace why a cell at the federation boundary has a different value than its source.

The candidate witness-content disciplines:

- **Pre-image record.** Each cross-bilattice cell carries a witness recording the source bilattice, the source value, and the morphism applied. Audit can reconstruct the source value exactly. The cost is witness-chain inflation proportional to cross-bilattice traffic.
- **Discipline-only record.** Each cross-bilattice cell carries a witness recording which morphism was applied (named by reference to a substrate-resident bilattice-morphism record), but not the source value. Audit can reconstruct the source value only by replaying through the morphism's inverse, which may be partial. The cost is lower witness inflation; the inverse-partiality is the trade-off.
- **No record.** Cross-bilattice cells appear as fresh substrate content with no provenance back to the source. The cost is impossibility of cross-bilattice audit; the benefit is minimum witness overhead.

The sub-question: which discipline does the substrate commit to, and how does it interact with the [provenance-semiring-witness](teaching/explanations/provenance-semiring-witness.md) framework — does the cross-bilattice transformation enter the semiring algebra as an opaque generator, as an explicit semiring homomorphism, or as a separate witness layer?

### Sub-question C — What does federation-convergence guarantee in the cross-bilattice case?

The current [federation-convergence](../theorems/federation-convergence.md) theorem guarantees strong-eventual-consistency at the bilattice value-domain level — same bilattice. The sub-question is to rephrase the theorem as *parametric in the bilattice-compatibility relation*:

- Under **identity compatibility**: the theorem holds unconditionally; this is the current statement.
- Under **embedding compatibility**: the theorem holds with the larger bilattice as the federation's joint bilattice; smaller-substrate values are lifted, and convergence is on the lifted values. The theorem's claim becomes "the federation converges in the larger bilattice; restriction to the smaller bilattice converges iff the smaller-substrate's restricted values were not contested by the larger-substrate's content."
- Under **bilattice-morphism compatibility**: the theorem becomes "the federation converges *modulo the chosen morphism's loss profile*; cells contested across bilattice morphisms register as $\top_k$ in the recipient bilattice with witness recording the source disagreement."
- Under **Galois-connection compatibility**: the theorem holds *up to Galois adjoint coverage* — a value shipped to the other substrate and back returns to the original Galois-closure; convergence is on the closure-equivalence-class.

The theorem's `status` would change from `proved` to `proved-modulo-bilattice-compatibility`, and the compatibility relation would become a declared parameter of the federation.

### Sub-question D — How does the [conformance](teaching/explanations/conformance.md) discipline distinguish cross-bilattice federation modes?

A substrate's conformance currently asserts that its observable behaviour matches the [conformance-test-suite](../objects/conformance-test-suite.md). For cross-bilattice federation the test suite must be extended:

- **Same-bilattice conformance.** The current suite; tests assume identical bilattices on both sides of the federation. Adequate for in-deployment federation.
- **Cross-bilattice conformance under a declared compatibility relation.** Each test specifies the compatibility relation (identity / embedding / morphism / Galois) it tests; conformance is per-relation. A substrate may declare which relations it supports and conformance is evaluated per declaration.
- **Compatibility-discovery conformance.** A substrate commits to *discovering* the compatibility relation with another substrate at federation time (handshake protocol for negotiating the mutual bilattice morphism). Conformance includes testing the discovery protocol's correctness.

The sub-question: which conformance extension the substrate commits to, and how the conformance-test-suite records the parameterisation.

## What is established

- Same-bilattice federation is fully proved by [federation-convergence](../theorems/federation-convergence.md) and the inherited CRDT framework ([shapiro-et-al2011](references/shapiro-et-al2011.md), [almeida-baquero-shapiro2018](references/almeida-baquero-shapiro2018.md)).
- The bilattice morphism literature (per [adjoint-structure-spo-bilattice](references/adjoint-structure-spo-bilattice.md) and the broader bilattice algebra tradition) provides the formal apparatus for sub-question A's compatibility relations; the math is well-understood.
- The substrate's witness machinery is structurally adequate to record cross-bilattice transformations: the provenance-semiring framework admits opaque generators by construction.
- The [hogan-et-al2021](references/hogan-et-al2021.md) survey of federated knowledge-graph engineering documents the *operational* practice of cross-system federation (RDF over OWL, schema mapping, ontology alignment); the discipline of *value-domain* federation is the predicated-substrate's structural extension.
- The [federation-envelope-as-substrate-record](federation-envelope-as-substrate-record.md) open question is structurally adjacent: it asks what the federation envelope (the wire format for cross-substrate cell-shipment) records, which constrains what cross-bilattice content the wire format can carry.

## What remains open

- Which of sub-question A's four compatibility relations the substrate commits to, and on what ground (mathematical principle vs engineering ergonomics vs deployment-portability).
- Which of sub-question B's three witness disciplines the substrate commits to.
- The parametric statement of federation-convergence under the chosen compatibility relation (sub-question C).
- The conformance-test-suite extension for cross-bilattice federation (sub-question D).
- Whether *bilattice negotiation* (two substrates negotiating a mutual bilattice at federation time) is itself a substrate operation with witness-recorded provenance, or an out-of-substrate handshake.
- The relationship between cross-bilattice federation and [scope-as-predication](teaching/explanations/scope-as-predication.md): does scope-discipline restrict cross-bilattice traffic, and if so, how is the restriction recorded?

## Why it matters

Resolving this question would settle four downstream commitments the substrate depends on:

1. **The strength of [federation-convergence](../theorems/federation-convergence.md) as an engineering claim** beyond the same-bilattice case. As written, the theorem is silent on cross-bilattice federation; resolving this question would let the theorem make a claim across bilattice diversity.
2. **The composability of substrates with different bilattices.** Without a cross-bilattice discipline, deployments must commit to a single bilattice corpus-wide; resolving this question would admit principled bilattice diversity within a federation.
3. **The audit discipline at federation boundaries.** Without a witness discipline for cross-bilattice transformations, federation-boundary audit is structurally incomplete.
4. **The conformance discipline for federation-supporting substrates.** Without a cross-bilattice conformance extension, conformance is silent on federation behaviour beyond same-bilattice cases.

A tractable next step is to write worked examples of federation under each of the four compatibility relations (identity, embedding, morphism, Galois), with the witness-chain content and the conformance-test cases made explicit; the partial answers in the bilattice algebra literature would become candidate theorems.
