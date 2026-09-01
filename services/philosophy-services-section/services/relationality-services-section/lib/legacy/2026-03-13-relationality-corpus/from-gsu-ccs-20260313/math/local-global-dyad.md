---

name: local-global-dyad
description: "Phenomenon: The Local/Global Dyad"
---

### Theorem — The Local/Global Dyad {#local-global-dyad}

The **local/global dyad** is the duality between what holds at each individual
site (a single history $t$, a single fiber $H_t$) and what holds across the entire
structure (the presheaf $H$ as a whole, the topos $R$). It is one of the two
constituent dyads of the nuclear quartet ([NuclearQuartetSubalgebra](nuclear-quartet-subalgebra.md)): the nuclear quartet
is the product of the being/becoming dyad (§being-becoming-dyad) crossed with
the local/global dyad.

#### The Two Poles {#local-global-dyad-poles}

| Pole | Scope | Mathematical instance |
|------|-------|----------------------|
| **Local** | A single history $t$ | The fiber $H_t$; propositions $a \in H_t$; conditions at one history |
| **Global** | The whole category $T$ | The presheaf $H : T^{\mathrm{op}} \to \mathbf{HA}$; sections over all histories; the topos $R$ |

The local pole addresses what exists or holds *at* a point. The global pole
addresses what exists or holds *across* all points coherently.

#### The Concrete Instances {#local-global-dyad-instances}

The local/global distinction appears at every layer of the construction:

- **Algebra section**: local = a single fiber $H_t$ with its nuclei $\sigma_t$,
  $\Delta_t$; global = the presheaf $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$
  assembling all fibers.

- **Language section**: local = the fiber language FiberNuclearLanguage at a single
  history (terms interpreted in $H_t$); global = the syntactic relational universe
  $R_{\mathrm{syn}}$ assembled from all fibers.

- **Geometry section**: local = conditions on individual fibers (e.g., the nucleus
  axioms on $H_t$); global = the commutation topology $J$ specifying when local
  data cohere into global sections, and the topos $R = \mathbf{Sh}(T,J)$.

- **Dynamics section**: local = the action of $U_G$ on a single object of $R$;
  global = the closure $U_G(R) = R$ — the universe is closed under all its own
  operations.

#### The Sheaf Condition as Convergence {#local-global-dyad-convergence}

The convergence of the local/global dyad is the **sheaf condition** (§locality):
a presheaf $H$ satisfies the sheaf condition for $J$ when local data on covering
sieves determine global sections uniquely. This is where local and global
coincide: the global section is exactly the compatible collection of local pieces.
The topology $J$ specifies when this convergence holds.

At the fixed point $R = U_G(R)$, every global structure decomposes into local
pieces (by the density of representables) and every local piece assembles into
global structure (by the sheaf condition). The local/global distinction has closed.

#### The Nuclear Quartet Cross-Product {#local-global-dyad-cross}

The nuclear quartet arises as the product of the being/becoming dyad with the
local/global dyad:

|              | Local | Global |
|--------------|-------|--------|
| **Being**    | Object (what the local structure IS) | Relation (how local structures CONNECT globally) |
| **Becoming** | Quality (what CAN BE SAID locally) | Act (what GENERATES globally) |

- Object = local being = what the fiber $H_t$ IS at each history
- Relation = global being = the static structure connecting all fibers (site, presheaf)
- Quality = local becoming = what can be said within $H_t$ (the language at $t$)
- Act = global becoming = what generates the universe as a whole ($U_G$, self-generation)
