---
type: concept
class: program-structure
depends-on:
  - type
  - predication-fiber-algebra
  - predicate-specialization
  - lawvere-comprehension-paraconsistent
  - twist-product
  - predication-fiber-residuation
  - closure-rule-system
  - closure-ordinal
see-also:
  - shape-record
  - check-type
  - refinements-as-paraconsistent-comprehension
  - refinement-type-decidability-boundary
---

# Refined type

A *type with an additional predicate constraining which values are admissible*. Refined types let the substrate express fine-grained constraints — "positive integers," "non-empty lists," "valid email addresses," "sorted sequences" — that base types alone cannot capture.

Surface syntax: `{ x : T | φ(x) }` — values of base type $T$ for which the refinement predicate $φ$ holds.

## What a refined type *is* structurally

A refined type is **not** a base type tagged with a Boolean side-condition. It is a [predicate-specialization](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-specialization.md) morphism

$$f_{φ}\;:\;\{T \mid φ\}\;\longrightarrow\;T$$

in the [predicate category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md). Two structurally distinct readings are admitted, and a refined-type declaration must commit to one of them — the substrate's *designation policy*:

- **Truth-designated (classical) reading.** $\mathrm{dom}(\{T \mid φ\}) := φ^{-1}(\mathbf{t}) \subseteq \mathrm{dom}(T)$, with $\mathbf{t}$ the [truth-order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/truth-order.md) top. By the [classical Lawvere comprehension theorem](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/lawvere-comprehension-classical.md) this is the right adjoint to the truth-order extension functor. Admits values for which the refinement holds in the ordinary classical sense — the default reading for everyday refined types like `{x : Integer | x > 0}`.
- **Knowledge-designated (paraconsistent) reading.** $\mathrm{dom}(\{T \mid φ\}) := φ^{-1}(\top) \subseteq \mathrm{dom}(T)$, with $\top$ the [knowledge-order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) top. By the [paraconsistent Lawvere comprehension theorem](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/lawvere-comprehension-paraconsistent.md) this is the right adjoint to the $\leq_k$-extension functor. Admits values for which the refinement is *informationally maximal* — both positive and negative evidence have settled. The reading appropriate for federation-active, audit-mature, or contested-evidence refinements.

Both adjoints exist on the substrate's [predication hyperdoctrine](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md); the substrate's day-to-day default is the truth-designated reading and the knowledge-designated reading is reached for explicitly when an engineer wants the maturity discipline.

The structural identification, in both designations, is recorded as the theorem [refinements-as-paraconsistent-comprehension](../theorems/refinements-as-paraconsistent-comprehension.md).

## Refinement satisfaction is bilattice-valued

A value $v$ evaluated against a candidate refinement $φ$ produces $φ(v)$ in $v$'s [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) — an element of the [twist product](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/twist-product.md) $\mathbf{L}^{\bowtie}$ — *before* the substrate decides whether to admit. The four cardinal cases in $\mathbf{FOUR}$:

- **$\mathbf{t}$ — refinement classically satisfied.** Positive evidence; no negative evidence. *Admitted* under the truth-designated comprehension. Also admitted under the knowledge-designated comprehension only if the substrate's discipline treats $\mathbf{t}$ as informationally maximal for this refinement (it is not, in $\mathbf{FOUR}$); otherwise the value is held pending further evidence.
- **$\mathbf{f}$ — refinement classically refuted.** Negative evidence; no positive evidence. *Refused* under both designations.
- **$\bot$ — refinement undetermined.** Neither positive nor negative evidence has settled. Per [closure-ordinal](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/closure-ordinal.md), this is the substrate's recording of "refinement check has not yet reached fixed point" — distinct from $\mathbf{f}$. *Refused* under both designations; differs from $\mathbf{f}$ in the witness recorded.
- **$\top$ — refinement contested.** Both positive and negative evidence present. Refused under the truth-designated comprehension. *Admitted* under the knowledge-designated comprehension, with the contestation carried per [paraconsistency-as-substrate-discipline](../../../theorems/paraconsistency-as-substrate-discipline.md) and exposed via the [inconsistency-sheaf-record](../../../objects/inconsistency-sheaf-record.md) machinery.

Admission is therefore fully determined by the *value of $φ(v)$ in the bilattice* and the *designation policy declared on the refined type* — a single structural rule in two arguments, not a separate per-refinement check.

Boolean refinements (the Liquid-Types tradition) are the special case where the refinement-rule system's image lies in $\{\mathbf{t}, \mathbf{f}\}$ at fixed point under the truth designation. The substrate's refinement discipline does *not* require this special case; refinements that legitimately remain $\bot$ at admission and refinements that reach $\top$ are first-class structural cases the substrate has names for.

## Refinement intersection and subtyping

Per the bilattice structure on $A_p$, refinements compose by the substrate's standard fiber-algebra operations rather than by an ad-hoc lattice on a side-condition language:

- **Intersection of refinements.** $\{T \mid φ\} \cap \{T \mid ψ\} = \{T \mid φ \wedge_t ψ\}$ under the truth designation, $\{T \mid φ \wedge_k ψ\}$ under the knowledge designation. Recovers ordinary intersection refinement-typing as the truth-designated case.
- **Union of refinements.** $\{T \mid φ\} \cup \{T \mid ψ\} = \{T \mid φ \vee_t ψ\}$ under the truth designation, $\{T \mid φ \vee_k ψ\}$ under the knowledge designation.
- **Refinement subtyping.** A [predicate-specialization](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-specialization.md) morphism $\{T \mid φ\} \to \{T \mid ψ\}$ exists iff the carved sub-supports satisfy $\mathrm{dom}(\{T \mid φ\}) \subseteq \mathrm{dom}(\{T \mid ψ\})$, i.e. $φ^{-1}(d) \subseteq ψ^{-1}(d)$ for the declared designation $d \in \{\mathbf{t}, \top\}$. This is *not* equivalent to a global cellwise inequality between $φ$ and $ψ$; only the designated cells are compared, and only domain inclusion (not value comparison off-domain) is required for the morphism to exist. The check the substrate runs for subtyping is therefore set-inclusion on $φ^{-1}(d)$ — recoverable from one $\leq_t$ comparison per cell that the substrate already performs at admission, but *not* the same as global $φ \leq_t ψ$.
- **Refinement implication / weakest precondition.** Per [predication-fiber-residuation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-residuation.md), the residual $φ \Rightarrow ψ$ is the largest fiber-algebra value such that $φ \odot (φ \Rightarrow ψ) \leq_t ψ$. Under the truth designation, this gives the substrate's Hoare-logic-style weakest-precondition computation directly; under the knowledge designation, the analogous adjunction operates on the $\leq_k$ side. Either way the substrate's standard $\odot \dashv \Rightarrow$ adjunction does the work, with no separate inference algorithm.

## Positive vs. negative refinement content

Per [twist-product](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/twist-product.md), every refinement value $\langle x, y \rangle \in \mathbf{L}^{\bowtie}$ separates *positive evidence* $x$ ("this value provably satisfies the refinement") from *negative evidence* $y$ ("this value provably refutes the refinement"). The substrate's refinement language admits both halves explicitly:

- A positive refinement `{ x : T | φ⁺(x) }` constrains the positive coordinate.
- A negative refinement `{ x : T | ¬⁻ φ⁻(x) }` constrains the negative coordinate via Nelson-style constructive negation, per [twist-product-fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md).
- A two-sided refinement `{ x : T | φ⁺ ; φ⁻ }` constrains both — a value is admitted only if it has positive evidence for $φ⁺$ *and* lacks negative evidence for $φ⁻$.

This recovers the engineering distinction between *whitelisting* (the value matched a known-good predicate; positive content) and *blacklisting* (the value did not match any known-bad predicate; absence of negative content) inside the same refinement formalism, with the substrate's twist-product giving them different structural roles rather than collapsing them to a single Boolean.

## Decidability of refinement checking

The substrate's refinement-check is the closure of a [closure-rule system](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) generated by the refinement language. Per the [refinements-as-paraconsistent-comprehension](../theorems/refinements-as-paraconsistent-comprehension.md) theorem, the discipline a refinement falls under is determined by its refinement-rule system's [closure ordinal](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/closure-ordinal.md) and the corresponding regime in the [four-regime classification](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md):

- **Strict regime** ($\kappa < \omega$, finite base, [strict-regime-engineering-envelope](../../../theorems/strict-regime-engineering-envelope.md)): the refinement settles in finitely many closure steps over a finite fiber. Decidable in fiber-algebra-arithmetic time. *Substrate-checkable at admission.*
- **Scott-continuous regime** ($\kappa = \omega$, infinite base with Scott-continuous closure, [scott-continuous-regime-engineering-envelope](../../../theorems/scott-continuous-regime-engineering-envelope.md)): refinement settles at the $\omega$-limit. Per [scott-continuous-regime-mld-polynomial](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/scott-continuous-regime-mld-polynomial.md), the per-step work is polynomial in fiber size. *Substrate-checkable at admission* via the standard $\omega$-iteration the substrate already runs.
- **Transfinite-bounded regime** ($\omega < \kappa < \omega_1$, non-Scott-continuous closure with countable cofinality, [transfinite-bounded-regime-engineering-envelope](../../../theorems/transfinite-bounded-regime-engineering-envelope.md)): refinement settles, but only at a countable transfinite ordinal. *Substrate-checkable only with explicit budget*; outside that budget the refinement remains in $\bot$ rather than being refuted.
- **Aperiodic regime** ($\omega_1 \leq \kappa$, [aperiodic-regime-engineering-envelope](../../../theorems/aperiodic-regime-engineering-envelope.md)): refinement either does not settle or settles only at an uncountable ordinal. *Not substrate-checkable in finite resources*; admission carries the refinement as a runtime-deferred or proof-carrying obligation per the discipline declared on the refinement type itself.

This regime-driven discipline is *the* answer to the substrate's refinement decidability boundary; it replaces the previous gestural "decidable / decidable-with-help / undecidable" trichotomy with the four-regime structural fact, and is what the [refinement-type-decidability-boundary](questions/refinement-type-decidability-boundary.md) question now resolves to. The remaining engineering decisions — refuse-to-admit vs. runtime-defer vs. proof-carry, and uniform vs. per-refinement — are policy declarations the substrate makes per refined-type per regime, not undetermined structural questions.

## Federation-active refinements

A refinement that must survive crossing into a peer substrate is stated under the [modal-necessity operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md):

$$\{\,x : T \mid \Box_R\, φ(x)\,\}\quad\text{— the refinement holds along every accessibility edge in } R.$$

Per [modal-necessity-basic-properties](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-necessity-basic-properties.md), $\Box_R$ preserves $\wedge_t$ and the strong implication; the federation-active refinement is therefore *closed under refinement intersection and subtyping*, and per [federation-convergence](../../../theorems/federation-convergence.md) it survives federation envelopes without re-checking. This is the structural reading of "the type's refinement is invariant under the substrate's federation discipline," and it composes with the capability-discipline's modal restriction (per [capability-non-amplification](capability-non-amplification.md)) using the same operator.

## Engineer-facing reading

In day-to-day use, a refined type still reads as `{ x : T | φ(x) }`. What changes by virtue of the structural grounding:

- **Refinements are first-class predication-cell values**, not a separate side-condition language. A refinement-checker error message points at the same fiber-algebra cells the rest of the substrate operates on.
- **Refinement subtyping is computed by the substrate's standard $\leq_t$ check**, not by a bespoke entailment procedure.
- **Weakest preconditions and strongest postconditions are the substrate's standard residuation**, not a verification-condition-generator pass.
- **Two-sided (positive / negative) refinements are admitted by construction**, not bolted on.
- **The decidability boundary is regime-determined**, not language-determined; the engineer reads which regime their refinement lives in and the discipline follows.
- **The bilattice-valued reading of admission is the structural target.** The substrate's `check-type` morphism currently exposes a binary `valid`/`invalid` projection at the engineer-facing surface (per the truth-designated comprehension), and the surrounding [type-soundness](../theorems/type-soundness.md) theorem is stated against that projection. The four-cell ($\mathbf{t}/\mathbf{f}/\bot/\top$) verdict described above lives one layer beneath that surface and matches the substrate's own bilattice content; lifting `check-type`'s signature and the soundness theorem to that finer verdict is a follow-on uplift, not a step that has already happened.
- **Refinements compose with capabilities and effects** through the same q-enriched-fiber machinery (per [graded-effects-via-q-enriched-fusion](../theorems/graded-effects-via-q-enriched-fusion.md) and [capability-non-amplification](capability-non-amplification.md)), so a refined-type system, an effect system, and a capability system are not three separate disciplines — they are three coordinates of the substrate's standard predication fibration.

## Examples

- **Range refinements.** `{ x : Integer | x > 0 }` — strict regime; substrate-checkable at admission.
- **Length refinements.** `{ xs : List T | length(xs) > 0 }` — strict / Scott-continuous regime depending on length encoding; substrate-checkable.
- **Pattern refinements.** `{ s : String | matches-email(s) }` — Scott-continuous regime under a finite-state pattern language; substrate-checkable.
- **Cross-field refinements.** `{ r : Record { start, end } | start ≤ end }` — strict regime; substrate-checkable.
- **Sortedness refinements.** `{ xs : List Integer | sorted(xs) }` — Scott-continuous regime under closure-rule unrolling on list length.
- **Termination refinements.** `{ f : Function | terminates(f) }` — aperiodic regime in general; admitted only with proof-carrying or runtime-deferred discipline.
- **Federation-active identity refinements.** `{ x : Identity | □_R verified(x) }` — substrate-checkable per federation discipline; survives federation envelopes by construction.

Per the substrate's [validation-rule](../../interactive-application-platform/concepts/validation-rule.md) discipline, refined types compose with form-input validation: a form field declared as `{ s : String | matches-email(s) }` automatically gets the email-matching validation. The substrate does not need a separate "validate email" rule; the type declaration carries the validation, and the bilattice-valued result composes with the rest of the form's predication content rather than being a Boolean side-channel.
