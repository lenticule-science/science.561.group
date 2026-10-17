---
type: reference
class: academic
status: cited
authors: [Miller, Mark Samuel]
year: 2006
title: "Robust Composition: Towards a Unified Approach to Access Control and Concurrency Control"
venue: "PhD dissertation, Johns Hopkins University, Baltimore"
---

## Source

M. S. Miller. *Robust Composition: Towards a Unified Approach to Access Control and Concurrency Control.* PhD dissertation, Johns Hopkins University, Baltimore, MD, May 2006. Available via the author and the Erights archive.

## Form

PhD dissertation. The synthesising statement of the *object-capability* discipline as developed in the E programming language and its predecessors (KeyKOS, EROS, Joule). The dissertation knits access-control discipline together with concurrency-control discipline under a single foundational structural commitment: authority is conferred only by holding a reference, never by ambient context.

## Content summary

The dissertation develops object-capability discipline along several axes:

1. **The lambda-calculus-with-only-references model.** A pure lambda-calculus with no global namespace, no ambient authority, no dynamic-scoping mechanism: a function's authority is *exactly* the closure of references it can reach from its inbound parameters. The structural argument is that this calculus *cannot* express ambient-authority operations; the absence is structural, not a discipline imposed on top.
2. **Capability non-amplification.** The fundamental theorem: a function called with reference set $\{r_1, \ldots, r_n\}$ can authorise only operations these references admit (or operations on references properly delegated from them). The proof is by induction on the call structure: each call passes references explicitly, so the callee's authority is bounded above by the union of the explicitly-passed references.
3. **The principle of least authority** (POLA) as a structural consequence rather than an aspirational guideline. In an object-capability system, POLA is what *can* be achieved by passing only the references each function needs; in an ambient-authority system, POLA is unachievable because the ambient environment makes more authority available than any function should hold.
4. **Promise pipelining and asynchronous capability invocation.** The concurrency-control half of the dissertation: capability invocations are asynchronous (returning promises) and admit pipelining (chained promise composition without round-trip latency). This is the operational discipline that makes capability systems practical for distributed deployment (E's *vat* model, the Erights *Captp* protocol).
5. **The capability machine architectures** (KeyKOS, EROS) as operational realisations: persistent capability machines whose entire state is a capability graph and whose system calls are capability invocations. These provide the existence proof that object-capability discipline scales to operating-system level.

The dissertation is the standard citation for the object-capability tradition. Its arguments are foundational for E, Joe-E, Caja, Waterken, Spritely Goblins, and (implicitly) for the platform-passing discipline of Roc (per [the roc example](../examples/roc.md)) and the abilities discipline of Unison.

## Position in the corpus

Functional-runtime-platform's [capability-non-amplification](../theorems/capability-non-amplification.md) theorem is Miller's theorem restated in the substrate's modal vocabulary: capability-passing reads as the [modal-necessity operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) along the call-graph accessibility relation, and modal-necessity is monotone in its argument's bilattice height. The two presentations (Miller's lambda-calculus-with-only-references; the substrate's modal-restriction discipline) are equivalent at the level of admissible behaviour; the substrate's modal presentation gives the proof a clean bilattice-mathematics foundation.

The [composability narrative](teaching/explanations/composability-with-predicated-knowledge-systems.md) Bridge 3 makes the equivalence explicit: capability ↔ modal-necessity restriction along the call-graph accessibility relation, with [capability-non-amplification](../theorems/capability-non-amplification.md) as the cross-bridge proof.

The [structural-lineage-from-church-to-roc](teaching/explanations/structural-lineage-from-church-to-roc.md) narrative places Miller's contribution as the *authority-discipline* step on the line: prior approaches had either no authority discipline (ambient authority, accessible to any function) or discretionary access control (which collapses to ambient under multi-step delegation). Object-capability discipline is the only structural commitment that gives modular authority reasoning.

The [effect-system-granularity](questions/effect-system-granularity.md) open question's per-capability granularity option (P3) is structurally Miller's discipline: effects are tracked exactly as capability-sets, with [capability-non-amplification](../theorems/capability-non-amplification.md) as the soundness theorem. Whether the subtheory commits to per-capability granularity uniformly or uses the hybrid presentation is open.

The dissertation's promise-pipelining and asynchronous-invocation chapters intersect the parent predicated-computing's concurrency commitments; the substrate's [send-channel](../morphisms/send-channel.md) and [acquire](../morphisms/acquire.md) morphisms inherit the asynchronous-discipline that Miller's dissertation grounds.

## Where used

- [capability-non-amplification](../theorems/capability-non-amplification.md)
- [capability](teaching/explanations/capability.md)
- [capability-passing](teaching/explanations/capability-passing.md)
- [capability-record](../objects/capability-record.md)
- [exercise-capability](../morphisms/exercise-capability.md)
- [structural-lineage-from-church-to-roc](teaching/explanations/structural-lineage-from-church-to-roc.md)
- [what-functional-runtime-platform-inherits](teaching/explanations/what-functional-runtime-platform-inherits.md)
- [composability-with-predicated-knowledge-systems](teaching/explanations/composability-with-predicated-knowledge-systems.md)
- [effect-system-granularity](questions/effect-system-granularity.md)
