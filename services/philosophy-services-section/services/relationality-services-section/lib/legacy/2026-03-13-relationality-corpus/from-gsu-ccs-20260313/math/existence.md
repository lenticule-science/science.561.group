---

name: existence
description: "Existence"
---

### Theorem — Existence {#existence}

**Theorem — Existence.** Given primitive data satisfying the axioms of §history-and-fiber-algebra, §modal-calculus, and §sheaf-construction, there exists:
- a universe $R$, an internal object $H \in R$, internal modal endomorphisms
  $\sigma, \Delta : H \to H$, and an internal fixed subobject $H^\ast \hookrightarrow H$,

such that:
1. $R \simeq \mathbf{Sh}(T,J)$.
2. The underlying presheaf $t \mapsto H_t$ with reindexing $H(f)$ is a $J$-sheaf;
   its sheafification is the object $H \in R$.
3. The fixed fibers $H_t^\ast$ assemble into a subsheaf $H^\ast \hookrightarrow H$.
4. The fiberwise modal operators define natural endomorphisms $\sigma, \Delta : H \to H$
   in $R$, making $H$ an internal Heyting-modal algebra object.
5. The propositional modal structure of FiberNuclearLanguage is realized as the internal
   propositional language of $R$ restricted to $H$.

*Proof.* By the Axiom of Histories we have a small category $T$ and, by the Axiom of Locality, a Grothendieck topology
$J$ on $T$. The category $\mathbf{Sh}(T,J)$ of $\mathcal{U}$-small set-valued sheaves
is a Grothendieck topos; denote it $R$.

By the history axiom, the fiber doctrine, and reindexing we have a functor $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$. Composing with
the forgetful functor to $\mathbf{Set}$ yields a presheaf of sets; the Axiom of Locality asserts this
satisfies the sheaf condition, so it determines an object $H \in R$. The fiberwise
lattice and modal operations are natural in $t$, so they assemble to internal morphisms
making $H$ an internal object of $\mathbf{HA_{nucl}}$.

The Axiom of Stability gives, for each $t$, a subset $H_t^\ast \subseteq H_t$ forming a subsheaf, so
$(H_t^\ast)$ determines a subobject $H^\ast \hookrightarrow H$ in $R$.

The Axiom of Fiber Nuclear Language ([fiber-nuclear-language-axiom](fiber-nuclear-language-axiom.md)) specifies for each history $t$ a fiber nuclear language whose fiberwise
interpretation lands in $H_t$ and is functorial in $t$. Since FiberNuclearLanguage and $H$ are
both sheaves and $\mathbf{Sh}(T,J)$ is a full subcategory of $\mathbf{PSh}(T)$, a natural
transformation between them is automatically a morphism in $R$; the fiberwise interpretations,
being natural and landing in a sheaf, assemble to a unique global morphism in $R$. $\square$
