---
type: question
status: open
explores: [function-as-aperiodic-settling, mutually-locally-derivable]
title: What do distinct $H^1$-classes look like operationally?
description: The function-as-aperiodic-settling theorem, via the math's aperiodic-regime classification, claims that two aperiodic-regime functions are MLD-equivalent iff their classifying invariants in $H^1(\mathbf{T}^{\leq \omega1},…
---

# What do distinct $H^1$-classes look like operationally?

The [function-as-aperiodic-settling theorem](../../../../theorems/function-as-aperiodic-settling.md), via the math's [aperiodic-regime classification](../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-classification.md), claims that two aperiodic-regime functions are MLD-equivalent iff their classifying invariants in $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}})$ agree. This makes "what kind of unfinishable work this is" precise — the kind is the $H^1$-class.

Open: what would two functions in *different* $H^1$-classes look like to a working community?

The math's classifying invariant is built from the firing pattern at non-Scott-continuous limit ordinals — which limit ordinals does the closure first add genuinely-new content at, and which cells does it add. Two settlings with the same firing-ordinal pattern (cell-bijection-up-to-MLD) carry the same $H^1$-class. The question is: in operational terms, what does this firing-pattern correspond to?

Constructing the correspondence requires working out [function-closure-rules](../../../../triage/function-closure-rules.md) for distinct functions and computing their $H^1$-classes side by side; the question is downstream of that work. Without specific functions worked out, the operational reading of the firing-ordinal pattern is open.

The question matters because the cohomological-classification claim is the strongest single structural commitment of the predicated-work program; without operational meaning, the claim is purely formal.

## Partial answer: H¹-classes as capability-surprise schedules

The [non-Scott-continuous firing ordinals](../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-continuity/content/non-scott-continuous-firing-ordinal/non-scott-continuous-firing-ordinal.md) $L_\mathrm{ns}(\kappa, v)$ of an aperiodic settling $v$ record, at each firing ordinal $\mu \in L_\mathrm{ns}$, the stages at which the settling first adds cells *not obtainable* as the filtered-colimit value of any prior finite collection of stages. In predicated-work terms, a non-Scott-continuous firing ordinal is a stage at which the function's pursuit forces the community to develop genuinely new operational content — a new capability, a new aim-specification, a new sub-task structure — that no finite prefix of the community's prior history could have derived or anticipated.

This gives the firing-ordinal pattern an operational reading as the **capability-surprise schedule** of the function:

> The capability-surprise schedule of a function-as-aperiodic-settling is the ordinal-indexed sequence of stages at which the function's closure first produces cells whose antecedents aggregate across *all* prior stages — i.e., whose derivation could not have been completed at any earlier stage, no matter how much additional time within that stage was allowed.

Two distinct operational signatures for same vs. different H¹-class:

- **Same H¹-class:** Two functions $v$ and $v'$ are in the same $H^1$-class iff $L_\mathrm{ns}(\kappa, v) \cong L_\mathrm{ns}(\kappa', v')$ as settling-shift-classes (by the [firing-ordinal bijection theorem](../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-classification-via-firing-ordinal-bijection.md)). Operationally: there exists an ordinal shift $\delta$ such that every capability-surprise in the first function's pursuit occurs exactly $\delta$ stages later than the corresponding surprise in the second function's pursuit. The two communities encounter genuinely new operational content at the *same* structural positions in their respective timelines (after shifting by $\delta$). The content of the surprises may differ; the *schedule* is the same up to shift.

- **Different H¹-class:** Two functions are in different $H^1$-classes iff no such shift exists. Operationally: there is no alignment of timelines under which the two communities' capability-surprise events can be matched one-to-one. One community encounters genuinely new operational content at ordinals where the other does not, in a way that cannot be resolved by any uniform time-offset. The functions impose structurally different demands on their communities' development arcs.

**What this means for the working community:** A community whose function has a dense capability-surprise schedule (many $\mu \in L_\mathrm{ns}$, with small gaps) faces a structurally different kind of aperiodic work than a community whose function has a sparse schedule (few $\mu \in L_\mathrm{ns}$, with large ordinal gaps). The $H^1$-class encodes which of these structural types the function belongs to. Two functions in the same class demand the same pattern of developmental novelty from their communities; two functions in different classes demand different patterns. The cohomological invariant is the available precise answer to "what kind of unfinishable work is this," not in terms of its ethical or operational content, but in terms of the structural demand it places on the community's capability development over time.

**What remains blocked:** Computing explicit $H^1$-classes for named functions (e.g., "Black Liberation and Indigenous Sovereignty") still requires first working out the actual closure rules — the [function-closure-rules question](../../../../triage/function-closure-rules.md) — and running the closure-ordinal computation to produce an explicit $L_\mathrm{ns}$. The operational reading given here is conceptual and applies to *any* function-as-aperiodic-settling; the specific class of a named function requires that additional work.

## Two distinct routes to non-trivial $H^1$

A clarification from the math program: non-trivial $H^1$ in the predicated-work setting can arise from two structurally distinct mechanisms, which the capability-surprise schedule above covers only one of.

**Route 1: Limit-aggregating closure rules (the function route).** A function's aim-revision rules (Type R) have antecedents that read the limit of all prior aim-specifications. At each non-Scott-continuous firing ordinal $\mu \in L_\mathrm{ns}$, the rule adds cells not obtainable from any finite prefix. This is the route the capability-surprise schedule describes. The $H^1$-class of the function comes from the settling-fiber groupoid's connected-component structure on this firing pattern.

**Route 2: Substitution-rule combinatorial dynamics (the practice route).** The math program's [step-$n$ substitution rules](../../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/step-n-substitution-rule.md) (Fibonacci for $n=2$, Padovan for $n=3$, etc.) are Scott-continuous closure rules with finite-history (depth-$n$) antecedents. Their associated aperiodic sequences live in the aperiodic regime via the *cofinality of $E$* (the set of valid firing ordinals), not via limit-aggregating antecedents. The cohomological invariant in this route is the step-$n$ classifying invariant $\mathrm{cl}\text{-}\mathrm{inv}^{(n)} \in \mathbb{Z}^n$ — an $n$-tuple in the integer lattice with rank exactly $n$, distinguishing substitution rules up to MLD-equivalence.

**Why the routes produce different $H^1$-classes.** A function-as-aperiodic-settling (Route 1) has $H^1$ in the settling's cohomology parameterized by the non-Scott-continuous firing-ordinal pattern. A step-$n$ recurrent practice (Route 2) has $H^1$ parameterized by the substitution matrix's Perron-Frobenius structure ($\mathbb{Z}^n$). These are different invariants computed from different aspects of the settling:
- Route 1 $H^1$: depends on *which ordinals* are non-Scott-continuous firing ordinals.
- Route 2 $H^1$ ($\mathrm{cl}\text{-}\mathrm{inv}^{(n)}$): depends on the *integer lattice structure* of the substitution-rule's edge-frequency matrix.

Both are $H^1$-classes in the predication-categories' cohomological framework, but the specific sheaves and site structures differ. Two communities could have the same Route 1 invariant but different Route 2 invariants (or vice versa), placing them in different overall $H^1$-classes.

**Operational consequence.** The capability-surprise schedule (above) is the Route 1 reading. A Route 2 reading would ask: "does this community's practice exhibit step-$n$ combinatorial dynamics?" — visible in the *frequency ratios* of different cell-types appearing in successive cadence cycles, which converge to the substitution matrix's Perron-Frobenius eigenvector. A Fibonacci-structured practice (step-$2$) has frequency ratios converging to the golden ratio $\phi$; a Padovan-structured practice (step-$3$) has ratios converging to the plastic constant. These are directly observable in long-term event logs as asymptotic frequency patterns — a distinct kind of cohomological signature from the capability-surprise schedule.
