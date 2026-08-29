---
type: question
class: internal
status: open
explores: [modal-complexity-bounds, twist-modal-translation, modal-finite-model-property, four-bilattice, internal-z2-gauge]
---

# Tighter complexity bounds for the bilattice modal calculus

The [modal complexity bounds](../theorems/modal-complexity-bounds.md) — PSPACE-completeness for local consequence, EXPTIME-completeness for global — are inherited from classical bimodal logic via the [twist modal translation](../objects/twist-modal-translation.md). The translation has polynomial overhead, so the bilattice bounds match the classical bimodal bounds up to that overhead.

Open: are tighter bounds *specific to the bilattice structure* achievable, or are these bounds essentially optimal?

## What "tighter" could mean

Three distinct improvement targets:

- **Lower-bound matching with smaller hypothesis classes.** The current PSPACE / EXPTIME lower bounds are inherited from classical bimodal logic and require all of bimodal's reduction expressivity. The bilattice structure has *less* expressive power in some directions (e.g., the implication is non-Boolean, normality fails). A natural conjecture: the bilattice modal calculus is strictly weaker than full bimodal, and its consequence problem may be in a smaller class — perhaps NP or co-NP for some natural fragments.
- **Structural-feature-driven upper bounds.** Specific bilattice features admit specialized algorithms:
  - The [internal $\mathbb{Z}/2$-gauge](teaching/explanations/internal-z2-gauge.md) (negation as a swap involution on the paired Priestley space) gives an automorphism that bisection-style arguments might exploit. Decision procedures factoring through the gauge could be tighter than generic bimodal procedures.
  - The four-valued state space ($\bot, \mathbf{f}, \mathbf{t}, \top$) is finite and small; algorithmic procedures specialized to four-state models may avoid the general-state-space costs that bimodal logic pays.
  - Non-normality of $\Box$ means standard tableau procedures don't apply; a *failed* branch in tableau argues differently. This may be a source of *higher* complexity in some directions (some procedures fail) or *lower* in others (some branches close trivially under non-normality).
- **Tightness for paraconsistent fragments.** The bilattice's paraconsistent fragment ($\top$-tracking, [paraconsistent variants](prose/teaching/explanations/paraconsistent-variants-opener.md)) is structurally finer than classical bimodal. The decision problem for paraconsistent modal consequence may have its own tighter characterization.

## What's available off the shelf

The classical bimodal complexity bounds come from results like Halpern-Moses ([@halpern-moses1992]) and Halpern-Vardi for multi-modal logics. The bilattice setting could borrow lower-bound techniques (reductions from QBF for PSPACE, succinct reductions for EXPTIME) but the upper-bound side has bilattice-native opportunities:

- **MV-algebra-based decidability** (Hájek's *Metamathematics of Fuzzy Logic*) gives published machinery for continuous-valued logics; the bilattice case is the discrete specialization.
- **Belnap's four-valued logic** has an extensive complexity literature (Pynko, Avron) that applies to the propositional fragment of the modal calculus and could anchor tighter modal bounds.

## Specific sub-questions

- Is the local consequence problem for the *paraconsistent fragment* (where only $\top$-designated formulas are considered) PSPACE-complete, or strictly easier?
- Is there a polynomial-time decidable fragment characterized by structural properties of bilattice formulas (e.g., the *positive* fragment with no $\Box \to$ or $\to \Box$ alternations)?
- Can the [modal finite model property](../theorems/modal-finite-model-property.md)'s bound be tightened? FMP gives an exponential-model upper bound; a polynomial-model bound would change the complexity story.
- Does the polynomial overhead of the twist translation hide a *non-tight* matching with bimodal? That is: is the bilattice problem actually harder/easier than bimodal, with the translation papering over the gap?

## Position in predication categories

This question is a sub-application of the [modal calculus chapter](prose/teaching/explanations/modal-calculus-opener.md) of Part 2. It doesn't feed back into the main Part 1 spine — the modal calculus is a side construction whose complexity matters for applications, not for predication categories' structural development. Tighter bounds would matter most for *practical* knowledge-representation use cases where bilattice-modal reasoning is implemented and runtime cost matters.
