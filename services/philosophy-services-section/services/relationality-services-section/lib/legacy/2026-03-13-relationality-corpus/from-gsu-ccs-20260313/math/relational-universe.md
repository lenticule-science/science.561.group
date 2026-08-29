---

name: relational-universe
description: "Object: Relational Universe"
defines: RelationalUniverse
---

### Definition — The Universal Structure {#relational-universe}

*Qualities aspect of geometry: the settled, canonical model.*

Once the ambient topos $R$ exists, we establish: that a relational universe satisfying all eight axioms exists,
that it is essentially unique, that the syntactic relational universe of §modal-calculus is its initial model,
and that $R$ decomposes along profiles. These are the global coherence theorems.

#### Definition — Relational Universe {#relational-universe}

A **relational universe** is a quintuple
$$
(R,\; H,\; \sigma,\; \Delta,\; H^\ast)
$$
where:

1. $R = \mathbf{Sh}(T,J)$ is a Grothendieck topos presented by a small history site
   $(T,J)$ satisfying the axioms of §history-and-fiber-algebra, §modal-calculus, and
   §sheaf-construction up to and including the Axiom of Locality.

2. $H \in R$ is the internal finite Heyting algebra object arising from the
   $\mathbf{HA_{nucl}}$-valued sheaf $t \mapsto H_t$ of the fiber doctrine and reindexing.

3. $\sigma, \Delta : H \to H$ are internal nuclear endomorphisms induced by the fiberwise
   nuclei $(\sigma_t, \Delta_t)$, making $H$ an internal object of $\mathbf{HA_{nucl}}$ in $R$.

4. $H^\ast \hookrightarrow H$ is the internal fixed subobject
   $\mathrm{Fix}(\sigma) \cap \mathrm{Fix}(\Delta)$, forming a subsheaf as in the Axiom of
   Stability.

All subsequent constructions and theorems take place internally in $R$.

**Remark — Derived structure.** The quintuple determines three further objects that are
not additional data but constructions from the structure above:
FiberNuclearLanguage ([fiber-nuclear-language](fiber-nuclear-language.md)), the internal nuclear Heyting-modal language of
$H$; $\mathcal{F}$ (§generative-basis), the finite family of structural operations; and
$U_G$ (§self-generation), the generative universe closure operator whose least fixed point
is $\mathrm{Obj}(R)$.
