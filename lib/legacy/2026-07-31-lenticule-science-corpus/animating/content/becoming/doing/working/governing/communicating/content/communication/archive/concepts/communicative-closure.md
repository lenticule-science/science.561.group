---
type: concept
class: parameterized-discipline
parameters: [completion-act, constraint-source, audit-form]
realizes: [accountable-closure]
see-also: [gutter, plan-reconstruction, audience]
instantiated-by:
- "../../math/theories/mathematical-communication/concepts/communicative-closure.md"
date-created: 2026-05-02
---

# Communicative closure

*Communicative closure* is the reader's disciplined completion of a transition between framed [panels](panel.md). It names the interpretive act that fills a [gutter](gutter.md). Closure is constitutive, not auxiliary: meaning is produced *by* the reader's completion, under the constraints the artifact and its register supply.

The word "closure" is used here in a communicative sense. It is not algebraic closure, topological closure, modal closure, nucleus closure, or closure under an operation, except where a later text explicitly identifies those notions.

## Pattern

A communicative artifact never states everything. It frames some material and leaves the rest for the reader to complete. The discipline of communication is not to eliminate this completion (that is impossible) but to make it accountable: to ensure the reader can see what they are being asked to complete, has the constraints they need to complete it correctly, and can locate a repair if they cannot.

## Parameters

- **`completion-act`** — what the reader actually does (recognize a pattern, perform a manipulation, infer an unstated lemma, transport a claim across registers, reconstruct a plan, fetch a definition).
- **`constraint-source`** — what limits the legitimate completions (the surrounding panels, the cited references, the register's native rigor, the audience's stipulated background, the repair mechanisms).
- **`audit-form`** — how an external observer can decide whether a particular closure was legitimate (re-derivation, citation check, formal verification, expert review, test execution).

## Conformance shape

For every completion act the artifact demands: identify the act explicitly (what is the reader doing?); enumerate the constraint sources that bound the legitimate completions; specify an audit form. A demand whose act, constraints, or audit cannot be stated has been smuggled rather than disciplined.

## Lineage

McCloud's "closure" — the reader's act of completing what the panel-and-gutter sequence withholds — is the origin term. The communicative-closure framing as a *general discipline* (rather than a comics-specific feature) is developed in the [good-mathematical-communication](../../math/texts/good-mathematical-communication.md) essay; it draws on Hamami & Morris on proof understanding (*Noûs* 58, 2024), Ashton on audience in proof development (*Synthese* 198, 2021), and the broader phenomenographic literature on mathematical communication (Murfett & Tran 2025).

## Instances in the corpus

- The [mathematical-communication concept of communicative-closure](../../math/theories/mathematical-communication/concepts/communicative-closure.md) instantiates this concept with `completion-act = {inference, recognition, manipulation, transport, plan-reconstruction}`, `constraint-source = {prior panels, cited lemmas, library imports, ambient definitions, register-native rigor}`, `audit-form = {re-derivation, formal proof check, peer review, executable test, equivalence to known instance}`.
