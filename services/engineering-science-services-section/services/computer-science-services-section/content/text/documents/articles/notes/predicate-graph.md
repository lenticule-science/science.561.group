---
title: "Predicate Graph"
aliases:
  - "Predicate Graph"
  - "predicate graph"
date-created: 2026-03-06T00:00:00
authors:
  - claude-opus-4-6
type: doc
keywords:
  - agential-semioverse
  - repository
  - semantic-web
requires:
  - ../semiotic-markdown/index.md
  - ./semantic-frontmatter.md
  - ../../../mathematics/objects/universes/semiotic-universe/semiotic-universe.md
  - ../../../mathematics/concepts/heyting-algebra/index.md
description: The predicate graph is the semantic substrate of the repository.
---

The predicate graph is the semantic substrate of the repository. It is
the set of all typed relations declared across all pages, represented as
subject-predicate-object triplets. Every other formal structure in the
ASR specification is built from or evaluated against this graph.

This document defines the predicate graph, describes how it approximates
the formal structures of the
[semiotic universe](../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/semiotic-universe.md),
and specifies the satisfaction relation by which pages are evaluated
against their type theories.

## 1. Triplets

A **triplet** is an ordered triple (s, p, o) where:

- **s** (subject) is a handle: the relative path from the content root
  to a page. Example: `mathematics/concepts/group/index.md`.
- **p** (predicate) is a relation type: the name of a frontmatter field.
  Example: `requires`.
- **o** (object) is either a handle (a path reference to another page)
  or a value (a string). Example: `mathematics/concepts/binary-operation/index.md`
  (handle) or `"group"` (value).

The **interaction surface** of a page P is the set of all triplets with
P as subject. These are the typed relations P declares in its
frontmatter.

The **predicate graph** G is the set of all triplets across all pages in
the repository. G is computable: it is extracted from YAML frontmatter
by reading every `.md` file under `content/`.

### 1.1 Node properties and graph edges

Not all predicates carry the same structural weight. Triplets divide
into two classes:

- **Graph edges** have handles as objects. They connect one page to
  another. Predicates that produce graph edges: `requires`, `extends`,
  `mirrors`, `references`, `proven-by`, `proves`, `supports`,
  `argued-by`, `targets`, `contested-by`, `addresses`, `addressed-by`,
  `part-of`. These are the typed relations defined in
  [semantic frontmatter](../../../../../services/markdown-services-section/content/text/glossary/terms/semantic-frontmatter.md).
- **Node properties** have values (strings) as objects. They describe a
  page's attributes without connecting it to another page. Predicates
  that produce node properties: `type`, `defines`, `teaches`, `cites`,
  `tagged`, `authors`, `notation`, `questions`, `source`, `vocabulary`.

Graph edges form the navigable structure of the predicate graph. Node
properties carry the content that axioms evaluate. Both are triplets in
G; the distinction is in what the object refers to.

### 1.2 Metadata fields

A subset of frontmatter fields are **metadata**: they identify and
classify the page but do not contribute to the predicate graph. These
are: `title`, `aliases`, `date-created`, `date-updated`, `status`,
`description`, `summary`, `license`. Metadata fields are excluded from
triplet extraction.

The boundary between metadata and predicates follows a principle:
**if the field establishes a relation between the page and something
else (a concept, a page, a type), it is a predicate. If it describes
the page as a document artifact, it is metadata.**

### 1.3 Current state

As of 2026-03-06, the predicate graph contains:

| Measure | Count |
|---|---|
| Pages | 2991 |
| Pages with triplets | 2902 |
| Typed pages | 2722 |
| Total triplets | 8130 |
| Handle triplets (graph edges) | 299 |
| Value triplets (node properties) | 7831 |
| Unique predicates | 34 |

The most-used predicates are `type` (2722), `tagged` (1803), `defines`
(1719), `teaches` (509), `authors` (505), `cites` (446), `requires`
(206), `mirrors` (61), `references` (49), `questions` (29). The long
tail includes 24 additional predicates with fewer than 12 occurrences
each.

The graph is sparse in handle-valued edges (299 of 8130 triplets, 3.7%)
and dense in value-valued properties. This reflects the current state of
frontmatter authoring: most relation fields point to string values
(concept names, tags) rather than resolved page handles. Increasing
handle resolution is a concrete enrichment target.

## 2. Types as theories

Each content type T in a domain D has a **theory**: the set of axioms
that the domain ASR specification declares for T. The theory is the
formal specification of what a well-formed instance of T contains.

### 2.1 Axioms

An axiom is a formula evaluated against a page's triplets. The axiom
types currently defined:

| Axiom kind | Meaning | Example |
|---|---|---|
| `must` | The predicate MUST appear in the page's interaction surface | A mathematics definition MUST have `defines` |
| `must_not` | The predicate MUST NOT appear | (reserved for future use) |
| `should` | The predicate SHOULD appear (violation is a warning, not an error) | A mathematics definition SHOULD have `notation` |
| `target_exists` | If the predicate's object is a handle, that handle must resolve to an existing page | `requires` targets must exist |
| `no_self_ref` | The predicate must not point to the page itself | `requires` must not self-reference |
| `reciprocal` | If page A has predicate P pointing to page B, then B should have predicate Q pointing to A | `proven-by` on A implies `proves` on B |
| `target_type` | The predicate's handle target should have a specific content type | `proven-by` targets should be type `proof` |

A type's theory is the conjunction of its axioms. A page **satisfies**
its theory when every axiom evaluates to true.

### 2.2 Domain axiom registries

Each domain ASR specification defines axioms for its content types.
Five domains currently have axiom registries:

**Mathematics** (at
[mathematical ASR](../../../mathematics/specifications/mathematical-agential-semioverse-repository/index.md)):
definition, theorem, proof, axiom, conjecture, lemma, corollary,
proposition.

**Philosophy** (at
[philosophical ASR](../../../philosophy/specifications/philosophical-agential-semioverse-repository/index.md)):
claim, argument, objection, position, tradition.

**Sociology** (at
[sociological ASR](../../../sociology/specifications/sociological-agential-semioverse-repository/index.md)):
term, concept, school, lesson, text.

**Games** (at
[ludic ASR](../../../games/specifications/ludic-agential-semioverse-repository/index.md)):
term, lesson, specification, text, topic.

**Education** (at
[pedagogical ASR](../../../education/specifications/pedagogical-agential-semioverse-repository/index.md)):
lesson, curriculum.

Universal axioms apply across all domains: handle targets must resolve
(`target_exists`); `requires` and `extends` must not self-reference
(`no_self_ref`).

### 2.3 Current satisfaction

426 typed pages have axioms defined for their type. Of these, 389
(91.3%) satisfy their theory. By domain:

| Domain | Checked | Satisfied | Rate | Errors | Warnings |
|---|---|---|---|---|---|
| mathematics | 22 | 22 | 100.0% | 0 | 13 |
| philosophy | 32 | 32 | 100.0% | 0 | 0 |
| business | 16 | 16 | 100.0% | 0 | 0 |
| technology | 13 | 13 | 100.0% | 0 | 0 |
| writing | 15 | 15 | 100.0% | 0 | 0 |
| design | 2 | 2 | 100.0% | 0 | 0 |
| domestic | 2 | 2 | 100.0% | 0 | 0 |
| music | 2 | 2 | 100.0% | 0 | 0 |
| sociology | 176 | 158 | 89.8% | 18 | 171 |
| education | 40 | 35 | 87.5% | 5 | 18 |
| games | 106 | 92 | 86.8% | 14 | 106 |

The 37 errors are MUST violations. The 308 warnings are SHOULD gaps.
Both are concrete enrichment targets: each gap names a specific
predicate that a specific page needs.

## 3. The satisfaction relation

The satisfaction relation is the central formal concept. It connects the
predicate graph (a finite, computable structure) to the formal semantics
of the
[semiotic universe](../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/semiotic-universe.md)
(a complete Heyting algebra with closure operators).

### 3.1 Formal definition

Let T be a content type with theory Phi_T = {phi_1, ..., phi_n}. Let P
be a page with type T. Let I(P) be the interaction surface of P (its
triplets). Then:

    P |= Phi_T  iff  for all phi_i in Phi_T: eval(phi_i, I(P), G) = true

where eval checks the axiom against the page's triplets and the global
predicate graph G.

This is the standard model-theoretic
[satisfaction](../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/model.md)
relation: P is a model of the theory Phi_T. The triplets are the
interpretation; the axioms are the formulas; satisfaction asks whether
the interpretation makes every formula true.

### 3.2 What this approximates

In the semiotic universe, the semantic field H is a complete Heyting
algebra. Each element of H is a truth value, and truth values are not
binary: a page can partially satisfy its type. The formal satisfaction
relation P |= phi produces an element of H, not just true or false.

The current implementation approximates this with three values:
satisfied (true), error (false for MUST axioms), warning (false for
SHOULD axioms). This is a coarsening of the Heyting algebra to a
three-element chain: error < warning < satisfied.

The formal path toward full Heyting-valued satisfaction requires:

1. **Graduated truth values.** Instead of "defines: is present" (true)
   or "defines: is absent" (false), measure how well the page defines
   what it claims to define. Does the body text contain a definition?
   Does the definition reference its prerequisites? Is notation provided
   for all defined terms? Each sub-requirement contributes a partial
   truth value; their conjunction (meet in H) gives the graduated
   satisfaction for the axiom.

2. **The Lindenbaum-Tarski construction.** The set of axioms for a type
   T, quotiented by logical equivalence, forms a Heyting algebra. This
   is the
   [Lindenbaum-Tarski algebra](../../../mathematics/concepts/lindenbaum-tarski-algebra/index.md)
   of T's theory. The current axiom registries define the generators of
   this algebra; the Heyting operations (meet, join, implication) define
   how axiom satisfaction values combine.

3. **Lean formalization.** The correspondence between the predicate
   graph's satisfaction relation and the semiotic universe's truth
   values should be provable in
   [Lean](../../../technology/topics/lean/index.md). The existing
   Lean formalization at `formalization/Relationality/` proves that the
   recognition field axioms constitute a Heyting algebra (Genesis.lean).
   Extending this to formalize the type theories and their satisfaction
   relation is the path to verified truth values.

### 3.3 What the approximation loses

The predicate graph is a finite discrete structure. The semiotic
universe's H is a continuous complete lattice. The losses:

- **No implication.** The Heyting implication a => b (the largest
  element whose meet with a is below b) requires computing over all
  elements of H. The predicate graph can compute meets and joins of
  finite sets of triplets but cannot compute implications without a
  concrete representation of the full lattice.

- **No pseudocomplement.** The negation ~a = (a => bottom) requires
  implication. Without it, the graph cannot express "the absence of a
  property" as a positive truth value.

- **No modal closure.** The semiotic universe's j : H -> H closes truth
  values under modality (necessity, stability). The predicate graph has
  no analogue of j. Modal closure would require knowing which truth
  values are "stable" — which properties of pages persist under all
  permissible operations.

- **No trace.** The comonad G : H -> H tracks provenance (what
  structure generated a truth value). The predicate graph records
  `authors` and `date-created` as metadata but does not integrate
  provenance into the satisfaction relation.

These losses are honest. They define the gap between the predicate graph
(what we have) and the semiotic universe (what we want). Each loss is a
research problem.

## 4. Closure and the predicate graph

The three closure operators of the semiotic universe act through the
satisfaction relation. See
[operational closure](./operational-closure.md) for the full
specification. The summary:

- **Semantic closure (S_sem)** closes truth values under axiom
  entailment. If a definition MUST have `defines` and `notation`, and
  it has `defines` but not `notation`, S_sem adds `notation` as an
  entailed requirement. The semantic gap Gap_sem(P) is the set of
  predicates P needs to satisfy its theory.

- **Syntactic closure (S_syn)** closes the set of available operations
  under definability. If a validation rule exists for mathematics and
  sociology but not education, S_syn identifies the education rule as
  definable from the same pattern.

- **Fusion closure (S_fus)** identifies operations that produce
  identical results on all content and names unnamed recurrent patterns.

The **fixed point** X* is the state where every page satisfies its
type's theory, every definable operation exists, and every equivalent
operation has been merged. Distance to X* is measurable: the total
number of unsatisfied axioms across all pages is a monotone decreasing
measure under closure.

### 4.1 Idempotency

A tool that correctly computes closure is idempotent: applying it twice
produces no changes on the second pass. This is the operational test.
The satisfaction checker (predicate-graph.py --satisfy-all) is
idempotent by construction: it reads the graph and evaluates axioms
without modifying anything.

An enrichment tool that fills gaps would be idempotent if: after filling
all gaps reported by the satisfaction checker, re-running the checker
reports zero new gaps.

## 5. Relationship to other specifications

The predicate graph is the foundation that other ASR specifications
build on:

- **[Semiotic Markdown](../semiotic-markdown/index.md)** defines the
  file model: how pages encode triplets (frontmatter fields) and
  content (body text). It specifies the encoding; the predicate graph
  is what the encoding produces.

- **[Semantic Frontmatter](../../../../../services/markdown-services-section/content/text/glossary/terms/semantic-frontmatter.md)** defines the
  vocabulary of typed relation fields. It specifies which predicates
  exist and what they mean. The predicate graph is the instantiation of
  that vocabulary across all pages.

- **[Directory Organization](./directory-organization/index.md)**
  determines the handle structure (file paths) and the implicit
  classification (discipline, subdirectory type). Handles are the
  node identifiers in the predicate graph; directory position determines
  which domain axiom registry applies.

- **Domain ASR specifications** define the axiom registries for their
  content types. These are the theories against which the predicate
  graph evaluates satisfaction.

- **[Operational Closure](./operational-closure.md)** specifies
  how the three closure operators act on the predicate graph. It maps
  the formal mathematics to computable operations.

## 6. Implementation

The predicate graph is implemented by `predicate-graph.py` at
`scripts/predicate-graph.py` in this specification directory. The tool:

1. Walks every `.md` file under `content/`.
2. Parses YAML frontmatter.
3. For each non-metadata field with a list or string value, extracts
   triplets. Handle values (relative paths that resolve to existing
   files) produce handle triplets; all others produce value triplets.
4. Builds an in-memory graph indexed by subject, predicate, and object.
5. Supports queries: interaction surface (--triplets), reverse lookup
   (--incoming), predicate filter (--query), transitive closure
   (--transitive).
6. Evaluates satisfaction (--satisfy, --satisfy-all) by loading domain
   axiom registries and checking each typed page against its theory.

The tool runs in approximately 1.3 seconds for a full repository scan.
It is read-only: it does not modify any files.

### 6.1 Honest status

The tool is scaffolding. It approximates the satisfaction relation by
checking field presence and handle resolution. It does not compute
Heyting-valued truth, does not read body text, does not verify that
definitions actually define what they claim to define. It is Layer 0.5
in the implementation hierarchy:

- **Layer 0**: Field linting (validate-content.py). Checks whether
  required fields exist.
- **Layer 0.5**: Predicate graph + satisfaction approximation
  (predicate-graph.py). Checks field presence, handle resolution,
  reciprocal consistency, and type compatibility.
- **Layer 1**: Body-text extraction (future). NLP-based extraction of
  implicit relations from page content.
- **Layer 2**: Formal satisfaction (future). Lean proofs that the
  predicate graph's satisfaction relation correctly instantiates the
  semiotic universe's truth values.

Each layer is useful on its own. Each layer's output is input to the
next. The formal target is Layer 2.
