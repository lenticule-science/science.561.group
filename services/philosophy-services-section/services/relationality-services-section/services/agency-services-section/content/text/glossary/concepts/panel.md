---
type: concept
class: parameterized-discipline
parameters: [unit-class, frame-marker, status-cues]
realizes: [frame-discipline, plan-reconstruction]
see-also: [gutter, icon, sequence]
instantiated-by:
- "../../math/theories/mathematical-communication/objects/definition-panel.md"
- "../../math/theories/mathematical-communication/objects/theorem-panel.md"
- "../../math/theories/mathematical-communication/objects/proof-panel.md"
- "../../math/theories/mathematical-communication/objects/diagram-panel.md"
- "../../math/theories/mathematical-communication/objects/formal-proof-script-panel.md"
date-created: 2026-05-02
title: Panel
description: A panel is a bounded communicative unit with a recognizable status.
---

# Panel

A *panel* is a bounded communicative unit with a recognizable status. The reader can tell what kind of unit it is, what it asserts, what it assumes, and what closure it asks for.

A panel is not defined by being visual. It is defined by being framed. A definition frames a term. A theorem frames a claim. A proof frames a derivation. An example frames an instance. A diagram frames a spatial or relational configuration. A code block frames an executable construction. A benchmark frames a computation under an acceptance protocol. A narrative bridge frames a route between objects that would otherwise remain adjacent but untraversed.

## Pattern

The artifact stipulates explicitly what is inside each panel and marks the panel's class so the reader can recognize the kind of communicative obligation it carries. Panels are the units that closure operates between; without panels, there are no [gutters](gutter.md) and no [communicative-closure](communicative-closure.md) to discipline.

## Parameters

- **`unit-class`** — the inventory of recognizable panel types in the practice (e.g. for math: definition, theorem, proof, lemma, example, diagram, equation, code, formal-script, benchmark, conjecture, narrative-bridge).
- **`frame-marker`** — how a panel's boundaries and class are made visible to the reader (e.g. typographic environment, numbering scheme, indentation, code fence, environment label, page region).
- **`status-cues`** — how the panel signals its epistemic status (proven / conjectured / motivating / pedagogical / under-revision / cited).

## Conformance shape

For any candidate artifact, enumerate every passage and verify (a) it falls inside exactly one panel of a recognized class; (b) the panel's class is marked by the practice's frame-marker; (c) the panel carries a status cue. Any region that is not classifiable, or any panel whose class or status cannot be recovered by inspection, is a defect.

## Lineage

The vocabulary derives from Scott McCloud's account of comics (*Understanding Comics*, HarperCollins, 1993), where the panel is the framed unit of sequential meaning. Will Eisner's craft vocabulary, Neil Cohn's cognitive treatment of sequential images, and Thierry Groensteen's semiotic system all give related accounts. The transfer to non-comic media is not metaphorical in the weak sense: any communicative artifact that frames units explicitly and asks readers to perform closure between them has panels.

## Instances in the corpus

- The [mathematical-communication panel inventory](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/communicating/content/communication/math/theories/mathematical-communication/objects) instantiates panel with `unit-class = {definition, theorem, proof, proof-sketch, lemma, example, counterexample, diagram, equation, code, formal-proof-script, benchmark, narrative-bridge, conjecture}`, `frame-marker = LaTeX environment / typographic ruling / code fence / numbered statement`, `status-cues = environment name + numbering + remarks`.
