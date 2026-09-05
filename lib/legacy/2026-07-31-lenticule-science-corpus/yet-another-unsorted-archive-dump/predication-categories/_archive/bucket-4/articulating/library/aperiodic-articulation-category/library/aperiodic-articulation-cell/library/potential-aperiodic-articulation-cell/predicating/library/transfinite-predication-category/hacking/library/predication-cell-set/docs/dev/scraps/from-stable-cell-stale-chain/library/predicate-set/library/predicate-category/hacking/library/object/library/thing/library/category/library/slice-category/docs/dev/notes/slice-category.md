---
name: slice-category
description: The overcategory C/V at a basepoint V — a category whose objects are arrows into V and whose morphisms are commuting triangles over V.
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
  - id: borceux1994
    type: book
    title: Handbook of Categorical Algebra, vol. 1: Basic Category Theory
    publisher: Cambridge University Press
    location: Cambridge
    author:
      - literal: Borceux, Francis
    issued:
      - year: 1994
  - id: maclane-moerdijk1992
    type: book
    title: Sheaves in Geometry and Logic: A First Introduction to Topos Theory
    publisher: Springer
    location: New York
    author:
      - literal: Mac Lane, Saunders
      - literal: Moerdijk, Ieke
    issued:
      - year: 1992
---

Let $\mathcal{C}$ be a category and $V$ an object of $\mathcal{C}$. The **slice category** $\mathcal{C}/V$ — also written $\mathcal{C} \downarrow V$ and called the *overcategory at $V$* — is the category with the following data [@maclane1971, ch. I §3]:

- $\mathrm{Ob}(\mathcal{C}/V) := \{(X, f) : X \in \mathrm{Ob}(\mathcal{C}),\; f \in \mathcal{C}(X, V)\}$. An object is a $\mathcal{C}$-object equipped with an arrow into $V$.
- $\mathcal{C}/V((X, f), (Y, g)) := \{h \in \mathcal{C}(X, Y) : g \circ h = f\}$. A morphism from $(X, f)$ to $(Y, g)$ is a $\mathcal{C}$-arrow $h : X \to Y$ that commutes with the maps into $V$:
  $$\begin{array}{ccc} X & \xrightarrow{h} & Y \\ {}_f \searrow & & \swarrow {}_g \\ & V & \end{array}$$
- Identities: $\mathrm{id}_{(X, f)} := \mathrm{id}_X$ in $\mathcal{C}$.
- Composition: $h_2 \circ h_1$ in $\mathcal{C}/V$ is the underlying composition in $\mathcal{C}$, which commutes by associativity from the two triangles.

The slice category satisfies the category axioms (associativity, identity laws) because they hold in $\mathcal{C}$ and the slice's commutation conditions are stable under composition.

## Universal property

$\mathcal{C}/V$ is the *comma category* $\mathrm{id}_\mathcal{C} \downarrow \Delta_V$, where $\Delta_V : \mathbf{1} \to \mathcal{C}$ is the constant functor sending the unique object of the terminal category $\mathbf{1}$ to $V$ [@maclane1971, ch. II §6; @borceux1994, ch. 1 §6]. The slice carries a canonical *forgetful functor*
$$U_V : \mathcal{C}/V \to \mathcal{C}, \quad (X, f) \mapsto X$$
which is faithful but generally not full: arrows in $\mathcal{C}$ that do not commute with the maps into $V$ are forgotten.

## Slicing as a functor on $\mathcal{C}$

The assignment $V \mapsto \mathcal{C}/V$ extends to a functor $\mathcal{C} \to \mathbf{Cat}$ via post-composition: for $w : V \to V'$, the functor $w_* : \mathcal{C}/V \to \mathcal{C}/V'$ sends $(X, f)$ to $(X, w \circ f)$ and acts trivially on morphisms [@maclane1971, ch. II §6]. The assignment is associative and unital in $w$.

## Role in fibered category theory

The slice $\mathcal{C}/V$ is the standard *bundle around the basepoint $V$* in categorical algebra [@maclane-moerdijk1992, ch. I §3; ch. III §1]. Its objects collect every arrow into $V$ — the cells incident to $V$ when $\mathcal{C}$ is a predication category, the morphisms-with-codomain-$V$ when $\mathcal{C}$ is an arbitrary category — and its morphisms record the commutation among such arrows. Slicing is the operation that equips every object of a category with this bundle.
