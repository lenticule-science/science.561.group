---
id: universe-as-object
name: UniverseAsObject
description: "Object: Relational Universe as an Algebraic Object"
---

### Definition — Relational Universe as an Algebraic Object {#universe-as-object}

A **relational universe** (as an algebraic object) is a tuple
$$
\mathbf{U} = (T_\mathbf{U},\; J_\mathbf{U},\; H_\mathbf{U} : T_\mathbf{U}^{\mathrm{op}} \to \mathbf{HA})
$$
where:
- $T_\mathbf{U} = \mathbb{M}(\Sigma_\mathbf{U}, I_\mathbf{U})$ is a history category (§history);
- $H_\mathbf{U}$ is a presheaf of Heyting algebras satisfying the nuclear compatibility condition (§fiber-doctrine);
- $J_\mathbf{U}$ is a Grothendieck topology making $H_\mathbf{U}$ a sheaf (§locality);

and the derived data — nuclei $\sigma_t, \Delta_t$, fixed fibers $H_\mathbf{U}^*$, the topos
$R_\mathbf{U} = \mathbf{Sh}(T_\mathbf{U}, J_\mathbf{U})$, and universe closure $U_{G_\mathbf{U}}$
— are all constructed from this triple as in §history-and-fiber-algebra through §closure-and-self-generation.

The essential data is the triple $(T_\mathbf{U}, J_\mathbf{U}, H_\mathbf{U})$; everything
else is forced. The canonical first-turn universe $R$ is the object with $T_\mathbf{U} = T$,
$J_\mathbf{U} = J$, $H_\mathbf{U} = H$.

#### Profiles — Relational Universes Inside $R$ {#profiles-as-objects}

An important special case: a **profile** is a relational universe living inside a given $R$,
specified by a **filter** — a Lawvere-Tierney topology $j$ on $R$ that commutes with the
internal nuclei $\sigma, \Delta$ on $H$. The subtopos $R_j = \mathbf{Sh}(R, j)$ inherits the
full relational universe structure: fiber algebras $H_t / j_t$, induced nuclei, inherited
topology. Profiles nest without bound — a filter on $R_j$ carves out a sub-profile, and so
on indefinitely — and this indefinite nesting is the fiber-level precursor of the hyperverse
tower (§hyperverse-tower).
