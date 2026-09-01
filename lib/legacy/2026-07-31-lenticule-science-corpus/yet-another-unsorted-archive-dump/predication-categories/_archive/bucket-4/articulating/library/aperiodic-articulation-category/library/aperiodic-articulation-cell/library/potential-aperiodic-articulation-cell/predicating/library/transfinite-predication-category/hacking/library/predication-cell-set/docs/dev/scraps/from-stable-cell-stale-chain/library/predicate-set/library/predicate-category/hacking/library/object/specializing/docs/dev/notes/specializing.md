---
name: specializing
description: A faithful subcategory inclusion functor — embeds a category whose objects bear additional invariants into a more general category, forgetting the extra invariants on the way up.
gerund: specializing
agent-noun: specializer
imperative: specialize
originating: structure
terminating: structure
preserves:
  - identities
  - composition
  - monomorphisms
references:
  - id: maclane1971
    type: book
    title: Categories for the Working Mathematician
    publisher: Springer
    location: New York
    author:
      - literal: Mac Lane, Saunders
    issued:
      - year: 1971
  - id: awodey2010
    type: book
    title: Category Theory
    edition: 2nd
    publisher: Oxford University Press
    location: Oxford
    author:
      - literal: Awodey, Steve
    issued:
      - year: 2010
  - id: lambek-scott1986
    type: book
    title: Introduction to Higher-Order Categorical Logic
    publisher: Cambridge University Press
    location: Cambridge
    author:
      - literal: Lambek, Joachim
      - literal: Scott, Philip J.
    issued:
      - year: 1986
---

Let $\mathcal{A}$ and $\mathcal{B}$ be categories. A **specialization** of $\mathcal{B}$ by $\mathcal{A}$ is a faithful functor
$$\iota : \mathcal{A} \hookrightarrow \mathcal{B}$$
that is injective on objects, and whose image $\iota(\mathcal{A})$ is a subcategory of $\mathcal{B}$ characterized by a family of additional invariants — predicates $P_1, \ldots, P_n$ on the objects and morphisms of $\mathcal{B}$ — such that $X \in \iota(\mathcal{A})$ if and only if $P_1(X), \ldots, P_n(X)$ hold.

Faithfulness means: for any objects $X, Y \in \mathcal{A}$, the map on hom-sets
$$\iota_{X,Y} : \mathcal{A}(X, Y) \to \mathcal{B}(\iota X, \iota Y)$$
is injective. Two distinct morphisms in $\mathcal{A}$ map to two distinct morphisms in $\mathcal{B}$; the embedding does not collapse arrows.

Injectivity on objects, faithfulness on arrows, and characterization-by-invariants make $\mathcal{A}$ a *full subcategory cut out by $P_1, \ldots, P_n$* of $\mathcal{B}$ — the standard form of a subobject classifier in categorical algebra [@maclane1971, ch. IV §2; @awodey2010, §1.5; @awodey2010, §2.1; @lambek-scott1986, Part I].

The functor $\iota$ has a partial left adjoint only when the invariants $P_i$ admit a free construction — when, for every $X \in \mathcal{B}$, there is a universal $X^* \in \mathcal{A}$ and a $\mathcal{B}$-morphism $X \to \iota(X^*)$ satisfying the standard universal property. Many specialization functors lack this adjoint; the discipline of specialization is the embedding direction itself, not the (sometimes nonexistent) free direction.

The cell $(A, \text{specializing}, B)$ records that the object $A$ is in the image of some specialization functor $\iota : \mathcal{A} \hookrightarrow \mathcal{B}$ — equivalently, that $A$ is a $B$ together with the additional invariants that cut $\mathcal{A}$ out of $\mathcal{B}$. Reading: "$A$ specializes $B$."

The dual pattern — concrete-form materializes abstract-form across a level of mathematical abstraction, rather than restricting within a single level — is [realizing](realizing.md).
