---
title: Documentation Nucleation
keywords:
  - documentation
  - process
layer: spec
status: plan
depends_on:
  - theorem/internal/documentation-structure
  - theorem/internal/function
---

This specification describes how to treat the documentation layer itself as a
relational structure and how to iteratively "nucleate" it so that acts,
theorems, specs, architecture docs, and code form a coherent view of the
underlying relational calculus.

## 1. Underlying structure

We regard the documentation artefacts as forming the documentation structure
`D` provided by **Theorem (Documentation Structure)**:

- points are act/theorem/spec/arch docs;
- relations are at least the explicit `depends_on` arrows, and later
  `Implements`/`Realises` arrows when we introduce them.

## 2. Nucleation goal

Documentation nucleation is a process that takes a finite slice of `D`
and rewrites it so that:

- internal theorem docs are atomic (one structure or one function per file),
- specs cite the structures/functions they actually instantiate,
- architecture docs cite the specs they actually realise,
- code and tests sit at the leaves of well‑typed dependency traces.

In other words, nucleation projects arbitrary documentation into a "normal
form" where ambiguities and multi‑purpose documents have been resolved into
clean, compositional pieces.

## 3. Expected functions on the documentation structure

We expect at least the following kinds of structure‑preserving operators in
the sense of **Theorem (Relational Functions)**:

- **Refinement functions.**  
  Maps that split a non‑atomic theorem/spec into multiple atomic ones while
  preserving dependency relations.

- **Normalization functions.**  
  Maps that adjust `depends_on`/`implements` fields so that they match the
  actual structures/functions used in the content.

- **Projection functions.**  
  Maps that forget implementation details and keep only the act/theorem/spec
  skeleton for certain analyses.

Precise definitions of these functions will be given in subsequent, more
focused specifications; this document records that such functions should
exist and be treated as structure‑preserving in the sense of *Function*. In
practice, a nucleation step over a local slice of documentation applies a
combination of refinement and normalization:

- identify free or ambiguous words and multi‑purpose documents,
- earn or reference internal theorems that supply the missing structures or
  functions, and
- rewrite the affected docs so that the words now refer to those earned
  objects and the dependency graph reflects that fact.

## 4. Relation to the repository process

The repository process specification must be read against this background:

- development steps over the repo are instances of the refinement and
  normalization functions on `D`,
- the "flow/nucleus" discipline is implemented as:
  - applying such functions (flow) along well‑typed dependency traces,
  - repeatedly nucleating documentation into normal form (nucleus) so that
    the docs remain aligned with the underlying relational mathematics.

When we revise documentation to replace vague terms with earned structures,
split omnibus theorems into atomic ones, or tighten specs to instantiate
internal theorems, we are performing exactly these nucleation steps on the
documentation structure.

## 5. Layer correspondence (calculus → system → machine → computer)

To avoid muddying math with implementation:

- **Calculus** is the relational math (acts, flow/nucleus, geometry).  
- **System** instantiates the calculus as informational dynamics (state as sheaf section, recognitions, traces) and must not contradict the calculus; equivalence is established by earned correspondences just like external math.  
- **Machine** is the abstract ISA over finite carriers (the sheaf-section state plus earned operators and runbook/program form) and must realise the system without violating it.  
- **Computer** is the machine plus interfaces/services (I/O, policy, measurement, network) and must be a machine respecting all upstream constraints.

Nucleation across docs should preserve these translations: when moving from calculus vocabulary to systems vocabulary, or systems to machine/computer, add explicit correspondence/proof links (flow/nucleus remains mathematical, only the grammar changes).
