---
id: nuclear-heyting-algebra
name: NuclearHeytingAlgebra
description: "Object: Finite Heyting Algebras and HA_nucl"
---

### Definition — Finite Heyting Algebras and $\mathbf{HA_{nucl}}$ {#nuclear-heyting-algebra}

A **finite Heyting algebra** is a finite poset $(A,\le)$ equipped with all finite meets
$\wedge$ and joins $\vee$, an implication $\Rightarrow$ satisfying
$$
c \le (a \Rightarrow b) \;\Longleftrightarrow\; (c \wedge a) \le b,
$$
and distinguished elements $\bot$ (least) and $\top$ (greatest). Every finite
distributive lattice carrying such an implication is a finite Heyting algebra; finite
Boolean algebras are the special case where $a \Rightarrow \bot$ satisfies double
negation.

Let $\mathbf{HA_{nucl}}$ denote the category whose:
- **objects** are triples $(A,\sigma,\Delta)$ with $A$ a finite Heyting algebra and
  $\sigma,\Delta : A \to A$ two commuting nuclei (extensive, idempotent, meet-preserving),
- **morphisms** are Heyting algebra homomorphisms that additionally preserve $\sigma$
  and $\Delta$.

The fiber doctrine constructs $\sigma_t$ and $\Delta_t$ from the presheaf
structure of $H: T^{\mathrm{op}} \to \mathbf{HA}$ (see §fiber-doctrine), and
derives their nucleus properties. Each fiber $(H_t, \sigma_t, \Delta_t)$ is thereby an
object of $\mathbf{HA_{nucl}}$.

#### Sub-HA Lemmas {#ha-nucl-sub-ha}

Two standard facts used repeatedly in §history-and-fiber-algebra and §sheaf-construction:

**Lemma — Images of HA homs are sub-HAs.** If $f : A \to B$ is a Heyting algebra
homomorphism, then $\mathrm{image}(f)$ is a sub-Heyting-algebra of $B$. *Proof.*
$\mathrm{image}(f)$ is closed under $\wedge, \vee, \Rightarrow, \bot, \top$ because
$f$ preserves all of these. $\square$

**Lemma — Intersections of sub-HAs are sub-HAs.** If $(A_i)_{i \in I}$ is any family
of sub-Heyting-algebras of $A$, then $\bigcap_{i \in I} A_i$ is a sub-Heyting-algebra.
*Proof.* Closure under each operation is checked pointwise. $\square$

These two lemmas together establish that $\mathrm{Fix}(\Delta_t) = \bigcap_{s \perp t}
\mathrm{image}(H(i_{s,t}))$ is a sub-Heyting-algebra of $H_t$, which is used in
the construction of the transfer nucleus (§fiber-doctrine).
