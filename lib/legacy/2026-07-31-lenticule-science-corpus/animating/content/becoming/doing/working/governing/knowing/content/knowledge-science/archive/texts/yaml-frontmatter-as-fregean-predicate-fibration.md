---
title: "YAML Frontmatter as Fregean Predicate Fibration"
description: "Markdown files with YAML frontmatter implement Fregean subject-predicate-object triples. Across a vault, predicates index fibers of values, forming a degenerate hyperdoctrine whose emergent structure can be examined without external schema."
date-created: 2026-03-28
type: paper
authors:
  - emsenn
status: draft
extends:
  - frege-predicate-logic
  - rdf-triple
  - lawvere-hyperdoctrine
requires:
  - yaml-frontmatter
  - markdown-file-vault
acts-on: knowledge-representation-in-plain-text
produces:
  - schema-free-knowledge-graph-from-existing-frontmatter
  - divergence-detection-without-external-validation
contrasts-with: schema-first-knowledge-representation
references:
  - id: frege1879
    type: document
    title: Begriffsschrift
    author:
      - literal: G. Frege
    container-title: Louis Nebert
    issued:
      - year: 1879
  - id: heck2003
    type: document
    title: The Function Is Unsaturated
    author:
      - literal: R. K. Heck
    container-title: Oxford University Press
    issued:
      - year: 2003
  - id: jacobs1999
    type: document
    title: Categorical Logic and Type Theory
    author:
      - literal: B. Jacobs
    container-title: Elsevier
    issued:
      - year: 1999
  - id: bernerslee2001
    type: document
    title: The Semantic Web
    author:
      - literal: T. Berners-Lee
      - literal: J. Hendler
      - literal: O. Lassila
    container-title: Scientific American
    issued:
      - year: 2001
  - id: w3c2024
    type: document
    title: RDF 1.2 Concepts and Abstract Data Model
    author:
      - literal: W3C
    container-title: W3C
    issued:
      - year: 2024
  - id: lawvere1969
    type: document
    title: Adjointness in Foundations
    author:
      - literal: F. W. Lawvere
    container-title: Dialectica
    issued:
      - year: 1969
cites:
  - frege1879
  - heck2003
  - jacobs1999
  - bernerslee2001
  - w3c2024
  - lawvere1969
---

## Abstract

A markdown file with YAML frontmatter encodes a set of subject-predicate-object triples: the file is the subject, each key is a predicate, and each value is an object. This is not a metaphor. It is Frege's function-argument structure (Frege 1879) implemented in a plain-text format now standard across millions of repositories.

When many files share the same predicate keys, each key generates a **fiber**: the collection of all values that key takes across files. The fiber for `authors` contains every author who appears in any file's `authors` field. The fiber for `extends` contains every concept any file claims to extend. These fibers, indexed by predicate, form a structure that categorical logicians call a fibration (Jacobs 1999) — specifically, a degenerate hyperdoctrine where the base category is the set of predicate keys and each fiber is the set of values assigned to that key.

This paper makes three claims. First, the Fregean reading is precise and literal, not analogical. Second, the fibration structure is already present in any vault with consistent frontmatter — it does not need to be imposed. Third, the emergent structure can be examined to detect divergence, identify implicit schema, and query relational configurations, all without external ontology or validation.

## 1. The Frontmatter Triple

### 1.1 Frege's Unsaturated Predicate

Frege's central insight in the *Begriffsschrift* (1879) is that a predicate is not a label attached to a subject but an unsaturated function that takes an argument and returns a value. "Is red" is not a property sitting on a shelf; it is an incomplete expression that needs an object to become a complete thought. The expression $f(x)$ is $f$ applied to $x$, where $f$ is incomplete without $x$ (Heck 2003).

This incompleteness is constitutive. A predicate with no argument is not a predicate in a weaker sense — it is not a predicate at all. It is a gap waiting to be filled.

### 1.2 YAML Frontmatter as Function Application

Consider a markdown file with frontmatter:

```yaml
---
authors: emsenn
extends: legibility
---
```

The file itself is a resource — a saturated object with a path, a name, content. Each frontmatter key is an unsaturated predicate: `authors` is incomplete until applied to both a subject (this file) and an object (emsenn). The frontmatter block is a set of function applications:

$$\texttt{authors}(\text{this-file}) = \texttt{emsenn}$$
$$\texttt{extends}(\text{this-file}) = \texttt{legibility}$$

This is Frege's structure, implemented. The file is the argument. The key is the function. The value is the output. There is no metaphor here — the YAML parser performs the function application when it reads the file.

### 1.3 Relation to RDF

The Resource Description Framework (W3C 2024) structures knowledge as triples: (subject, predicate, object). RDF was designed to implement Berners-Lee's vision of a machine-readable semantic web (Berners-Lee et al. 2001). The frontmatter triple is an RDF triple in which:

- The subject is always the file (identified by path or filename)
- The predicate is always a YAML key
- The object is always a YAML value

This is a restricted form of RDF — the subject is implicit (always the file) rather than explicitly named. But the restriction is a feature: it means every markdown file is automatically a set of triples without requiring the author to write RDF syntax. The frontmatter format is RDF for people who don't know RDF.

## 2. Predicate Fibers

### 2.1 Definition

Let $V$ be a vault: a set of markdown files, each with YAML frontmatter. Let $K$ be the set of all keys that appear in any file's frontmatter. For each key $k \in K$, define the **fiber** $F_k$ as the set of all values that $k$ takes across all files in $V$:

$$F_k = \{ v : \exists f \in V \text{ such that } k(f) = v \}$$

For example, if 200 files have `authors: emsenn` and 3 files have `authors: claude`, then:

$$F_{\texttt{authors}} = \{\texttt{emsenn}, \texttt{claude}\}$$

If 15 files use `extends:` with various values:

$$F_{\texttt{extends}} = \{\texttt{legibility}, \texttt{rate-distortion-theory}, \texttt{frege-predicate-logic}, \ldots\}$$

Each fiber is a set of tokens. The fibers are indexed by predicate keys. The total structure — all fibers, indexed by all keys — is the vault's **predicate fibration**.

### 2.2 What the Fibration Contains

The predicate fibration contains exactly the relational structure that the vault's authors have asserted through frontmatter. No more, no less. It does not contain the content of the files, only the claims their frontmatter makes. It does not impose a schema — it reports what schema has emerged from practice.

For a vault with rich, consistent frontmatter, the fibration is dense: many keys, many shared values, many files connected through common tokens in the same fibers. For a vault with sparse or inconsistent frontmatter, the fibration is thin: few connections, many singletons.

### 2.3 Relation to Categorical Logic

In Lawvere's hyperdoctrine framework (Lawvere 1969), a predicate logic over a base category $\mathcal{C}$ assigns to each context $c \in \mathcal{C}$ a lattice of propositions $P(c)$. The assignment $P: \mathcal{C}^{op} \to \mathbf{HeytAlg}$ is a functor from contexts to Heyting algebras. This is a fibration: each context gets its own fiber of predicates, and these fibers are connected by reindexing maps (substitution).

The predicate fibration of a vault is a degenerate case. The base category is the discrete set $K$ of predicate keys (no morphisms between keys). Each fiber $F_k$ is a set (not a Heyting algebra — there is no implication structure within a fiber). There are no reindexing maps because the base is discrete.

This is the simplest possible fibration. It is worth naming precisely because it already exists in every vault with frontmatter, and because the degenerate structure can be enriched:

- If values within a fiber are partially ordered (e.g., `status: draft` < `status: review` < `status: published`), the fiber becomes a poset, and with it a Heyting algebra.
- If keys are related (e.g., `extends` and `extended-by` are dual), morphisms appear in the base, and the fibration acquires reindexing maps.
- If files are organized into directories that provide context, the base category gains hierarchical structure.

Each enrichment moves the vault closer to a full hyperdoctrine without requiring the vault's author to know what a hyperdoctrine is.

## 3. Emergent Schema

### 3.1 Schema-First vs. Schema-Free

Traditional knowledge representation is schema-first: define an ontology, then populate it with instances. RDF/OWL works this way — you define classes and properties, then assert triples that conform to the schema. Violations are errors.

The predicate fibration inverts this. The vault's authors write frontmatter as they see fit. The fibration reports what has emerged. If 800 files assert `authors: emsenn` and one file asserts `authors: emsen`, the fibration does not call this an error. It reports a divergence: one value in the `authors` fiber that appears once where another appears 800 times.

### 3.2 Divergence Detection

A **divergence** in a fiber is a value that appears rarely relative to the fiber's dominant values. Divergences may indicate:

- Typos (`emsen` for `emsenn`)
- Legitimate exceptions (a file with a different author)
- Evolving conventions (an old key being replaced by a new one)

The fibration cannot distinguish between these. A human or agent must interpret the divergence. But the fibration makes the divergence *visible* — it surfaces the question "is this intentional?" without needing a schema to enforce an answer.

### 3.3 Implicit Schema Recovery

The dominant patterns within fibers constitute the vault's implicit schema. If every file with `type: paper` also has `authors:` and `status:`, then `paper` implicitly requires `authors` and `status` — not because a schema says so, but because practice has determined it. This implicit schema can be extracted, examined, and formalized after the fact, or it can remain implicit and serve as a soft constraint.

## 4. What This Is Not

This paper does not claim that YAML frontmatter is a replacement for RDF, OWL, or formal ontology engineering. Those systems provide inference, constraint checking, and reasoning that the predicate fibration does not. The claim is narrower: the Fregean structure is already there in frontmatter, the fibration is already there in any vault, and examining the emergent structure is useful even without external tooling.

This paper also does not claim novelty for the Fregean reading of subject-predicate-object triples — that connection is well-established in the RDF literature. The contribution is recognizing that YAML frontmatter in markdown vaults is a concrete, widespread, practical instantiation of this structure, and that the fibration it generates can be examined as a mathematical object.

## 5. Practical Consequences

### 5.1 For Knowledge Workers

Any vault with consistent frontmatter already has a queryable knowledge graph. The graph does not need to be extracted into a database — it can be read directly from the YAML. The predicate fibration tells you: what predicates exist, what values each predicate takes, which files share values, and where conventions diverge.

### 5.2 For AI Agents

AI agents that read vaults (via CLAUDE.md, AGENTS.md, or Model Context Protocol) already consume frontmatter. The fibration gives them a way to understand the vault's structure without reading every file: examine the fibers, identify the dominant patterns, and use those patterns to navigate the vault's content.

### 5.3 For Vault Design

If you design frontmatter with the fibration in mind — using short, reusable tokens as values, using predicate keys that carry relational weight (defines, extends, requires, acts-on, produces, contrasts-with) rather than flat labels (tags) — you build a denser, more traversable graph. Each value becomes a node that connects every file that uses it. Each predicate becomes a typed edge. The vault becomes a knowledge base, not by importing an external ontology, but by writing careful frontmatter.

## 6. Conclusion

YAML frontmatter is Fregean predicate logic implemented in plain text. Each key is an unsaturated function. Each file is an argument. Each value is the output. Across a vault, shared keys generate fibers of values that constitute a predicate fibration — a degenerate hyperdoctrine whose structure emerges from practice rather than being imposed by schema. This structure is already present in every vault with frontmatter. Examining it yields knowledge about the vault's implicit conventions, its divergences, and its relational topology, without requiring any formalism the author did not already use.

## References

- Berners-Lee, T., Hendler, J., & Lassila, O. (2001). "The Semantic Web." *Scientific American*, 284(5), 34–43.
- Frege, G. (1879). *Begriffsschrift*. Louis Nebert.
- Heck, R. K. (2003). "The Function Is Unsaturated." In *The Cambridge Companion to Frege*. Oxford University Press.
- Jacobs, B. (1999). *Categorical Logic and Type Theory*. Elsevier.
- Lawvere, F. W. (1969). "Adjointness in Foundations." *Dialectica*, 23(3-4), 281–296.
- W3C. (2024). *RDF 1.2 Concepts and Abstract Data Model*. W3C Recommendation.
