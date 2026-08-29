---
title: Documentation Style
keywords:
  - documentation
  - style
layer: spec
status: plan
depends_on:
  - theorem/internal/structure
  - theorem/internal/function
  - theorem/internal/documentation-structure
  - theorem/internal/syntax
  - theorem/internal/semantics
---
# Documentation Style

This specification describes the writing style and vocabulary discipline for
all documentation in the repository. The goal is to keep prose as close as
possible to the underlying relational mathematics so that every important
word can, in principle, be unfolded into precise structure and function
statements.

## 1. Language and register

- Use General American English spelling and grammar.
- Prefer short, direct sentences over ornate or rhetorical prose.
- Avoid unnecessary synonyms for technical concepts:
  - choose one canonical term for each concept (e.g., "specification" rather
    than alternating between "spec", "design", "idea"),
  - use that term consistently across acts, theorems, specs, architecture,
    and code comments.
- When introducing a new term of art, define it in place or point to the
  act/theorem/spec where it is formally defined.

## 2. Vocabulary determinism

Documentation should be written so that key words can be unfolded into the
relational structures and operators they refer to, as earned by the internal
theorem layer:

- Terms like "flow", "nucleus", "structure", "function", "context",
  "recognition", "trace", "section", "profile", and "tower" are not
  metaphors; they refer to specific acts and internal theorems.
- When using such terms in prose:
  - use the exact spelling that matches acts/theorems where possible,
  - avoid casual variants ("flowing", "nucleating", "tower-like") when the
    precise technical term is available,
  - ensure the surrounding text makes clear which formal object is meant.
- If a word cannot yet be unfolded into an act or theorem, treat it as a
  placeholder and mark it for later refinement rather than letting it drift
  in meaning.

### 2.1 Syntactic vs semantic vocabulary

The words "syntactic" and "semantic" are reserved for the meanings given by
the internal theorems:

- **Syntactic** always means "about admissible derivations", as in
  **Theorem (Syntax as Admissible Derivations)**:
  - which step acts and compositions are allowed,
  - which flows are considered legal in a proof, runbook, or runtime.
- **Semantic** always means "about normalization equivalence", as in
  **Theorem (Semantics as Normalization Equivalence)**:
  - which recognitions are identified because all admissible flows carry them
    to the same nucleus class,
  - how meanings change when the admissible step set (syntax) is changed.

Specs and architecture documents that speak about syntax or semantics should
do so only in this induced sense, and should point to the relevant theorems in
their `depends_on` metadata when those distinctions matter.

### 2.2 Documentation words as earned structures

Because documentation itself is part of the relational system, technical words
introduced in documentation must eventually correspond to earned structures or
functions:

- a term like "module", "kernel", or "interface" should not be treated as
  primitive; it must be tied back to internal theorems that define the
  underlying structures (for example, port and connection structures,
  evaluation structures, or gluing structures),
- until that happens, such words should be used carefully, marked as
  provisional, and treated as targets for nucleation work.

The long-term goal is that every meaningful word in the documentation can, in
principle, be rewritten as a judgement or structure/operator description over
the relational calculus. Documentation editing is therefore a process of
reducing free words into earned relational structures and operators.

### 2.3 Structure/operator vs type/function vocabulary

To keep the mathematical and implementation layers distinct, we fix the
following vocabulary discipline:

- In the **mathematical layer** (`docs/math/acts/` and
  `docs/math/theorem/**`):
  - use "structure" and "operator" for abstract objects earned by acts,
  - reserve "function" for the specific internal theorem `theorem/internal/function`
    (relational functions) and for external mathematical usage where that word
    is standard.
- In the **specification/architecture layer** (`docs/app/spec/`,
  `docs/app/arch/`):
  - use "type" and "function" for implementation-level data and behaviour,
  - refer back to mathematical "structures" and "operators" when describing
    which objects are being instantiated.

When in doubt, treat a new concept as a mathematical structure/operator first
and only introduce types/functions in specs once the underlying structure has
been earned by internal theorems.

### 2.4 Avoiding acronyms in mathematical text

To keep the mathematical vocabulary unambiguous and mechanically searchable,
avoid acronyms in acts and theorems:

- internal and external theorems should spell out names such as "simply-typed
  lambda calculus" rather than using short forms like "STLC",
- specifications and architecture documents may still reference external
  standards by their customary names (e.g., HTTP, OpenAPI), but mathematical
  objects defined by this repository should use fully expanded names.

## 3. Frontmatter, identifiers, and claims

- All documentation files under `docs/` should use frontmatter to declare:
  - `layer`: one of the allowed layer markers:
    - calculus layer: `act`, `internal-theorem`, `external-theorem`;
    - system layer: `spec` that instantiates earned structures as informational dynamics;
    - machine layer: `machine` for the abstract kernel/ISA docs;
    - computer layer: `arch` for the cybernetic/platform assemblies.
  - `status`: one of:
    - `someday`, `later`, `soon` – early or rough sketches,
    - `plan` – drafted but not yet wired to implementation,
    - `make` – under active implementation,
    - `test` – backed by tests,
    - `doc` – implementation and docs aligned,
    - `release` – stable and depended on by other components.
- `depends_on` values should use canonical identifiers:
  - for acts: their slug (e.g., `seed-observation`),
  - for theorems: `theorem/internal/name` or `reference/name`,
  - for specs: `spec/name`,
  - for architecture: `arch/name`.
- Avoid mixing bare slugs and path-like identifiers within the same
  `depends_on` list; pick one convention and apply it consistently.

- When a document makes one or more specific assertions, it may declare
  `claims` in frontmatter. Each claim should be a small record such as:
  - `type`: a coarse kind (`act`, `structure`, `function`, `theorem`,
    `specification`, `architecture`),
  - `judgement`: a concise textual statement of the main assertion, phrased so
    it can in principle be rewritten as a judgement over the earned structures
    and functions.
- When a document has explicit derivation traces or proof logs, it may declare
  `witnesses`, listing external files that record those traces in a
  machine-checkable, human-readable format. Future tooling may replay such
  witnesses to validate that the claims follow from the dependencies under the
  allowed derivations for the document’s layer.

### 3.1 Reference notation

To make static analysis possible, references to earned structures and functions
must use a consistent notation **and be hyperlinks**, not bare words:

- When referring to acts, internal theorems, external theorems, specs, or
  architecture docs in prose, use backticks and a canonical identifier:
  - acts: `` `acts/slug.md` `` or `` `slug` `` when unambiguous,
  - internal theorems: `` `theorem/internal/name` `` or `` `docs/math/theorem/internal/name.md` ``,
- external correspondences: `` `reference/name` `` or `` `docs/reference/name.md` ``,
  - specs: `` `spec/name` `` or `` `docs/app/spec/name.md` ``,
  - arch docs: `` `arch/name` `` or `` `docs/app/arch/name.md` ``.
- When writing Markdown, wrap those identifiers in links and use relative file
  paths as the target:
  - e.g., `[Judgment Calculus Structure](./judgment-calculus-structure.md)`.
  The link target doubles as the canonical identifier for static checks.
- Whenever such an identifier appears in the body of a spec or architecture
  doc, it should also appear in `depends_on`, unless the document is explicitly
  describing external work.

This convention allows tools (and agents) to mechanically check that a spec or
architecture document depends on the theorems and specs it actually uses, and
to detect undefined technical words that are not tied to earned structures.

## 4. Git usage and documentation as recognitions

Version control is part of the documentation discipline:

- Make small, coherent commits that reflect single development steps:
  - each commit should say what changed, how, and why in ordinary language,
  - avoid leaving large sets of uncommitted changes dangling.
- Treat commit messages as recognitions about documentation and code:
  - they should make it easier to reconstruct the sequence of flow/nucleus
    steps applied to the repository,
  - they should use the same vocabulary discipline as other docs.

Over time, we may add a dedicated specification for version control and
snapshotting; this document records the minimum style expectations so that
written history remains aligned with the rest of the relational calculus.
