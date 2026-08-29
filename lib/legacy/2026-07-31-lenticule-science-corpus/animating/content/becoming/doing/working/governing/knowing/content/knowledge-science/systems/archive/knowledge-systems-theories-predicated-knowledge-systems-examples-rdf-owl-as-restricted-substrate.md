---
title: "RDF/OWL as Restricted Predication-Cell Substrate"
type: example
status: sketch
---

## What is being instantiated

The [predicated-knowledge-system](../objects/predicated-knowledge-system.md) object, with the [predication-cell](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md) substrate restricted along three axes to recover the W3C semantic-web stack ([@w3c-rdf2014], [@w3c-owl2012]).

## The restrictions

Recovering RDF + OWL from the full predication-cell substrate requires three structural restrictions:

1. **Value-domain collapse $\mathbf{2} \otimes \mathbf{2} \twoheadrightarrow \mathbf{2}$.** Each cell in RDF is either present (asserting "$s\ p\ o$ holds") or absent. There is no separate negative-evidence channel. Recovering this from the predication-cell substrate is the projection of the bilattice onto its truth-order: a cell with bilattice value $v$ projects to $\mathbf{t}$ iff $v \geq_t \mathbf{t}$, otherwise to $\bot$. Cells with value $\mathbf{f}$ or $\top$ are *not representable* in plain RDF and require OWL's `owl:NegativePropertyAssertion` (which is itself a reified RDF triple — a workaround) or are simply silenced.
2. **Federation collapse to set union.** RDF's *named graph* construct partitions a dataset into disjoint graphs; cross-graph reasoning is the union of the constituent graphs (with deduplication). The predication-fibration's [federate](../morphisms/federate.md) operation, when restricted to the $\mathbf{2}$ value-domain and the absence of source-tracked evidence, *coincides* with disjoint-union-with-deduplication. The richer bilattice colimit ([federation-as-bilattice-colimit](../theorems/federation-as-bilattice-colimit.md)) is unavailable: there is no way to record that two graphs disagree on a triple's truth, only that one or both assert it.
3. **Externally-applied closure.** RDF graphs do not carry an intrinsic closure-rule system; closure is applied by an *outer* engine — RDFS entailment, OWL 2 EL/QL/RL/Full reasoners, SPARQL queries with `SERVICE` clauses, or custom rule engines. The framing recovers this by treating the RDF graph as a *substrate-state* ([substrate-state](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/substrate-state.md)) and the OWL profile as a *closure-rule signature* applied externally to derive a settled state.

## What the restriction makes visible

The three restrictions are independent: any one can be lifted without lifting the others. Lifting (1) alone yields a bilattice-valued RDF (the *RDF\** programme of Hartig and Thompson is a partial step in this direction, recording per-triple metadata that includes provenance and certainty). Lifting (2) alone yields a federation-aware RDF (LD-Patch and SPARQL Update with `LOAD ... INTO` are partial steps). Lifting (3) alone yields a self-closing RDF (the SHACL specification's *advanced features* include closure-style validation rules, and RIF-Core adds rule-language semantics).

The framing's claim is that *all three liftings are necessary jointly* to recover the full predication-cell substrate, and the three OWL profiles plus their extensions span only a subset of the regime space the [four-group-register-as-regime](../theorems/four-group-register-as-regime.md) theorem identifies.

## Worked sketch

Take the running example: two RDF graphs $G_1, G_2$, each containing the triple `(ex:Alice, ex:knows, ex:Bob)`. Under plain RDF + named graphs, federation by union yields one triple in the merged graph. Under the bilattice substrate, $G_1$ contributes a cell with value `(t, f)` (positive evidence from $G_1$, no negative evidence) and $G_2$ contributes a cell with value `(t, f)`; the federated cell has value `(t, f) ⊔_k (t, f) = (t, f)` (knowledge-order join). If $G_2$ instead contained `(ex:Alice, ex:knows, ex:Bob)` with provenance "asserted by adversarial source" and were assigned cell value `(f, t)`, the federation would yield `(t, t) = ⊤` — recording the inter-source contradiction *as a value* rather than collapsing it.

## Failure modes

Practitioners frequently treat RDF + OWL as the *most expressive available* knowledge substrate; the framing locates RDF + OWL as a particular tractable corner of a larger expressivity space. Conversely, treating RDF as if it were already bilattice-valued (e.g., assuming `owl:NegativePropertyAssertion` is symmetric with positive assertion) leads to subtle reasoning bugs the framing would expose by demanding the negative-evidence channel be explicit.
