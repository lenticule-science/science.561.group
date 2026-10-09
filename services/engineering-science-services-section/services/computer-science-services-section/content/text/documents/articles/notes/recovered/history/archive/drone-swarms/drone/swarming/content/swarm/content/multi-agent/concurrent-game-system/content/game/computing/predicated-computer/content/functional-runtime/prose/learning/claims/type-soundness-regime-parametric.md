---
type: theorem
class: engineering-claim
status: draft
depends-on:
  - type-soundness
  - refinements-as-paraconsistent-comprehension
  - refined-type
  - check-type
  - invoke-function
  - type-record
  - predication-fibration
  - predication-fiber-algebra
  - fibered-coinduction
  - four-regime-dichotomy
  - closure-ordinal
  - regime-classification-for-substrate
  - rule-language-realizability-determines-regime
  - strict-regime-engineering-envelope
  - scott-continuous-regime-engineering-envelope
  - transfinite-bounded-regime-engineering-envelope
  - aperiodic-regime-engineering-envelope
  - conformance-implies-substrate-properties
  - paraconsistency-as-substrate-discipline
see-also:
  - type-soundness
  - refinements-as-paraconsistent-comprehension
  - refinement-type-decidability-boundary
  - witness-lifecycle-trajectory-is-regime-conditional-federation-content
---

# Regime-parametric FOUR-valued type soundness

## Setup: structural verdict vs. surface verdict

Two layers must be distinguished before the claim can be stated honestly.

**Structural verdict (FOUR).** Per [refinements-as-paraconsistent-comprehension](refinements-as-paraconsistent-comprehension.md) Part 1, the value of a [refinement](teaching/explanations/refined-type.md) $\varphi$ at a value $v$ lives in the bilattice $A_{p_T}$ of the predication fiber over $T$, with cardinal cells $\{\mathbf{t}, \mathbf{f}, \bot, \top\}$:
- $\mathbf{t}$ — settled-true,
- $\mathbf{f}$ — settled-false (refuted),
- $\bot$ — undetermined (no settling evidence on either side),
- $\top$ — contested (settling evidence on both sides simultaneously).

**Surface verdict.** Per [check-type](../morphisms/check-type.md), the substrate's current operation returns a ternary `{valid, invalid, undecided}` verdict and a witness. The structural-to-surface map the substrate currently implements is:
$$\mathbf{t} \mapsto \texttt{valid}, \quad \mathbf{f} \mapsto \texttt{invalid}, \quad \bot \mapsto \texttt{undecided}, \quad \top \mapsto \texttt{undecided}.$$

The current binary-signature [type-soundness](type-soundness.md) further collapses `undecided` and `invalid` together into "did not admit," yielding the binary projection $\{\mathbf{t}\} \mapsto \texttt{admitted}, \{\mathbf{f}, \bot, \top\} \mapsto \texttt{not-admitted}$.

The structural cells exist independently in the bilattice; the surface verdict is a (current, lossy) projection-policy choice that may be loosened. This theorem reasons about the structural cells.

## Designation policy

Per [refined-type](teaching/explanations/refined-type.md), a refinement-type declaration commits to one of two designation policies:

- **Truth-designated (default), $D = T$.** Comprehension domain is $\varphi^{-1}(\mathbf{t})$. The refinement-type's *inhabitants* are exactly values where $\varphi(v) = \mathbf{t}$. Refuted ($\mathbf{f}$), undetermined ($\bot$), and contested ($\top$) values are *not* inhabitants.
- **Knowledge-designated (paraconsistent), $D = K$.** Comprehension domain is $\varphi^{-1}(\top)$. The refinement-type's inhabitants are exactly values where $\varphi(v) = \top$ — *contested-only*. Per [refined-type](teaching/explanations/refined-type.md), $\mathbf{t}$ under $K$ is "held pending" rather than admitted, since $\mathbf{t}$ is not informationally-maximal in $\mathbf{FOUR}$. Refuted ($\mathbf{f}$) and undetermined ($\bot$) are not inhabitants. (The $K$ designation is the discipline appropriate for federation-stable, audit-mature, or contested-evidence refinements — types whose inhabitants are exactly values *with both positive and negative settled evidence*.)

These are different types in the comprehension reading and they have different soundness obligations. The admissibility table below is therefore indexed by both the regime $\rho$ and the designation $D \in \{T, K\}$.

## Two regime variables

A function signature carries refinements at parameter, return, and effect positions, possibly with different regimes. The theorem needs *two* regime variables, not one:

- **$\rho_{\text{obl}}(f)$** — the supremum of the regimes of all refinements appearing in $f$'s signature. This bounds the *internal* proof-obligation discipline the substrate must discharge to admit $f$ at all (a single aperiodic refinement anywhere in the signature pulls $f$'s admission into the aperiodic discipline for *that* refinement, requiring proof-carrying witnesses for it).
- **$\rho_{\text{ret}}(\varphi_{\text{ret}})$** — the regime of the *return* refinement specifically. This is what controls which structural cell at the return value is admissible at runtime.

These are independent and the theorem reads them at different positions: $\rho_{\text{obl}}$ at admission-time witness-discipline; $\rho_{\text{ret}}$ at the return-value structural-cell admissibility table.

## Claim

Let $f$ be a [function-record](../objects/function-record.md) admitted by [check-type](../morphisms/check-type.md), let $\rho_{\text{obl}}(f)$ and $\rho_{\text{ret}}(\varphi_{\text{ret}})$ be as above, and let $D(\varphi_{\text{ret}}) \in \{T, K\}$ be the return refinement's designation policy.

For any input arguments matching $f$'s parameter types and any capability set including $f$'s required capabilities, [invoke-function](../morphisms/invoke-function.md) on $f$ produces a result whose declared return-type refinement $\varphi_{\text{ret}}(v_{\text{ret}}) \in \mathbf{FOUR}$ is *admissible at* $(\rho_{\text{ret}}, D(\varphi_{\text{ret}}))$, where the admission table is:

| $\rho_{\text{ret}}$ | Truth-designated ($D = T$) | Knowledge-designated ($D = K$) |
|---|---|---|
| Strict ($\kappa < \omega$) | $\{\mathbf{t}\}$ | $\{\top\}$ |
| Scott-continuous ($\kappa = \omega$) | $\{\mathbf{t}\}$ | $\{\top\}$ |
| Transfinite-bounded ($\omega < \kappa < \omega_1$) | $\{\mathbf{t}, \bot\}$ | $\{\top, \bot\}$ |
| Aperiodic ($\omega_1 \leq \kappa$) | $\{\mathbf{t}, \bot\}$ | $\{\top, \bot\}$ |

with the following witness obligations on $\bot$:
- transfinite-bounded $\bot$ requires a *budget-exhaustion* witness recording where the orbit was suspended,
- aperiodic $\bot$ requires a *proof-carrying* witness discharging the obligation externally (Lean module, SMT certificate, external attestation),

and an additional witness obligation on $\top$ specifically when $D = K$ and $\rho_{\text{obl}}(f)$ is aperiodic anywhere in the signature: $\top$-admission requires a *contestation-record* witness per [paraconsistency-as-substrate-discipline](../../../theorems/paraconsistency-as-substrate-discipline.md), so the substrate's audit trail records which contesting evidence produced the contested cell.

**$\mathbf{f}$ is never admissible** — under either designation, in any regime, at the return position. A refuted refinement at the return value is always a type error.

The two designation columns differ on which structural cell is the inhabitant at convergence: under $T$ the cell is $\mathbf{t}$; under $K$ the cell is $\top$. Regime determines $\bot$-discipline (whether $\bot$ is reachable at convergence and what witness it requires); designation determines which fully-settled cell is the inhabitant.

## Proof sketch

The argument is the standard progress + preservation framing of [type-soundness](type-soundness.md), instantiated against the bilattice verdict rather than its truth-projection.

**Part 1 (FOUR-valued preservation).** Per [refinements-as-paraconsistent-comprehension](refinements-as-paraconsistent-comprehension.md) Part 1, every refinement value $\varphi(v)$ lives in $A_{p_T}$. Per the [predication fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md)'s cartesian-lift property, evaluation steps preserve the fiber and therefore preserve $\varphi(v)$'s structural cell up to $\leq_k$-monotone refinement as further evidence settles. Per the four-regime dichotomy, the orbit of $\varphi$ under closure converges at the regime's closure ordinal $\kappa(\rho_{\text{ret}})$.

**Part 2 (FOUR-valued progress, $\bot$-reachability per regime).**
- *Strict ($\kappa < \omega$).* Per [strict-regime-engineering-envelope](../../../theorems/strict-regime-engineering-envelope.md), closure terminates in finitely many steps over a finite fiber. The orbit reaches a $\leq_k$-maximal cell — $\mathbf{t}$, $\mathbf{f}$, or $\top$, never $\bot$. So $\bot$ is unreachable at convergence and the column omits it.
- *Scott-continuous ($\kappa = \omega$).* Per [scott-continuous-regime-engineering-envelope](../../../theorems/scott-continuous-regime-engineering-envelope.md), $\omega$-iteration converges; same as strict for $\bot$-reachability.
- *Transfinite-bounded ($\omega < \kappa < \omega_1$).* Per [transfinite-bounded-regime-engineering-envelope](../../../theorems/transfinite-bounded-regime-engineering-envelope.md), convergence requires a countable transfinite ordinal. A finite-budget run may halt before convergence, leaving the cell at $\bot$. Admissible only with a budget-exhaustion witness.
- *Aperiodic ($\omega_1 \leq \kappa$).* Per [aperiodic-regime-engineering-envelope](../../../theorems/aperiodic-regime-engineering-envelope.md), the closure orbit is strictly $\leq_k$-ascending across $\omega_1$-many stages — no finite-resource fixed point. Admission of $\bot$ requires a proof-carrying witness.

**Part 3 (Designation-determined inhabitant cell).** The admission table's "settled" column ($\bot$-free part) is fixed by the designation:
- $D = T$: comprehension domain is $\varphi^{-1}(\mathbf{t})$, so the inhabitant cell at convergence is $\mathbf{t}$. $\top$ at the return value is *outside the comprehension domain* and is therefore a type error.
- $D = K$: comprehension domain is $\varphi^{-1}(\top)$, so the inhabitant cell at convergence is $\top$. $\mathbf{t}$ at the return value is *not informationally-maximal* (per [refined-type](teaching/explanations/refined-type.md)) and is therefore "held pending" rather than admitted as the return value of a $K$-designated function — i.e. for the soundness statement, $\mathbf{t}$ at the return position is a type error under $K$. The substrate's deployment policy may relax this to "treat $\mathbf{t}$ as a partial $K$-admission" but that is a separate policy declaration outside this theorem.

In both designations $\mathbf{f}$ is outside the comprehension domain.

**Part 4 (Witness discipline for $\top$ under $K$, regime-cross-cutting).** Per [paraconsistency-as-substrate-discipline](../../../theorems/paraconsistency-as-substrate-discipline.md), $\top$ records that settling evidence has arrived on both the positive and negative sides. Under $D = K$, $\top$ is the canonical inhabitant and the contestation-record witness obligation depends on $\rho_{\text{obl}}(f)$: when $\rho_{\text{obl}}(f) \geq$ aperiodic somewhere in the signature, the contesting evidence cannot in general be summarized by a finite-budget proof and the substrate's audit record must carry the contestation provenance. For lower $\rho_{\text{obl}}$ the contestation can be reconstructed from the substrate's standard refinement-trace and the witness obligation is satisfied by the trace itself.

**Part 5 (Refinement preservation as cartesian lift, FOUR-valued).** Per [refinements-as-paraconsistent-comprehension](refinements-as-paraconsistent-comprehension.md) Part 2, refinement subtyping is the predicate-specialization morphism out of the comprehension object at the declared designation, which is the cartesian lift along the type-checking arrow. The structural cell is preserved by this lift by construction; the parameters $(\rho_{\text{ret}}, D)$ control only which cells are *admissible at the terminal* refinement, not whether intermediate cells are preserved. The role of $\rho_{\text{obl}}$ is dual: it gates which proof obligations the substrate must discharge to admit $f$ at all, *not* which return cells can appear at runtime.

$\square$

## Relation to the binary-signature soundness

The current binary-signature [type-soundness](type-soundness.md) projection is $\{\mathbf{t}\} \mapsto \texttt{admitted}, \{\mathbf{f}, \bot, \top\} \mapsto \texttt{not-admitted}$. The strict and Scott-continuous truth-designated columns of the table above project exactly to that — admitting $\mathbf{t}$ only — so the binary-signature theorem is the truth-projection of those two columns.

The transfinite-bounded and aperiodic columns admit cells ($\bot$) that the current binary signature collapses to "not-admitted." The knowledge-designated columns admit $\top$, also collapsed by the current binary signature. The binary-signature theorem therefore *cannot witness* either kind of admission: a substrate exposing only the binary signature must refuse refinements whose regime is transfinite-bounded or aperiodic at admission, and refuse the $K$ designation entirely. That is the discipline of a substrate that admits only the strict and Scott-continuous regimes under truth-designation — the federation-portable default per [witness-lifecycle-trajectory-is-regime-conditional-federation-content](../../../theorems/witness-lifecycle-trajectory-is-regime-conditional-federation-content.md).

This theorem is therefore not a re-statement of the binary soundness with a richer codomain — it is a *strictly stronger* statement that the binary-signature theorem is the truth-projected restriction of, to the strict / Scott-continuous / truth-designated cells. Adopting this theorem operationally requires the substrate to either (a) expand `check-type`'s surface verdict to expose the structural cell, or (b) attach the regime-and-designation column to the witness record and treat admissions as conditional on the witness, leaving the surface ternary verdict unchanged.

## Engineering consequence

- **Soundness has two parameters: regime and designation.** Type-soundness holds *at* a $(\rho_{\text{ret}}, D)$ pair. The substrate's deployment policy chooses which pairs it admits, and the soundness statement adjusts its admissible-cell entry accordingly. There is no "soundness with refinements" option dial separate from these parameters.
- **The current surface verdict is a projection, not the structural cell.** A substrate that wants to expose $\bot$ vs $\top$ separately can refine the structural-to-surface map without changing what soundness says — only what the surface signature *guarantees per cell*.
- **Witness-record discipline is determined by $(\rho, D, \text{cell})$.** A $\bot$-admission in transfinite-bounded regime requires a budget-exhaustion witness; a $\bot$-admission in aperiodic regime requires a proof-carrying witness; a $\top$-admission under $K$ when $\rho_{\text{obl}}$ reaches aperiodic requires a contestation-record witness. The witness schema is regime-and-designation-determined, not a free design surface.
- **Federation-portability discipline is sharper.** Per [witness-lifecycle-trajectory-is-regime-conditional-federation-content](../../../theorems/witness-lifecycle-trajectory-is-regime-conditional-federation-content.md), the regime gates federation crossing; this theorem now states *which structural cells* survive a federation envelope at each $(\rho_{\text{ret}}, D)$ pair — namely $\{\mathbf{t}\}$ for strict and Scott-continuous truth-designated (the federation-portable cell), with all other admissions requiring witness re-discharge at the destination substrate.

## Status

`draft`: the structural argument is recorded above and follows from the existing predication-categories machinery + the four-regime envelope theorems already proved in this subtheory. What is not yet recorded:

- A formal Lean realization of the regime-and-designation admission table.
- A worked-example chain across the eight cells showing each admissible-cell entry hit by an actual substrate refinement (in particular a $K$-designated example whose return inhabitant is $\top$ rather than $\mathbf{t}$, e.g. a contested-record query).
- The exact witness-record schema fields for the budget-exhaustion, proof-carrying, and contestation-record cases (cross-referenced from [refinement-type-decidability-boundary](questions/refinement-type-decidability-boundary.md)'s "What remains policy" section).
- The substrate's structural-to-surface verdict-map policy declaration — currently $\{\bot, \top\} \mapsto \texttt{undecided}$, possibly to be split.
- The exact semantics of $\mathbf{t}$-at-return under $D = K$: this draft treats $\mathbf{t}$ as a type error under $K$ (matching [refined-type](teaching/explanations/refined-type.md)'s "held pending" reading); a deployment policy may relax this to a "partial $K$-admission" but that policy must be declared and is outside the structural theorem.

## Position

This theorem closes the soundness-layer uplift gap that [refinements-as-paraconsistent-comprehension](refinements-as-paraconsistent-comprehension.md) opened structurally. With this draft in place, the relationship between the comprehension theorem (structural identification, `proved`), the binary-signature [type-soundness](type-soundness.md) (operational, `proved` against the truth-projection of the strict/Scott-continuous truth-designated columns), and this regime-and-designation-parametric form (refinement of the operational theorem to the bilattice verdict, `draft`) is fully recorded. The remaining work — formalizing this in Lean, fixing the witness schemas, declaring the substrate's surface-projection policy — is concrete engineering and witness-record schema work, not structural mathematics.
