---
type: concept
class: parameterized-discipline
parameters: [unit-marker, status-language, ambiguity-cost]
realizes: [accountable-closure]
see-also: [panel, register]
instantiated-by:
- "../../math/theories/mathematical-communication/concepts/frame-discipline-in-math.md"
date-created: 2026-05-02
---

# Frame discipline

*Frame discipline* is the requirement that the reader can tell what kind of unit each [panel](panel.md) is, what it asserts, what it assumes, and what closure it asks for. Where panel names the unit, frame discipline names the practice's commitment to making the unit's class and status legible.

## Pattern

The practice uses an explicit, finite set of unit-markers (typographic, spatial, syntactic) that map one-to-one onto the panel-classes the practice admits. The practice uses an explicit status language for the panel's epistemic status (proven / conjectured / motivational / pedagogical / cited). Ambiguity — a passage where the reader cannot tell which panel-class governs or what status the panel carries — has a stated cost that prevents the practice from sliding into atmospheric prose.

## Parameters

- **`unit-marker`** — the explicit signs the practice uses to mark panel boundaries and class. Typographic environments, numbering schemes, environment labels, code fences, indentation conventions, page region.
- **`status-language`** — the practice's vocabulary for the panel's epistemic status (theorem vs. proposition vs. lemma vs. claim vs. conjecture vs. example vs. remark vs. exercise vs. counterexample, and parallel inventories in non-mathematical practices).
- **`ambiguity-cost`** — what the practice does when frame discipline fails (peer review rejection, refactoring request, tooling warning, audit failure, editorial repair).

## Conformance shape

For each region of the artifact: locate the unit-marker; recover the panel-class and status; verify both are unambiguous to a competent reader of the stated audience. Tally regions that fail. The practice's stated ambiguity-cost determines what counts as an acceptable rate of frame-discipline failure.

## Lineage

The frame-discipline criterion synthesizes McCloud's panel-class vocabulary, Murfett & Tran's empirical finding that mathematicians distinguish formal, pictorial, and language modes (Murfett & Tran 2025), and the older communication-studies inventory of orientation, definition, example, process, solidification, and term-control (Kline & Ishii, *Written Communication* 25, 2008).

## Instances in the corpus

- The [mathematical-communication frame-discipline concept](../../math/theories/mathematical-communication/concepts/frame-discipline-in-math.md) instantiates this concept with mathematical typographic environments as unit-markers, the standard mathematical-statement status vocabulary (theorem, proposition, lemma, corollary, remark, conjecture, definition, example, counterexample, exercise) as status-language, and the peer-review / refereeing system as the ambiguity-cost mechanism.
