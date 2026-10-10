---
type: narrative
status: current
introduces: [predication-substrate, operator, predicated-computer]
---

# What "the substrate is the predication" means in engineering

The central commitment of predicated computing is that things exist through acts of predication — through cells of the form *(subject, predicate, object)* carrying values in the substrate's value-domain — not through positional occupation of memory cells. As an engineering choice, this is a *substrate choice*: a predicated computer's primary carrier of computation is the predication, not the addressed memory cell.

The substrate choice is *not* the architectural choice of using a graph database. A graph database that runs on a Boolean computer — where cells are addressed by hash, values are stored at addresses, and the engine's primitive operations are reads and writes against those addresses — is not a predicated computer in this sense. The predication substrate enters earlier: at the level of *what a computational primitive is*. On a predicated computer, the three primitives are [insertion](../morphisms/insertion.md), [retraction](../morphisms/retraction.md), and [traversal](../morphisms/traversal.md); they operate on relations, not on addressed cells; and the operators that compose them are constrained to act on graphs of relations throughout.

What follows from this choice is a substantial body of engineering content:

- The substrate's value-domain (typically multi-valued or bilattice-valued, allowing partial and contested evidence) makes the join-of-stores a commutative-associative-idempotent operation, which makes [merge](../morphisms/merge.md) a CRDT-style operation, which makes federation between two predicated computers a substrate-level affair rather than a glued-on protocol.
- The substrate's locality contract — each closure-rule application reads a bounded radius — makes [wavefront](../teaching/explanations/wavefront.md) propagation tractable on graphs much larger than RAM, with memory bounded by wavefront width rather than graph size.
- The substrate's [self-representation](../teaching/explanations/self-representation.md) discipline — every closure rule, every shape, every operator specification is itself an entity in the store — makes the system its own metalanguage. Editing the rules is editing predications; the substrate sees its own definition as data.

The remainder of the corpus develops these in detail. The [concepts](../teaching/explanations/) section names the recurring engineering disciplines (canonical form, determinism, fuel bound, witness, repair). The [objects](../objects/) section gives the structural definitions (the predicated computer itself, the predication-graph store, the event log, the application sublocale). The [morphisms](../morphisms/) section presents the operators on the substrate. The [theorems](../theorems/) section will state engineering claims about the substrate's properties as the corpus matures. The [examples](../examples/) section presents concrete realizations.

The corpus's [agential-orchestration-platform](../theories/agential-orchestration-platform/_index.md) subtheory specializes the substrate to the case where agents (human and AI) are the operative actors and where their skills, runbooks, and shapes are themselves entities in the same store.
