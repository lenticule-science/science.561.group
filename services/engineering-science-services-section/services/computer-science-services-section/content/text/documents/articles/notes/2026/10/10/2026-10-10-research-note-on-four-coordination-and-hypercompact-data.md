---
title: "Research note: FOUR and coordination-freedom as compute reduction, and semiotic addressing as hypercompact data"
date-created: 2026-10-10
type: notes
name: 2026-10-10-research-note-on-four-coordination-and-hypercompact-data
authors:
  - emsenn
  - claude
status: research
keywords: ["four", "belnap", "calm", "coordination-free", "crdt", "content-addressing", "proof-path-addressing", "sen", "seavt", "hash-consing", "deduplication", "compute-reduction"]
provenance:
  office: Lenticule Science Senior
  request: debt-2026-10-09-leader-words-held-in-corpus
  pass: obsmetrologia-math
  leader-utterances:
    - "ni:///sha-256;7_HlrTqKrUV5eKjYwKB6ESBWvNmvSGvKz7w1yHX-B20"
    - "ni:///sha-256;LsEnP1J8YEh8EbR2d-cK6863CtlzxL2zzvx20xYK-Zc"
    - "ni:///sha-256;y_6wo75Tfq6N2_PMmS9T7Q9efcL_nSIzxYTFUTGy2k4"
---

## The question

On 2026-10-06 the Leader asked for hard thought about two things. The first is how **FOUR and coordination** could lead to massive reductions in compute. The second is how **SEN and SEAVT, proof-path addressing and semiotic content addressing** let the Group have **hypercompact data formations**. The Leader framed this against the Group's need for resource monitoring and ledgering of all throughput: bits on disks, bytes on wires, CPU. Surveying is work for the Group's software, not for agents by hand. On 2026-09-28 the Leader rejected dropping proof-path addressing, because it is part of the theory.

## What the house's theory says

- **FOUR** is the Belnap–Dunn four-valued reading (none, for, against, both) that positing assigns. Its knowledge order is a join-semilattice. Evidence only grows: `measure_cons_le` says evidence has an arrow of time. The told-both value holds a contradiction without exploding (`Settling.asserted_liar_settles_kTop`). See the 2026-09-27 release note.
- **Coordination-freedom.** The release note lists CALM monotone coordination-freedom as a result the library *recovers*. The charter names "coordination-free deductive-truth planning" as one of a node's four loops.
- **SCA, SEN and SEAVT** "together give us a way to address, relate, and temporalize arbitrary content, which is the basis needed for metrologic" (the Leader's 2026-09-23 software-ecosystem sheet). SEAVT is EAVT, whose rows are `{e, a, v, t}`, with E, A and V typed (glossary `seavt`).
- **Proof-path addressing** gives each record an address earned by its derivation, by the law of proof-path condensation. Normalizing to that address is how copies are found and removed.

## What is known outside the house

**Monotonicity removes coordination.** The CALM theorem (Hellerstein 2010; Ameloot, Neven and Van den Bussche 2011, 2013) says a distributed program has a consistent, coordination-free implementation exactly when it is monotone. Conflict-free replicated data types (Shapiro, Preguiça, Baquero and Zawirski 2011) realize this. State forms a join-semilattice, merges are joins, and replicas converge with no consensus round. Consensus (Paxos, Raft) costs at least one round trip to a quorum per decision, and it is the main serialization point in distributed systems.

**FOUR is a natural CRDT.** The knowledge order of FOUR is the product of two boolean semilattices (evidence for, evidence against). Merging two FOUR-valued stores is the pointwise join, which is commutative, associative and idempotent. Classical two-valued state forces a choice when two replicas disagree. FOUR records the disagreement as *both* and defers the choice. So every reading the house keeps in FOUR, and every derivation that is monotone in the knowledge order, needs no coordination. Coordination is needed only where a non-monotone step happens: settling, negation used as absence, or a threshold. The compute saving is the number of consensus rounds and locks that are never run, together with the recomputation that disagreement would otherwise force.

**Addressing by content removes duplicates.** Hash-consing (Ershov 1958; Filliâtre and Conchon 2006) stores each structurally equal term once and makes equality a pointer comparison. Merkle DAGs (Merkle 1987), as in Git's object store and IPFS/IPLD, address data by its hash, so identical subtrees are stored and sent once. Content-defined chunking (Muthitacharoen, Chen and Mazières, LBFS 2001) extends this to near-duplicate files. Succinct data structures (Jacobson 1989) hold such indexes close to their information-theoretic minimum.

## How these combine

The house's proposal goes past ordinary content addressing in two ways:

1. **Semiotic content addressing.** The house addresses a record by what it says (its marks, under the identification the theory licenses), not only by its bytes. Two records that are equal after the root identification then share one address. That is hash-consing modulo the theory's equivalence. The more the theory identifies, the fewer distinct objects exist.
2. **Proof-path addressing.** A record's address is the path of its derivation. A derived record need not be stored at all: its address is a recipe, and anything stored can be rebuilt from upstream addresses when it is needed. Storage holds the leaves and the paths, and caches are disposable.

Together with SEAVT's typed, time-stamped rows, a corpus then holds each distinct claim once, each derivation as a path, and each change as an appended row. The Leader calls that a **hypercompact data formation**. The house's own measure of the gain is the resource ledger of the 2026-10-06 metered derivable journal: bytes on disk and on the wire before and after normalization.

## Open

- Which of the house's derivations are monotone in FOUR's knowledge order and so coordination-free, and which steps (settling, thresholds) need coordination. CALM gives the test, and the census has not been run.
- The equivalence semiotic content addressing hashes modulo. It must be decidable and cheap to normalize, and the root identification of `Language/Identification.lean` is the candidate.
- The definition of SEAVT. The glossary says E, A and V are typed claims in Relation Model Notation (RMN). The 2026-09-23 sheet names SEN as the addressing layer. Both cannot be the primitive.
- A measured baseline: the resource ledger's bytes and CPU for one section before and after normalization. Without it "massive" is a claim, not a measurement.
