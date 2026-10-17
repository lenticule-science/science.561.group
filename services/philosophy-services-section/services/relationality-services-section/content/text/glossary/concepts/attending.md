---
name: "Attending"
title: "Attending: The Four-Part Relational Closure"
id: "561-relationality:attending"
description: "The composite relational act articulate → predicate → posit → settle, whose four codomains and maps form a Turn."
date-created: 2026-10-17
type: concept
status: active-research-conjecture
science-owner: relationality-services-section
defines:
  - relational-attending
  - attending-composite
codomain-concept: turn
conjectures:
  - attending-generated-from-mark
  - caring-as-complete-attending
distinct-from:
  - turn-codomains
  - attending-wit-of-ack
  - attention-budget
  - biological-perception
keywords:
  - attention
  - articulation
  - predication
  - positing
  - settling
  - quotient-identification
  - care
---

# Attending: the four-part closure

**Attending** is the complete relational act **articulating → predicating → positing → settling**. It is what one does when a difference is admitted, oriented, given an evidential position, and permitted to settle under an admissible rule. Its result is not just one final cell: the [Turn](turn.md) is the **family of codomains** this act generates, with its connecting maps and produced traces.

We conjecture that Attending is a fundamental operation of existence, not merely the conscious direction of a person's senses. Attention in human cognition, institutional investigation, and computational observation may be specializations of this more general generative construction.

## A typed composition

Let \(M\) be the primitive Mark carrier, \(U(M)\) its generated utterance carrier, and \(X_1,X_2,X_3,X_4\) the codomains of the four stage maps. In a context \(\Gamma\) containing the rule and evidence admitted at the present stage, write

\[
\begin{aligned}
\alpha &: U(M)\to X_1 &&\text{articulate},\\
\pi &: X_1\to X_2 &&\text{predicate},\\
\nu_\Gamma &: X_2\to X_3 &&\text{posit},\\
\sigma_\Gamma &: X_3\to X_4 &&\text{settle}.
\end{aligned}
\]

Then

\[
\operatorname{Attend}_\Gamma
=\sigma_\Gamma\circ\nu_\Gamma\circ\pi\circ\alpha:
U(M)\to X_4.
\]

**Attending is the composite; a Turn is the indexed diagram of these codomains.** A trace through a Turn consists of the actual outputs reached for one admitted utterance. It is not the entire family of possible codomain values.

The maps must preserve their source witnesses and intended order. The conjecture that they are all ultimately *generated from Mark* means that the types, operations, admissibility tests, and required context can themselves be derived from the preceding relational constructions rather than independently inserted.

## Current Obsmetrologia realization

[Obsmetrologia's language spine](https://github.com/lenticule-science/obsmetrologia/blob/main/Obsmetrologia/Language/Spine.lean) gives an executable typed four-stage composition from a pair of Marks to an `Articulating`, a claim locus, a `Meme` with an admitted FOUR charge, and a settled `Meme`. It proves that the composite preserves the claim locus and settles at a fixed charge relative to the supplied closure.

**The remaining generative obligation is concrete:** `Spine.posit` takes a caller-supplied `Charge`, and `Spine.run` takes that charge together with a supplied `Charge.Closure`. The present computation therefore depends on \(\Gamma\); it does not yet derive the whole attending operation from Marks alone. A complete version must construct or lawfully receive these inputs through the preceding generated structure. A retrospective label like “Mark-derived” is not itself that derivation.

At the final stage, today's `settle` returns the same `Meme` carrier as positing. A refined type for \(X_4\) could record the fixed-point condition as part of its data. The current Lean theorem `Spine.settle_charge_fixed` establishes that property of the returned object; it does not introduce the proposed distinct codomain type.

## Observation and informational cost

Attending may identify two presentations only through an admitted observational relation. Our mathematical rule is **Marks are not compared directly**; they are distinguished through observable obstruction and identified relative to a declared family of tests.

The [Obsmetrologia quotient and wit ledger](https://github.com/lenticule-science/obsmetrologia/blob/main/docs/history/quot-sound-as-residue.md) treats each actual use of the identification instrument `Quot.sound` as one accountable wit. For a finite sequence of \(E\) identifications among \(V\) presented entities ending in \(C\) components, the number of independent class mergers is \(V-C\) and the residual cycle count is \(E-V+C\). The [Landauer entropy](https://github.com/lenticule-science/obsmetrologia/blob/main/Obsmetrologia/Cohomology/LandauerEntropy.lean) source names this second number `landauerBits`.

This yields the **identification balance** \(E=(V-C)+(E-V+C)\). One use of `Quot.sound` is one instrument application; the residual count is the number of applications that did not merge previously separate classes. They need not have equal totals. Identifications are accounted at the site of their use; a measured physical heat cost requires a separate thermodynamic realization.

## Attending and Caring

We conjecture that the four-stage act of Attending is precisely the metaphysical operation from which [Caring](caring.md) becomes intelligible. In this sense, caring is not a fifth stage performed after settling. It is the orientation and completion of the whole relational act, including what its residue leaves open for the next Turn.

The human ethical meaning of care additionally concerns the cared-for's responses, recognition, and material needs. It is not licensed by the mere existence of an automated closure operation. Those are distinct conditions for particular caring relations, not reasons to reduce this metaphysical conjecture to a metaphor.

See the [canonical Turn](turn.md), [relationlessness](../terms/relationlessness.md), and [Obsmetrologia generated foundation](https://github.com/lenticule-science/obsmetrologia/blob/main/docs/preprints/00-generated-relational-foundation.md).
