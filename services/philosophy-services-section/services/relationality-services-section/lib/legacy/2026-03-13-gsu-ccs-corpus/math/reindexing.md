---
id: reindexing
name: Reindexing
description: "The presheaf H : T^op → HA_nucl of Heyting algebras with commuting nuclei, including restriction maps that intertwine nuclei and preserve fixed fibers, derived from the fiber doctrine."
defines: Reindexing
---

### Definition — Presheaf Data {#reindexing}

*Objects aspect of geometry: the fibers and their connecting maps.*

The fiber doctrine provides, for each history $t$, a finite Heyting algebra
$H_t$ together with restriction maps $H(f): H_{t'} \to H_t$ for each morphism
$f: t \to t'$, making $H: T^{\mathrm{op}} \to \mathbf{HA}$ a presheaf of Heyting
algebras. The nuclei $\sigma_t$ and $\Delta_t$ are defined fiberwise from this presheaf structure
(see §saturation-nucleus, §transfer-nucleus, §nucleus-commutation). The present unit records the consequence for §sheaf-construction:
the presheaf $H$ in fact lands in $\mathbf{HA_{nucl}}$, and the restriction maps
intertwine the nuclei.

#### Reindexing {#reindexing}

The functor $H : T^{\mathrm{op}} \longrightarrow \mathbf{HA_{nucl}}$ is determined by
the fiber doctrine:

- for each object $t \in \mathrm{Ob}(T)$, $H(t) = (H_t, \sigma_t, \Delta_t)$;
- for each morphism $f : t \to t'$ in $T$, the restriction map $H(f) : H_{t'} \to H_t$
  is a morphism of $\mathbf{HA_{nucl}}$.

Here $\mathbf{HA_{nucl}}$ is as in §nuclear-heyting-algebra: objects are triples $(A, \sigma, \Delta)$
of a finite Heyting algebra with commuting nuclei, and morphisms are Heyting algebra
homomorphisms preserving $\sigma$ and $\Delta$.

**Functoriality** ($H(\mathrm{id}_t) = \mathrm{id}_{H_t}$ and $H(g \circ f) = H(f) \circ H(g)$)
is axiomatic in §fiber-doctrine.

**Preservation of Heyting structure** (preservation of $\wedge$, $\vee$, $\Rightarrow$,
$\bot$, $\top$) is axiomatic in §fiber-doctrine.

#### Restriction Maps {#restriction-maps}

**Preservation of nuclei.** For every morphism $f : t \to t'$ and all $a \in H_{t'}$,
$$
H(f)(\sigma_{t'}(a)) = \sigma_t(H(f)(a)), \qquad
H(f)(\Delta_{t'}(a)) = \Delta_t(H(f)(a)).
$$
This follows from the definitions of $\sigma_t$ and $\Delta_t$ via restriction images.
For $\Delta$: $H(f)$ intertwines the extension-image intersections because extensions of
$t$ factor through extensions of $t'$ via functoriality. For $\sigma$: $H(f)$ preserves
the sub-history restriction profile because restrictions of $t'$ restrict further to
sub-histories of $t$.

**Compatibility with Fixed Fibers.** For every morphism $f : t \to t'$:
$$
H(f)\bigl(H_{t'}^\ast\bigr) \subseteq H_t^\ast.
$$
Immediate from nucleus preservation: if $\sigma_{t'}(a) = a$ and $\Delta_{t'}(a) = a$
then $\sigma_t(H(f)(a)) = H(f)(a)$ and $\Delta_t(H(f)(a)) = H(f)(a)$.

#### Remark {#remark-reindexing-interpretation}

The fibers vary coherently over the history category. A morphism $f : t \to t'$ induces a
view change of propositions: what holds over $t'$ can be pulled back to $t$ without
breaking any propositional or modal structure. This follows entirely from the Axiom of
fiber doctrine; no separate reindexing axiom is needed.
