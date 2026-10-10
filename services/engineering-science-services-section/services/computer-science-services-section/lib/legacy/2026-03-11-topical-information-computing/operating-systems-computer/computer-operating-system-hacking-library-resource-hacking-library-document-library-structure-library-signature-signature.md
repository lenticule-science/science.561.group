---
name: signature
description: The finite list of typing judgments that declares which characterizations — sorts, operations, relations, constants — a structure-form's instances must carry, together with the axioms those characterizations must satisfy.
references:
  bourbaki1968:
    class: book
    authors: ["Bourbaki, Nicolas"]
    year: 1968
    title: "Theory of Sets"
    publisher: "Hermann"
    location: "Paris"
  maclane1971:
    class: book
    authors: ["Mac Lane, Saunders"]
    year: 1971
    title: "Categories for the Working Mathematician"
    publisher: "Springer"
    location: "New York"
  lambek-scott1986:
    class: book
    authors: ["Lambek, Joachim", "Scott, Philip J."]
    year: 1986
    title: "Introduction to Higher-Order Categorical Logic"
    publisher: "Cambridge University Press"
    location: "Cambridge"
  awodey2010:
    class: book
    authors: ["Awodey, Steve"]
    year: 2010
    title: "Category Theory"
    edition: "2nd"
    publisher: "Oxford University Press"
    location: "Oxford"
---

A **signature** of a structure-form $F$ is a finite list of *typing judgments* presenting the data an instance of $F$ must supply, together with a finite list of *axioms* presenting the conditions those data must satisfy.
The signature is the declaration; an instance of $F$ is a realization of the declaration in a chosen semantic category.

Following the categorical-algebra tradition [@maclane1971, ch. II §1; @lambek-scott1986, Part I §1; @awodey2010, §1.4], a signature declares four kinds of typing judgment:

- **Sorts** — the carriers an instance must supply.
  A signature with sorts $A_1, \ldots, A_k$ requires an instance to supply $k$ carrier objects (in the chosen semantic category) interpreting each sort.
- **Operations** — the functions an instance must support, each given with a declared arity and a result sort.
  An operation $f : A_{i_1} \times \cdots \times A_{i_n} \to A_j$ requires the instance to supply a morphism of that shape between the carriers interpreting the source and target sorts.
- **Relations** — the predicates an instance must support, each given with a declared arity over sorts.
  A relation $R \subseteq A_{i_1} \times \cdots \times A_{i_n}$ requires the instance to supply a sub-object (or, in the predicate-categorical reading, a designated value in the appropriate fiber) of the indicated arity.
- **Constants** — the distinguished elements an instance must designate.
  A constant $c : A_i$ requires the instance to supply a chosen point of the carrier interpreting $A_i$.

An **axiom** is a closed first-order (or, more generally, higher-order) sentence in the language built over the signature's typing judgments [@bourbaki1968, ch. IV].
The signature's instances are required to satisfy every axiom in the list.

## Signature versus structure-form

A signature is one component of a structure-form.
The other component is the inhabitance relation pairing the signature with elements of a base set that satisfy it (per the structure-form definition).

A structure-form's signature is a piece of *syntactic* data — it lives in the language the signature is presented in.
The inhabitance relation crosses from this syntactic data to *semantic* data — the elements of a base set that realize the signature.
Both pieces together make a structure-form; the signature alone is one half of the data.

Two structure-forms with the same signature but distinct inhabitance relations are distinct structure-forms.
Two structure-forms with the same inhabitance relation but distinct signatures are also distinct structure-forms; in this case the two signatures present the same set of carriers and characterizations through different syntactic surfaces, and the difference is recoverable by signature-translation.

## Per-category presentations

A signature's typing judgments take different concrete shapes depending on the semantic category the structure-form is interpreted in.
The four general kinds (sorts, operations, relations, constants) are universal; the encoding of each kind in concrete data depends on the category:

- In $\mathbf{Set}$, the signature reads as the classical set-theoretic interpretation: a sort is a set, an operation is a function, a relation is a sub-set of a product, a constant is an element.
- In a topos $\mathcal{E}$, the signature reads as in $\mathbf{Set}$ with the internal language of $\mathcal{E}$ supplying the carriers, operations, sub-objects, and global elements.
- In the predication category $\mathcal{P}$, the signature reduces to a uniform list of characteristic predication cells — see [predication-shape](predication-shape.md) for the theorem stating the reduction and its proof.

The general signature concept is category-agnostic; per-category presentations are specializations under the chosen interpretation category.
