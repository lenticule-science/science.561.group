---
type: narrative
status: draft
discusses:
  - ../teaching/explanations/derivation-as-cell-shape.md
  - ../teaching/explanations/thin-value-domain.md
  - ../teaching/explanations/scott-continuous-closure-rule-system.md
  - ../teaching/explanations/partial-self-representation.md
  - ../learning/questions/four-regime-classification-of-nix.md
  - ../learning/questions/jung-rivieccio-and-nix-hash-discipline.md
  - ../learning/questions/binary-caches-as-substrate-federation.md
  - ../learning/questions/closure-2-monad-and-nix.md
see-also:
  - ../../../../../../predicated-computing/_index.md
  - ../../../_index.md
title: Nix mapped onto the substrate
description: A walking record of what an opening pass of substrate-mapping produces when Nix is read against predicated-computing using only concepts whose source texts have been read directly.
---

# Nix mapped onto the substrate

A walking record of what an opening pass of substrate-mapping produces when Nix is read against [predicated-computing](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/deployment-systems/theories/predicated-computing/_index.md) using only concepts whose source texts have been read directly. The narrative names what Nix matches structurally, what it falls short on, and what cannot yet be characterized without further reading. The four constituent concepts ([derivation-as-cell-shape](../../../../glossary/concepts/derivation-as-cell-shape.md), [thin-value-domain](../../../../glossary/concepts/thin-value-domain.md), [scott-continuous-closure-rule-system](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/deployment-systems/theories/nix/theories/predicated-nix/prose/teaching/teaching/explanations/scott-continuous-closure-rule-system.md), [partial-self-representation](../../../../glossary/concepts/partial-self-representation.md)) are the load-bearing observations; the four questions are the unverified parts.

## Texts the mapping is grounded in

To distinguish grounded from speculative claims later, the texts read for this pass are listed up front. From the math layer (predication-categories): predication-cell, subject, predicate, object, entity, closure-rule, closure-rule-system, closure-rule-language, closure-operator, knowledge-order, truth-order, four-bilattice, predication-fiber-algebra, predication-valuation, predication-settling, settling-monotonicity, closure-drivenness, scott-continuous-closure, settling-quiescence, non-scott-continuous-firing-ordinal, residuated-lattice. From the engineering layer (predicated-computing): predication-substrate, predication-graph-store, event-log, hash-discipline, predicated-computer, settling-as-computation, self-representation, identity-by-relations, wavefront, operator, insertion, traversal, closure-conditions.

Texts *not* read for this pass and which would refine or correct the mapping below: the four-regime-dichotomy theorem, Jung-Rivieccio duality, the closure-2-monad and lax-idempotence theorems, the federation-convergence theorem, the predication-fibration / predication-hyperdoctrine objects.

## What evaluation produces — the cell-shape question

A Nix [derivation](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/deployment-systems/theories/nix/theories/predicated-nix/teaching/explanations/derivation.md), after evaluation, is a `.drv` record with structural slots: `outputs`, `inputDrvs`, `inputSrcs`, `system`, `builder`, `args`, `env`. From this one record relations like `(output-path, depends-on, input-path)`, `(output-path, builds-using, builder-path)`, `(output-path, targets, system-tuple)` extract.

The shape $(s, p, o)$ is there. But per [predication-cell](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/deployment-systems/theories/predicated-computing/concepts/predication-cell.md), *"the predicate is a typed coordinate, not a label"* — predicates live in a small category $\mathcal{C}$ with morphisms in four classes (specialization, converse, subject-projection, object-projection), and the predicate coordinate carries the typing that licenses reindexing along these morphisms. Nix's predicate-coordinates are field names in an attrset. There is no $\mathcal{C}$ over them. There is no specialization morphism between, say, `inputDrvs` and `inputArgs`; no converse; no projection class membership. Nix's relations are *labels in the RDF sense* — exactly the impoverished form `predication-cell.md` warns against.

The cell-shape claim is therefore partial: Nix has the tuple structure but not the typed-coordinate structure. The substrate's compositional machinery (reindexing along $\mathcal{C}$-morphisms, naturality of the fiber functor, the four-regime classification that depends on antecedent quantifier structure over $\mathcal{C}$) does not have direct counterparts in Nix because there is no $\mathcal{C}$ to be natural over. The detail is in [derivation-as-cell-shape](../../../../glossary/concepts/derivation-as-cell-shape.md).

## Identity-by-relations — partial match

Per [identity-by-relations](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/deployment-systems/theories/predicated-computing/concepts/identity-by-relations.md): *"an entity is identified by which relations it participates in, not by a class declaration, a stored type, or a position in memory."* Per [predicated-computer](../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predicated-computer.md): *"two entities are the same when their incident-predication structure is the same."*

A Nix store path's hash is computed from the `.drv`'s content — i.e., from the *outgoing* relations of the derivation cell (its inputs, its builder, its system, its env). Two derivations with the same `.drv` content get the same store path. Two with different `.drv` content get different store paths. This matches identity-by-relations on the *outgoing* side. But the substrate says "incident-predication structure" — incoming edges count too. Nix's identity is invariant under incoming edges: adding a thousand new derivations that depend on `/nix/store/abc...-foo` does not change the hash of `foo`. So Nix has identity-by-outgoing-relations, which is a strict weakening.

(Content-addressed derivations weaken this in the other direction: same recipe can yield different identity if outputs differ.)

## The value-domain — where Nix is thin

The substrate is parameterized by a residuated lattice $\mathbf{L}$, and each predication cell carries a value in $\mathbf{L}^\bowtie$ — the twist product, which gives a bilattice with knowledge-order $\leq_k$ and truth-order $\leq_t$. The canonical four values: $\mathbf{t}$ (told-true), $\mathbf{f}$ (told-false), $\bot$ (told-nothing), $\top$ (told-both).

What is Nix's value-domain at a store path cell? Pragmatically: $\{\bot, \text{recipe-known}, \text{realized}\}$. Each transition raises in something resembling $\leq_k$. But there is no $\mathbf{f}$, no $\top$, no truth-order, no fusion product, no residual. Nix's value-domain is a thin lattice — closer to $\mathbf{2}$ than $\mathbf{FOUR}$, and certainly not residuated in any useful sense. The substrate's paraconsistent / multi-valued machinery does not apply to Nix as it stands. Detail in [thin-value-domain](../../../../glossary/concepts/thin-value-domain.md).

## The closure-rule system — Scott-continuous

Per [closure-rule](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/deployment-systems/theories/predicated-computing/concepts/closure-rule.md), a closure rule has the schema $\forall \vec{x}.\; \phi \Longrightarrow v'(p)(t_1, t_2) \geq_k V$, with antecedent in the closure-rule-language fragment that determines the regime: quantifier-free antecedents generate Scott-continuous closures; antecedents with $\forall$-blocks over infinite entity domains generate non-Scott-continuous closures.

A Nix derivation's evaluation rule says: *given that the cells `(input-path-1, present, _)`, …, `(input-path-n, present, _)` are settled, the cell `(output-path, content, bytes)` settles to the result of running the builder on those inputs.* The antecedent is a finite, explicit list of cell-presence atoms — quantifier-free in the closure-rule-language sense. There are no Nix rules of the form *"for every derivation $x$ in the universe, if $x$ has property $P$, then …"*; antecedents are always per-derivation, finite, and explicit. This is structural to Nix's hermetic-build commitment: a derivation must declare its inputs explicitly.

So Nix's closure operator is **Scott-continuous**, and Nix sits in the strict / Scott-continuous regime under the four-regime-dichotomy theorem (which I have not directly read; the regime claim is grounded in the closure-rule-language criterion alone). Detail in [scott-continuous-closure-rule-system](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/deployment-systems/theories/nix/theories/predicated-nix/prose/teaching/teaching/explanations/scott-continuous-closure-rule-system.md); see [four-regime-classification-of-nix](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/deployment-systems/theories/nix/theories/predicated-nix/prose/teaching/learning/questions/four-regime-classification-of-nix.md) for what the regime claim formally requires.

## Settling, wavefront, quiescence

`nix build .#foo` settles the closure-rule system at the cell `foo`. Lazy: the wavefront's reach is bounded by the closure rule's match radius (per [wavefront](../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/wavefront.md)). Confluent: same `.drv` → same output store path → same bytes. Reaches quiescence: after `nix build` finishes, requested cells stay at their settled values until GC or new derivations come in.

The Curry-Howard table at the end of `settling-as-computation.md` maps cleanly onto Nix:

| Substrate | Nix |
|---|---|
| predication-cell admission | derivation expression evaluated → `.drv` written |
| closure-rule application | builder running, producing output bytes |
| settling quiescence | requested derivations all realized in store |
| confluence | same `.drv` → same store path → same bytes |
| strong normalization | sandboxed builds terminate |

This part of the correspondence is direct and not partial. Nix's runtime is, in the settling-as-computation sense, an instance of the substrate's closure operator at the system-realization scope.

## Hash discipline — close match at byte level

Per [hash-discipline](../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-discipline.md): *"the identity of a piece of content in the predicated computer is the SHA-256 digest of its canonical-form byte-encoding."* Nix uses SHA-256. The canonical bytes are the `.drv` serialization (input-addressed) or the NAR-serialized output bytes (content-addressed). Same canonical form → same hash → same store path.

The byte-level discipline matches. The structural argument — that hash discipline is *correct* because the canonical form is the substrate-side enumeration of the value's Priestley dual under Jung-Rivieccio duality, and the chain *value → Priestley dual → canonical form → hash* is injective at every step — I cannot verify for Nix without reading the duality theorem. See [jung-rivieccio-and-nix-hash-discipline](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/deployment-systems/theories/nix/theories/predicated-nix/prose/teaching/learning/questions/jung-rivieccio-and-nix-hash-discipline.md).

## Operators — partial match

Per [operator](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/deployment-systems/theories/predicated-computing/concepts/operator.md), the three primitives are insertion, retraction, traversal.

- [Insertion](../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/insertion.md): `nix-store --add` and the implicit insertions performed during `nix build`. Idempotent ✓, commutative ✓, witness-bearing partial — the build log + path existence is a record, but it is not a witness chain in the substrate's `(before-hash, op-id, op-input-hash, op-output-hash, after-hash)` sense.
- [Traversal](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/traversal.md): `nix-store --query --references` (forward) and `--referrers` (backward). Pure ✓, indexed ✓, composable ✓.
- Retraction: `nix-collect-garbage`. The substrate's discipline is *"declared, witnessed, scope-bounded"*. Nix GC is declared and reachability-bounded but not witnessed in the substrate's sense.

## Self-representation — partial

Per [self-representation](../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), *"every operative element of the predicated computer is itself an entity in the same substrate the operative elements act on."*

Nix is partially self-representing: derivations are store paths, built artifacts are store paths, even the Nix evaluator (when Nix-built) is a store path. But the Nix language semantics — what counts as a valid expression, the rules of evaluation — is encoded in the evaluator's source code, not as substrate entities. The substrate's `self-representation.md` (line 14) commits that *"closure rules are entities"*; Nix's closure rules are baked into the C++ evaluator. Editing them means editing source and rebuilding.

So Nix has the *engine in the substrate* commitment partially (the engine binary is a store path), but not the *closure rules as entities* commitment (the rules are not store paths). Detail in [partial-self-representation](../../../../glossary/concepts/partial-self-representation.md).

## Event log — Nix has snapshots, not events

Per [event-log](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/deployment-systems/theories/predicated-computing/objects/event-log.md): *"the append-only, witness-recorded history of every state change... each event is one operator invocation contributing an increment."*

Nix has `flake.lock` (a settled state of input resolution, replaced wholesale on update — not append-only); profile generations (snapshots, not events); build logs in `/nix/var/log/nix/drvs/` (informational, not part of an audit chain). There is no unified append-only event log in Nix in the substrate's sense — no per-operator-invocation record with witness chain. Replay is from-recipes (rebuild), not from-events.

This is structurally significant. The substrate's `event-log.md` line 19 commits that the event log is what makes the substrate *"verifiable byte-for-byte by anyone with access to the log and the rule-system version-chain."* Nix has byte-verifiability of *current store contents* (via hashes), but not of the *trajectory* that produced them. You can verify what is, not how it became what is.

## Where the match is strongest

- Hash-addressed identity at the byte level. Same canonical form → same hash → same path.
- Scott-continuous closure operator. Quantifier-free antecedents over finite explicit input lists.
- Wavefront locality. Lazy, dependency-ordered, parallelism-bounded.
- Confluence / replay determinism. Same recipe → same outputs.
- Forward and backward traversal. Both indexed, $O(1)$ per result.

## Where the match is weakest

- Predicate-category typing on predicates. Nix has labels, not a category $\mathcal{C}$.
- Bilattice value-domain. Nix's value-domain is thin Boolean-ish; no $\mathbf{f}$, no $\top$, no truth-order, no residuated-lattice operations.
- Self-representation of the closure-rule system. Nix's evaluation rules live in the evaluator's source.
- Witnessed retraction and witnessed insertion. Nix has GC and writes, but no witness chain.
- Append-only event log with replay. Nix has snapshots and recipes; not a unified per-event log.

## In one sentence, with grounded terms

Nix is a Scott-continuous closure-rule system over a thin partial-order value-domain at the system-realization scope, with strong hash-discipline and wavefront-locality, but without the substrate's predicate-category typing on predicates, bilattice value-domain, full self-representation, or witnessed event log.

That is not the same as *"Nix is a predicated computer."* Nix matches the substrate on several specific structural commitments and fails to match on several others, and the failures are not incidental — they are about the value-domain, the predicate-category typing, and the self-representation of the rule system, which are load-bearing in the substrate's theorem chain.

## What the next pass would refine

The four open questions ([four-regime-classification-of-nix](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/deployment-systems/theories/nix/theories/predicated-nix/prose/teaching/learning/questions/four-regime-classification-of-nix.md), [jung-rivieccio-and-nix-hash-discipline](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/deployment-systems/theories/nix/theories/predicated-nix/prose/teaching/learning/questions/jung-rivieccio-and-nix-hash-discipline.md), [binary-caches-as-substrate-federation](../../learning-articles/questions/binary-caches-as-substrate-federation.md), [closure-2-monad-and-nix](../../learning-articles/questions/closure-2-monad-and-nix.md)) record the parts of this mapping that depend on substrate texts not yet read by the author of this pass. Resolving them would either confirm the regime/duality/federation/lax-idempotence claims sketched above or surface mismatches that the current pass has hidden.
