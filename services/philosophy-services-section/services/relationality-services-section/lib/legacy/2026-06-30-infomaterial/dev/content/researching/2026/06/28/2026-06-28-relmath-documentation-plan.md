# RelMath documentation plan

Date: 2026-06-28

## Constraint

RelMath has three documentation levels:

1. `RelMath/` is the verified library and API documentation source.
2. `docs/` is the public Verso, Diataxis, and proof-tree documentation body.
3. `dev/docs/` is the public Blueprint frontier and planning graph.

The proof-tree markdown files are not historic provenance parked beside the docs.
They are the docs.
The mistake to avoid is nesting the proof-tree site under a copied source path.
Each documentation site should be mounted at the appropriate documentation root.

## Move recorded

The former `content/mark/` tree has been moved into the RelMath Lean checkout and mounted at:

`sites/relationality.dev.emsenn.net/lean/docs/`

The moved documentation site contains 2,480 files.
Its root shape is now:

- `docs/mark.md`
- `docs/mark.schema.json`
- `docs/content/...
  `

This is the proof-tree documentation body.
Verso should unfold it, not replace it.

## Documentation levels

### Level 1: `RelMath/`

`RelMath/` is the checked mathematical library.

Its documentation job is API precision:

- module headers explain local position in the verified derivation;
- declaration docstrings state the exact definition, theorem, construction, or computation;
- generated API docs come from the Lean environment and docstrings;
- claims stay bounded by the declaration that Lean actually checks.

This level should feel close to Mathlib and Lean core practice: exact, searchable, generated, and mechanically tied to declarations.

### Level 2: `docs/`

`docs/` is the public educational documentation body.

Its documentation job is proof-tree unfolding:

- the proof-tree markdown is the canonical public documentation substrate;
- Verso provides checked, navigable, reader-facing unfolding over that substrate;
- Diataxis should be available at each meaningful proof-tree token;
- the documentation can be strange, fractal, and mathematical because the object being documented is strange, fractal, and mathematical.

For each proof-tree token, the documentation system should be able to expose the four Diataxis modes:

- Tutorial: how to enter this token from a learner's current position.
- How-to: how to use this token in proofs, readings, or constructions.
- Explanation: why this token exists in the derivation.
- Reference: what its exact Lean/API surface is, when one exists.

This does not require four fully hand-written essays for every token.
It requires the site architecture to admit those unfoldings as first-class paths.

### Level 3: `dev/docs/`

`dev/docs/` is the public frontier graph.

Its documentation job is Blueprint:

- proof obligations;
- theorem dependency graph;
- roadmap edges;
- maturity ledger;
- frontier planning.

Blueprint should remain public-facing, but it is not the educational proof-tree body.
It is the graph of what is proved, what is being connected, and what remains open.

## Linearizing the stratified object

The proof tree is not naturally linear.
The documentation should therefore separate traversal from containment.

Containment is the proof-tree site rooted at `docs/`.

Traversal is supplied by Verso.

The canonical public reading path should be a Verso spine through the proof tree, not a flattening of the proof tree.
The spine gives readers a first route through the object.
Every major token should also support local expansion into its Diataxis views and cross-links:

- down to child tokens;
- up to parent tokens;
- sideways to sibling or dual constructions;
- inward to Lean declarations;
- forward to Blueprint obligations when the token reaches the frontier.

The point is not to simplify the fractal object into a book.
The point is to let a book-path pass through the fractal object while preserving its stratification.

## 2026 external pattern

The large Lean libraries still provide useful engineering discipline:

- Mathlib keeps meaning close to declarations through module docstrings and declaration docstrings, with recurring sections such as main definitions, main statements/results, implementation notes, references, and tags.
- Generated API docs should come from the Lean environment and docstrings.
  `doc-gen4` is the normal shape for that reference surface.
- Long-form explanation belongs in literate/manual systems, not in oversized declaration docs.
  Lean's current reference manual is a model for checked, navigable manual documentation, and Verso supports that mode.
- Documentation maintenance must be gated.
  Style conventions, module headers, declaration docs, naming checks, and import graph checks scale better than heroic cleanup passes.

RelMath should use that discipline without inheriting Mathlib's documentation ontology.
Mathlib is a broad shared mathematics library.
RelMath is a proof tree unfolding into a verified library, with public documentation that must preserve token-level Diataxis and stratified traversal.

External references:

- Mathlib documentation guidelines: https://leanprover-community.github.io/contribute/doc.html
- Lean reference manual: https://lean-lang.org/doc/reference/latest/
- Verso: https://github.com/leanprover/verso
- doc-gen4: https://github.com/leanprover/doc-gen4

## Plan

### Phase 0: Correct the mount

Status: done.

- Move the proof-tree markdown site to `sites/relationality.dev.emsenn.net/lean/docs/`.
- Remove the intermediate `lean/content/mark/` mount.
- Verify that `docs/` contains 2,480 files.

Acceptance criteria:

- `docs/mark.md` exists.
- `docs/content/...
  ` exists.
- `lean/content/mark/` does not exist.

### Phase 1: Establish the three-level contract

Status: next.

- State the three documentation levels in the public documentation architecture:
  - `RelMath/`: API.
  - `docs/`: Verso, Diataxis, proof tree.
  - `dev/docs/`: Blueprint.
- Route generated API output, Verso render output, and Blueprint output so each level is discoverable without nested site confusion.
- Keep documentation claims maturity-bounded across all three levels.

Acceptance criteria:

- A reader can tell which level they are in by path alone.
- No public documentation surface treats the proof-tree markdown as merely archival.

### Phase 2: Diataxis per proof-tree token

Status: planned.

- Define the token-level documentation contract:
  - tutorial path;
  - how-to path;
  - explanation path;
  - reference path.
- Decide how each token declares which modes are present, inherited, or still absent.
- Make missing Diataxis modes explicit rather than silent.
- Link reference views to Lean declarations where the token has a formal API surface.

Acceptance criteria:

- A proof-tree token can expose Diataxis views without duplicating the whole tree.
- A missing mode is a visible documentation obligation, not an accidental absence.

### Phase 3: Verso traversal spine

Status: planned.

- Build a canonical Verso reading spine through `docs/`.
- Keep the spine linear enough to teach, but link it into the non-linear proof tree.
- Use checked Lean examples when a token has formal declarations.
- Allow frontier prose when it is explicitly maturity-tagged and linked to Blueprint obligations.

Acceptance criteria:

- A reader can follow a first path through the system without losing the proof-tree shape.
- A reader can leave the spine at any major token and unfold local Diataxis views.

### Phase 4: API alignment

Status: planned.

- Keep `RelMath/` declaration and module docstrings focused on exact API reference.
- Use generated API docs as the reference target for Diataxis reference views.
- Add module headers that name the module's proof-tree position when the ancestry is real and checked.
- Avoid putting tutorial or frontier prose into declaration docstrings.

Acceptance criteria:

- API docs remain precise and generated.
- Proof-tree docs can point into API docs without re-authoring declaration reference material.

### Phase 5: Blueprint placement

Status: planned.

- Mount Blueprint under `dev/docs/`.
- Keep Blueprint focused on frontier graph, obligations, and maturity state.
- Link frontier-facing Verso passages and proof-tree tokens to Blueprint nodes.

Acceptance criteria:

- Frontier claims can be audited through `dev/docs/`.
- Public educational docs can discuss the frontier without pretending it is proved.

## Immediate next actions

1. Add the three-level documentation contract to the public documentation architecture.
2. Create or move the Blueprint surface under `dev/docs/`.
3. Define the token-level Diataxis metadata shape for `docs/`.
4. Wire the Verso spine so it traverses `docs/` rather than replacing the proof tree.
5. Audit path references that still imply `content/mark/` is the documentation home.
