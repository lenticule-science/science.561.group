---
type: narrative
recaps:
  - ../README.md
  - ../references/pierce2002.md
  - ../references/milner1978.md
  - ../references/plotkin1981.md
  - ../references/moggi1991.md
  - ../references/wadler1992.md
  - ../references/miller2006.md
  - ../references/reynolds1974.md
discusses:
  - ../teaching/explanations/function.md
  - ../teaching/explanations/type.md
  - ../teaching/explanations/effect.md
  - ../teaching/explanations/capability.md
  - ../teaching/explanations/runtime.md
  - ../theorems/type-soundness.md
  - ../theorems/function-purity-replay-fidelity.md
  - ../theorems/capability-non-amplification.md
see-also:
  - structural-lineage-from-church-to-roc.md
  - composability-with-predicated-knowledge-systems.md
---

# What functional-runtime-platform inherits when it goes structural

The parent theory [predicated-computing](../../../README.md) supplies substrate-level computation — closure-rule applications, witnesses, snapshots, federation. This subtheory specialises the parent to the *functional-runtime* register — typed first-class functions, polymorphic types, effects, capabilities, code-as-substrate, evaluation. This narrative records the inheritance ledger in three columns: what the subtheory inherits *with proof* from upstream programming-language theory, what it inherits *as substantive commitment* (`status: sketch`), and what *does not inherit* (the parameters by which the subtheory adapts to its instances).

The ledger is in the spirit of the [predicated-knowledge-systems inheritance ledger](../../../../../../../../../science/theories/information/theories/knowledge-systems/theories/predicated-knowledge-systems/narratives/what-knowledge-systems-inherits.md) and the [semiotics inheritance ledger](../../../../../../../../../science/theories/linguistics/theories/semiotics/narratives/what-semiotics-inherits.md): the discipline holds that *being explicit about what does and does not inherit* is itself part of the structural commitment.

## What inherits with proof

These inheritances are *proved* by the upstream literature directly:

- **Type-soundness has the progress + preservation shape** (Pierce; per [Pierce 2002](../references/pierce2002.md), TAPL chapter 8). For any type system reducible to the simply-typed lambda calculus extended with records and sums, soundness follows from *progress* (well-typed non-value terms reduce) and *preservation* (reduction preserves well-typedness). The proof is the canonical induction on the typing derivation. This is the structural template the subtheory's [type-soundness](../theorems/type-soundness.md) inherits directly.
- **Hindley-Milner type inference is sound and complete on the let-polymorphic fragment** (Milner; per [Milner 1978](../references/milner1978.md)). Every typeable expression has a most general type (principal type), inferable in a deterministic algorithm; the proof is the W-algorithm correctness theorem. The subtheory inherits this for any type-inference subsystem that respects the let-polymorphic discipline.
- **Operational semantics is structurally specifiable** (Plotkin; per [Plotkin 1981](../references/plotkin1981.md)). A program's evaluation can be specified by SOS rules that are induction-friendly, equivalence-classed, and machine-checkable; the proof is the construction of SOS itself and its derivability of standard reduction-based semantics. The subtheory's [evaluate](../morphisms/evaluate.md) morphism inherits the SOS discipline as its specification register.
- **Effects can be presented as a monadic structure** (Moggi; per [Moggi 1991](../references/moggi1991.md)). A computation is a value of type $T(A)$ where $T$ is a strong monad; pure values inhabit $A$, effectful computations inhabit $T(A)$, and $T$'s unit-and-bind structure presents the effect's algebraic identity. The proof is the categorical-semantics construction. The subtheory's [effect](../teaching/explanations/effect.md) concept inherits the monadic-presentation discipline.
- **Effect annotations compose along function arrows** (Wadler; per [Wadler 1992](../references/wadler1992.md)). Effect-typed functions form a monad-of-effect-rows whose composition is governed by the row-union discipline; the proof is the soundness of the effect calculus relative to the underlying monad. The subtheory inherits the per-arrow effect-annotation discipline directly.
- **Object-capability discipline rules out ambient authority** (Miller; per [Miller 2006](../references/miller2006.md)). In a system where authority is conferred only by holding a reference, no function can exercise an authority not granted by some inbound reference; the proof is the lambda-calculus-with-only-references model. The subtheory's [capability-non-amplification](../theorems/capability-non-amplification.md) theorem inherits this proof structure, recast in the substrate's modal vocabulary.
- **Parametric polymorphism induces relational identities** (Reynolds; per [Reynolds 1974](../references/reynolds1974.md)). Every type expression in System F-style polymorphism has a logical relation that is preserved by every well-typed term; the *parametricity theorem* (free theorems) follows. The subtheory's [type-soundness](../theorems/type-soundness.md) inherits the parametricity discipline for its polymorphic fragment.

## What inherits as substantive commitment (status: sketch)

These inheritances are *plausible structural commitments* that the structural framing names but that have not been established in full generality. They are `status: sketch`:

- **Function ↔ closure-rule application is faithful** (per the [composability narrative](composability-with-predicated-knowledge-systems.md), Bridge 1). A typed function reads as a substrate closure-rule schema; the input-type is the rule's premise shape, the output-type is the rule's conclusion shape, the body is the rule's derivation. The full categorical isomorphism between the lambda-calculus closure-formation and the substrate's [closure-rule application](../../../morphisms/closure-rule-application.md) is operational but not yet proved.
- **Runtime ↔ closure operator is faithful** (per the [composability narrative](composability-with-predicated-knowledge-systems.md), Bridge 2). [evaluate](../morphisms/evaluate.md) reads as one application of the substrate's closure operator on a function-record cell; the runtime's evaluation strategy reads as the closure operator's traversal regime. The full faithfulness of the identification across all evaluation strategies (call-by-value, call-by-name, call-by-need) is not yet established.
- **Capability ↔ modal-necessity is faithful** (per [capability-non-amplification](../theorems/capability-non-amplification.md)). The capability-passing discipline reads as a [modal-necessity operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) along the call-graph accessibility relation; the proof of non-amplification rides the modal operator's bilattice properties. The reading is operational on the call-graph case; its extension to revocation, delegation across federation boundaries, and capability-as-existential-witness is sketch-level.
- **Effect-row tracking ↔ substrate witness footprint is faithful** (per the [effect-system-granularity](../learning/questions/effect-system-granularity.md) open question). The effect-row presentation of effects reads as the substrate's witness footprint of the cells the function touches; the bridge is plausible but the discipline of mapping row-union to witness-set-union has not been settled.
- **Refinement-type discharge respects substrate decidability classes** (per the [refinement-type-decidability-boundary](../learning/questions/refinement-type-decidability-boundary.md) open question). The substrate's discipline for which refinement logics are first-class is a substantive commitment that has not been finalised; the discipline is named but not enacted across the existing references.

## What inherits as engineering correspondence

These are inheritances at the operational surface — what a working functional-runtime gets when it adopts the structural framing:

- **Pure functions are memoizable and parallel-safe by structure, not by ad-hoc convention.** Per [function-purity-replay-fidelity](../theorems/function-purity-replay-fidelity.md), a pure function's output is determined by its input; memoization and parallelism follow as engineering corollaries.
- **Capability discipline is enforceable by the runtime, not by social convention.** Per [capability-non-amplification](../theorems/capability-non-amplification.md), the runtime can reject capability-violating calls before they execute; the discipline is structural, not heuristic.
- **Replay-determinism is a substrate property, not a runtime feature.** Per [function-purity-replay-fidelity](../theorems/function-purity-replay-fidelity.md) and the parent's [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md), a pure function's historical execution can be replayed byte-identically.

## What is *not* inherited

Some commitments of upstream programming-language theory are *not* preserved by this subtheory's structural framing. Naming them is part of the discipline:

- **The choice of evaluation strategy.** Call-by-value, call-by-name, and call-by-need are evaluation strategies admissible under the subtheory; the discipline is open over which strategy a working runtime chooses. A runtime committing to call-by-value (e.g., the [roc example](../examples/roc.md)) is one instance; alternative strategies remain admissible.
- **The choice of effect presentation.** Monadic effects (Moggi/Wadler), algebraic effects with handlers (Plotkin-Pretnar), region-typed effects (Tofte-Talpin), capability-as-effect (Bauer-Pretnar): each is a presentation of the same effect-discipline; the subtheory commits to *some* effect presentation existing without committing to which.
- **The choice of polymorphism discipline.** Hindley-Milner let-polymorphism, System F universal polymorphism, System F-omega higher-order polymorphism, dependent types: each is a polymorphism discipline; the subtheory commits to *first-class polymorphism* without committing to its strength.
- **The choice of memory discipline.** Garbage collection, reference counting, ownership-and-borrowing, region inference: each is a memory discipline; the subtheory's [function](../teaching/explanations/function.md) and [closure](../teaching/explanations/closure.md) concepts are open over which discipline a working runtime adopts.
- **The choice of binding discipline for captured variables.** Lexical capture, dynamic capture, fluid-binding: each is a closure-environment discipline; the subtheory commits to *some* environment-capture mechanism without specifying its scope.

These un-inheritances are *features*, not bugs: they are the parameters by which the structural framing adapts to different runtimes. A structural framing that imposed any of them would be less general than the discipline it claims to formalise.

## What the parent gains by adopting the substrate

The parent theory predicated-computing is enriched, not replaced, by the functional-runtime framing committed to here. What the parent gains:

- **A substrate-level reading of every functional-runtime primitive.** Functions, types, effects, capabilities, runtimes become substrate-level operations rather than runtime-implementation details.
- **A composability discipline with the predicated-knowledge-systems substrate.** Functional-runtime content and predicated knowledge content live on the same substrate, federated via the same operations.
- **A regime-classification of runtime systems.** The four-regime substrate classification (strict / Scott-continuous / transfinite-bounded / aperiodic) provides a structural-mathematical taxonomy of runtime evaluation strategies, supplementing the operational-semantics one.
- **An operational binding to working systems.** The corpus's own operational tooling — every [skill](../../agential-orchestration-platform/concepts/skill.md) realisation, every script invocation — inherits the functional-runtime reading, which becomes the substrate's structural account of what *being-evaluated* means at a working scale.
