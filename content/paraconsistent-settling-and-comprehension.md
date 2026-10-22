---
title: "Paraconsistent Settling and Comprehension on Four-Valued Evidence"
summary: "Settling closes four-valued evidence to a least fixed point; comprehension then extracts what is held. Conflict gets its own sheaf, so it is never erased."
date-created: 2026-06-20
type: article
status: active
visibility: public
tags: [paraconsistent-logic, settling, comprehension, bilattices, sheaf-cohomology, hyperdoctrines]
abstract: "Two linked ideas from the 561 Group's research on bilattice-valued predication: settling, which iterates a monotone closure of four-valued evidence to a least fixed point, and paraconsistent comprehension, which extracts a sub-support from a four-valued predicate by designating the top of the information order. The article defines both, states which results are marked proved, which are examples and which remain sketches, and explains how conflict is tracked in its own sheaf."
keywords: [settling, comprehension, Lawvere, hyperdoctrine, bilattice, paraconsistent, cohomology, knowledge order]
math: true
references:
  lawvere1970: { type: chapter, title: "Equality in hyperdoctrines and comprehension schema as an adjoint functor", author: [{family: Lawvere, given: F. William}], issued: {date-parts: [[1970]]}, container-title: "Applications of Categorical Algebra, Proceedings of Symposia in Pure Mathematics", volume: "17", publisher: "American Mathematical Society", page: "1-14" }
  hellerstein2020: { type: article-journal, title: "Keeping CALM: when distributed consistency is easy", author: [{family: Hellerstein, given: Joseph M.}, {family: Alvaro, given: Peter}], issued: {date-parts: [[2020]]}, container-title: "Communications of the ACM", volume: "63", issue: "9", page: "72-81" }
---

# Paraconsistent Settling and Comprehension on Four-Valued Evidence

Settling is the process of repeatedly applying a monotone closure rule to accumulated four-valued evidence until nothing new is added, which gives the least fixed point in the information order. Paraconsistent comprehension is the companion operation that extracts, from a four-valued predicate, the sub-support where a chosen value holds, and the most distinctive choice is the value "both", which collects conflicts. Together they let a system record that sources disagree, keep that disagreement as first-class data, and still compute with it.

Both ideas live on the four-valued bilattice described in [What is a bilattice?](/bilattices-and-belnap-dunn-logic/): values $\bot$ (nothing said), $\mathbf{t}$, $\mathbf{f}$ and $\top$ (both), with a truth order $\leq_t$ and a knowledge order $\leq_k$. For the underlying logic see [Belnap four-valued logic](/belnap-four-valued-logic/).

## What is settling?

### Site versus settlement

A *site* is a bare place with a rule: a carrier, and a law saying what content that carrier will admit. A *settlement* is that site actually inhabited: real accumulated content together with the fact that the site's own law admits it. The distinction is the point. A rule with nothing laid over it settles nothing, and content with no admission law is present but not settled.

The Lean 4 library Obsmetrologia abstracts this shape as a structure with three parameters (a kind of base, the content each place can carry, and an admission law) and two fields (the content and a proof that the law admits it). The module also proves that four constructions built independently (tiles, beads, holes, and Čech cocycles) are each an instance of it. That proof is recorded as checked by the Lean language server with no errors and no `sorry` placeholders. For the library, see [Obsmetrologia: formal mathematics in Lean 4](/obsmetrologia-formal-mathematics-in-lean-4/).

### Settling as closure to a fixed point

Operationally, a *settling* starts from no information and applies a step that accretes content until the step adds nothing. Each cell of the settling holds a value in the knowledge-ordered fiber. If the step is *knowledge-monotone* (more input knowledge never gives less output knowledge) and *inflationary* (the output is at least the input), then over a bounded fiber the orbit only climbs and so reaches a least fixed point. Formally, the settlement is $\mathrm{lfp}_{\leq_k}F_U=\bigsqcup_{\tau<\kappa}F_U^{\tau}(\bot)$, where $F_U$ is closure followed by merging the next increment of evidence and $\kappa$ is the stage at which the orbit stabilizes. Bounded iteration without fixed-point evidence is only a prefix, not a settlement.

The stabilization stage, the *closure ordinal*, sorts settlings into four regimes (marked proved in the source):

| Regime | Closure ordinal | Trigger |
|---|---|---|
| strict | $\kappa<\omega$ | everything finite |
| Scott-continuous | $\kappa=\omega$ | continuous closure, some base infinite |
| transfinite-bounded | $\omega<\kappa<\omega_1$ | non-continuous, countable cofinality |
| aperiodic | $\omega_1\leq\kappa$ | non-continuous, cofinality at least $\omega_1$ |

Settling is also coordination-free in a precise sense. Because updates are monotone in $\leq_k$, any query that is a $\leq_k$-monotone function of the settling state can be evaluated without cross-replica coordination; the note records this as a direct instance of the CALM theorem [@hellerstein2020] and labels it proved.

## How is conflict tracked separately from truth?

Evidence can arrive on two tracks. The *positive* track follows cells that gain a truth component ($\mathbf{t}$ or $\top$), and its mirror, the *negative* track, follows cells that gain a falsity component ($\mathbf{f}$ or $\top$). For a stage $\tau$, the negative track collects cells whose value first lies in $\{\mathbf{f},\top\}$:

$$\Delta^{-}_\tau(q)=\{(s,o):v_\tau(q)(s,o)\in\{\mathbf{f},\top\}\text{ and no earlier stage is in }\{\mathbf{f},\top\}\}.$$

Each track is packaged as a sheaf of integer-valued data over the cells (a sheaf assigns data to regions and glues compatibly). The shared contradiction component is identified with the sheaf of $\top$ cells: the two tracks intersect exactly in the conflicts. Bilattice negation swaps $\mathbf{t}$ and $\mathbf{f}$ and fixes $\bot$ and $\top$, which induces an isomorphism between the positive sheaf composed with negation and the negative sheaf. A broader symmetric container for both tracks is a sheaf valued in d-frames (algebraic duals of bitopological spaces); the source notes this container without developing it further here.

### What does the bigraded classification say?

For two aperiodic settlings $v$ and $v'$ over a common base, the source defines an invariant with two components: the class of the truth-only track and the class of the inconsistency track, living in a direct sum of two first cohomology groups. The theorem, labelled *proved*, says that $v$ and $v'$ are *mutually locally derivable* (related by an invertible, structure-respecting map between settlings, possibly with a shift in starting ordinal) exactly when their bigraded invariants agree.

The interpretive consequence: for consistent settlings the second component vanishes, so nothing is lost relative to the truth-only classification. For inconsistent settlings the second component separates patterns that truth-order cohomology alone cannot see.

### A transfinite example

Take transfinite induction on $\omega_1$ and seed the cell $(0,0)$ with $\top$. The closure rule propagates $\top$ to every diagonal cell. Then no cell ever carries plain $\mathbf{t}$, so the classical (truth-only) first cohomology is zero, while the inconsistency component is a direct sum of copies of $\mathbb{Z}$ indexed by the non-successor ordinals below $\omega_1$; the split knowledge-order cohomology is a sum of $\aleph_1$ copies of $\mathbb{Z}$, and the bigraded invariant is $(0,\mathbf{1}_\top)$. The source labels this an *example*, not a new classification proof. It shows that a settling can be invisible to the classical sheaf while being non-trivial on the inconsistency track.

## What is comprehension?

Comprehension is the passage from a predicate to the collection of things satisfying it. In Lawvere's categorical treatment [@lawvere1970], comprehension is a right adjoint: roughly, extending a sub-collection to a predicate is left adjoint to forming the sub-collection of a predicate's satisfiers. The classical form designates truth: $\{p:-\}_{\mathbf{t}}$.

### The knowledge-order analogue

For a predicate $p$, the knowledge-order extension functor sends a map $g:q\to p$ to the predicate that takes value $\top$ on the domain of $q$ and $\bot$ elsewhere. Its right adjoint, $\{p:-\}_\top$, sends a four-valued predicate $\psi$ to the specialization $q_\psi\to p$ whose domain is $\psi^{-1}(\top)$, the cells carrying conflict. This is a proved theorem; the proof is the parallel of the classical adjunction proof with $\mathbf{t}$ replaced by $\top$, $\mathbf{f}$ by $\bot$, and $\leq_t$ by $\leq_k$. Both $\{p:-\}_\mathbf{t}$ and $\{p:-\}_\top$ are right adjoints; they designate different sub-supports.

### Form validation as two comprehensions

When a form has several validation rules, each gives a per-cell four-valued verdict, and the verdicts are aggregated by the knowledge join:

$$\varphi_F(v)=\bigvee_i \mathrm{cl}_{\rho_i}(v).$$

Two surfaces then arise from the same aggregate. $\mathrm{Admit}(F)=\{p_F:\varphi_F\}_{\mathbf{t}}$ is the ordinary admission surface, and $\mathrm{Conflict}(F)=\{p_F:\varphi_F\}_{\top}$ is the contradiction surface. All four cells stay visible: $\mathbf{t}$ is positive and uncontradicted, $\mathbf{f}$ is rejection, $\bot$ is unevaluated, and $\top$ is conflicting evidence. A rule that says yes and a rule that says no join to $\top$ instead of silently poisoning or erasing the result. The source labels this engineering claim *proved*, with the status limited to the structural identification, not to every runtime implementation claim around it.

### Refined types

A refined type $\{T\mid\varphi\}_d$ chooses a declared designation $d\in\{\mathbf{t},\top\}$. The $\mathbf{t}$ choice is the everyday default; $\top$ is the variant stable under federation of settled information. Subtyping at a fixed designation is inclusion of designated domains, $\varphi^{-1}(d)\subseteq\psi^{-1}(d)$, not an unqualified global inequality. The residual of the fusion on the fibers supplies weakest preconditions, $\varphi\odot\psi\leq_t\chi \iff \varphi\leq_t(\psi\Rightarrow\chi)$; see [the adjoint-structure paper](/adjoint-structure-of-predication-on-bilattice-fibers/). The structural result is proved; a four-valued upgrade of the runtime's existing binary type-check soundness theorem is explicitly future work.

### SQL WHERE: an open sketch

A proposal in the same program reads a SQL `WHERE` clause as comprehension at a recorded designation $D\subseteq\mathbf{FOUR}$. Principal cases: $\{\mathbf{t}\}$ is legacy SQL truth, $\{\top\}$ selects conflict-repair rows, $\{\mathbf{t},\top\}$ is positive evidence, and $\{\mathbf{t},\top,\bot\}$ is "not classically refuted". The status is *sketch*. Still required are a precise binding from SQL syntax to the hyperdoctrine, a proof that the proposed designation family yields the claimed right adjoints, and a reduction of the standard behaviour of `NULL`, `IS NULL`, `COALESCE` and aggregates to designation choices. The proved $\mathbf{t}$ and $\top$ adjunctions do not by themselves establish the general SQL claim.

## Limits and open problems

- **Status discipline.** Proved: the knowledge-order comprehension adjunction, the bigraded classification, the regime stratification and the form-validation identification. Example: the transfinite $\omega_1$ settling. Sketch: the SQL `WHERE` reading.
- **No proof that the implemented fixed-point combinator computes the least fixed point in general.** It does when the step is monotone and inflationary and the fiber is bounded; none of these conditions is checked at runtime, and a non-inflationary step simply exhausts its budget.
- **No formal correspondence** between the implemented combinator and the Lean structure: quiescence is offered as the admission law, but that identification is not formalized.
- **Unrelated presentations.** Whether the settling reached in code agrees with the cohomological reading of the same settling is unaddressed.
- **Runtime regimes.** Regime-dependent termination and budget-exhausted $\bot$ outcomes remain part of scope; not every operational check is already four-valued.
- **Comprehension is not belief revision.** Extracting $\{p:-\}_\top$ locates conflicts; it does not decide which side to believe.

## Related

- [Belnap four-valued logic](/belnap-four-valued-logic/)
- [What is a bilattice?](/bilattices-and-belnap-dunn-logic/)
- [The adjoint structure of predication on bilattice fibers](/adjoint-structure-of-predication-on-bilattice-fibers/)
- [The Nelson identity on four-valued truth](/nelson-identity-on-four-valued-truth/)
- [Paraconsistent transfinite linear agent integration](/paraconsistent-transfinite-linear-agent-integration/)
- [Obsmetrologia: formal mathematics in Lean 4](/obsmetrologia-formal-mathematics-in-lean-4/)
- Sibling sites: [561.group](https://561.group/), [engineering.561.group](https://engineering.561.group/), [operations.561.group](https://operations.561.group/), [services.561.group](https://services.561.group/), [market.561.group](https://market.561.group/)
