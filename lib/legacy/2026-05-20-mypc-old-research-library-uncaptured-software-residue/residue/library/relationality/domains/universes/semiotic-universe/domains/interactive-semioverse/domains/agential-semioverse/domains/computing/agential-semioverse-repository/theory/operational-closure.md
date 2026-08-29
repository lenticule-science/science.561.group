---
title: "Operational Closure"
date-created: 2026-03-06T00:00:00
date-updated: 2026-03-06T00:00:00
authors:
  - claude-opus-4-6
status: draft
keywords:
  - AgentialSemioverse
  - Repository
requires:
  - ../ideas/closure-operators-as-api-contracts.md
  - ../predicate-graph.md
  - ../../../../mathematics/objects/universes/semiotic-universe/semiotic-universe.md
  - ../../../../mathematics/objects/universes/interactive-semioverse/interactive-semioverse.md
  - ../../../../mathematics/texts/fragment-calculus.md
---

This document specifies what closure computation means operationally
for an Agential Semioverse Repository. It grounds the three formal
closure operators (semantic, syntactic, fusion) in computable
operations on repository content, and specifies a layered
implementation path from Python scaffolding to Lean verification.

## 0. Foundations

The [predicate graph](../predicate-graph.md) specification defines the
semantic substrate: triplets, types as theories, the satisfaction
relation, and what the graph approximates. This document builds on that
foundation by specifying how the three closure operators act on the
predicate graph.

The three closure operators operate through the satisfaction relation:

- **S_sem** closes the set of truths about pages under the theory's
  axioms. If the axioms say "a definition must define something, and
  what it defines must have notation," then S_sem ensures those
  entailments are present in the semantic field.

- **S_syn** closes the set of available operations under definability.
  If the axioms for mathematics and the axioms for philosophy share a
  pattern, S_syn recognizes the common pattern as a new operation.

- **S_fus** identifies operations that produce the same truth values
  on all models, and names unnamed behaviors.

The fixed point X* is the state where every page is a model of its
type's theory, every theory's axioms have been applied to saturation,
and every derivable operation has been named.

## 1. The correspondence

The formal specifications define mathematical structures. The
repository is a finite, discrete, file-based system. The
correspondence is not an isomorphism but a disciplined approximation.

| Formal concept | Repository counterpart | Fidelity |
|---|---|---|
| H (complete Heyting algebra) | The algebra of truth values for axioms about repository content | Approximate: H is continuous; the repository is finite |
| Elements of H | Truth values of axioms evaluated against pages | Good: each axiom produces a truth value; the collection forms a lattice |
| Lindenbaum-Tarski algebra of type T's theory | The set of MUST/SHOULD axioms for T, quotiented by logical equivalence | Good: domain ASR specs define the theories |
| M |= phi (satisfaction) | Page P satisfies axiom phi when P's triplets make phi true | Good: checkable against the predicate graph |
| Subject-predicate-object triplets | (handle, relation-type, target-handle) from frontmatter | Exact: the primitive data |
| Handles | File paths | Exact: persistent, external, not identified with semantic content |
| eta(tau) (semantic seed) | A page's frontmatter and content as contributed to H | Approximate: extraction is lossy |
| Interaction terms | Typed relations in frontmatter | Good: each relation field combines a handle with an operator |
| Interaction surface Ix_X(tau) | The set of triplets with a page as subject | Good: directly readable from frontmatter |
| Handle fragment F_{tau,X} | The transitive neighborhood of a page's typed relations | Computable: follow relations to gather the neighborhood |
| Footprint Foot_X(tau) | The closed state of a handle's fragment | This is what closure computation must produce |
| Fragments F(H) | Finitely generated subalgebras, approximated by relation-chain neighborhoods | Approximate: real fragments are algebraically closed |
| Op^def (definable operators) | Skills, scripts, validation rules | Good: named, typed, invocable |
| S_sem | Close semantic content under operations | See Section 2 |
| S_syn | Close operations under definability | See Section 3 |
| S_fus | Identify equivalent operations, name behaviors | See Section 4 |
| S = S_fus . S_syn . S_sem | The composite closure | See Section 5 |
| X* (least fixed point) | Every page satisfies its type; every operation is named | Asymptotic target |

## 2. Semantic closure (S_sem)

Given X = (H_X, Op_X), S_sem closes H_X under interpretation of
operators, Heyting operations, modal/trace closure, and fixed points
of admissible operators.

### 2.1 What this means for a page

Given a page P with type T in domain D, semantic closure asks: **what
semantic content is entailed by P's current state, given the laws that
govern type T in domain D?**

The "laws" are the domain ASR spec's axioms for T. A mathematical
definition's closure includes everything it `defines:`, notation for
those definitions, and the transitive `requires:` chain. A theorem's
closure includes its `proven-by:` chain and every definition used in
the proof.

Linting checks whether a field exists. Closure computes what the field
should contain and what it entails:

- **Linting**: "This definition is missing `notation:`."
- **Closure**: "This definition defines `group`. Its closure includes:
  the notation for `group`, the definitions of `identity-element` and
  `binary-operation` (referenced in the body), and the requirements
  of those definitions transitively."

### 2.2 The type closure law

For a page P with type T in domain D, the **type closure law** L_T is
the function that takes P's current state and returns the state P
should have if it were a complete, well-formed instance of T.

**Structure of L_T**:

1. **Field closure**: For each MUST field F of T, L_T includes the
   semantic content F names. If T = definition and F = defines, L_T
   includes the terms being defined.

2. **Relational closure**: For each typed relation R that T
   participates in, L_T follows R to its targets and includes their
   contributions. If a definition requires group.md, L_T includes
   the fragment of group.md.

3. **Transitive closure**: Apply field and relational closure to each
   newly included page, until stable.

4. **Consistency closure**: Check that the accumulated content does
   not contain contradictions within the fragment.

### 2.3 The semantic gap

For a page P:

    Gap_sem(P) = L_T(state(P)) \ state(P)

Each element of Gap_sem(P) is an actionable enrichment need:
- "defines: is empty"
- "requires: should include ./binary-operation.md (referenced in body)"
- "notation: should include the symbol used in downstream pages"
- "cites: should reference the source for this claim"

### 2.4 What is computable

**Now** (from frontmatter + domain ASR specs):
- Field presence gaps
- Relational target resolution (do targets exist?)
- Transitive relation chain assembly
- Type-specific field value requirements

**With moderate work** (requires reading page bodies):
- Cross-reference extraction: what concepts does a page reference in
  its body that should appear in its frontmatter?
- Notation usage tracking
- Claim extraction

**Not yet** (requires deeper infrastructure):
- Full semantic content comparison across fragments
- Consistency checking across transitive closures
- Heyting operations (join, meet, implication) over semantic content

## 3. Syntactic closure (S_syn)

S_syn closes Op_X under lambda-definability, composition, and finitary
justification.

### 3.1 What this means for the repository

S_syn asks: **given the available skills, scripts, and validation
rules, what new operations could be defined by composition?**

If `validate-content.py` handles mathematics and sociology but not
education, S_syn identifies the gap: the education rules are definable
from the same template. If `validate` and `enrich` both exist, their
composition `validate-then-enrich` is in S_syn.

The finitary justification clause: if a new skill behaves identically
to an existing one on every test case within a bounded fragment, it is
already justified.

### 3.2 The operational closure law

For a set of operations Op, L_Op returns the operations definable from
Op by:

1. **Composition**: if skill A's output is skill B's input, A;B is in
   L_Op.
2. **Parameterization**: if skill A works for domain D and D' has the
   same structure, A instantiated for D' is in L_Op.
3. **Finitary justification**: if a candidate agrees with an existing
   operation on every tested fragment, it is in L_Op.

### 3.3 The operational gap

    Gap_syn(Op) = L_Op(Op) \ Op

Each element is a missing skill or script.

## 4. Fusion closure (S_fus)

S_fus identifies operators that agree on all fragments and names
admissible behaviors that exist but lack names.

### 4.1 What this means for the repository

1. **Equivalence**: Skills that produce identical results on all
   content should be merged.
2. **Naming**: Recurrent patterns of agent work that have no skill
   should become skills.

## 5. The composite closure and implementation layers

The composite S = S_fus . S_syn . S_sem is applied iteratively. Each
agent session computes a partial closure, bringing the repository
closer to X*.

### 5.1 Implementation layers

The layers are numbered honestly: lower numbers are scaffolding that
approximates what higher numbers will verify formally.

**Layer 0: Field linting** (DONE)
- validate-content.py: MUST/SHOULD field presence per domain ASR specs
- fragment.py: frontmatter extraction, relation chain assembly
- assess.py: repository-wide statistics and coverage gaps
- These check *preconditions* for closure, not closure itself.

**Layer 0.5: Satisfaction approximation** (DONE)
- predicate-graph.py: builds the full predicate graph (2991 pages,
  8130 triplets, 34 predicates) and evaluates domain axioms against
  it. 426 typed pages checked, 389 fully satisfied (91.3%).
- Axiom types: field presence (must/should/must_not), target resolution,
  self-reference, reciprocal consistency, target type compatibility.
- Idempotency verified. Runs in 1.3 seconds.
- This approximates M |= phi by checking frontmatter structure. It does
  not read body text, does not compute Heyting-valued truth, does not
  verify that definitions actually define what they claim.

**Layer 1: Body-text extraction** (FUTURE)
- NLP-based extraction of implicit relations from page content.
- Cross-reference extraction: concepts mentioned in body text that
  should appear in frontmatter.
- Claim parsing: sentences that assert properties of defined concepts.
- This bridges Level 1 (frontmatter) to Level 2 (body text) of the
  [semiotic markdown](../../semiotic-markdown/index.md) claim model.

**Layer 1.5: Cross-fragment compatibility** (FUTURE, REQUIRES LAYER 1)
- Follow typed relations transitively and check consistency across
  the closure.
- Detect when a requires: chain introduces contradictory assumptions.
- Corresponds to the Compat(F, G) predicate and Delta(F -> G)
  computation from the fragment calculus.

**Layer 2: Formal verification** (FUTURE, TARGET)
- Lean proofs that the satisfaction relation correctly instantiates
  the semiotic universe's truth values.
- The existing Lean formalization at `formalization/Relationality/`
  proves RecognitionField = HeytingAlgebra. Extending to formalize
  the type theories and their satisfaction relation is the target.
- When Layer 2 is complete, the Python tools become generators of
  proof obligations, not the verification system itself.

**Layer 3: Operational gap computation** (PARALLEL TO LAYERS 1-2)
- Analyze available skills against S_syn.
- Report missing skills, definable compositions, parameterizable
  patterns.

**Layer 4: Fusion detection** (REQUIRES LAYERS 1-3)
- Detect equivalent skills and unnamed recurrent patterns.

### 5.2 What "fixed point" means

The repository reaches X* when:
- Every typed page satisfies its type's theory (Gap_sem = empty)
- Every domain has complete operational coverage (Gap_syn = empty)
- No equivalent skills exist unsimplified (fusion is saturated)

This is asymptotic. The useful measure is distance, not arrival.

### 5.3 Idempotency

Skills that compute closures are idempotent by construction. If a
tool computes Gap_sem(P) and applies the enrichments, running it
again produces no changes. This is the operational test: **apply it
twice; if the second application is a no-op, it is a closure.**

## 6. Relationship to existing tools

### 6.1 predicate-graph.py

Builds the full predicate graph from YAML frontmatter and evaluates
domain axioms against it. **Layer 0.5 infrastructure**: approximates
the satisfaction relation by checking field presence, handle resolution,
reciprocal consistency, and target type compatibility. Supports queries
(interaction surface, reverse lookup, predicate filter, transitive
closure). See the [predicate graph](../predicate-graph.md) spec.

### 6.2 fragment.py

Extracts frontmatter into (A, K, P) tuples, follows requires: chains,
computes field-level deltas. **Layer 0 infrastructure**: collects the
seed from which closure would be computed. Does not compute closure.

### 6.3 validate-content.py

Checks MUST/SHOULD field presence. **Layer 0 infrastructure**: checks
necessary conditions for satisfaction. A missing MUST field means the
page cannot satisfy its type's theory — but having the field present
does not mean the axiom is satisfied.

### 6.4 assess.py

Reports coverage gaps (which domains have specs, which have validation
rules, which pages have well-formed frontmatter). **Layer 0 and Layer
3 infrastructure**.

## 7. What to build next

Layer 0.5 (satisfaction approximation) is done: predicate-graph.py
implements the predicate graph and satisfaction checker. The next
targets:

**Near term — Layer 1 (body-text extraction):**
- Extract markdown links and wikilinks from body text to discover
  implicit `requires:` and `cites:` relations not declared in
  frontmatter.
- Compare body-discovered relations against declared frontmatter to
  produce enrichment suggestions.

**Medium term — Lean formalization:**
- Formalize H with modal closure j and trace G (Axioms 1.2-1.4 of
  the semiotic universe spec). Extends the existing HeytingAlgebra
  in Genesis.lean.
- Formalize the typed lambda calculus and operator algebra.
- Formalize fragments and fragment preservation.
- Formalize the three closure operators and prove their composite
  yields a monotone inflationary operator with a least fixed point.
- Formalize the initiality theorem.

**Parallel — operational gap computation:**
- Survey available skills and scripts against the syntactic closure
  law. Report missing operations that are definable from existing
  ones.

## 8. Open problems

### 8.1 Heyting algebra operations over the predicate graph

The triplets form a graph. For this graph to support Heyting algebra
operations (meet, join, implication, pseudocomplement), the repository
needs:

- An **order relation** on semantic content. When does one page's
  content include another's? The `requires:` relation induces a
  partial order; the question is whether this order supports the
  full lattice structure.

- **Meet and join** operations. The common content of two pages
  (meet) and their combined content (join) need computable
  definitions. Meet could be "the triplets shared by both pages";
  join could be "the union of both pages' triplets." Whether these
  satisfy the lattice axioms needs verification.

- **Implication**. If page A's content implies page B's content, what
  does that mean operationally? The Heyting implication a => b is the
  largest element whose meet with a is below b. Translating this to
  the predicate graph: "the largest set of triplets that, combined
  with A's triplets, produces only triplets already in B." This is
  computable in principle but needs a concrete algorithm.

### 8.2 Truth predicates beyond field presence

The satisfaction relation M |= phi is currently approximated by
checking whether frontmatter fields exist. A real truth predicate
evaluates each axiom against the page's full content:

- **Implicit requirements**: A definition that mentions "identity
  element" in its body text implicitly requires that concept, even
  if it is not in the `requires:` field. Extracting implicit
  triplets from body text is computable (pattern matching, link
  extraction) but not yet implemented.

- **Transitive evaluation**: If A requires B and B requires C, does
  A's content account for C's contributions? This requires
  evaluating the satisfaction relation along the full transitive
  closure, not just checking that the chain of paths exists.

- **Partial truth values**: When a page partially satisfies an axiom,
  the truth value is an element of H between bottom and top. The
  Lindenbaum-Tarski construction says: these truth values form the
  Heyting algebra H. Computing partial truth values — not just "yes"
  or "no" but "how much" — requires a metric on the predicate graph.
  One candidate: the fraction of an axiom's sub-requirements that
  are satisfied. Another: the depth of the transitive closure that
  is complete.

### 8.3 Live querying

predicate-graph.py implements basic queries: interaction surface
(--triplets), reverse lookup (--incoming), predicate filter (--query),
and transitive closure (--transitive). These support questions like
"which pages require this page?" and "what is the transitive closure
of this page's requires: chain?"

Open queries not yet implemented:
- "Which pages define concepts that this page references in its body
  but does not declare in frontmatter?" (requires body-text extraction)
- "What is the semantic neighborhood of this page within N hops?"
  (requires parameterized graph traversal)
- "Which axioms across the repository are most frequently unsatisfied?"
  (requires aggregation over satisfaction results)

These queries are the operational counterpart of the interaction
calculus's evaluation. A query is an interaction term; its result is
a semantic generator in H.

### 8.4 Node acts

Pages should be able to execute operations on themselves: "compute my
satisfaction status," "list my unsatisfied axioms," "suggest the
triplets I need." These are the operational counterpart of the
agential semioverse's skill calculus applied to individual handles.
A page's interaction surface, combined with its type's theory,
determines what operations are applicable and what they should
produce.
