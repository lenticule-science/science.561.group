---
name: "Attending"
title: "Attending: The Four-Part Relational Closure"
id: "561-relationality:attending"
description: "The composite relational act articulate → predicate → posit → settle, whose four codomains and maps form a Turn."
date-created: 2026-10-17
date-modified: 2026-10-17
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

## The fixed-point codomain of one Attending

The four-map composite changes carriers. To call its final settling step a **closure operator**, we must identify the carrier on which that last step acts.

Fix a predication locus \(\varphi\). On its FOUR-valued charge fiber, take an admitted closure \(c_\varphi\). Define the settled codomain as

\[
X_4(\varphi)=\operatorname{Fix}(c_\varphi)
=\{a\mid c_\varphi(a)=a\}.
\]

The map \(r_\varphi(a)=(c_\varphi(a),\text{fixedness witness})\) takes a posited charge into that fixed-point carrier. Its inclusion \(i_\varphi:X_4(\varphi)\to X_3(\varphi)\) forgets only the attached fixedness evidence. The closure axioms yield

\[
i_\varphi r_\varphi=c_\varphi,\qquad
r_\varphi i_\varphi=\operatorname{id},\qquad
c_\varphi(a)\le_k b\ \Longleftrightarrow\ a\le_k b
\quad(b\in X_4(\varphi)).
\]

The last equivalence is the **reflection law**: from left to right use extensivity \(a\le_k c_\varphi(a)\); from right to left use monotonicity and the fixedness of \(b\).

This gives one precise realization of settlement as an **idempotent reflection** inside the complete Attending. It does not make the composite \(U(M)\to X_4\) itself an endomorphic closure. The current Lean `Spine.settle` already realizes the charge closure inside a `Meme`; the fully distinct fixed-point type \(X_4\) is the additional construction.

For `Charge.joinClosure k` on Belnap FOUR, \(c_k(a)=a\vee_k k\) has these laws. All 64 triples \((k,a,b)\) of four-valued charges were checked for inflation, idempotence and the reflected order comparison (conditional on \(b\) fixed). Their source Lean laws are `Charge.Closure.op_least`, `Charge.settle_fixed`, and `Spine.settle_charge_fixed`.

## What generation from Mark demands

**Mark-generated** does not mean that every implementation argument is called a Mark. It means that later carriers, evidence, rules, and transports are either constructed from earlier admitted Marks and their articulations, or explicitly supplied under a derived and recorded admission map. In particular, a post-hoc free `Charge` or arbitrary `Charge.Closure` is not made generated by composing it with a Mark-derived input.

A useful necessary law is **naturality under admitted observational renaming**. Let \(\rho:M\to M'\) be a renaming whose relational observations and witnesses are preserved. It induces \(U(\rho)\) on utterances and stage transports \(X_i(\rho)\). If each stage satisfies

\[
X_i(\rho)\circ a_i^{M,\Gamma}
=a_i^{M',\Gamma'}\circ X_{i-1}(\rho),
\]

then composition gives

\[
X_4(\rho)\circ\operatorname{Attend}_{\Gamma}
=\operatorname{Attend}_{\Gamma'}\circ U(\rho).
\]

**Proof.** Apply the stage relation four times and use associativity of composition. The resulting outer square commutes, so the final reading cannot depend on a surface-name difference that the admitted observations cannot measure.

Naturality alone does not establish full generation: a constant map can be natural while discarding the entire input. The required stronger condition is that every nontrivial output difference have **a Mark-derived observational witness** and every admitted operation have a source trace. The current `Spine.run` exposes the exact inputs still needing that provenance.

An implementation that compares two bare `Mark.surface` strings, or that injects an arbitrary negative charge unconnected to admitted testimony, fails this requirement even if its final result is labeled “settled.” [Obsmetrologia's Mark source and docket](https://github.com/lenticule-science/obsmetrologia/blob/main/docs/loop/items/marks-never-compared-directly.md) own the actual Lean migration.

## Observation and informational cost

Attending may identify two presentations only through an admitted observational relation. Our mathematical rule is **Marks are not compared directly**; they are distinguished through observable obstruction and identified relative to a declared family of tests.

The [Obsmetrologia quotient and wit ledger](https://github.com/lenticule-science/obsmetrologia/blob/main/docs/history/quot-sound-as-residue.md) treats each actual use of the identification instrument `Quot.sound` as one accountable wit. For a finite sequence of \(E\) identifications among \(V\) presented entities ending in \(C\) components, the number of independent class mergers is \(V-C\) and the residual cycle count is \(E-V+C\). The [Landauer entropy](https://github.com/lenticule-science/obsmetrologia/blob/main/Obsmetrologia/Cohomology/LandauerEntropy.lean) source names this second number `landauerBits`.

This yields the **identification balance** \(E=(V-C)+(E-V+C)\). One use of `Quot.sound` is one instrument application; the residual count is the number of applications that did not merge previously separate classes. They need not have equal totals. Identifications are accounted at the site of their use; a measured physical heat cost requires a separate thermodynamic realization.

## Attending and Caring

We conjecture that the four-stage act of Attending is precisely the metaphysical operation from which [Caring](caring.md) becomes intelligible. In this sense, caring is not a fifth stage performed after settling. It is the orientation and completion of the whole relational act, including what its residue leaves open for the next Turn.

The human ethical meaning of care additionally concerns the cared-for's responses, recognition, and material needs. It is not licensed by the mere existence of an automated closure operation. Those are distinct conditions for particular caring relations, not reasons to reduce this metaphysical conjecture to a metaphor.

See the [canonical Turn](turn.md), [relationlessness](../terms/relationlessness.md), and [Obsmetrologia generated foundation](https://github.com/lenticule-science/obsmetrologia/blob/main/docs/preprints/00-generated-relational-foundation.md).
