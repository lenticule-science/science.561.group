---
name: reflective-nuclear-square

description: "The commuting square of four nucleus-reflection maps produced by a commutative nuclear square: four objects connected by four reflections whose two composite paths agree."
defines: ReflectiveNuclearSquare
---

### Definition — Reflective Nuclear Square {#reflective-nuclear-square}

A **reflective nuclear square** is the categorical diagram produced by a
[commutative nuclear square](commutative-nuclear-square.md) $(A, j_1, j_2)$:
$$
\begin{array}{ccc}
A & \xrightarrow{j_1} & \mathrm{Fix}(j_1) \\
j_2 \downarrow & & \downarrow j_2|_{\mathrm{Fix}(j_1)} \\
\mathrm{Fix}(j_2) & \xrightarrow{j_1|_{\mathrm{Fix}(j_2)}} & A^*
\end{array}
$$

It has four objects — the four corners of the
[nuclear quartet subalgebra](nuclear-quartet-subalgebra.md) — and four morphisms, each
a nucleus map that is a reflection in the categorical sense. The diagram commutes.

#### The Four Morphisms {#reflective-nuclear-square-morphisms}

| Arrow | Domain | Codomain | Map |
|---|---|---|---|
| Top | $A$ | $\mathrm{Fix}(j_1)$ | $j_1$ |
| Left | $A$ | $\mathrm{Fix}(j_2)$ | $j_2$ |
| Right | $\mathrm{Fix}(j_1)$ | $A^*$ | $j_2|_{\mathrm{Fix}(j_1)}$ |
| Bottom | $\mathrm{Fix}(j_2)$ | $A^*$ | $j_1|_{\mathrm{Fix}(j_2)}$ |

Each arrow is a Heyting algebra homomorphism. Each is a **reflection**: it is the left
adjoint of the corresponding inclusion $\iota$, giving an adjoint pair
$$
j_i : A \;\rightleftharpoons\; \mathrm{Fix}(j_i) : \iota_i
$$
and similarly for the restricted maps along the right and bottom edges.

#### Commutativity of the Diagram {#reflective-nuclear-square-commutativity}

The square commutes: both paths from $A$ to $A^*$ are equal to the joint projection
$\pi = j_1 \circ j_2 = j_2 \circ j_1$.

- **Top-right path**: $A \xrightarrow{j_1} \mathrm{Fix}(j_1) \xrightarrow{j_2|} A^*$ gives $j_2(j_1(a)) = \pi(a)$.
- **Left-bottom path**: $A \xrightarrow{j_2} \mathrm{Fix}(j_2) \xrightarrow{j_1|} A^*$ gives $j_1(j_2(a)) = \pi(a)$.

These agree because $j_1 \circ j_2 = j_2 \circ j_1$. The commutativity of the
[commutative nuclear square](commutative-nuclear-square.md) is exactly the
commutativity of this diagram.

#### Distinction from the Nuclear Quartet Subalgebra {#reflective-nuclear-square-vs-quartet}

The [nuclear quartet subalgebra](nuclear-quartet-subalgebra.md) names the four
sub-algebras as a tuple: $(A, \mathrm{Fix}(j_1), \mathrm{Fix}(j_2), A^*)$. It
emphasizes the objects.

The reflective nuclear square is the same four objects together with the four reflection
morphisms and the commutativity of the diagram. It emphasizes the structure: that each
step is a reflection, that the two paths agree, and that the diagram lives in the
category of Heyting algebras with left-adjoint maps between reflective sub-objects.

The two are complementary views of what a [commutative nuclear square](commutative-nuclear-square.md)
produces.
