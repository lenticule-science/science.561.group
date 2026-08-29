---

name: dynamic-residuation
description: "Dynamic Residuation"
defines: DynamicResiduation
---

### Definition — Dynamic Residuation {#dynamic-residuation}

Let $H_t$ be a fiber Heyting algebra with nucleus $j : H_t \to H_t$ (either $\sigma_t$ or $\Delta_t$,
or any nucleus of $H_t$). The **$j$-residuation** at a pair $(a, b) \in H_t \times H_t$ is the
greatest element of $H_t$ satisfying the $j$-implication constraint:

$$
j\!\supset\!(a,b) \;:=\; \max\bigl\{\, x \in H_t \;\big|\; j(a \wedge x) \leq j(b) \,\bigr\}.
$$

When $j = \sigma_t$, write $\sigma\!\supset\!(a,b)$. When $j = \Delta_t$, write $\Delta\!\supset\!(a,b)$.

The $j$-residuation is a **dynamic** analog of the fiber implication $\Rightarrow_t$: it mediates
the implication relation **through** the nucleus rather than in the raw fiber. The static implication
$a \Rightarrow_t b$ is the $j$-residuation with $j = \mathrm{id}_{H_t}$.

#### Lemma — Galois Connection {#dynamic-residuation-galois}

The $j$-residuation satisfies:
$$
j(a \wedge b) \leq j(c)
\;\iff\;
b \leq j\!\supset\!(a, c).
$$

**Proof.** Since $j$ is meet-preserving, $j(a \wedge x) = j(a) \wedge j(x)$. The condition
$j(a) \wedge j(x) \leq j(c)$ is equivalent (by the adjunction $\_ \wedge j(a) \dashv j(a) \Rightarrow \_$
in the Heyting algebra $H_t$) to $j(x) \leq j(a) \Rightarrow j(c)$. The maximum $x$ satisfying
$j(x) \leq j(a) \Rightarrow j(c)$ exists because $j$ is a closure operator and
$H_t$ is complete; it is the preimage of $j(a) \Rightarrow j(c) \in \mathrm{Fix}(j)$ under $j$.
Thus $j\!\supset\!(a,c) = j^{-1}(j(a) \Rightarrow j(c))$, where $j^{-1}$ denotes the
(well-defined, since $j$ is monotone and $H_t$ is complete) greatest preimage. $\square$

#### Lemma — Stability Under Composition {#dynamic-residuation-stability}

If $b \leq j\!\supset\!(a,c)$ and $d \leq j\!\supset\!(c,e)$, then $b \wedge d \leq j\!\supset\!(a,e)$.

**Proof.** By the Galois connection, $j(a \wedge b) \leq j(c)$ and $j(c \wedge d) \leq j(e)$.
Then $j(a \wedge b \wedge d) \leq j(c \wedge d) \leq j(e)$, so $b \wedge d \leq j\!\supset\!(a,e)$.
$\square$

#### Corollary — Fiber as Dynamic Heyting Algebra {#dynamic-heyting-algebra}

The tuple $(H_t, \wedge, \vee, j\!\supset\!, j(\bot), j(\top))$ is a Heyting algebra — the
**dynamic Heyting algebra of $H_t$ relative to $j$**. It coincides with the quotient
Heyting algebra $\mathrm{Fix}(j)$ when the Galois connection is traced through: the
$j$-residuation produces exactly the implication of $\mathrm{Fix}(j)$ lifted back to $H_t$.

**Remark.** The distinction between $\Rightarrow_t$ (static fiber implication) and
$\sigma\!\supset\!(\_, \_)$ (saturation-mediated implication) is the distinction between asking
"what is sufficient for $b$ given $a$?" at the fiber level versus "what is sufficient for
$\sigma_t(b)$ given $\sigma_t(a)$?" — i.e., for the stabilized forms. Similarly
$\Delta\!\supset\!(\_, \_)$ asks for sufficiency for the transfer-settled form of $b$ given
the transfer-settled form of $a$. Both are natural when the language and dynamics
operate through the nuclei rather than on the raw fiber.
