---
title: "Research memo: categorical and algebraic structures of documents and prose"
description: A document is not a string with annotations.
aliases:
  - "Research Memo: Categorical and Algebraic Structures of Documents and Prose"
keywords:
  - categorical-semantics
  - coalgebra
  - DisCoCat
  - DisCoCirc
  - forest-algebras
  - graph-rewriting
  - initial-algebra
  - Lambek-calculus
  - Montague-grammar
  - operads
  - term-rewriting
---
# Research memo: categorical and algebraic structures of documents and prose

## 0. Guiding claim

A document is not a string with annotations. Mathematically, it is better treated as a **layered structured object**:

\[
\text{document}
=
(\text{local syntax})
+
(\text{semantic interpretation})
+
(\text{discourse organization})
+
(\text{tree/graph hierarchy})
+
(\text{references})
+
(\text{revision dynamics})
+
(\text{institutional context}).
\]

No single formalism covers all of these well. The strongest approach is **heterogeneous**: Lambek-style type logic for local syntax, categorical semantics for compositional meaning, tree/forest algebras for document hierarchy, graph/cospan/operadic structures for citation and cross-reference, coalgebras and rewriting for revision, and institutional/category-theoretic semantics for situated interpretation.

The sources below are mostly primary mathematical sources: Lambek’s syntactic calculus, Montague grammar, Barwise–Perry situation semantics, Joyal–Street string diagrams, Lawvere theories, Goguen–Thatcher–Wright initial algebra semantics, Courcelle graph algebras/MSO, Bojańczyk–Walukiewicz forest algebras, and DisCoCat/DisCoCirc work by Coecke, Sadrzadeh, Clark, and collaborators. ([cs.cmu.edu](https://www.cs.cmu.edu/~fp/courses/15816-f16/misc/Lambek58.pdf?utm_source=chatgpt.com))

---

## 1. Taxonomy: what each formalism takes as primitive

| Formalism | Primitive object | Composition operation | Best model of document/prose |
|---|---:|---:|---|
| Formal language theory | strings, trees, forests | concatenation, substitution, derivation | admissible surface forms |
| Lambek calculus / categorial grammar | typed words | noncommutative type reduction | syntax as proof |
| Pregroup grammar | ordered monoid with adjoints | type cancellation | compact-closed syntactic reductions |
| Montague grammar | syntax algebra + semantic algebra | homomorphic translation | typed logical semantics |
| Monoidal / compact closed categories | objects as types, morphisms as processes | tensor, composition, cups/caps | compositional syntax-semantics interface |
| DisCoCat | grammatical reductions + vector spaces | strong monoidal functor | distributional sentence meaning |
| DisCoCirc | entity wires, sentence gates | circuit composition/update | text as semantic process |
| Operads / multicategories / PROPs | operations with many inputs/outputs | grafting, wiring | compositional document constructors |
| Lawvere theories / term algebras | operations and equations | substitution | document ASTs and algebraic APIs |
| Initial algebras | recursive data constructors | folds/catamorphisms | finite structured documents |
| Coalgebras | states and observations | behavioral evolution | streams, interactive documents, edits |
| Rewriting systems | rewrite rules | reduction sequences | normalization, editing, transformation |
| Graph rewriting / adhesive categories | typed graphs and spans | pushout rewriting | document graphs, citations, cross-links |
| XML/DOM/tree algebras | unranked trees, forests | child/sibling composition | structured markup |
| Forest / hedge algebras | horizontal forest monoids + vertical context monoids | context action | regular XML-like document languages |
| RST / SDRT discourse formalisms | discourse units + relations | rhetorical attachment/update | paragraph and discourse coherence |
| Institutions | signatures, sentences, models, satisfaction | signature morphisms | situated systems of interpretation |

This memo treats “content” as something like a **many-sorted, typed, recursive, interpreted, revisable graph/tree process**.

---

## 2. Local syntax as algebra and proof

### 2.1 Lambek calculus

Lambek’s 1958 paper introduced a calculus in which grammatical composition is a kind of noncommutative logical deduction. Types are built from atomic categories such as \(n\) for noun phrase and \(s\) for sentence:

\[
A ::= p \mid A \cdot B \mid A \backslash B \mid B / A.
\]

A sequent

\[
A_1,\ldots,A_n \Rightarrow B
\]

means that a string of expressions of types \(A_1,\ldots,A_n\) composes to type \(B\). The operations \( /\) and \(\backslash\) are residuals of product:

\[
\Gamma,A \Rightarrow B
\quad \text{iff} \quad
\Gamma \Rightarrow B/A,
\]

\[
A,\Gamma \Rightarrow B
\quad \text{iff} \quad
\Gamma \Rightarrow A\backslash B.
\]

The key mathematical point is that syntax becomes **proof search** in a substructural logic: order matters, and one generally lacks exchange, contraction, and weakening. This is why the calculus is suitable for word order and resource-sensitive composition. Lambek’s original paper is the classic source for this proof-theoretic treatment of sentence structure. ([cs.cmu.edu](https://www.cs.cmu.edu/~fp/courses/15816-f16/misc/Lambek58.pdf?utm_source=chatgpt.com))

Example:

\[
\text{Alice}: n,
\qquad
\text{likes}: n\backslash s / n,
\qquad
\text{Bob}: n.
\]

Then

\[
n,\; n\backslash s / n,\; n \Rightarrow s.
\]

The right noun phrase fills the object slot of “likes,” producing \(n\backslash s\); the left noun phrase fills the subject slot, producing \(s\).

### 2.2 Pregroup grammar

Pregroup grammar, developed by Lambek later, packages a similar idea into an ordered monoid with adjoints. A **pregroup** is a partially ordered monoid \(P\) in which every element \(p\) has left and right adjoints \(p^l,p^r\) satisfying

\[
p^l p \leq 1 \leq p p^l,
\qquad
p p^r \leq 1 \leq p^r p.
\]

A string is grammatical as a sentence if the product of the assigned word types reduces to \(s\).

For a transitive verb one may assign:

\[
\text{likes}: n^r s n^l.
\]

Then

\[
n \cdot (n^r s n^l) \cdot n
\leq
1 \cdot s \cdot 1
=
s.
\]

This is not merely notation. Pregroups are compact closed posetal categories, so the syntactic reductions are string diagrams with cups/caps. This is exactly what later makes the grammar compatible with compact closed categorical semantics.

### 2.3 Representation theorem: Lambek grammars and context-free languages

Pentus proved a major theorem: languages generated by Lambek grammars are context-free, and his later work proved the product-free Lambek calculus version of the Chomsky conjecture, connecting Lambek grammars tightly with context-free grammars. ([projecteuclid.org](https://projecteuclid.org/ebooks/lecture-notes-in-logic/Logic-Colloquium-95--Proceedings-of-the-Annual-European-Summer/chapter/Lambek-Calculus-and-Formal-Languages/lnl/1235415909.pdf?utm_source=chatgpt.com))

A document-level consequence is negative but important: pure Lambek/categorial syntax is powerful for **local sentential syntax**, but by itself it does not model document hierarchy, revision, citation graphs, or discourse state.

---

## 3. Montague grammar: documents as interpreted syntax algebras

Montague’s “Universal Grammar” made natural language semantics mathematically continuous with formal logic: syntactic categories are translated into semantic types, usually in typed intensional logic. The mathematical pattern is:

\[
\text{syntax algebra}
\longrightarrow
\text{semantic algebra}.
\]

The syntax side supplies recursively generated expressions. The semantic side supplies typed meanings. Translation is compositional: the meaning of a complex expression is determined by the meanings of its parts and the rule by which they combine. ([philpapers.org](https://philpapers.org/rec/MONUG?utm_source=chatgpt.com))

A simple type assignment:

\[
\llbracket \text{Alice} \rrbracket : e,
\qquad
\llbracket \text{Bob} \rrbracket : e,
\qquad
\llbracket \text{likes} \rrbracket : e \to e \to t.
\]

Then:

\[
\llbracket \text{Alice likes Bob} \rrbracket
=
\text{likes}(\text{Bob})(\text{Alice})
:
t.
\]

The relevant document insight is that Montague grammar treats prose as **interpreted typed syntax**. But it is still sentence-centered unless extended with discourse dynamics, situation semantics, or context-update semantics.

---

## 4. Monoidal, compact closed, and traced categories

### 4.1 Monoidal categories

A monoidal category is a category \(\mathcal C\) equipped with a tensor product

\[
\otimes : \mathcal C \times \mathcal C \to \mathcal C
\]

and a unit object \(I\), together with associativity and unit isomorphisms satisfying coherence conditions.

In document terms:

\[
A \otimes B
\]

can mean “place component \(A\) beside component \(B\),” “compose independent resources,” or “combine semantic spaces.” Mac Lane’s coherence theorem is the reason stringless parenthesization works: all canonical composites built from associativity and unit constraints agree. Mac Lane’s *Categories for the Working Mathematician* is the standard source for monoidal categories and coherence. ([mtm.ufsc.br](https://www.mtm.ufsc.br/~ebatista/2016-2/maclanecat.pdf?utm_source=chatgpt.com))

### 4.2 Compact closed categories

A compact closed category is a symmetric monoidal category where every object \(A\) has a dual \(A^*\), with unit and counit maps

\[
\eta_A : I \to A^* \otimes A,
\qquad
\epsilon_A : A \otimes A^* \to I,
\]

satisfying the yanking identities. These identities say that bending a wire down and then back up is equal to the identity morphism.

This is exactly the algebraic form needed for pregroup reductions. A noun wire and its adjoint can cancel:

\[
n \otimes n^r \to I,
\qquad
n^l \otimes n \to I.
\]

Kelly and Laplaza gave the classic coherence theorem for compact closed categories; Joyal and Street then developed the broader geometry of tensor calculus, making string diagrams a rigorous language for monoidal categories. ([fbc.keio.ac.jp](https://www.fbc.keio.ac.jp/~sirahata/Research/cmll.ps?utm_source=chatgpt.com))

### 4.3 Traced monoidal categories

A traced monoidal category adds a trace operation

\[
\operatorname{Tr}^{U}_{A,B} :
\mathcal C(A\otimes U, B\otimes U)
\to
\mathcal C(A,B),
\]

subject to naturality, dinaturality, vanishing, superposing, and yanking axioms. Intuitively, one may feed an output wire back into an input wire. Joyal, Street, and Verity introduced traced monoidal categories and proved structure theorems relating traced structure to compact closed structure. ([cambridge.org](https://www.cambridge.org/core/journals/mathematical-proceedings-of-the-cambridge-philosophical-society/article/traced-monoidal-categories/2BE85628D269D9FABAB41B6364E117C8?utm_source=chatgpt.com))

For documents, traced structure is useful when a text has feedback:

\[
\text{definition} \to \text{use} \to \text{revision of definition}.
\]

A traced category can represent circular dependence, self-reference, iterative update, and feedback loops, which are all common in real documents: footnotes refer to sections, sections revise definitions, citations motivate later claims, and revisions retroactively change earlier meaning.

---

## 5. DisCoCat: categorical compositional distributional semantics

DisCoCat, introduced by Coecke, Sadrzadeh, and Clark, combines pregroup grammar with distributional vector semantics. The mathematical construction is:

\[
F : \mathbf{Grammar} \to \mathbf{FVect},
\]

where \(F\) is a strong monoidal functor from a compact closed grammatical category to finite-dimensional vector spaces. Pregroup reductions become linear maps; word meanings become vectors or tensors. ([arxiv.org](https://arxiv.org/abs/1003.4394?utm_source=chatgpt.com))

For “Alice likes Bob”:

\[
\text{Alice}: n,
\quad
\text{likes}: n^r s n^l,
\quad
\text{Bob}: n.
\]

The grammatical reduction is:

\[
n \otimes n^r \otimes s \otimes n^l \otimes n
\to
s.
\]

Under \(F\):

\[
F(n)=N,
\qquad
F(s)=S,
\]

\[
\vec{\text{Alice}}\in N,
\qquad
\vec{\text{Bob}}\in N,
\qquad
\vec{\text{likes}}\in N\otimes S\otimes N.
\]

The sentence meaning is the contraction:

\[
(\epsilon_N \otimes 1_S \otimes \epsilon_N)
\bigl(
\vec{\text{Alice}}
\otimes
\vec{\text{likes}}
\otimes
\vec{\text{Bob}}
\bigr)
\in S.
\]

This is a mathematically precise way to say: syntax determines the tensor contraction pattern; distributional data supplies lexical vectors/tensors.

DisCoCat’s document relevance is strong but limited. It composes **sentences** well, especially where grammatical type reduction determines semantic contraction. It is weaker for paragraph-level anaphora, citation structure, document layout, and evolving interpretation unless extended.

---

## 6. DisCoCirc: text as circuit rather than sentence as vector

DisCoCirc extends DisCoCat from sentence meanings to text meanings. The key shift is:

\[
\text{sentence as state}
\quad \leadsto \quad
\text{sentence as process/update}.
\]

In DisCoCirc, entities are wires, sentences are gates, and a text is a circuit that updates entity meanings through discourse. Coecke describes this as “the mathematics of text structure”: word meanings evolve, sentence meanings become input-output processes, and a whole text becomes a single diagrammatic circuit. ([arxiv.org](https://arxiv.org/abs/1904.03478?utm_source=chatgpt.com))

Example paragraph:

> Alice wrote a paper. It cites Lambek.

A sentence-level model might produce two unrelated sentence vectors. A circuit model instead keeps an entity wire for Alice, a document/entity wire for the paper, and a reference relation introduced by the second sentence. Schematically:

\[
\text{Alice},\text{paper}
\xrightarrow{\text{wrote}}
\text{Alice}',\text{paper}'
\xrightarrow{\text{cites Lambek}}
\text{Alice}',\text{paper}''.
\]

The discourse state changes. The pronoun “it” is not merely a vector; it is a wiring decision identifying the second sentence’s subject with the paper wire.

Recent DisCoCirc work includes pipelines from CCG to circuits and text-to-circuit distillation, where sentence types and discourse updates are structured diagrammatically. ([arxiv.org](https://arxiv.org/abs/2311.17892?utm_source=chatgpt.com))

---

## 7. Operads, multicategories, and PROPs: document constructors as compositional operations

### 7.1 Operads

An operad consists of spaces or sets of operations

\[
\mathcal O(n)
\]

whose elements are \(n\)-ary operations, together with composition maps

\[
\gamma :
\mathcal O(k)
\times
\mathcal O(n_1)
\times
\cdots
\times
\mathcal O(n_k)
\to
\mathcal O(n_1+\cdots+n_k),
\]

units, and associativity/equivariance laws. Operads are designed to formalize “operations with many inputs and one output.” Markl, Shnider, and Stasheff’s book is a standard reference on operads as algebraic devices for encoding compositional structure. ([theo.inrne.bas.bg](https://theo.inrne.bas.bg/~mitov/configuration/Markl%20M.%2C%20Shnider%20S.%2C%20Stasheff%20J.D%2C%20Operads%20in%20Algebra%2C%20Topology%20and%20Physics%2C%202002.pdf?utm_source=chatgpt.com))

For documents, an operad can encode constructors:

\[
\operatorname{paragraph} : \text{Sentence}^n \to \text{Paragraph},
\]

\[
\operatorname{section} :
\text{Heading} \times \text{Block}^n
\to
\text{Section},
\]

\[
\operatorname{article} :
\text{Title}\times\text{AuthorList}\times\text{Abstract}\times\text{Section}^n\times\text{Bibliography}
\to
\text{Article}.
\]

The operadic view says the main thing is not that an article is a string. It is a **tree of typed operations**.

### 7.2 Multicategories

A multicategory generalizes a category by allowing morphisms with many inputs and one output:

\[
f : (A_1,\ldots,A_n) \to B.
\]

This is useful when different document components have different types:

\[
\operatorname{caption} :
(\text{Figure},\text{Sentence})
\to
\text{FigureBlock}.
\]

Multicategories are often the right formalism for typed document assembly when one does not want to impose a single tensor product on all components.

### 7.3 PROPs

A PROP is a symmetric strict monoidal category whose objects are natural numbers, representing multiple inputs and multiple outputs. PROPs encode algebraic structures borne by objects in symmetric monoidal categories. Lack’s “Composing PROPs” develops how PROPs encode and compose algebraic theories. ([tac.mta.ca](https://www.tac.mta.ca/tac/volumes/13/9/13-09abs.html?utm_source=chatgpt.com))

For documents, PROPs are natural when components have **many outputs**:

\[
\operatorname{extractMetadata} :
\text{Article}
\to
\text{Title}\otimes\text{AuthorList}\otimes\text{Keywords}\otimes\text{References}.
\]

Or:

\[
\operatorname{compile} :
\text{Markdown}\otimes\text{Bibliography}
\to
\text{HTML}\otimes\text{PDF}\otimes\text{CitationGraph}.
\]

This is more document-like than a plain operad, because real content pipelines often transform many inputs into many outputs.

---

## 8. Algebraic theories, Lawvere theories, term algebras, and initial algebras

### 8.1 Lawvere theories

A Lawvere theory is a small category \(\mathbb L\) with finite products whose objects are finite powers

\[
1^0,1^1,1^2,\ldots.
\]

A model of \(\mathbb L\) in a finite-product category \(\mathcal C\) is a product-preserving functor

\[
M:\mathbb L \to \mathcal C.
\]

Lawvere’s thesis and later publication introduced this categorical semantics of algebraic theories. ([pnas.org](https://www.pnas.org/doi/10.1073/pnas.50.5.869?utm_source=chatgpt.com))

For documents, a Lawvere theory can specify operations such as:

\[
\operatorname{concat} : T^2 \to T,
\]

\[
\operatorname{emph} : T \to T,
\]

\[
\operatorname{quote} : T \to T,
\]

\[
\operatorname{cite} : T \times R \to T,
\]

with equations such as associativity of concatenation:

\[
\operatorname{concat}(\operatorname{concat}(x,y),z)
=
\operatorname{concat}(x,\operatorname{concat}(y,z)).
\]

A model interprets these operations in strings, HTML nodes, LaTeX documents, semantic graphs, rendered pages, or database records.

### 8.2 Term algebras

Given a many-sorted signature \(\Sigma\), a \(\Sigma\)-algebra assigns each sort a carrier set and each operation symbol a function. The **term algebra** \(T_\Sigma(X)\) is the algebra of formal expressions generated from variables \(X\).

For a document signature:

\[
\begin{aligned}
\operatorname{text} &: \text{String}\to \text{Inline},\\
\operatorname{emph} &: \text{Inline}\to \text{Inline},\\
\operatorname{link} &: \text{Inline}\times\text{URI}\to \text{Inline},\\
\operatorname{para} &: \text{InlineList}\to \text{Block},\\
\operatorname{section} &: \text{Heading}\times\text{BlockList}\to \text{Block},\\
\operatorname{article} &: \text{Metadata}\times\text{BlockList}\to \text{Document}.
\end{aligned}
\]

Then a document is a term:

\[
\operatorname{article}
\bigl(
m,
[
\operatorname{section}
(h,
[
\operatorname{para}([\operatorname{text}("Lambek introduced...")])
])
]
\bigr).
\]

### 8.3 Initial algebra semantics

For a functor \(F:\mathcal C\to\mathcal C\), an \(F\)-algebra is a pair

\[
(A,\alpha:F(A)\to A).
\]

An initial \(F\)-algebra is an \(F\)-algebra

\[
(\mu F,\operatorname{in}:F(\mu F)\to\mu F)
\]

such that for every \(F\)-algebra \((A,\alpha)\) there is a unique homomorphism

\[
\mathsf{fold}_\alpha:\mu F\to A.
\]

This gives structural recursion. Goguen, Thatcher, Wagner, and Wright developed initial algebra semantics as a general mathematical semantics for abstract data types and programming-language constructs. ([research.ibm.com](https://research.ibm.com/publications/initial-algebra-semantics-and-continuous-algebras?utm_source=chatgpt.com))

For documents, take a polynomial functor:

\[
F(X)
=
\text{Text}
+
\text{Emph}(X)
+
\text{Link}(X,\text{URI})
+
\text{Paragraph}(\operatorname{List}X)
+
\text{Section}(\text{Heading},\operatorname{List}X)
+
\text{Article}(\text{Metadata},\operatorname{List}X).
\]

Then

\[
\mu F
\]

is the type of finite well-formed document trees. Rendering, word counting, citation extraction, and outline generation are all folds:

\[
\mathsf{render}:\mu F\to\text{HTML},
\]

\[
\mathsf{outline}:\mu F\to\text{Tree}(\text{Heading}),
\]

\[
\mathsf{refs}:\mu F\to\mathcal P(\text{CitationKey}).
\]

The theorem says: define an algebra for each constructor, and there is a unique structurally recursive interpretation of the whole document.

---

## 9. Coalgebras: evolving, interactive, and streaming documents

An \(F\)-coalgebra is a map

\[
c:X\to F(X).
\]

Where algebras model construction, coalgebras model observation and evolution. Rutten’s universal coalgebra and Jacobs’s work present coalgebra as the mathematics of state-based systems, observations, streams, automata, and bisimulation. ([cs.cornell.edu](https://www.cs.cornell.edu/courses/cs6861/2024sp/Handouts/Rutten.pdf?utm_source=chatgpt.com))

A live document editor can be modeled as:

\[
c:X\to O\times X^E,
\]

where:

- \(X\) is the set of document states,
- \(O\) is the observable rendering,
- \(E\) is the set of edits,
- \(X^E\) gives the next state after each possible edit.

So:

\[
c(x)=(\operatorname{render}(x), e\mapsto \operatorname{apply}(e,x)).
\]

A stream of document versions is a coalgebra for

\[
F(X)=D\times X.
\]

Then a version history is:

\[
d_0,d_1,d_2,\ldots.
\]

The central theorem is final coalgebra semantics: if \((\nu F,\operatorname{out})\) is final, every coalgebra \(c:X\to F(X)\) has a unique behavior map

\[
\llbracket - \rrbracket:X\to \nu F.
\]

Two document states are behaviorally equivalent when they map to the same final behavior; coalgebraic bisimulation gives a proof principle for such equivalence.

This is the right mathematics for “documents” that are not static artifacts: collaborative editors, notebooks, interactive hypertexts, literate programs, versioned knowledge bases, and conversational documents.

---

## 10. Formal language theory as algebra

### 10.1 Strings and syntactic monoids

For a language \(L\subseteq \Sigma^*\), define the syntactic congruence:

\[
u\equiv_L v
\quad \Longleftrightarrow \quad
\forall x,y\in\Sigma^*,
\;
xuy\in L \iff xvy\in L.
\]

The syntactic monoid is

\[
\Sigma^*/{\equiv_L}.
\]

A classical theorem says \(L\) is regular iff its syntactic monoid is finite. Schützenberger’s theorem identifies star-free languages with aperiodic syntactic monoids, and Eilenberg’s variety theorem relates varieties of regular languages to pseudovarieties of finite monoids. ([dl.acm.org](https://dl.acm.org/doi/pdf/10.1145/3242953.3242956?utm_source=chatgpt.com))

For prose, this is not a semantic model. It is a model of **recognizable surface regularities**: token patterns, markup fragments, local schemas, citation-key formats, section-numbering languages.

### 10.2 Tree automata and tree algebras

Documents are rarely just strings. XML, HTML, Markdown ASTs, syntax trees, and outlines are trees or forests. Thatcher and Wright’s work generalized automata theory to finite trees using algebras and recognizability; their results connect finite tree automata, recognizable tree languages, and logical definability. ([research.ibm.com](https://research.ibm.com/publications/generalized-finite-automata-theory-with-an-application-to-a-decision-problem-of-second-order-logic?utm_source=chatgpt.com))

A ranked tree algebra gives each constructor fixed arity:

\[
\operatorname{section}(\text{heading},\text{body})
\]

but real documents usually use **unranked** branching:

\[
\operatorname{section}(h,b_1,\ldots,b_n).
\]

This motivates hedge and forest algebras.

### 10.3 XML, DOM, hedge algebras, forest algebras

XML documents are naturally represented as unranked ordered trees. Murata, Lee, Mani, and Kawaguchi give a formal-language-theoretic taxonomy of XML schema languages using regular tree grammars, while Neven surveys automata and logic for XML unranked trees. ([pike.psu.edu](https://pike.psu.edu/publications/toit05.pdf?utm_source=chatgpt.com))

Bojańczyk and Walukiewicz introduced forest algebras as an algebraic framework for regular languages of finite unranked labeled forests. A forest algebra consists roughly of:

- a horizontal monoid \(H\) of forests,
- a vertical monoid \(V\) of contexts,
- an action \(V\times H\to H\),
- compatibility laws connecting context composition and forest substitution.

A language of forests is regular when recognized by a morphism from the free forest algebra into a finite forest algebra. ([mimuw.edu.pl](https://www.mimuw.edu.pl/~bojan/upload/confbirthdayBojanczykW08.pdf?utm_source=chatgpt.com))

Example:

```text id="n9erth"
article
 ├── title
 ├── abstract
 ├── section
 │    ├── heading
 │    ├── paragraph
 │    └── figure
 └── bibliography
```

A forest algebra distinguishes horizontal composition:

\[
h_1 + h_2
\]

from vertical context insertion:

\[
v[h].
\]

This is exactly the distinction between sibling order and nesting depth in documents.

---

## 11. Graph algebras, citations, and inter-document structure

Trees fail for cross-references. Citations, hyperlinks, footnotes, entity references, and version links are graph-like.

A document corpus can be modeled as a typed graph:

\[
G=(V,E,s,t,\tau),
\]

where vertices include documents, sections, claims, authors, references, and concepts; edges include “cites,” “authored by,” “defines,” “uses,” “contradicts,” “revises,” and “is version of.”

Courcelle’s work with Engelfriet develops graph structure through monadic second-order logic, recognizability, equational graph sets, and graph transformations. The point is that graphs can be handled algebraically and logically even when finite automata are no longer the natural model. ([labri.fr](https://www.labri.fr/perso/courcell/Book/TheBook.pdf?utm_source=chatgpt.com))

Example citation graph:

\[
\text{Article}_A
\xrightarrow{\text{cites}}
\text{Lambek1958},
\qquad
\text{Article}_A
\xrightarrow{\text{uses}}
\text{PregroupGrammar},
\qquad
\text{PregroupGrammar}
\xrightarrow{\text{formalizedBy}}
\text{CompactClosedCategory}.
\]

This representation handles relations that are not part of the document tree but are essential to scholarly content.

---

## 12. Rewriting and document transformation algebras

### 12.1 Term rewriting

A term rewriting system consists of rules

\[
l \to r
\]

applied inside terms. For documents, rules may normalize structure:

\[
\operatorname{bold}(\operatorname{bold}(x))
\to
\operatorname{bold}(x),
\]

\[
\operatorname{section}(h,[])
\to
\operatorname{empty},
\]

\[
\operatorname{cite}(k)
\to
\operatorname{link}(\operatorname{bibliographyLookup}(k)).
\]

Important properties:

- **Termination**: no infinite rewrite sequences.
- **Confluence**: if \(x\to^* y\) and \(x\to^* z\), then there is \(w\) with \(y\to^* w\) and \(z\to^* w\).
- **Unique normal forms**: termination plus confluence gives canonical outputs.

Baader and Nipkow’s text is a standard source for term rewriting, especially termination and confluence as the central mathematical properties of rewrite systems. ([zubairabid.com](https://zubairabid.com/Semester7/subjects/PoPL/books/TRaAT.pdf?utm_source=chatgpt.com))

### 12.2 Graph rewriting

For document graphs, one wants rewriting rules not on trees but on graphs. In double-pushout rewriting, a rule is a span:

\[
L \xleftarrow{} K \xrightarrow{} R,
\]

where \(L\) is the pattern to remove, \(R\) is the replacement, and \(K\) is the preserved interface. Applying the rule uses pushout complements and pushouts.

This is a good fit for transformations such as:

\[
\text{unresolved citation node}
\to
\text{resolved bibliographic edge + formatted reference}.
\]

Adhesive categories generalize graph rewriting to categorical settings where pushout-based rewriting behaves well. Lack and Sobociński’s work on adhesive and quasiadhesive categories is a central source. ([numdam.org](https://www.numdam.org/item/ITA_2005__39_3_511_0/?utm_source=chatgpt.com))

### 12.3 Lenses and bidirectional document transformations

A lens between source and view has operations:

\[
\operatorname{get}:S\to V,
\qquad
\operatorname{put}:S\times V\to S.
\]

The usual laws include:

\[
\operatorname{get}(\operatorname{put}(s,v))=v
\]

and

\[
\operatorname{put}(s,\operatorname{get}(s))=s.
\]

For documents, lenses model synchronized views:

\[
\text{Markdown}
\leftrightarrow
\text{HTML preview},
\]

\[
\text{article source}
\leftrightarrow
\text{outline},
\]

\[
\text{bibliography database}
\leftrightarrow
\text{rendered references}.
\]

Foster, Pierce, and collaborators developed lenses as a formal basis for bidirectional transformations. ([cis.upenn.edu](https://www.cis.upenn.edu/~bcpierce/papers/lenses-toplas-final.pdf?utm_source=chatgpt.com))

### 12.4 CRDTs and collaborative documents

A state-based CRDT can be modeled as a join-semilattice \((S,\sqsubseteq,\sqcup)\), with updates inflationary and merge given by join:

\[
\operatorname{merge}(x,y)=x\sqcup y.
\]

This gives convergence of replicas under suitable monotonicity conditions. Shapiro and collaborators’ CRDT work formalized these convergence guarantees for replicated data types. ([csa.iisc.ac.in](https://www.csa.iisc.ac.in/~raghavan/CleanedPods2021/crdt-shapiro-2011.pdf?utm_source=chatgpt.com))

For collaborative prose, this gives a mathematical account of eventual consistency. But it does not by itself preserve authorial intent, rhetorical coherence, or semantic consistency.

---

## 13. Discourse and rhetoric as algebraic structure

### 13.1 Rhetorical Structure Theory

Rhetorical Structure Theory represents a text as discourse units related by rhetorical relations such as Elaboration, Evidence, Contrast, Condition, and Result. Relations often distinguish nucleus and satellite. Mann and Thompson’s original RST work is the classic source. ([sfu.ca](https://www.sfu.ca/rst/05bibliographies/bibs/Mann_Thompson_1988.pdf?utm_source=chatgpt.com))

One can model this algebraically by typed constructors:

\[
\operatorname{Elaboration}
:
D_{\text{nucleus}}\times D_{\text{satellite}}
\to D,
\]

\[
\operatorname{Contrast}
:
D\times D
\to D,
\]

\[
\operatorname{Evidence}
:
D_{\text{claim}}\times D_{\text{support}}
\to D.
\]

Example paragraph:

> Lambek introduced a calculus of syntactic types. This made parsing resemble proof search.

Representation:

\[
\operatorname{Result}
\bigl(
d_1,
d_2
\bigr)
\]

or, depending on analysis,

\[
\operatorname{Elaboration}(d_1,d_2).
\]

The limitation is that rhetorical relations are often underspecified, ambiguous, and context-dependent. RST gives structure, but not a complete algebra of meaning.

### 13.2 SDRT

Segmented Discourse Representation Theory treats discourse interpretation dynamically. Discourse segments introduce labels, and rhetorical relations connect them:

\[
\operatorname{Result}(\pi_1,\pi_2),
\qquad
\operatorname{Elaboration}(\pi_1,\pi_2),
\qquad
\operatorname{Narration}(\pi_1,\pi_2).
\]

Asher and Lascarides develop SDRT as a logic of discourse interpretation, integrating semantics and pragmatics through rhetorical relations and update. ([books.google.com](https://books.google.com/books/about/Logics_of_Conversation.html?id=PYf2EVuGKbkC&utm_source=chatgpt.com))

For documents, SDRT is more expressive than sentence-local semantics because it models anaphora, coherence, attachment, and discourse update. But it is less algebraically clean than Lambek calculus or initial algebra semantics.

---

## 14. Situation semantics and situated interpretation

Barwise and Perry’s situation semantics shifts semantic evaluation away from isolated truth conditions and toward partial situations, information, and context. ([john.jperry.net](https://john.jperry.net/cv/1981c.pdf?utm_source=chatgpt.com))

For documents, this matters because a document is not merely a syntactic object. It is interpreted relative to:

\[
(\text{reader},\text{time},\text{place},\text{background theory},\text{genre},\text{institution}).
\]

A legal document, a mathematical article, a treaty, and a social-media thread may share tree structure while differing radically in force and interpretation.

This is where institution theory is relevant. An institution consists of signatures, sentences, models, and a satisfaction relation invariant under change of notation/signature. Goguen and Burstall introduced institutions as an abstract model theory independent of any one logical system. ([dl.acm.org](https://dl.acm.org/doi/10.1145/147508.147524?utm_source=chatgpt.com))

For a document ecosystem, an institution-like model can separate:

\[
\text{syntax of claims}
\quad
\text{models/worlds of interpretation}
\quad
\text{satisfaction/evaluation}
\quad
\text{translation between vocabularies}.
\]

This is useful for knowledge representation, ontology alignment, scholarly corpora, and cross-domain document systems.

---

## 15. Worked multi-layer example

Consider the short article fragment:

> **Title:** Categorical Grammar  
> **Paragraph:** Lambek introduced a calculus of sentence structure. Coecke, Sadrzadeh, and Clark later connected such grammar to vector semantics.  
> **Citation:** Lambek 1958; Coecke–Sadrzadeh–Clark 2010.

### 15.1 As a term algebra

\[
\operatorname{article}
\left(
\operatorname{title}("Categorical Grammar"),
[
\operatorname{paragraph}
([
s_1,s_2
])
],
\operatorname{bibliography}([r_1,r_2])
\right).
\]

This captures hierarchy.

### 15.2 As a forest

```text id="h1wywz"
article
 ├── title
 ├── paragraph
 │    ├── sentence
 │    └── sentence
 └── bibliography
      ├── reference
      └── reference
```

This supports XML/HTML validation.

### 15.3 As Lambek syntax

For the sentence:

> Lambek introduced a calculus.

Assign:

\[
\text{Lambek}:n,
\quad
\text{introduced}:n^r s n^l,
\quad
\text{a calculus}:n.
\]

Then:

\[
n(n^r s n^l)n\leq s.
\]

This captures local grammatical well-formedness.

### 15.4 As DisCoCat semantics

Assign:

\[
\vec{\text{Lambek}}\in N,
\quad
\vec{\text{calculus}}\in N,
\quad
\vec{\text{introduced}}\in N\otimes S\otimes N.
\]

The sentence vector is:

\[
(\epsilon_N\otimes 1_S\otimes \epsilon_N)
(
\vec{\text{Lambek}}
\otimes
\vec{\text{introduced}}
\otimes
\vec{\text{calculus}}
).
\]

This captures distributional compositional meaning.

### 15.5 As discourse algebra

Let:

\[
d_1=\text{“Lambek introduced...”}
\]

\[
d_2=\text{“Coecke, Sadrzadeh, and Clark later connected...”}
\]

Then one plausible discourse structure is:

\[
\operatorname{Narration}(d_1,d_2)
\]

or:

\[
\operatorname{Background}(d_1,d_2),
\]

depending on rhetorical analysis.

### 15.6 As citation graph

\[
\text{fragment}
\xrightarrow{\text{cites}}
\text{Lambek1958},
\]

\[
\text{fragment}
\xrightarrow{\text{cites}}
\text{CoeckeSadrzadehClark2010},
\]

\[
\text{CoeckeSadrzadehClark2010}
\xrightarrow{\text{uses}}
\text{PregroupGrammar}.
\]

This captures scholarly inter-document structure.

### 15.7 As evolving coalgebra

A document editor state \(x\) exposes:

\[
c(x)=
(
\operatorname{render}(x),
e\mapsto \operatorname{apply}(e,x)
).
\]

An edit replacing “later connected” with “categorically connected” is a transition:

\[
x \xrightarrow{e} x'.
\]

This captures revision.

---

## 16. Comparison matrix

| Formalism | Local syntax | Semantic composition | Discourse | Hierarchy | Citations | Revision | Inter-document relations |
|---|---:|---:|---:|---:|---:|---:|---:|
| Lambek calculus | Excellent | Indirect | Weak | Weak | No | No | No |
| Pregroup grammar | Excellent | Good via compact closure | Weak | Weak | No | No | No |
| Montague grammar | Good | Excellent logical semantics | Moderate with extensions | Weak | No | No | Weak |
| DisCoCat | Good | Excellent vector composition | Weak-moderate | Weak | No | No | Weak |
| DisCoCirc | Moderate | Strong process semantics | Stronger | Moderate | Possible as wires/relations | Moderate | Moderate |
| Operads/multicategories | Moderate | Abstract | Moderate | Strong | Moderate | Moderate | Moderate |
| PROPs | Moderate | Strong process view | Moderate | Moderate | Stronger | Moderate | Strong |
| Lawvere theories | Weak syntax | Abstract algebraic semantics | Weak | Strong | Moderate | Weak | Moderate |
| Initial algebras | No linguistic syntax | Via folds | Weak | Excellent | Moderate | Weak | Weak |
| Coalgebras | No | Behavioral | Strong for interaction | Moderate | Moderate | Excellent | Moderate |
| Tree/forest algebras | Markup syntax | Weak | Weak | Excellent | Weak-moderate | Weak | Weak |
| Graph algebras/MSO | Weak | Weak-moderate | Moderate | Strong | Excellent | Moderate | Excellent |
| Term rewriting | No | Via normalization | Weak | Strong | Moderate | Excellent | Moderate |
| Graph rewriting | Weak | Moderate | Moderate | Strong | Excellent | Excellent | Excellent |
| Lenses | No | View semantics | Weak | Strong | Moderate | Excellent | Moderate |
| CRDTs | No | No | No | Moderate | Moderate | Excellent for convergence | Moderate |
| RST/SDRT | Moderate | Strong discourse semantics | Excellent | Moderate | Weak | Weak | Weak |
| Institutions | No | Very strong abstractly | Moderate | Moderate | Strong | Moderate | Excellent |

---

## 17. Central representation results and what they buy

### 17.1 Lambek–Pentus: syntax as proof, but context-free

Lambek grammars give syntax as logical derivability. Pentus’s results show that Lambek grammars generate context-free languages, giving a precise boundary on their generative power. ([cs.cmu.edu](https://www.cs.cmu.edu/~fp/courses/15816-f16/misc/Lambek58.pdf?utm_source=chatgpt.com))

**Document consequence:** excellent for sentence grammar; insufficient for full document systems.

### 17.2 Coherence for monoidal and compact closed categories

Mac Lane coherence allows monoidal expressions to be manipulated without tracking all associators and unitors. Kelly–Laplaza and Joyal–Street coherence results justify string diagrams as rigorous syntax for compact closed and monoidal reasoning. ([mtm.ufsc.br](https://www.mtm.ufsc.br/~ebatista/2016-2/maclanecat.pdf?utm_source=chatgpt.com))

**Document consequence:** syntax reductions, semantic contractions, and content pipelines can be reasoned about diagrammatically.

### 17.3 DisCoCat functorial transfer

A strong monoidal functor transfers grammatical reductions into linear maps. The grammatical proof determines the semantic computation. ([arxiv.org](https://arxiv.org/abs/1003.4394?utm_source=chatgpt.com))

**Document consequence:** one can combine symbolic grammar and distributional semantics in a single compositional model.

### 17.4 Initiality and folds

Initial algebra semantics says that once a recursive document type is the initial algebra of a functor, every constructor-respecting interpretation is uniquely determined by an algebra. ([research.ibm.com](https://research.ibm.com/publications/initial-algebra-semantics-and-continuous-algebras?utm_source=chatgpt.com))

**Document consequence:** rendering, extraction, validation, and summarization over AST-like documents become structurally recursive folds.

### 17.5 Finality and coinduction

Final coalgebra semantics says that state-based systems have canonical behavior maps into final coalgebras, and bisimulation becomes a proof principle for behavioral equivalence. ([cs.cornell.edu](https://www.cs.cornell.edu/courses/cs6861/2024sp/Handouts/Rutten.pdf?utm_source=chatgpt.com))

**Document consequence:** interactive documents, editors, notebooks, and streams of versions can be modeled behaviorally.

### 17.6 Tree/forest recognizability

Thatcher–Wright tree automata and Bojańczyk–Walukiewicz forest algebras give algebraic recognizers for tree and forest languages. ([research.ibm.com](https://research.ibm.com/publications/generalized-finite-automata-theory-with-an-application-to-a-decision-problem-of-second-order-logic?utm_source=chatgpt.com))

**Document consequence:** XML/DOM-like document classes can be recognized, minimized, and reasoned about algebraically.

### 17.7 Courcelle-style graph structure

Courcelle and Engelfriet connect graph structure, monadic second-order logic, recognizability, and graph transformations. ([labri.fr](https://www.labri.fr/perso/courcell/Book/TheBook.pdf?utm_source=chatgpt.com))

**Document consequence:** citations, hyperlinks, claim graphs, and cross-document networks require graph formalisms beyond tree algebras.

### 17.8 Rewriting normalization and transformation

Term rewriting gives formal conditions for terminating and confluent transformations; adhesive graph rewriting gives categorical structure for graph transformations. ([zubairabid.com](https://zubairabid.com/Semester7/subjects/PoPL/books/TRaAT.pdf?utm_source=chatgpt.com))

**Document consequence:** format conversion, normalization, citation resolution, refactoring, and structural edits can be specified as rewrite systems.

---

## 18. Limits and failure modes

First, **syntax is not document structure**. Lambek, pregroups, and DisCoCat handle sentence-level compositionality, but documents involve hierarchy, discourse, metadata, layout, citation graphs, institutional conventions, and revision.

Second, **tree models cannot handle cross-reference naturally**. XML/DOM/forest algebras are excellent for nested structure, but citations, hyperlinks, footnotes, repeated entities, and version histories are graph-like.

Third, **semantic composition is not pragmatic interpretation**. Montague semantics and DisCoCat can assign meanings compositionally, but indexicals, genre, authority, irony, quotation, legal force, and institutional uptake require richer situated semantics.

Fourth, **vector semantics is not enough for document identity**. DisCoCat and DisCoCirc can represent evolving meanings, but scholarly documents also require authorship, provenance, reference stability, editions, and external knowledge systems.

Fifth, **rewrite equivalence is not rhetorical equivalence**. Two documents may be structurally equivalent but rhetorically different; two edits may converge operationally but diverge in intended meaning.

Sixth, **discourse formalisms are often underdetermined**. RST and SDRT give formal structures for coherence, but real discourse attachment is ambiguous and context-sensitive.

Seventh, **CRDT convergence is not semantic convergence**. Collaborative editing can guarantee replica convergence while still producing incoherent prose.

Eighth, **category theory supplies compositional invariants, not automatic understanding**. It tells us what structure-preserving interpretation should mean; it does not by itself solve parsing, grounding, reference resolution, or interpretive disagreement.

---

## 19. Bibliography with source notes

**Lambek, “The Mathematics of Sentence Structure” (1958).**  
Introduces the Lambek calculus: syntactic categories as types, grammaticality as derivability, and noncommutative residual structure for sentence composition. Essential for syntax as algebra/proof. ([cs.cmu.edu](https://www.cs.cmu.edu/~fp/courses/15816-f16/misc/Lambek58.pdf?utm_source=chatgpt.com))

**Pentus, “Lambek Grammars and Context-Free Grammars” / “Lambek Calculus and Formal Languages.”**  
Provides the major generative-capacity results connecting Lambek grammars and context-free languages. Supplies the representation boundary for Lambek-style syntax. ([projecteuclid.org](https://projecteuclid.org/ebooks/lecture-notes-in-logic/Logic-Colloquium-95--Proceedings-of-the-Annual-European-Summer/chapter/Lambek-Calculus-and-Formal-Languages/lnl/1235415909.pdf?utm_source=chatgpt.com))

**Montague, “Universal Grammar” (1970).**  
Gives the classic compositional formal semantics program: natural language syntax mapped systematically into typed logical semantics. ([philpapers.org](https://philpapers.org/rec/MONUG?utm_source=chatgpt.com))

**Barwise and Perry, *Situations and Attitudes*.**  
Develops situation semantics, relevant for documents as situated informational artifacts rather than merely closed sentences. ([john.jperry.net](https://john.jperry.net/cv/1981c.pdf?utm_source=chatgpt.com))

**Mac Lane, *Categories for the Working Mathematician*.**  
Standard reference for categories, monoidal categories, and coherence. Supplies the background for categorical compositionality. ([mtm.ufsc.br](https://www.mtm.ufsc.br/~ebatista/2016-2/maclanecat.pdf?utm_source=chatgpt.com))

**Joyal and Street, “The Geometry of Tensor Calculus.”**  
Formalizes string diagrams for monoidal categories, giving the rigorous diagrammatic language later used in categorical semantics and quantum/NLP compositional models. ([phas-lecnotes-part38a.tripod.com](https://phas-lecnotes-part38a.tripod.com/webonmediacontents/Tensor-core.pdf?utm_source=chatgpt.com))

**Joyal, Street, and Verity, “Traced Monoidal Categories.”**  
Introduces traced monoidal categories and their axioms, relevant to feedback, circularity, and iterative document processes. ([cambridge.org](https://www.cambridge.org/core/journals/mathematical-proceedings-of-the-cambridge-philosophical-society/article/traced-monoidal-categories/2BE85628D269D9FABAB41B6364E117C8?utm_source=chatgpt.com))

**Abramsky and Coecke, “Abstract Physical Traces” and related compact-closed categorical semantics.**  
Develops strongly compact closed categories, traces, scalars, and diagrammatic reasoning; important background for categorical compositional semantics. ([arxiv.org](https://arxiv.org/abs/0910.3144?utm_source=chatgpt.com))

**Coecke, Sadrzadeh, and Clark, “Mathematical Foundations for a Compositional Distributional Model of Meaning.”**  
Introduces DisCoCat: a strong monoidal functor from pregroup grammar to vector spaces, turning grammatical reductions into tensor contractions. ([arxiv.org](https://arxiv.org/abs/1003.4394?utm_source=chatgpt.com))

**Moortgat, “Categorial Type Logics” and “Multimodal Linguistic Inference.”**  
Develops type-logical grammar beyond basic Lambek calculus, including multimodal control over structural rules. Important for richer syntax. ([link.springer.com](https://link.springer.com/article/10.1007/BF00159344?utm_source=chatgpt.com))

**Coecke, “The Mathematics of Text Structure” / DisCoCirc.**  
Extends categorical compositional distributional semantics from sentence vectors to text circuits with evolving word/entity meanings. ([arxiv.org](https://arxiv.org/abs/1904.03478?utm_source=chatgpt.com))

**Lawvere, “Functorial Semantics of Algebraic Theories.”**  
Introduces Lawvere theories: algebraic theories as categories with finite products and models as product-preserving functors. Central for algebraic theories of document operations. ([pnas.org](https://www.pnas.org/doi/10.1073/pnas.50.5.869?utm_source=chatgpt.com))

**Goguen, Thatcher, Wagner, and Wright, “Initial Algebra Semantics and Continuous Algebras.”**  
Develops initial algebra semantics for abstract data types and recursive semantic definitions. Central for documents as inductive syntax trees. ([research.ibm.com](https://research.ibm.com/publications/initial-algebra-semantics-and-continuous-algebras?utm_source=chatgpt.com))

**Thatcher and Wright, “Generalized Finite Automata Theory with an Application to a Decision Problem of Second-Order Logic.”**  
Generalizes automata and recognizability from strings to finite trees using algebraic methods. Foundational for tree-structured documents. ([research.ibm.com](https://research.ibm.com/publications/generalized-finite-automata-theory-with-an-application-to-a-decision-problem-of-second-order-logic?utm_source=chatgpt.com))

**Courcelle and Engelfriet, *Graph Structure and Monadic Second-Order Logic*.**  
Provides algebraic and logical foundations for graph structure, graph languages, recognizability, and transformations. Essential for citations and cross-document networks. ([labri.fr](https://www.labri.fr/perso/courcell/Book/TheBook.pdf?utm_source=chatgpt.com))

**Bojańczyk and Walukiewicz, “Forest Algebras.”**  
Develops algebraic recognizers for regular languages of unranked forests, directly relevant to XML/DOM-like document hierarchies. ([mimuw.edu.pl](https://www.mimuw.edu.pl/~bojan/upload/confbirthdayBojanczykW08.pdf?utm_source=chatgpt.com))

**Murata, Lee, Mani, and Kawaguchi, “Taxonomy of XML Schema Languages Using Formal Language Theory.”**  
Uses regular tree grammars and formal language theory to classify XML schema languages. Important for document validation. ([pike.psu.edu](https://pike.psu.edu/publications/toit05.pdf?utm_source=chatgpt.com))

**Neven, “Automata Theory for XML Researchers.”**  
Surveys automata and logic for XML, especially unranked tree representations of documents. ([sigmodrecord.org](https://sigmodrecord.org/publications/sigmodRecord/0209/libkin.pdf?utm_source=chatgpt.com))

**Baader and Nipkow, *Term Rewriting and All That*.**  
Standard mathematical source for term rewriting, termination, confluence, and normal forms. Applies to document transformations and normalization. ([zubairabid.com](https://zubairabid.com/Semester7/subjects/PoPL/books/TRaAT.pdf?utm_source=chatgpt.com))

**Lack and Sobociński, “Adhesive and Quasiadhesive Categories.”**  
Generalizes double-pushout graph rewriting categorically, useful for structured document graph transformations. ([numdam.org](https://www.numdam.org/item/ITA_2005__39_3_511_0/?utm_source=chatgpt.com))

**Foster, Greenwald, Moore, Pierce, and Schmitt, “Combinators for Bidirectional Tree Transformations.”**  
Develops lenses with get/put laws for synchronizing source and view; relevant to Markdown/HTML, source/outline, and bibliography/rendered-reference synchronization. ([cis.upenn.edu](https://www.cis.upenn.edu/~bcpierce/papers/lenses-toplas-final.pdf?utm_source=chatgpt.com))

**Shapiro et al., CRDT work.**  
Formalizes convergent replicated data types using semilattices and commutative operations. Relevant to collaborative document editing. ([csa.iisc.ac.in](https://www.csa.iisc.ac.in/~raghavan/CleanedPods2021/crdt-shapiro-2011.pdf?utm_source=chatgpt.com))

**Mann and Thompson, Rhetorical Structure Theory.**  
Introduces discourse units and rhetorical relations such as elaboration, evidence, contrast, and result. Gives a formalizable structure for paragraphs and larger discourse. ([sfu.ca](https://www.sfu.ca/rst/05bibliographies/bibs/Mann_Thompson_1988.pdf?utm_source=chatgpt.com))

**Asher and Lascarides, SDRT / *Logics of Conversation*.**  
Develops dynamic discourse semantics with rhetorical relations and update, relevant for paragraph and article-level interpretation. ([books.google.com](https://books.google.com/books/about/Logics_of_Conversation.html?id=PYf2EVuGKbkC&utm_source=chatgpt.com))

**Goguen and Burstall, Institutions.**  
Introduces institutions as an abstract model theory of signatures, sentences, models, and satisfaction. Useful for documents interpreted across changing vocabularies, theories, and institutional settings. ([dl.acm.org](https://dl.acm.org/doi/10.1145/147508.147524?utm_source=chatgpt.com))

---

## 20. Bottom line

The best mathematical abstraction of a document is not “a string” but a **typed, recursive, interpreted, transformable, graph-situated object**.

A compact formulation is:

\[
\text{Document}
\in
\mu F
\]

for its finite recursive structure,

\[
\llbracket - \rrbracket :
\mu F \to \mathcal S
\]

for its semantic interpretation,

\[
G_D
\]

for its citation/reference/entity graph,

\[
c:X\to O\times X^E
\]

for its evolving editor behavior,

and

\[
\mathcal I=(\text{Sign},\text{Sen},\text{Mod},\models)
\]

for its institutional semantics.

The categorical insight is that these are not competing metaphors. They are different functorial views of the same artifact.
