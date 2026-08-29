---
name: nuclear-quartet-subalgebra

description: "The quadruple of four Heyting sub-algebras produced by a commutative nuclear square: the whole algebra, each individual fixed-point sub-algebra, and their intersection."
defines: NuclearQuartetSubalgebra
---

### Definition — The Nuclear Quartet Subalgebra {#nuclear-quartet-subalgebra}

A **nuclear quartet subalgebra** is the quadruple of four Heyting sub-algebras produced by a
[commutative nuclear square](commutative-nuclear-square.md) $(A, j_1, j_2)$:
$$
(A,\quad \mathrm{Fix}(j_1),\quad \mathrm{Fix}(j_2),\quad A^*)
$$
where $A^* = \mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2)$.

---

#### The Commuting Square of Inclusions {#nuclear-quartet-subalgebra-square}

The four sub-algebras fit into a commuting square of Heyting algebra inclusions
and nucleus maps:
$$
\begin{array}{ccc}
A & \xrightarrow{j_1} & \mathrm{Fix}(j_1) \\
j_2 \downarrow & & \downarrow j_2|_{\mathrm{Fix}(j_1)} \\
\mathrm{Fix}(j_2) & \xrightarrow{j_1|_{\mathrm{Fix}(j_2)}} & A^*
\end{array}
$$
The square commutes because $j_1 \circ j_2 = j_2 \circ j_1$ (see [CommutativeNuclearSquare](commutative-nuclear-square.md)).
Each arrow is a Heyting algebra homomorphism; each has a right adjoint given by the
corresponding inclusion $\iota$.

---

#### The Joint Projection {#nuclear-quartet-subalgebra-projection}

The composite $\pi := j_1 \circ j_2 = j_2 \circ j_1$ is itself a nucleus on $A$:

- **Extensive**: $a \leq \pi(a)$ for all $a \in A$.
- **Idempotent**: $\pi(\pi(a)) = \pi(a)$ for all $a \in A$.
- **Meet-preserving**: $\pi(a \wedge b) = \pi(a) \wedge \pi(b)$.

Its fixed-point set is exactly $A^*$:
$$
\mathrm{Fix}(\pi) \;=\; \mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2) \;=\; A^*.
$$

For each $a \in A$, $\pi(a)$ is the **least element of $A^*$ above $a$**:
$$
\pi(a) \;=\; \min\bigl\{\, b \in A^* \;\big|\; b \geq a \,\bigr\}.
$$
This is the reflection of $a$ into $A^*$ under the inclusion $A^* \hookrightarrow A$.
The inclusion has left adjoint $\pi : A \to A^*$, giving the adjunction
$\pi(a) \leq_* b \;\Leftrightarrow\; a \leq b$ for $b \in A^*$.

---

#### Strictness {#nuclear-quartet-subalgebra-strict}

When the commutative nuclear square is non-trivial — i.e., $A \neq A^*$ — the inclusions are all
strict:
$$
A^* \;\subsetneq\; \mathrm{Fix}(j_1) \;\subsetneq\; A
\qquad\text{and}\qquad
A^* \;\subsetneq\; \mathrm{Fix}(\Delta) \;\subsetneq\; A
\quad\text{in general}.
$$
For such $a \in A \setminus A^*$, the collapse $a \mapsto \pi(a)$ is strict: $a < \pi(a)$.
The nucleus does not merely rename elements — it identifies them. This is what makes
$A^*$ genuinely smaller than $A$ rather than isomorphic to it.

---

#### Instances {#nuclear-quartet-subalgebra-instances}

The primary instance in $R$ is the [fiber nuclear quartet subalgebra](fiber-nuclear-quartet.md):
the commutative nuclear square $(H_t, \sigma_t, \Delta_t)$ at each history $t$ produces
$(H_t,\, \mathrm{Fix}(\sigma_t),\, \mathrm{Fix}(\Delta_t),\, H_t^*)$.

The universe nuclear quartet subalgebra (see [relational-universe-nuclear-quartet](relational-universe-nuclear-quartet.md)) is the instance
at the level of the Relational Universe, whose joint fixed-point sub-algebra is
$R = \mathbf{Sh}(T,J)$.
