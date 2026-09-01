---

name: accord
description: "An accord is an object of the relational universe R = Sh(T,J): a coherent assignment of local data to each history, assembling from independent concurrent contributions exactly as histories compose from independent steps."
---

### Definition — Accord {#accord}

An **accord** is an object of the relational universe $R = \mathbf{Sh}(T, J)$: a contravariant functor
$F : T^{\mathrm{op}} \to \mathbf{Set}$ satisfying the sheaf condition for the commutation topology $J$.

#### Definition {#accord-definition}

1. **Local sections.** For each history $t \in T$, $F$ assigns a set $F(t)$ — the local sections of $F$ at $t$.

2. **Restriction.** For each prefix relation $f : t \to t'$ (i.e., $t \leq t'$), a restriction map
   $F(f) : F(t') \to F(t)$, contravariant and functorial.

3. **Concurrent assembly.** For every independence cover $\{u_i \to t\} \in J(t)$ (§history-site),
   compatible families of local sections assemble uniquely: a family $(s_i \in F(u_i))$ that agrees on
   all overlaps extends to a unique $s \in F(t)$ restricting to each $s_i$.

Condition (3) is the **accord condition**: the local sections at independent concurrent sub-histories
are in accord — they agree on overlaps and combine without ambiguity at the concurrent join.

#### The Name {#accord-name}

**Accord** derives directly from the defining property. An accord on $(T, J)$ assembles coherently from
independent concurrent contributions, exactly as histories in $T$ compose from independent concurrent
steps. At each concurrent join $t = u \vee v$ (with $u, v$ independent), the accord condition requires
local data at $u$ and $v$ to be in accord: to agree on their common restrictions and determine $F(t)$
uniquely.

The fiber language FiberNuclearLanguage ([fiber-nuclear-language-axiom](fiber-nuclear-language-axiom.md)) makes propositions about $F(t)$ — about the
accord at each history $t$. An accord is not a description of something else; it is the thing the
language describes.

#### Remark {#accord-remark}

Every patch site $(U, J|_U)$ (§patch) supports the restriction of any accord $F \in R$ to an accord
$F|_U \in R_U$. By Patch Reconstruction (§patch-reconstruction), $F|_U$ is a complete accord in the
patch universe $R_U = \mathbf{Sh}(U, J|_U)$: observation focuses the accord without destroying it.
