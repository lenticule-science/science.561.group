---

name: history-monoid
description: "The free history monoid M(Σ,I) — the initial history system over (Σ,I), constructed as the quotient of the free monoid Σ* by commutation equivalence — with its universal property."

defines: HistoryMonoid
---

### Definition — The Free History Monoid {#history-monoid}

Given a finite step set $\Sigma$ (§step) and a commutation relation $I$ (§commutation),
the **free history monoid** $\mathbb{M}(\Sigma, I)$ is the canonical history system over
$(\Sigma, I)$ — the initial object in the category of all history systems over $(\Sigma, I)$.

#### Construction {#history-monoid-construction}

Let $\Sigma^*$ denote the free monoid of finite sequences of steps. Define the
**commutation equivalence** $\sim_I$ as the smallest congruence on $\Sigma^*$ satisfying
$$
u \cdot s \cdot s' \cdot v \;\sim_I\; u \cdot s' \cdot s \cdot v
\quad\text{whenever } (s, s') \in I.
$$
The **free history monoid** is the quotient
$$
\mathbb{M}(\Sigma, I) \;:=\; \Sigma^* / {\sim_I},
$$
with multiplication $[u] \star [v] := [uv]$ and unit $e := [\varepsilon]$
(the class of the empty sequence). The injection $\mathrm{gen} : \Sigma \to
\mathbb{M}(\Sigma, I)$ sends each step $s$ to its singleton class $[s]$.

$\mathbb{M}(\Sigma, I)$ is a history system over $(\Sigma, I)$: generation holds because
every class $[w]$ is a product of singletons; commutativity holds by the definition of
$\sim_I$; unit-free and left-cancellative are classical results for free partially
commutative monoids (see §history-normalization for the normal-form proof of
unit-free; left-cancellativity is proved in §history-universality).

The elements of $\mathbb{M}(\Sigma, I)$ are the **histories** over $(\Sigma, I)$
(§history).

#### Canonical Representatives: The Foata Normal Form {#history-monoid-nf}

Every history $t \in \mathbb{M}(\Sigma, I)$ has a unique normal form — the
**Foata normal form** — described in §history-normalization. Normal forms are used
for decidable equality and for computing depth (§history-depth). The construction
of $\mathbb{M}(\Sigma, I)$ as a quotient is the only place in the main theory where
$\Sigma^*$ and $\sim_I$ appear explicitly; the rest of the paper works with the
abstract history system axioms.

#### The Universal Property {#history-monoid-universal}

**Definition — Abstract History System.** An **abstract history system** over
$(\Sigma, I)$ is a history system $(M, \star, e, \mathrm{gen}_M)$ (§history) — a
monoid $M$ equipped with $\mathrm{gen}_M : \Sigma \to M$ satisfying the four axioms.
A **morphism** of abstract history systems over $(\Sigma, I)$ is a monoid homomorphism
$\phi : M \to M'$ satisfying $\phi(\mathrm{gen}_M(s)) = \mathrm{gen}_{M'}(s)$ for
all $s \in \Sigma$. Let $\mathbf{AHS}(\Sigma, I)$ denote this category.

**Theorem.** $\mathbb{M}(\Sigma, I)$ with $\mathrm{gen} = [s \mapsto [s]]$ is the
**initial object** of $\mathbf{AHS}(\Sigma, I)$: for every abstract history system
$(M, \mathrm{gen}_M)$ over $(\Sigma, I)$, there is a unique morphism
$$
\phi \;:\; \mathbb{M}(\Sigma, I) \longrightarrow M.
$$

*Proof.* **Existence.** Define $\phi([s_1 \cdots s_n]) := \mathrm{gen}_M(s_1) \star
\cdots \star \mathrm{gen}_M(s_n)$. This is well-defined: if $[u] = [v]$ in
$\mathbb{M}(\Sigma, I)$ then $u$ and $v$ are related by finitely many commutation
swaps; each swap exchanges $\mathrm{gen}_M(s) \star \mathrm{gen}_M(s')$ with
$\mathrm{gen}_M(s') \star \mathrm{gen}_M(s)$, which are equal in $M$ by the
commutativity axiom. $\phi$ is a monoid homomorphism with $\phi \circ \mathrm{gen} =
\mathrm{gen}_M$.

**Uniqueness.** Any morphism $\phi'$ in $\mathbf{AHS}(\Sigma, I)$ must satisfy
$\phi'([s]) = \mathrm{gen}_M(s)$ for each $s \in \Sigma$. Since every history is a
product of singletons, $\phi'$ is determined everywhere. $\square$

#### Prefix Order and Role in the Theory {#history-monoid-role}

The prefix order $[u] \leq [v]$ iff $\exists [w] : [v] = [u] \star [w]$ equips
$\mathbb{M}(\Sigma, I)$ with the structure of the history category $T$ (§order).
$T$ is the base of the relational universe $R = \mathbf{Sh}(T, J)$ (§history-site).
The monoidal structure of $T$ gives the Day convolution on $R$ (§history-convolution)
and indexes the sequential comonads $\{G_s\}$ acting on $R$ (§sequential-act).

#### Three Levels of Free Objects {#history-monoid-three-levels}

The free-history-system pattern recurs at every level of the paper:

| Level | Steps | Commutativity | Free object | Normal form |
|---|---|---|---|---|
| History | $s \in \Sigma$ | $I \subseteq \Sigma \times \Sigma$ | $\mathbb{M}(\Sigma, I)$ | Foata NF (§history-normalization) |
| Formula | Propositional variables | Heyting-modal laws | FiberNuclearLanguage | Canonical $\mathsf{Prop}$-terms (§normalization) |
| Universe | Relational universes | Meta-commutation | $\mathbb{M}(\mathbf{RU}, I_\mathbf{RU})$ | Universe NF (§universe-normalization) |

At each level the free object is initial among models satisfying the relations.
