---
type: narrative
recaps:
  - ../teaching/explanations/function.md
  - ../teaching/explanations/runtime.md
  - ../teaching/explanations/capability.md
  - ../teaching/explanations/effect.md
  - ../teaching/explanations/code-as-substrate.md
  - ../theorems/capability-non-amplification.md
  - ../theorems/function-purity-replay-fidelity.md
introduces:
  - ../theorems/type-soundness.md
discusses:
  - ../../../../../../../../../science/theories/information/theories/knowledge-systems/theories/predicated-knowledge-systems/objects/predicated-knowledge-system.md
see-also:
  - what-functional-runtime-platform-inherits.md
  - structural-lineage-from-church-to-roc.md
---

# Composability with predicated knowledge systems

The structural framing this subtheory commits to is *composable* with the [predicated-knowledge-systems](../../../../../../../../../science/theories/information/theories/knowledge-systems/theories/predicated-knowledge-systems/README.md) substrate at four load-bearing places. This narrative names the four bridges, argues for their faithfulness, and records the open work each bridge leaves for follow-up.

The bridges are the discipline's load-bearing self-application: the typed function is a substrate closure-rule schema; runtime evaluation is a substrate closure-operator step; the capability is a substrate modal restriction; the program-as-substrate-content commitment is the substrate's self-representation discipline applied to the code register. The substrate was named first in the corpus's actual order of construction; the functional-runtime framing now grounds the substrate's evaluation vocabulary in the older and broader programming-language theory that supplies it.

## Bridge 1 — Function ↔ closure-rule schema

The first bridge places the typed [function](../teaching/explanations/function.md) at the substrate's *closure-rule schema*. The bridge's faithfulness rests on three structural facts:

1. *Both are derivation schemata.* A typed function $f : A \to B$ is a derivation schema: given an input cell typed $A$, derive an output cell typed $B$. A substrate [closure-rule application](../../../morphisms/closure-rule-application.md) is a derivation schema: given premise cells matching the rule's premises, derive a conclusion cell matching the rule's conclusion. The structural role is the same: parameterised derivation from typed premises.
2. *Both compose along arrow-discipline.* Function composition $g \circ f$ is well-typed when $f : A \to B$ and $g : B \to C$, yielding $g \circ f : A \to C$. Closure-rule composition is well-typed when the conclusion shape of one matches the premise shape of the next. The structural role is the same: arrow-typed composition.
3. *Both carry effect / footprint annotations.* A typed function carries effect-row annotations indicating which effects its evaluation may exercise. A closure-rule application carries a witness footprint indicating which substrate cells it touches. The structural role is the same: declared external-interaction profile.

The bridge's open work: the *higher-order* case. Functions in this subtheory are first-class values; closure-rules in the substrate are not (yet) first-class. The bridge holds at first order; its extension to higher-order closure-rules (rules whose premises are themselves rule-applications) is open and is what the parent predicated-computing's [self-representation](../../../teaching/explanations/self-representation.md) commitment hints at without yet establishing.

## Bridge 2 — Runtime ↔ closure operator

The second bridge places the [runtime](../teaching/explanations/runtime.md) at the substrate's *closure operator*, with [evaluate](../morphisms/evaluate.md) as one application of the operator on a function-record cell. The bridge's faithfulness rests on three structural facts:

1. *Both iterate to a fixpoint determined by their regime.* The substrate's closure operator iterates to the bilattice-$\leq_k$-least fixpoint, with regime determined by the closure-rule structure (per the [four-regime dichotomy](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md)). A runtime's evaluation iterates to a value (or diverges); the regime of divergence (terminating, productive-coinductive, generally non-terminating) corresponds to the substrate's regime classification.
2. *Both are deterministic up to substrate-recorded state.* Per [function-purity-replay-fidelity](../theorems/function-purity-replay-fidelity.md), pure-function evaluation is deterministic given input. Per the substrate's [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md), substrate operations are deterministic given snapshot state. The structural role is the same: deterministic settling under recorded state.
3. *Both record their derivation.* A runtime's evaluation step is recorded in the witness chain (the SOS-style derivation). A substrate closure-rule application is recorded as a witness cell. The structural role is the same: derivation-as-witness.

The bridge places call-by-value at the *strict regime*, call-by-need at the *Scott-continuous* regime (memoised demand-driven), call-by-name at the unmemoised demand-driven sub-case, and divergence-tolerant evaluation (productive coinduction) at the *transfinite-bounded* regime; the bridge does not collapse one into another.

## Bridge 3 — Capability ↔ modal-necessity restriction

The third bridge places the [capability](../teaching/explanations/capability.md) at the substrate's [modal-necessity operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) along the call-graph [accessibility relation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md). The bridge is *proved at the bilattice level* by [capability-non-amplification](../theorems/capability-non-amplification.md): the modal operator is monotone in its argument's bilattice height, so the callee's available capability is bounded above by the caller's. The bridge's faithfulness rests on three structural facts:

1. *Authority transfer is along call-graph edges.* A function call passes capabilities from caller to callee; the call-graph edge is the accessibility cell. The substrate's modal-necessity discipline applies directly.
2. *Authority composition is bilattice-bounded.* Multi-step delegation composes along chained accessibility cells; per [modal-necessity-basic-properties](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-necessity-basic-properties.md), the composed restriction never exceeds the source.
3. *Authority revocation is fiber-restricted update.* Revoking a capability is a fiber-restricted substrate update on the capability-record; the modal restriction now evaluates to $\bot_k$ on subsequent calls.

The bridge's open work: the relationship between *capability passing* and *capability-as-existential-witness* (per the TAPL-aligned encoding hinted at in [pierce2002](../references/pierce2002.md)). Both encodings produce capability non-amplification at the level of admissible behaviour; whether one is *the* substrate-level reading is open.

## Bridge 4 — Code-as-substrate ↔ self-representation

The fourth bridge places [code-as-substrate](../teaching/explanations/code-as-substrate.md) at the parent predicated-computing's [self-representation](../../../teaching/explanations/self-representation.md) commitment. The bridge's faithfulness rests on two structural facts:

1. *Programs are substrate cells.* A function-record is a substrate cell carrying typed predications about the function (its type, its body, its effect annotations, its capability requirements). The same query/edit/witness machinery that operates on any substrate cell operates on function-records.
2. *Evaluation produces substrate cells.* Each evaluation step produces witness cells recording the step's premises, conclusion, and effect footprint. The substrate's audit, replay, and federation operations apply to these cells without modification.

The bridge is *what makes the corpus's own operational tooling load-bearing for the corpus's own theory* — every operational [skill](../../agential-orchestration-platform/concepts/skill.md) realisation is, structurally, a function on the substrate; the substrate's discipline applies to the realisations as it does to any other substrate content.

## What the bridges buy

The four bridges, taken together, give the discipline:

- **A substrate-level reading of every functional-runtime primitive.** Functions, runtimes, capabilities, code become substrate operations rather than runtime-implementation details.
- **A regime classification of evaluation strategies.** Strict (call-by-value), Scott-continuous (call-by-need with memoisation), transfinite-bounded (productive coinduction), aperiodic (genuinely non-terminating non-productive computation) — each evaluation strategy lands at one substrate regime.
- **An operational binding to working systems.** The corpus's own operational tooling inherits the functional-runtime reading; the substrate's *evaluate* operation is the discipline's *function-application* under another name.
- **A composability discipline with [predicated-knowledge-systems peer-comp morphisms](../../../../../../../../../science/theories/information/theories/knowledge-systems/theories/predicated-knowledge-systems/morphisms/_index.md).** The subtheory's [compile](../morphisms/compile.md), [evaluate](../morphisms/evaluate.md), and [check-type](../morphisms/check-type.md) compose with the substrate's settle/derive/federate operations.

## What the bridges leave open

- The full faithfulness of the function ↔ closure-rule schema identification (Bridge 1) at the higher-order case — see the [self-representation](../../../teaching/explanations/self-representation.md) discussion.
- The exhaustive regime classification of evaluation strategies (Bridge 2) — the four worked cases (CBV, CBN, CBNeed, productive coinduction) are catalogued; whether mixed strategies (e.g., call-by-push-value's stratified discipline) introduce a new regime or collapse to a combination of existing ones is open.
- The asymmetry between capability-passing and capability-as-existential-witness (Bridge 3) — see the references in [pierce2002](../references/pierce2002.md) and [miller2006](../references/miller2006.md).
- The synchronisation discipline between code-as-substrate and the substrate's witness-chain (Bridge 4) — operational in the [roc example](../examples/roc.md) but not yet settled at full generality across all admissible runtimes.
