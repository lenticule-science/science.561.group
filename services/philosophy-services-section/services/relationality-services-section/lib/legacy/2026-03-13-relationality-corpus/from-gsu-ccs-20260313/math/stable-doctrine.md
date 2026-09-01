---

name: stable-doctrine
description: "The Stable Doctrine — the Heyting doctrine H* : T^op → HA assigning the fixed fiber H_t* to each history; the sub-doctrine of doubly-stable propositions"
---

### Definition — The Stable Doctrine {#stable-doctrine}

A single fixed fiber $H_t^*$ is an algebraic object at one history. The
**relation** between fixed fibers — how $H_t^*$ and $H_{t'}^*$ are connected
when $t \leq t'$ — is the geometric facet.

#### The Sub-Doctrine $H^*$ {#fixed-fiber-presheaf}

The assignment $t \mapsto H_t^*$ is a sub-doctrine of the fiber doctrine
$H : T^{\mathrm{op}} \to \mathbf{HA}$ (§fiber-doctrine). Specifically it is a
Heyting doctrine (§doctrine): for each morphism
$f : t \to t'$ in $T$ (i.e., $t \leq t'$), the restriction map
$H(f) : H_{t'} \to H_t$ carries $H_{t'}^*$ into $H_t^*$:

$$
H(f)\bigl(H_{t'}^*\bigr) \;\subseteq\; H_t^*.
$$

This holds because $H(f)$ is a $\mathbf{HA_{nucl}}$ homomorphism
(§reindexing): it intertwines the nuclei, so
$\sigma_t(H(f)(a)) = H(f)(\sigma_{t'}(a)) = H(f)(a)$ when
$\sigma_{t'}(a) = a$, and similarly for $\Delta_t$. Therefore the restricted
map

$$
H^*(f) \;:=\; H(f)\big|_{H_{t'}^*} \;:\; H_{t'}^* \longrightarrow H_t^*
$$

is a well-defined Heyting algebra homomorphism, and $H^* : T^{\mathrm{op}} \to
\mathbf{HA}$ is a Heyting doctrine in its own right.

#### What Restriction Preserves and Forgets {#restriction-stable}

The restriction $H^*(f) : H_{t'}^* \to H_t^*$ forgets the extra relational
history in $t'$ beyond $t$, but only the **stable** part of that history.
Since both source and target are doubly quiescent, what is preserved is
exactly what both the backward settling ($\sigma$) and the forward settling
($\Delta$) agree on.

Concretely: if $a \in H_{t'}^*$ is a stable proposition at the longer history
$t'$, then $H^*(f)(a)$ is its restriction to $t$ — a stable proposition at
the shorter history. The restriction may collapse distinct stable propositions
at $t'$ into the same one at $t$ (information is lost going to shorter
histories), but it never produces an unstable result.

#### The Sheaf Condition — Stability {#stability-sheaf}

The Axiom of Stability (§stability) asserts that $H^*$ is a
**sub-sheaf** of $H$ for the commutation topology $J$. This means:

For any covering family $\{u_i : t_i \to t\}_{i \in I}$ in $J(t)$ and any
compatible family $(a_i)_{i \in I}$ with $a_i \in H_{t_i}^*$ and
$H^*(f_{ij})(a_i) = H^*(f_{ij})(a_j)$ on overlaps, there exists a unique
$a \in H_t^*$ with $H^*(u_i)(a) = a_i$ for all $i$.

The sheaf condition says stable propositions glue: if you have a compatible
family of active local data on a cover, it assembles into a unique stable
global datum. Stability is not merely a fiberwise property — it is a
**geometric** condition, coherent across the site.

#### Assembly into the Invariant Locale {#assembly-locale}

The sub-doctrine $H^*$, being a sheaf of finite Heyting algebras with
frame-map restrictions, determines an internal locale $\mathsf{Phase}$ in
$R$ (§invariant-locale). The frame of opens of $\mathsf{Phase}$ is $H^*$
itself: each stable proposition is an open of the internal phase space.

The passage from fiberwise fixed fibers $H_t^*$ to the global locale
$\mathsf{Phase}$ is the geometric content of the fixed fiber:

| Level | Object | Role |
|-------|--------|------|
| Fiberwise | $H_t^*$ at each $t$ | Local stable algebra |
| Doctrine | $H^* : T^{\mathrm{op}} \to \mathbf{HA}$ | Compatible family of active algebras |
| Sheaf | $H^* \in R$ | Global stable object in the topos |
| Locale | $\mathsf{Phase}$ | Internal phase space whose opens are stable propositions |

Each row adds geometric structure: from isolated fibers, to a compatible
system, to a sheaf, to a locale. The relation between fixed fibers is what
produces this assembly.

#### Remark — Geometric Morphisms Preserve Stability {#stability-geom-morph}

A morphism of relational universes $(\phi, \alpha) : \mathbf{U} \to \mathbf{V}$
(§universe-morphism) automatically preserves the fixed fiber structure:
since $\alpha$ intertwines the nuclei (§morphisms-nuclei), it carries
$H_\mathbf{U}^*$ to $H_\mathbf{V}^*$. The induced geometric morphism
$f : R_\mathbf{U} \to R_\mathbf{V}$ therefore restricts to a locale map
$\mathsf{Phase}_\mathbf{U} \to \mathsf{Phase}_\mathbf{V}$.

This is the relation between fixed fibers at the universe level: stable
propositions in one universe map to stable propositions in another, coherently.
