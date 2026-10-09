---
type: concept
class: parameterized-discipline
parameters: [transition-type, closure-demand, repair-mechanism]
realizes: [accountable-closure]
see-also: [panel, communicative-closure, audience]
instantiated-by:
- "../../math/theories/mathematical-communication/concepts/gutter-classification.md"
- "../../math/theories/mathematical-communication/objects/routine-gutter.md"
- "../../math/theories/mathematical-communication/objects/productive-gutter.md"
- "../../math/theories/mathematical-communication/objects/disciplinary-gutter.md"
- "../../math/theories/mathematical-communication/objects/unaccountable-gutter.md"
date-created: 2026-05-02
title: Gutter
description: A gutter is the transition between panels where the reader is required to perform communicative-closure.
---

# Gutter

A *gutter* is the transition between [panels](panel.md) where the reader is required to perform [communicative-closure](communicative-closure.md). The gutter is not a defect: no artifact can state everything at once. Communication depends on selection. The gutter is where the reader does the work the artifact deliberately leaves for them.

## Pattern

A practice marks a gutter not by stating it explicitly (a stated gutter would just be another panel) but by the structural absence between panels. A good gutter is *crossable*: it requires participation but not mind reading. A bad gutter turns hidden expertise into a gatekeeping device.

A practice is responsible for two things: enumerating which gutter types are licensed by the practice, and marking which licensed type each particular gutter is.

## Parameters

- **`transition-type`** — the inventory of recognized gutter classes the practice admits. A common four-way classification: *routine* (a standard manipulation the audience can perform), *productive* (a conceptual interval the artifact intentionally leaves so the plan stays visible), *disciplinary* (a field-specific background the artifact relies on), *unaccountable* (a closure neither routine nor productive nor properly marked — the dangerous case).
- **`closure-demand`** — what the reader is being asked to do across the gutter (manipulate, recognize, infer, transport, reconstruct, look up).
- **`repair-mechanism`** — what the artifact provides if the reader fails to close: a citation, a glossary entry, a worked example, a proof obligation, a comment, a test, a re-derivation.

## Conformance shape

For each gap between panels in the artifact: classify the gutter under the practice's enumerated transition-types; verify the closure-demand is consistent with the [audience](audience.md) the artifact is addressing; verify a repair-mechanism is locatable. Any gutter that cannot be classified, or whose closure-demand exceeds what the stated audience is licensed to perform, or whose repair-mechanism is missing, is a defect.

## Lineage

McCloud's gutter is the originating concept. Line Edslev Andersen's "Acceptable gaps in mathematical proofs" (*Synthese* 197, 2020) gives the contemporary practice-theoretic account: intentional gaps in proofs are regulated by professional norms, and refereeing practices limit certain gaps while permitting others. The four-way classification above is a synthesis of the McCloud gutter, Andersen's empirical findings, and Hamami & Morris's account of plan reconstruction.

## Instances in the corpus

- The [mathematical-communication gutter classification](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/communicating/content/communication/math/theories/mathematical-communication/objects) instantiates gutter with `transition-type = {routine, productive, disciplinary, unaccountable}`, `closure-demand = {standard-manipulation, plan-recognition, field-background-recall, register-transport, plan-reconstruction, citation-resolution}`, `repair-mechanism = {cited lemma, worked example, formal proof obligation, glossary entry, code test, comment in script}`.
