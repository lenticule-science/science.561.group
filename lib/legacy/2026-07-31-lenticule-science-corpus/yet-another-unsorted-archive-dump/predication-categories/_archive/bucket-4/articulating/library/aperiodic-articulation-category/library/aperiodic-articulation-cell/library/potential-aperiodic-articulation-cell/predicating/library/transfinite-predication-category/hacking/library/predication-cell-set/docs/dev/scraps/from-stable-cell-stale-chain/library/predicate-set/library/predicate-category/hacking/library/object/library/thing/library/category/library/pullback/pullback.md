---
name: pullback
description: "The universal cone over a cospan — the fiber product. Given morphisms f : A → C and g : B → C, the pullback P = A ×_C B is the object equipped with projections π_1 : P → A and π_2 : P → B such that f ∘ π_1 = g ∘ π_2, universal among such commutative squares. The aliases-as-resolve-pullbacks theorem's typed home."
specializing: object
references:
  - id: maclane1971
    type: book
    title: Categories for the Working Mathematician
    series: Graduate Texts in Mathematics
    volume: 5
    publisher: Springer-Verlag
    location: New York
    author:
      - literal: Mac Lane, Saunders
    issued:
      - year: 1971
  - id: awodey2010
    type: book
    title: Category Theory
    edition: "2"
    series: Oxford Logic Guides
    volume: 52
    publisher: Oxford University Press
    location: Oxford
    author:
      - literal: Awodey, Steve
    issued:
      - year: 2010
---

A **pullback** of a cospan $f : A \to C$, $g : B \to C$ in a category $\mathcal{C}$ is an object $P$ (often written $A \times_C B$) together with projection morphisms $\pi_1 : P \to A$ and $\pi_2 : P \to B$ satisfying [@maclane1971, Ch. III §4; @awodey2010, §5.5]:

$$f \circ \pi_1 = g \circ \pi_2$$

and the universal property:

> For every $(Q, q_1 : Q \to A, q_2 : Q \to B)$ with $f \circ q_1 = g \circ q_2$, there exists a unique morphism $u : Q \to P$ such that $\pi_1 \circ u = q_1$ and $\pi_2 \circ u = q_2$.

Diagrammatically, the pullback is the universal completion of a cospan into a commuting square:

$$
\begin{array}{ccc}
P & \xrightarrow{\pi_2} & B \\
\downarrow \pi_1 & & \downarrow g \\
A & \xrightarrow{f} & C
\end{array}
$$

**Examples by category.**

- In Set, the pullback is $A \times_C B = \{(a, b) \in A \times B : f(a) = g(b)\}$ — the subset of the product where the two morphisms produce equal values in $C$.
- In Top, the pullback is the same set with the subspace topology of $A \times B$.
- In Grp, the pullback is the fiber product subgroup of $A \times B$.
- The pullback of $A \to C$ with itself along the identity gives $A$ back; the pullback of $A \to 1$ with $B \to 1$ (where $1$ is terminal) gives the binary product $A \times B$.

**The aliases-theorem connection.** The [aliases-as-resolve-pullbacks](../../../../../../../../../prose/learning/claims/aliases-are-resolve-pullbacks-of-classical-equality.md) theorem states that the alias relation $\sim_\text{alias}$ on surface forms is the pullback of classical equality on entities along the resolve function $\rho : \Sigma \to E$. Concretely:

$$\sigma_1 \sim_\text{alias} \sigma_2 \iff \rho^*(=_E)(\sigma_1, \sigma_2) = \mathbf{t}$$

is the assertion that the alias relation arises as the pullback square:

$$
\begin{array}{ccc}
\sim_\text{alias} & \to & =_E \\
\downarrow & & \downarrow \\
\Sigma \times \Sigma & \xrightarrow{\rho \times \rho} & E \times E
\end{array}
$$

With `pullback` as a typed thing, the theorem's content becomes expressible as a cell record: an alias-relation cell carries a pullback-witness referencing the entity-equality predicate and the resolve function.

**Limit-form.** Pullback is the limit of a cospan-shaped diagram (three objects with two morphisms forming a cospan). The general [limit](../limit/limit.md) record's `pullback` branch handles this case directly. The pullback record exists separately because the aliases theorem and many other constructions reference it by name.

**Dual.** The dual is the [pushout](../pushout/pushout.md) — the universal cocone over a span.
