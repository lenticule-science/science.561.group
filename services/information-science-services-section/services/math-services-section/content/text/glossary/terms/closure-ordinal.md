---
name: Closure Ordinal
date-created: 2026-09-03
references:
  tarski1955:
    authors: ["Alfred Tarski"]
    title: "A lattice-theoretical fixpoint theorem and its applications"
    publication: "Pacific Journal of Mathematics"
    year: 1955
  cousot1979:
    authors: ["Patrick Cousot", "Radhia Cousot"]
    title: "Constructive versions of Tarski's fixed point theorems"
    publication: "Pacific Journal of Mathematics"
    year: 1979
---

Given a monotone, [extensive](./closure-operator.md) (inflationary) operator $F$ on a
[complete lattice](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/preorder/content/order/content/lattice/content/complete-lattice/complete-lattice.md)
(or more generally a poset with enough joins) and a starting element $x$, the
**transfinite iteration sequence** of $F$ from $x$ is defined by ordinal recursion:

$$F^0(x) = x, \qquad F^{\alpha+1}(x) = F(F^\alpha(x)), \qquad F^\lambda(x) = \bigvee_{\alpha<\lambda} F^\alpha(x) \text{ for limit } \lambda.$$

Because $F$ is extensive, this sequence is non-decreasing; because the lattice is
complete, it cannot rise forever without repeating. The **closure ordinal**
$\kappa(F, x)$ is the least ordinal $\tau$ at which the sequence stabilizes:

$$\kappa(F, x) := \min\{\tau : F^{\tau+1}(x) = F^\tau(x)\}.$$

At $\tau = \kappa(F,x)$, $F^\tau(x)$ is the least fixed point of $F$ above $x$ — this is
the constructive, transfinite-iteration proof of the Knaster–Tarski fixed-point theorem
(Tarski 1955), made fully general (dropping continuity assumptions, iterating through
the ordinals rather than stopping at $\omega$) by Cousot and Cousot (1979). When $F$ is
[Scott-continuous](./scott-continuity.md), the sequence already stabilizes by stage
$\omega$; without that assumption it may take an ordinal of any cardinality up to the
successor of the lattice's cardinality to close.

## In Obsmetrologia

The corpus's own definition, for a
[settling endofunctor](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/closure-ordinal/closure-ordinal.md)
$F_U$ from an initial state $\mathcal{E}_0$, is exactly this ordinal
$\kappa(F_U, \mathcal{E}_0)$, with the corpus's own bound $\kappa \leq |\mathbf{PrFib}|^+$
(the successor cardinal of the ambient 2-category's object class) standing in for the
general Knaster–Tarski/Cousot–Cousot bound above.

`Obsmetrologia.Closure.Regime` proves the **four-regime dichotomy**: $\kappa$ falls into
exactly one of four mutually exclusive, jointly exhaustive strata at the ordinal
boundaries $\omega$ and $\omega_1$ — strict ($\kappa < \omega$), Scott ($\kappa = \omega$),
transfinite-bounded ($\omega < \kappa < \omega_1$), and aperiodic ($\kappa \geq \omega_1$)
— the corpus's own statement of this theorem is the node
[four-regime dichotomy](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md).
`classify` selects the regime from three decidable flags (Scott-continuity, a finite
base, countable cofinality); `regimeCornerBij` proves the four regimes are in bijection
with `Articulating.Corner` — the four corners of the corpus's recurring FOUR — axiom-free
(`propext`-free, `Quot.sound`-free: `(none)` in the measured axiom profile). The spine's
own `ClosureRegimeData` has a finite base, so `classify` places it in the strict regime
(`spine_is_strict`, axiom profile `propext`), re-expressing `ClosureOrdinal.strict_finite`'s
$\kappa \leq 3$.

The measured axiom profiles (per the [note on antisymmetry, thinness, and the axiom
discipline](../../../../services/obsmetrological-services-section/content/text/documents/articles/notes/2026/08/17/2026-08-17-note-on-antisymmetry-thinness-and-the-axiom-discipline.md))
read as: `regimeCornerBij` needed no inferred identification of propositions at all,
while `spine_is_strict` spent `propext` — antisymmetry of the entailment preorder on
`Prop` — to conclude the spine's regime membership is not merely biconditional-true but
equal to `strict` on the nose.

`ClosureRegimeData` is a decidable classification of exactly three Booleans
(`scottContinuous`, `finiteBase`, `countableCofinality`) constrained by two
stipulated implications carried as structure fields —
`finiteBase = true → scottContinuous = true` (`fin_scott`) and
`finiteBase = true → countableCofinality = true` (`fin_cof`) — not an
independent triple. The honest ordinal-shape classifier cannot reach every
stratum this decidable data can name: `Closure/RegimeCofinality.lean`
proves `Ord.regimeOfOrdHonest_ne_aperiodic` — for any ordinal or
Scott-continuity witness, `Ord.regimeOfOrdHonest` never outputs `aperiodic`
— because Lean core carries no transfinite cardinals to test uncountable
cofinality against. The aperiodic regime is inhabited in the library only
through a stipulated `countableCofinality = false` flag in one hand-built
`ClosureRegimeData`
(`KineticTheory/Plasma/TopologicalWaveSheaf.lean`'s `canonicalEdgeBand`),
never through ordinal evidence.

The regime-cohomology table (`cohomologyVanishes`, a definition by cases
over the four `ClosureRegime` constructors; `cohomologyVanishes_iff` proves
this table's own content by exhaustion) has exactly one constructed,
rather than merely stipulated, witness in the whole library:
`Cohomology/FiringGenerators.lean` builds a finite one-vertex cochain
complex whose header calls it "the first witness making
`cohomologyVanishes transfiniteBounded = false` true by construction
rather than by table stipulation."

## See also

- [Scott continuity](./scott-continuity.md) — the property that bounds a closure ordinal at $\omega$
- [Cofinality](./cofinality.md) — the invariant that further splits the non-Scott-continuous case into transfinite-bounded and aperiodic
- [Fixpoint](./fixpoint.md) — the value a closure ordinal's iteration converges to
- [Closure operator](./closure-operator.md) — the special case where $F$ is also idempotent
