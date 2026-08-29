---
type: object
class: classical
status: active
depends-on:
  - teaching/explanations/semantic-network.md
see-also:
  - teaching/explanations/knowledge-representation.md
references:
  - references/sowa-knowledge2000.md
---

# Frame

A **frame** (Minsky 1975) is a structured
representation of a stereotyped situation: a named
*concept* with a collection of *slots* (attributes)
each filled by a *value* or constrained by a
*default*. Influential in cognitive psychology and
AI; ancestor of object-oriented programming and
modern schema-based representations.

## Origins

Marvin Minsky's "A Framework for Representing
Knowledge" (1975) proposed frames as a model of how
people understand stereotyped situations:

- A *frame* is a packaged knowledge structure for a
  situation type (a Birthday Party, a Restaurant,
  a Person).
- Slots represent the structured components.
- Defaults handle typical values.
- Activated frames guide perception, expectation,
  and action.

Roger Schank's *scripts* (1977) and Charles Fillmore's
*frame semantics* (1976) are kindred ideas in NLP and
linguistics.

## Structure

A frame has:

- **Frame name.** The concept being represented.
- **Slots.** Attributes of the concept (each named).
- **Slot fillers.** Values, possibly with constraints.
- **Defaults.** Typical values when not otherwise
  specified.
- **Demons / procedural attachments.** Code to run
  when slot is read or written.
- **Inheritance.** Frames inherit from more general
  frames (Restaurant ← FoodService ← BusinessVisit).

Example: `Restaurant` frame:
- name: string
- cuisine: enum {italian, chinese, ...}
- typical-cost: dollars (default: $20-30)
- has-menu: bool (default: true)
- payment-required-after-meal: bool (default: true)

## Inheritance and defaults

Two key features:

- **Inheritance.** Slots and defaults propagate from
  parent frames.
- **Default reasoning.** Apply defaults when no
  contradicting information; revise when contradicted
  (non-monotonic).

These together enable script-like reasoning: filling
in expected details about a situation when not
explicitly stated.

## Frames in AI history

- **1970s-1980s.** Frame-based systems major in
  expert systems and AI.
- **KL-ONE family.** Formalized frames into
  description logics.
- **CLOS, Java, Python, etc.** Object-oriented
  programming inherited frame ideas.
- **Modern KGs.** Entity-with-properties resembles
  frame-with-slots.

The frame idea has influenced widely without often
being named.

## Frame semantics in NLP

Fillmore's frame semantics:
- Words evoke frames (concepts).
- Frame elements are roles within the frame.
- Sentence semantics built from frame composition.

Modern NLP resources:
- **FrameNet.** Catalog of frames and frame
  elements; annotated corpus.
- **PropBank.** Predicate-argument structure.
- **AMR.** Abstract Meaning Representation.

These continue the frame tradition in computational
linguistics.

## In contemporary AI

- **Object-oriented programming.** Direct descendant.
- **Knowledge graphs.** Entity-with-properties is
  frame-like.
- **Schema.org.** Web-scale frame-like schema.
- **JSON-LD documents.** Frame-style structured
  data on the web.
- **LLM scaffolding.** Frame-style prompts and
  scaffolds.

## Limits

- **Non-monotonic reasoning.** Defaults make
  inference non-monotonic; complicates semantics.
- **Single-inheritance preferences.** Multiple
  inheritance complicates.
- **Procedural attachments.** Mix of declarative
  and procedural makes formal analysis hard.
- **Largely informal.** Frame systems vary; no single
  standard.

## Status

Classical formalism whose ideas pervade modern KR
without always being named. Direct frame systems
mostly historical; their ideas continue in OOP, KGs,
and NLP frame semantics.
