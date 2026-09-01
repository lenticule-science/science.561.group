---
type: question
class: internal
status: open
explores:
  - four-bilattice
  - predication-hyperdoctrine
  - bilattice-two-orders-duality
  - settling-frobenius-structure
  - klein-four-symmetry
  - d-frame
  - dihedral-symmetry-on-twist-products
  - four-regime-dichotomy
  - temporal-2-category
  - closure-2-monad
  - emmenegger-fibration-comonad
see-also:
  - ../theorems/step-n-and-bilattice-correspondence.md
  - ../theorems/bilattice-two-orders-duality.md
  - ../theorems/dihedral-symmetry-on-twist-products.md
  - ../theorems/four-regime-dichotomy.md
  - ../theorems/regime-chain-order.md
  - ../theorems/tqft-structure.md
  - ../theorems/settling-cohomology-vanishes-above-degree-1.md
  - ../theorems/emmenegger-fibration-comonad.md
  - ../theorems/gray-street-fibration-monad.md
  - ../theorems/kz-diamond-strict-commutation.md
  - ../theorems/transfinite-bounded-regime-h1-generators.md
  - ../theorems/equivariant-cohomology-decomposition.md
  - questions/bilattice-two-orders-duality.md
  - questions/sigma-as-axis-rotation.md
  - questions/bilattice-klein-four-symmetry.md
  - questions/kz-diamond-hierarchical-swarm-coordination.md
  - questions/three-backward-structures-and-their-symmetry.md
  - prose/teaching/explanations/the-two-adjoint-systems.md
---

# What categorical structure underlies the recurrent two-axis diamond?

The **bigraded diamond** (defined in Section 4) is a 5-element structure — a free
4-element shadow acted on by the diagonal $K_4 = \langle \sigma, \sim\!- \rangle$,
plus a canonical fixed-point center $I$ — that recurs at every categorical dimension
of predication categories. Its recurrence is not incidental. The tower of bigraded
diamonds (Section 5) is a candidate answer to the question of what predication
categories fundamentally *are* as a mathematical category.

Three reconceptions follow if the tower conjecture is correct:

**FOUR is the coefficient system, not the foundation.** The value layer (FOUR) is the
bigraded diamond's one level without a center — the pure free orbit, where no
categorical lifting has yet occurred. Every higher level has a center, and those
centers form the globular identity tower $f^* \leftarrow \mathrm{id}_{f^*} \leftarrow
\cdots$ The categorical identity of a predication category is not $\mathbf{FOUR}$ but
$f^*$, the reindexing functor. $\mathbf{FOUR}$ is where values live; $f^*$ is where
the category's self-reference lives.

**The four regimes are categorical depth, not merely dynamical classification.** The
regime chain order $\mathrm{strict} < \mathrm{scott\text{-}cont} <
\mathrm{transfinite\text{-}bounded} < \mathrm{aperiodic}$ indexes how many levels of
the bigraded diamond tower carry non-trivial content in a given settling. A
strict-regime settling is 1-categorically complete: its significant structure is fully
described at the predicate level (level 1). An aperiodic settling requires level 3 or
beyond. The known cohomological fact that $H^1 = 0$ in the lower two regimes and $H^1
\neq 0$ in the upper two is not an independent invariant: it is the signature of
level-2 tower activation. Cohomology tells you which categorical dimension the
settling inhabits.

**Predication categories are the diagonal-$K_4$-equivariant $(\infty,1)$-categories
based at $f^*$, with $\mathbf{FOUR}$ as coefficients.** The bigraded diamond at each
level $n$ is the algebraic loop space at $I_n$, and the tower is the loop-space tower
rooted at $f^*$. Predication categories are to $\mathbf{FOUR}$ roughly as based loop
spaces are to their basepoints: $\mathbf{FOUR}$ is the coefficient ring; $f^*$ is the
basepoint; and the tower measures how many times you can loop within the structure
before the loops trivialize — which is exactly what the regime measures.

This question asks whether these reconceptions can be made precise.

## The motif: FOUR's diamond and its traversal generator

In $\mathbf{FOUR} = \{\bot, \mathbf{t}, \mathbf{f}, \top\}$ under the knowledge
order $\leq_k$:

**Two orthogonal dyad pairs.** The pair $\{\bot, \top\}$ are the $\leq_k$-extremes,
swapped by conflation $-$ and fixed by negation $\sim$. The pair
$\{\mathbf{t}, \mathbf{f}\}$ are the $\leq_k$-incomparable middle elements, swapped
by $\sim$ and fixed by $-$. Each involution is the other pair's swapper and first
pair's fixator.

**The diamond shape.** $\bot$ is below both middle elements; both middles are below
$\top$; the two middles are incomparable. The Hasse diagram is the Boolean diamond.
Under $\leq_t$ the shape is identical but the extremes and middles are exchanged:
$\mathbf{f}$ is the $\leq_t$-bottom, $\mathbf{t}$ the $\leq_t$-top, and $\{\bot,
\top\}$ the incomparable $\leq_t$-middle. This "extreme $=$ middle of the other
order" is the bilattice's defining transversality, established for all twist-products
in the [bilattice two-orders duality question](bilattice-two-orders-duality.md).

**The canonical traversal generator.** The [dihedral symmetry theorem](../theorems/dihedral-symmetry-on-twist-products.md)
establishes that the symmetry group of $\mathbf{FOUR}$'s two-order structure is $D_4
= \langle r, s : r^4 = s^2 = (rs)^2 = e \rangle$ with $r = \sigma\!\sim$ and $s =
\sigma$, where $\sigma$ is the order-swap involution $\sigma : \bot \leftrightarrow
\mathbf{f},\; \mathbf{t} \leftrightarrow \top$.

The rotation generator $r = \sigma\!\sim$ is a **4-cycle** on FOUR:
$$\bot \;\xrightarrow{r}\; \mathbf{f} \;\xrightarrow{r}\; \top \;\xrightarrow{r}\;
\mathbf{t} \;\xrightarrow{r}\; \bot.$$

This cycle visits all four elements exactly once. Its orbit describes the canonical
traversal: start at the $\leq_k$-bottom $\bot$, visit the $\leq_t$-bottom $\mathbf{f}$
(one member of the $\leq_k$-middle pair), visit the $\leq_k$-top $\top$, visit the
$\leq_t$-top $\mathbf{t}$ (the other member of the $\leq_k$-middle pair), and return
to $\bot$. The cycle visits each element's "role-partner" in alternation: knowledge-
bottom $\to$ truth-bottom $\to$ knowledge-top $\to$ truth-top $\to$ back.

**Self-lacing.** In settling dynamics each predicate's trajectory is $\leq_k$-monotone,
climbing from $\bot$ toward $\top$ as evidence accumulates. When a predicate reaches
$\top$, its closure rule fires and provides initial evidence for a downstream predicate,
whose own trajectory starts from $\bot$. The knowledge-top of one diamond instance is
causally upstream of the knowledge-bottom of the next. The diamonds lace into a chain
with each $\top$ triggering the next $\bot$.

**The 3 / 4 / 5 coincidence.** Three natural cardinalities characterize the motif:

- **3:** three $\leq_k$-ranks — $\{\bot\}$, $\{\mathbf{t}, \mathbf{f}\}$, $\{\top\}$ —
  yielding a 3-chain when the incomparable pair is quotiented. Each single adjunction
  chain $\exists_f \dashv f^* \dashv \forall_f$ also has length 3.

- **4:** four elements of the full diamond $\mathbf{FOUR}$.

- **5:** five functors in the [predication hyperdoctrine](../objects/predication-hyperdoctrine.md)'s
  combined adjoint system, derived in the next section.

The 3 and 4 extend the [step-$n$ / bilattice cardinality coincidence theorem](../theorems/step-n-and-bilattice-correspondence.md),
which records that FOUR's substructure cardinalities $\{2, 3, 4\}$ match the named
step-$n$ alphabet sizes and that no FOUR substructure has cardinality $\geq 5$. The 5
appears one categorical level up — at the predicate level — not within FOUR itself.

---

## Section 1: The 5-element combined adjoint system and the σ*-fixed-point

The [predication hyperdoctrine](../objects/predication-hyperdoctrine.md), as the
[two-adjoint-systems narrative](prose/teaching/explanations/the-two-adjoint-systems.md)
records, is distinguished from Lawvere–Seely hyperdoctrines by carrying
**two parallel adjoint systems** instead of one. For every morphism $f : q \to p$
in the predicate category:

$$\exists_f^k \;\dashv\; f^* \;\dashv\; \forall_f^k \quad \text{($\leq_k$ system)}$$
$$\exists_f^t \;\dashv\; f^* \;\dashv\; \forall_f^t \quad \text{($\leq_t$ system)}$$

These five functors $\{\exists_f^k,\, \exists_f^t,\, f^*,\, \forall_f^t,\, \forall_f^k\}$
form a **centered diamond**: $f^*$ at the center, two dyad pairs as the four outer
vertices $\{\exists^k, \forall^k\}$ and $\{\exists^t, \forall^t\}$.

**Observation (σ*-action on the combined adjoint system).** The bilattice
[two-orders duality theorem](../theorems/bilattice-two-orders-duality.md) defines a
$\sigma$-conjugation functor $\sigma_* : v \mapsto \sigma \circ v$ that maps
$\leq_k$-settlings to $\leq_t$-settlings. The combined adjoint system inherits this
action. We claim:

> **The $\sigma_*$-conjugation fixes $f^*$ and swaps the two outer dyad pairs:
> $\sigma_* \circ \exists^k \circ \sigma_* = \exists^t$ and
> $\sigma_* \circ \forall^k \circ \sigma_* = \forall^t$. Consequently, $f^*$ is
> the unique $\sigma_*$-fixed point in the 5-element system.**

*Sketch.* $\sigma_*$ commutes with $f^*$: for any valuation $v$,
$(\sigma_* \circ f^*)(v)(a) = \sigma(v(f(a))) = (f^* \circ \sigma_*)(v)(a)$, so
$\sigma_* \circ f^* = f^* \circ \sigma_*$. Since $\sigma_*^2 = \mathrm{id}$, this
gives $f^* = \sigma_* \circ f^* \circ \sigma_*$ — $f^*$ is $\sigma_*$-fixed.

By the two-orders duality theorem (Step 3 of its proof), $\sigma_* \circ T_k \circ
\sigma_* = T_t$. The adjoint pair $(\exists^k_f, \forall^k_f)$ is determined by the
$\leq_k$-adjunction structure of $T_k$. Conjugating by $\sigma_*$ sends $\leq_k$
to $\leq_t$ (Step 1 of the duality theorem), so $\sigma_* \circ \exists^k_f \circ
\sigma_*$ is the $\leq_t$-left adjoint of $f^*$, which is $\exists^t_f$ by
uniqueness of adjoints. Dually $\sigma_* \circ \forall^k_f \circ \sigma_* =
\forall^t_f$. $\square$

**The 5 = 4 + 1 interpretation.** FOUR has 4 elements on which $\sigma$ acts freely
(no fixed points — $\sigma$ is a non-identity involution). The 5-element combined
adjoint system is FOUR's 4 functional "positions" $\{\exists^k, \exists^t, \forall^t,
\forall^k\}$ on which $\sigma_*$ acts freely, augmented by the one $\sigma_*$-fixed
element $f^*$. The 5th element is the **canonical fixed-point of the σ-involution
at the predicate level** — an element that FOUR itself lacks because $\sigma$ on
value-space has no fixed point.

The predication hyperdoctrine's combined adjoint system is thus
$\mathbf{FOUR} \cup \{f^*\}$ in the sense of the $\sigma_*$-orbit decomposition:
$\{f^*\}$ is the fixed-point sector and $\{\exists^k, \exists^t, \forall^t, \forall^k\}$
is the free orbit sector, the latter having the same 4-element structure as $\mathbf{FOUR}$
under $\sigma_*$.

---

## Section 2: The Frobenius algebra instance

The [settling Frobenius structure](teaching/explanations/settling-frobenius-structure.md)
equips each boundary predication system $\mathcal{B}$ with a commutative Frobenius
algebra $(Z(\mathcal{B}), \eta, \mu, \varepsilon, \Delta)$. The generating set of
operations $\{\eta, \mu, \varepsilon, \Delta\}$ has 4 members arranged in two dyad
pairs:

- $\{\eta, \varepsilon\}$: disk and dual-disk cobordisms (creation/annihilation,
  related by time-reversal / Verdier duality).
- $\{\mu, \Delta\}$: pair-of-pants and dual pair-of-pants cobordisms (merge/split,
  also related by Verdier duality).

Verdier duality for settlings (exchanging a cobordism with its time-reverse) acts on
the 4 generators by:
$$\eta \leftrightarrow \varepsilon, \qquad \mu \leftrightarrow \Delta.$$

Adding the identity morphism $\mathrm{id}_{\mathcal{B}}$ gives 5 morphisms. The
Verdier duality fixes $\mathrm{id}_{\mathcal{B}}$ and swaps the two outer dyad pairs
— the same $\sigma_*$-fixed-point pattern as in Section 1:
$$\mathbf{FOUR}_\text{Frob} \;=\; \{\eta, \mu, \varepsilon, \Delta\}, \qquad
\text{center} \;=\; \mathrm{id},$$
with Verdier acting as the Frobenius-level $\sigma_*$, fixing $\mathrm{id}$ and
freely swapping the 4-element "Frobenius diamond."

**The Frobenius compatibility as a diamond identity.** The Frobenius law
$$(\mathrm{id} \otimes \mu) \circ (\Delta \otimes \mathrm{id}) \;=\; \Delta \circ \mu
\;=\; (\mu \otimes \mathrm{id}) \circ (\mathrm{id} \otimes \Delta)$$
is precisely the claim that two paths through a diamond of cobordisms coincide. The
"lacing" $\Delta \circ \mu$ — splitting then merging — is the cobordism-level
instance of the settling's "reaching $\top$ then seeding the next $\bot$": the
comultiplication $\Delta$ is what a settled boundary does when it copies itself into
the next system's input.

---

## Section 3: Instances at each structural layer

The same 4-element diamond + 5-element extension appears at each layer:

**Value layer ($\mathbf{FOUR}$).** The motif is the bilattice itself. $\sigma$ acts
freely on the 4 elements (no fixed point). The $D_4$-rotation generator $r = \sigma\!\sim$
produces the 4-cycle $\bot \to \mathbf{f} \to \top \to \mathbf{t} \to \bot$ — the
canonical traversal. There is no "center" element at this layer: FOUR is the
4-element, σ-free-orbit layer.

**Predicate layer (hyperdoctrine).** Per Section 1: 5 functors
$\{\exists^k, \exists^t, f^*, \forall^t, \forall^k\}$, with $f^*$ as the unique
$\sigma_*$-fixed center. The standard Lawvere–Seely hyperdoctrine has one 3-element
adjoint chain; the predication hyperdoctrine has two, sharing the $\sigma_*$-fixed
center $f^*$. The extension from 3 to 5 is exactly the addition of the second system's
outer pair $\{\exists^t, \forall^t\}$.

**Cohomological layer (Frobenius algebra).** Per Section 2: 4 Frobenius generators
$\{\eta, \mu, \varepsilon, \Delta\}$ plus identity $\mathrm{id}$ at the center.
Verdier duality is the Frobenius-level $\sigma_*$. The Frobenius diamond law is the
lacing equation made algebraic.

**Bitopological layer (d-frame).** A [d-frame](../objects/d-frame.md)
$\mathbb{L} = (L_+, L_-, \mathrm{con}, \mathrm{tot})$ has 4 components in two dyad
pairs:
- $\{L_+, L_-\}$: positive/negative evidence frames (truth-axis dyad).
- $\{\mathrm{con}, \mathrm{tot}\}$: consistency/totality relations on $L_+ \times
  L_-$ (knowledge-axis dyad — $\mathrm{con}$ is downward-closed, $\mathrm{tot}$
  upward-closed, they are the order-dual of each other under bilattice conflation).

The d-frame is a coordinate-chart presentation of the same data as a distributive
bilattice (by the Jung–Rivieccio correspondence the [d-frame file](../objects/d-frame.md)
records: "three coordinate charts on the same axis"). Because the 4 components
have two distinct types — $L_\pm$ are frames while $\mathrm{con}, \mathrm{tot}$ are
relations — the diagonal $K_4$ involutions $\iota_k = \sim\!-$ and $\iota_t = \sigma$
cannot act as literal permutations of d-frame components. Instead:

- $\iota_t = \sim$ as a d-frame automorphism sends $(L_+, L_-, \mathrm{con},
  \mathrm{tot}) \mapsto (L_-, L_+, \mathrm{con}^{op}, \mathrm{tot}^{op})$ (swap
  frames, adjust relations). This preserves d-frame structure.
- $\iota_k = -$ as a d-frame operation sends $\mathrm{con} \leftrightarrow
  \mathrm{tot}$ while keeping $L_\pm$ fixed — but flips the "downward-closed vs.
  upward-closed" type, giving a dual d-frame structure rather than a d-frame.
- $\iota_t = \sigma$ (the diagonal K_4's free involution) mixes frames and
  relations under the bilattice–d-frame correspondence, and therefore does not
  correspond to a single endofunctor of $\mathbf{dFrm}$.

The d-frame instance of the bigraded diamond is therefore **implicit**: the bigraded
diamond structure lives in the bilattice from which the d-frame is derived, and the
d-frame presents the same data in a chart where the four roles appear as two different
object types. The 5th element $I$ in the d-frame instance is not a 5th component of
any d-frame but rather the **bilattice itself** (or the identity functor on the
bilattice) — the σ*-fixed carrier that generates the d-frame data and which the
d-frame presentation does not represent directly. Whether a natural categorical
formulation of "the bilattice as center of its d-frame" can be made rigorous — e.g.,
as a reflection in the 2-category of d-frames, or as a canonical section of the
bilattice–d-frame correspondence functor — is open.

**Linear-logic layer (Chu spaces).** The [predication-fibers-as-linear-logic-models
narrative](prose/teaching/explanations/predication-fibers-as-linear-logic-models.md) records
that each predication fiber is a Chu space $\mathrm{Chu}(\mathbf{L}, 0)$ on the
consistent values, with the twist product's $\top = \langle 1, 1\rangle$ the
paraconsistent extension beyond the standard Chu space. In Chu space terms:
- The 4 values of FOUR correspond to 4 Chu cells (two positive-only, two with both
  poles).
- The linear-logic connectives $\otimes$ and $\multimap$ (and their duals $\parr$ and
  $\bindnasrepma$) form 4 connective operations analogous to the 4 Frobenius generators.
- The shift operators $\uparrow$ and $\downarrow$ (the "focusing" discipline's polarity
  shifts) perform the role of $\sigma$ — rotating between positive and negative polarity.

The focusing discipline in linear logic produces a 4-step traversal (focus on
positive formula, invert to negative, focus on negative, invert to positive) that
mirrors the $r = \sigma\!\sim$ cycle $\bot \to \mathbf{f} \to \top \to \mathbf{t}
\to \bot$. Whether the linear-logic focusing framework fully captures the motif —
and whether FOUR's extra content (beyond standard Chu spaces) corresponds to the
paraconsistent extension of the focusing discipline — is open.

**2-categorical layer ($\mathbb{M} \dashv \mathbb{N}$ diamond).** The
[Emmenegger fibration 2-comonad theorem](../theorems/emmenegger-fibration-comonad.md)
establishes a 2-adjunction $\mathbb{M} \dashv \mathbb{N}$ on $\mathbf{Cat}/\mathcal{C}$
between the [Gray–Street fibration 2-monad](../theorems/gray-street-fibration-monad.md)
$\mathbb{M}$ and the Emmenegger fibration 2-comonad $\mathbb{N}$. The 2-adjunction
carries four canonical 2-cells (noted as forming "a diamond" in the Emmenegger theorem):

$$\eta_{\mathbb{M}} : 1 \Rightarrow \mathbb{M}, \quad
\mu_{\mathbb{M}} : \mathbb{M}^2 \Rightarrow \mathbb{M}, \quad
\varepsilon_{\mathbb{N}} : \mathbb{N} \Rightarrow 1, \quad
\delta_{\mathbb{N}} : \mathbb{N} \Rightarrow \mathbb{N}^2.$$

These are two dyad pairs: $\{\eta_{\mathbb{M}}, \varepsilon_{\mathbb{N}}\}$ (unit
and counit, related by adjoint-swap) and $\{\mu_{\mathbb{M}}, \delta_{\mathbb{N}}\}$
(multiplication and comultiplication, also related by adjoint-swap). The center is
the identity 2-cell $\mathrm{id}$. This is the Level-3 instance of the motif.
(The [KZ-diamond strict commutation theorem](../theorems/kz-diamond-strict-commutation.md)
establishes a separate strict distributive law between the closure 2-monad
$\mathrm{Cl}$ and $\mathbb{N}$; that theorem concerns the interaction of two
different 2-functors on disjoint data, not the four-element shadow of the motif.)

---

## Section 4: A proposed unifying structure

**Definition (bigraded diamond).** A *bigraded diamond* is a triple
$(X, \iota_k, \iota_t)$ where:
- $X$ is a 5-element set $\{A, B, C, D, I\}$.
- $\iota_k : X \to X$ and $\iota_t : X \to X$ are involutions.
- $\iota_k$ fixes $I$ and swaps $A \leftrightarrow C$ and $B \leftrightarrow D$.
- $\iota_t$ fixes $I$ and swaps $A \leftrightarrow B$ and $C \leftrightarrow D$.
- The two involutions commute: $\iota_k \circ \iota_t = \iota_t \circ \iota_k$.

The **4-element shadow** of a bigraded diamond is the set $\{A, B, C, D\}$ with the
two involutions' actions restricted. The shadow has $\iota_k$ swapping $(A,C)$ and
$(B,D)$, and $\iota_t$ swapping $(A,B)$ and $(C,D)$. This is the free $K_4$ action on a 4-element set via two free commuting involutions
— the **diagonal Klein four action** on FOUR with $\iota_k = \sim\!-$ and $\iota_t
= \sigma$ (not the standard bilattice $K_4 = \langle \sim, - \rangle$, whose
generators have fixed points; see the Remark at the end of this section).

**The σ*-involution as the bigraded diamond's $\iota_t$.** At the predicate layer:
- $I = f^*$.
- $A = \exists^k$, $B = \exists^t$, $C = \forall^k$, $D = \forall^t$.
- $\iota_t$ = the $\sigma_*$-action: fixes $f^*$, swaps $\exists^k \leftrightarrow
  \exists^t$ and $\forall^k \leftrightarrow \forall^t$. This is the axis-swap $A
  \leftrightarrow B$ and $C \leftrightarrow D$. ✓
- $\iota_k$ = the operation that swaps the existential/universal role within each
  axis: swaps $\exists^k \leftrightarrow \forall^k$ and $\exists^t \leftrightarrow
  \forall^t$. (This is Verdier duality restricted to the adjoint functors.) This is
  the direction-swap $A \leftrightarrow C$ and $B \leftrightarrow D$. ✓

The two involutions commute: $\sigma_*$ and Verdier duality commute on the combined
adjoint system (σ* acts on the axis label, Verdier acts on the ∃/∀ polarity; these
are independent). $\checkmark$ (Sketch: $\sigma_*$ maps $\leq_k$-structure to
$\leq_t$-structure; Verdier flips ∃/∀ within each axis. These act on orthogonal
labels and therefore commute.)

**Instances as bigraded diamonds.**

| Layer | $I$ | $\{A,C\}$ | $\{B,D\}$ | $\iota_k$ | $\iota_t$ |
|---|---|---|---|---|---|
| Predicate | $f^*$ | $\{\exists^k, \forall^k\}$ | $\{\exists^t, \forall^t\}$ | Verdier | $\sigma_*$ |
| Frobenius | $\mathrm{id}$ | $\{\eta, \varepsilon\}$ | $\{\mu, \Delta\}$ | Verdier | transpose (pair-of-pants flip) |
| 2-cat ($\mathbb{M} \dashv \mathbb{N}$ diamond) | $\mathrm{id}$ | $\{\eta_{\mathbb{M}}, \varepsilon_{\mathbb{N}}\}$ | $\{\mu_{\mathbb{M}}, \delta_{\mathbb{N}}\}$ | adjoint-swap | unit↔mult |

Whether the d-frame and linear-logic instances fit the same definition — i.e., whether
a natural choice of $I$, $\iota_k$, $\iota_t$ makes each a bigraded diamond — is
open.

**The 4-element shadow as FOUR.** The shadow $\{A,B,C,D\}$ under $\iota_k$ and
$\iota_t$ is FOUR under the **diagonal $K_4$ involutions**, not the standard
Klein-four generators:
- $A = \bot$, $B = \mathbf{f}$, $C = \top$, $D = \mathbf{t}$.
- $\iota_k = \sim\!-$ (the composition of negation and conflation): maps
  $\bot \mapsto \top, \top \mapsto \bot, \mathbf{f} \mapsto \mathbf{t}, \mathbf{t}
  \mapsto \mathbf{f}$ — swaps $(A, C)$ and $(B, D)$. ✓
- $\iota_t = \sigma$ (the order-swap involution): maps $\bot \mapsto \mathbf{f},
  \mathbf{f} \mapsto \bot, \top \mapsto \mathbf{t}, \mathbf{t} \mapsto \top$ —
  swaps $(A, B)$ and $(C, D)$. ✓

This identifies the value-layer diamond FOUR as the **4-element shadow** of a
bigraded diamond, with the 5th element $I$ (the center, the $\sigma_*$-fixed point)
absent at the value layer and present at every higher layer.

**Remark: the two $K_4$ subgroups of $D_4$.** The $D_4$ symmetry group of FOUR
contains two Klein-four subgroups. The **standard $K_4 = \langle \sim, - \rangle$**
is the bilattice's canonical symmetry group (established in the [Klein-four symmetry
concept](teaching/explanations/klein-four-symmetry.md)), but $\sim$ fixes $\bot$ and $\top$
while $-$ fixes $\mathbf{t}$ and $\mathbf{f}$ — neither acts freely on FOUR. The
**diagonal $K_4 = \langle \sigma, \sim\!- \rangle = \{e, \sigma, \sim\!-,
\sigma\!\circ\!\sim\!-\}$** has all three non-identity elements acting freely on FOUR
(zero fixed points each). The bigraded diamond's shadow involutions $\iota_k$ and
$\iota_t$ must be free involutions, so they come from the diagonal $K_4$, not the
standard $K_4$. The diagonal $K_4 = \langle s, r^2 \rangle$ in $D_4$'s standard
presentation ($r = \sigma\!\sim$, $s = \sigma$), where $r^2 = \sim\!-$ is the
unique central element of $D_4$. The traversal 4-cycle $r = \sigma\!\sim$ is not in
the diagonal $K_4$ (it has order 4); it relates to the bigraded diamond by $r^2 =
\iota_k$, so one full traversal cycle $r^4 = e$ corresponds to applying $\iota_k$
twice.

**The lacing as the bigraded diamond's $\iota_k \circ \iota_t$ composite.** The
composite $\iota_k \circ \iota_t$ is itself an involution and acts on the 4-element
shadow by $A \to D$, $B \to C$, $C \to B$, $D \to A$ — the "anti-diagonal flip." On
FOUR, $\iota_k \circ \iota_t = (\sim\!-) \circ \sigma = \sim\!-\sigma$ maps $\bot
\mapsto \mathbf{t}$, $\mathbf{f} \mapsto \top$, $\top \mapsto \mathbf{f}$,
$\mathbf{t} \mapsto \bot$ — the anti-diagonal element $r^2 s \in D_4$, swapping
$(\bot, \mathbf{t})$ and $(\mathbf{f}, \top)$. (Note: $\sim\!-\sigma$ is distinct
from both $\sim\!-$ and $\sigma$; all three are elements of the diagonal $K_4$.)
At the predicate layer, $\iota_k \circ \iota_t = \mathrm{Verdier} \circ \sigma_*$
maps $\exists^k \mapsto \forall^t$ and $\exists^t \mapsto \forall^k$ — the
"cross-axis swap" that exchanges existential quantification in one order with
universal quantification in the other. This cross-axis swap is the predicate-level
analog of the causal lacing: the knowledge-existential of the cause becomes the
truth-universal of the effect, and vice versa.

---

## Section 5: How the center $I$ emerges — a structural observation

At the value layer, FOUR has no $\sigma$-fixed point: $\sigma$ acts freely, so the
value-layer bigraded diamond is a pure 4-element free orbit with no center. Every
higher-layer bigraded diamond has a center $I$. The question is what categorical
mechanism produces $I$ when going from values to predicates.

**Observation (center emergence via lifting free orbits to fixed-point sectors).**
The passage from values to predicates is the passage from elements of $\mathbf{FOUR}$
to functors on the predication presheaf category. When the $\sigma_*$-action lifts
from values to presheaves, the lifting carries additional structure:

1. At the value level, the $\sigma$-action has a **free orbit** of size 4 (all of
   FOUR) and **no fixed points**.
2. At the presheaf level, the $\sigma_*$-action's fixed-point sector is non-empty.
   Specifically, $f^*$ is fixed because $\sigma_* \circ f^* = f^* \circ \sigma_*$
   (as proved in Section 1 — reindexing commutes with value-space conjugation).
3. Therefore the $\sigma_*$-orbit decomposition of the combined adjoint system
   $\{\exists^k, \exists^t, f^*, \forall^t, \forall^k\}$ has:
   - A free sector $\{\exists^k, \exists^t, \forall^t, \forall^k\}$ of size 4 (the
     bigraded diamond's shadow, isomorphic to FOUR's free orbit), and
   - A fixed-point sector $\{f^*\}$ of size 1 (the center $I$).

**The center $I$ is the categorical trace of the lift.** When an involution lifts from
a "ground" level to a "structure" level, the reindexing functor $f^*$ (or its
analog at each layer — $\mathrm{id}$ in the Frobenius and 2-categorical instances)
sits at the junction between the ground level and the structure level. It commutes
with the involution because it is the universal functor for passing between the two
levels; and this commutativity is precisely "being fixed." The center is thus not an
arbitrary element but the **canonical bridge object** between the two levels, and it
is $\iota_t$-fixed (and $\iota_k$-fixed) because bridges are intrinsically symmetric
with respect to the passage they mediate.

**Theorem (Bigraded diamond at each level).** For each $n \in \{1, 2, 3\}$, the five
canonical structure maps of the predication category at level $n$ constitute a bigraded
diamond $(\mathcal{X}^{(n)}, \iota_k^{(n)}, \iota_t^{(n)})$ with a unique center $I_n$
fixed by both involutions and a free diagonal $K_4$-orbit on the remaining four elements.

*Proof for $n = 1$.* Let $\mathcal{X}^{(1)} = \{\exists^k_f, \exists^t_f, f^*,
\forall^t_f, \forall^k_f\}$ with $\iota_k^{(1)} = \mathrm{Verdier}$ and
$\iota_t^{(1)} = \sigma_*$.

**$f^*$ is fixed by both involutions.**
For $\sigma_*$: $(\sigma_* \circ f^*)(v)(a) = \sigma(v(f(a))) = (f^* \circ \sigma_*)(v)(a)$
for all valuations $v$ and predicates $a$ — reindexing commutes with value-conjugation.
For Verdier: $f^*$ is the middle element of both adjoint triples
$\exists^k_f \dashv f^* \dashv \forall^k_f$ and $\exists^t_f \dashv f^* \dashv
\forall^t_f$. Verdier duality is defined as time-reversal; $f^*$ (reindexing along a
spatial morphism $f$) carries no temporal direction, so $\mathrm{Verdier}(f^*) = f^*$.
Hence $I_1 := f^*$ is fixed by both $\iota_k^{(1)}$ and $\iota_t^{(1)}$.

**The outer four form a free diagonal $K_4$-orbit.**
$\sigma_*(\exists^k_f) = \exists^t_f \neq \exists^k_f$ since the $k$- and $t$-adjoint
systems are distinct (they arise from distinct bilattice orders, by the
[two-orders duality theorem](../theorems/bilattice-two-orders-duality.md)).
$\mathrm{Verdier}(\exists^k_f) = \forall^k_f \neq \exists^k_f$ since left and right
adjoints are distinct in any predication hyperdoctrine with non-trivial fibers.
Every non-identity element of $\langle \sigma_*, \mathrm{Verdier} \rangle \cong K_4$
therefore moves each outer element — the orbit is free and of size 4.

**The involutions commute on the shadow.**
$\sigma_*$ acts on the order-axis label ($k \leftrightarrow t$); Verdier acts on the
direction label ($\exists \leftrightarrow \forall$). These are orthogonal attributes,
so $\sigma_* \circ \mathrm{Verdier} = \mathrm{Verdier} \circ \sigma_*$ on
$\{\exists^k_f, \exists^t_f, \forall^t_f, \forall^k_f\}$.

All conditions of the bigraded diamond definition (Section 4) are satisfied. $\square$

*Proof for $n = 2, 3$.* The center $I_n$ is the identity morphism (level 2) or
identity 2-cell (level 3). Any involution $\phi$ defined by a structural symmetry
satisfies $\phi(\mathrm{id}_A) = \mathrm{id}_{\phi(A)}$; since $I_n$ is the identity on
a structurally invariant object (the settled boundary system at level 2; the identity
2-functor at level 3), $\phi(I_n) = I_n$ for all structural involutions. Explicitly:
the identity cobordism (cylinder) is its own Verdier dual; the identity 2-cell is its
own adjoint-swap and unit/mult-swap dual.

Freeness of $\iota_k^{(n)}$ and $\iota_t^{(n)}$ on the 4-element shadow is proved in
sub-question 6(a): at level 2, the Frobenius generators are distinguished by their
(source-boundary, target-boundary) cobordism types; at level 3, the four $\mathbb{M}
\dashv \mathbb{N}$ 2-cells are distinguished by their (source 2-functor, target
2-functor) pairs. In both cases no involution fixes any shadow element.

Commutativity at each level follows from orthogonality: at level 2, Verdier acts on
cobordism direction and Frobenius transpose acts on arity — orthogonal; at level 3,
adjoint-swap acts on the monad/comonad axis and unit/mult-swap acts on the arity axis
— orthogonal. All bigraded diamond conditions are satisfied. $\square$

The value layer is the exception precisely because it IS the ground level — no
lifting has occurred, so no bridge functor exists, and no center appears.

**The tower conjecture.** The center-emergence mechanism iterates. $I_1 = f^*$
appears at the predicate level. But $f^*$ is itself a member of a free diagonal $K_4$
orbit at the predicate level. Does a center $I_2$ appear at the cohomological level
(level 2), with $f^*$ as one of four shadow objects?

The Frobenius layer (Section 2) says: yes. The Frobenius generators $\{\eta, \mu,
\varepsilon, \Delta\}$ form the shadow at level 2, and the center $I_2 =
\mathrm{id}_{f^*}$ is the identity morphism on $f^*$ — the unique element among the
five Frobenius morphisms that is fixed by both Verdier duality and the Frobenius
transpose. The level-2 bigraded diamond's diagonal $K_4$ acts on the generators:
$\iota_k^{(2)} = $ Verdier (swaps $\eta \leftrightarrow \varepsilon$ and $\mu
\leftrightarrow \Delta$) and $\iota_t^{(2)} = $ Frobenius transpose (swaps
$\eta \leftrightarrow \mu$ and $\varepsilon \leftrightarrow \Delta$). Both are free
on the shadow $\{\eta, \mu, \varepsilon, \Delta\}$, and both fix $\mathrm{id}$.

The $\mathbb{M} \dashv \mathbb{N}$ 2-adjunction on $\mathbf{Cat}/\mathcal{C}$ gives
level 3 (per the [Emmenegger fibration 2-comonad theorem](../theorems/emmenegger-fibration-comonad.md),
which explicitly notes these form "a diamond"). Define:
- $A = \eta_{\mathbb{M}} : 1 \Rightarrow \mathbb{M}$ (monad unit),
- $B = \mu_{\mathbb{M}} : \mathbb{M}^2 \Rightarrow \mathbb{M}$ (monad multiplication),
- $C = \varepsilon_{\mathbb{N}} : \mathbb{N} \Rightarrow 1$ (comonad counit),
- $D = \delta_{\mathbb{N}} : \mathbb{N} \Rightarrow \mathbb{N}^2$ (comonad comultiplication),
- $I_3 = \mathrm{id}$ (the identity 2-cell).

The diagonal $K_4$ at level 3: $\iota_k^{(3)} = $ adjoint-swap (swaps
$\eta_{\mathbb{M}} \leftrightarrow \varepsilon_{\mathbb{N}}$ and $\mu_{\mathbb{M}}
\leftrightarrow \delta_{\mathbb{N}}$, i.e., monad-side $\leftrightarrow$ comonad-side);
$\iota_t^{(3)} = $ unit/mult-swap (swaps $\eta_{\mathbb{M}} \leftrightarrow
\mu_{\mathbb{M}}$ and $\varepsilon_{\mathbb{N}} \leftrightarrow \delta_{\mathbb{N}}$,
i.e., first-order $\leftrightarrow$ second-order within each side). Both are free on
the shadow $\{A,B,C,D\}$, both fix $\mathrm{id}$.

**The center sequence.** The centers form a sequence:
$$I_0 = \text{(nothing)}, \quad I_1 = f^*, \quad I_2 = \mathrm{id}_{Z(\mathcal{B})},
\quad I_3 = \mathrm{id}_{2\text{-cell}},$$
where each $I_n$ is the identity element of the relevant categorical structure at
level $n$. This sequence is morally the **globular identity tower** rooted at $f^*$
(each center is the "identity on the previous center's structure"), but the
identification is not strict in the $(\infty,1)$-categorical sense: the centers live
in different ambient structures (functors at level 1, morphisms in a cobordism
category at level 2, 2-cells of a 2-adjunction at level 3), so
$I_2 \neq \mathrm{id}_{f^*}$ as a natural transformation $f^* \Rightarrow f^*$.
Formalizing the globular identity tower claim requires either embedding all levels in
a common $(\infty,1)$-category or identifying the levels with categorical dimensions
of a single ambient structure.

**Towers:  summary.**

| Level $n$ | Shadow | Center $I_n$ | $\iota_k^{(n)}$ | $\iota_t^{(n)}$ |
|---|---|---|---|---|
| 0 (value) | $\{\bot, \mathbf{f}, \top, \mathbf{t}\}$ | — | $\sim\!-$ | $\sigma$ |
| 1 (predicate) | $\{\exists^k, \exists^t, \forall^t, \forall^k\}$ | $f^*$ | Verdier | $\sigma_*$ |
| 2 (cohomological) | $\{\eta, \mu, \varepsilon, \Delta\}$ | $\mathrm{id}_{Z(\mathcal{B})}$ | Verdier | transpose |
| 3 (2-categorical) | $\{\eta_{\mathbb{M}}, \mu_{\mathbb{M}}, \varepsilon_{\mathbb{N}}, \delta_{\mathbb{N}}\}$ | $\mathrm{id}$ | adjoint-swap | unit↔mult |

At every level $n \geq 1$, the abstract pattern holds: $\iota_t^{(n)}$ is an
"axis-type" involution (the $\sigma$-like or adjoint-swap involution — it identifies
a structural pairing between the two members of each shadow dyad) and $\iota_k^{(n)}$
is a "direction-reversal" involution (the Verdier-like involution — it swaps across
the two dyad pairs). At level 1, these are $\sigma_*$ and Verdier on the adjoint
system. At level 2, these are cobordism-transpose and Verdier time-reversal on
the Frobenius generators. At level 3, these are unit/mult-swap and adjoint-swap on
the $\mathbb{M} \dashv \mathbb{N}$ 2-cells. In each case $\iota_k$ is the central
element $r^2 = \sim\!-$ of $D_4$ lifted to level $n$.

**Regime depth.** The settling's closure ordinal $\kappa$ determines how many levels
of the tower carry non-trivial cohomological content. The
[regime-chain-order theorem](../theorems/regime-chain-order.md) establishes that the
strict and Scott-continuous regimes have $H^1 = 0$ for the settling-associated sheaf.
This means:

- **Strict regime ($\kappa < \omega$).** The level-2 bigraded diamond (the Frobenius
  layer) is cohomologically trivial: the four Frobenius generators all land in the
  same cohomology class. The tower's non-trivial content terminates at level 1.
- **Scott-continuous regime ($\kappa = \omega$).** Same triviality: $H^1 = 0$, tower
  terminates at level 1.
- **Transfinite-bounded regime ($\omega < \kappa < \omega_1$).** $H^1 \neq 0$: the
  Frobenius level carries genuine content, non-trivial at level 2.
- **Aperiodic regime ($\kappa \geq \omega_1$).** $H^1 \neq 0$; additionally, the
  level-3 bigraded diamond is **fully active**: $\mathbb{M}$ and $\mathbb{N}$ remain
  genuinely lax-idempotent throughout the $\omega_1$-long orbit, so the KZ diamond
  2-cells are non-trivializing (they never collapse to isomorphisms). Tower depth
  $\geq 3$ is proved below. Whether the tower continues past level 3 depends on
  identifying level-4 and higher bigraded diamonds — not yet established in the corpus.

**Proposition (Level-3 tower activation).** The level-3 bigraded diamond
$\{\eta_{\mathbb{M}}, \mu_{\mathbb{M}}, \varepsilon_{\mathbb{N}}, \delta_{\mathbb{N}}\}$
in $\mathbf{T}(\mathcal{C}, \lambda)$ carries:
- **Trivial content** (all four 2-cells are isomorphisms; $\mathbf{T}$ collapses to
  a 1-category) iff $\kappa \leq \omega$ — strict and Scott-continuous regimes.
- **Non-trivial content** (at least one 2-cell is a non-invertible lax natural
  transformation) iff $\kappa > \omega$ — the upper two regimes.
- **Fully active content** (the 2-cells remain non-invertible throughout the orbit;
  $\mathbf{T}$ is genuinely 2-dimensional for all $\tau < \kappa$) iff $\kappa \geq
  \omega_1$ — the aperiodic regime only.

*Proof.* Directly from the [four-regime-dichotomy theorem](../theorems/four-regime-dichotomy.md)'s
KZ diamond section. $\mathbb{M}$ and $\mathbb{N}$ are strict-idempotent iff $\kappa
\leq \omega$, which is precisely the condition that $\mathbf{T}(\mathcal{C}, \lambda)$
collapses to $\lambda$ as a 1-category — all canonical 2-cells become identities,
hence isomorphisms: trivial content. In the upper two regimes ($\kappa > \omega$),
$\mathbb{M}$ and $\mathbb{N}$ are genuinely lax-idempotent, so the 2-cells are
non-invertible: non-trivial content. The aperiodic case ($\kappa \geq \omega_1$)
additionally has the orbit extending through $\omega_1$-many stages without
stabilization; the lax non-invertibility therefore persists throughout: fully active.
For the transfinite-bounded case ($\omega < \kappa < \omega_1$), $\mathbf{T}(\mathcal{C},
\lambda)$ is genuinely 2-dimensional in the window $[0, \kappa)$ but stabilizes at
$\kappa$: non-trivial but bounded. $\square$

This distinguishes all four regimes at the level-3 tower: strict/Scott-continuous
(trivial), transfinite-bounded (non-trivial, bounded), aperiodic (fully active). The
level-3 tower is not a binary invariant: it has three states. Compare with the level-2
invariant $H^1$, which is binary (zero/non-zero) and separates only lower-two from
upper-two. The level-3 characterization is finer: it separates the aperiodic regime
from the transfinite-bounded regime by whether the non-triviality persists.

**Proposition (Level-3 invariant as cofinality of $L_{\mathrm{ns}}(\kappa)$ in
$\omega_1$).**
The three-state level-3 characterization is captured entirely by the cofinality of
the NSC-firing set $L_{\mathrm{ns}}(\kappa)$ within $\omega_1$:

- **$\ell_3 = 0$:** $L_{\mathrm{ns}}(\kappa) = \emptyset$ iff $\kappa \leq \omega$
  (trivial; strict and Scott-continuous regimes).
- **$\ell_3 = 1$:** $L_{\mathrm{ns}}(\kappa) \neq \emptyset$ but not cofinal in
  $\omega_1$ iff $\omega < \kappa < \omega_1$ (bounded; transfinite-bounded regime).
- **$\ell_3 = 2$:** $L_{\mathrm{ns}}(\kappa)$ cofinal in $\omega_1$ iff $\kappa \geq
  \omega_1$ (fully active; aperiodic regime).

In particular, $H^1 = 0 \iff \ell_3 = 0$, and $H^1 \neq 0$ splits as $\ell_3 = 1$
(transfinite-bounded) vs.\ $\ell_3 = 2$ (aperiodic). The level-3 invariant $\ell_3$
is a ternary refinement of the binary $H^1$ invariant.

*Proof.*
$\ell_3 = 0$: by the [H¹-generators theorem](../theorems/transfinite-bounded-regime-h1-generators.md),
$L_{\mathrm{ns}}(\kappa) = \emptyset \iff H^1 = 0 \iff \kappa \leq \omega$.

$\ell_3 = 1$: in the transfinite-bounded regime $\omega < \kappa < \omega_1$, so
$L_{\mathrm{ns}}(\kappa) \subseteq \kappa < \omega_1$; thus $L_{\mathrm{ns}}(\kappa)$
is bounded below $\omega_1$.

$\ell_3 = 2$: suppose for contradiction that $\kappa \geq \omega_1$ but
$L_{\mathrm{ns}}(\kappa)$ is bounded below $\omega_1$, i.e., there exists $\alpha <
\omega_1$ with all NSC firings occurring before $\alpha$. Then for all $\tau \geq
\alpha$, the closure operator fires only Scott-continuously. By
[transfinite settling convergence](../theorems/transfinite-settling-convergence.md),
each Scott-continuous segment stabilizes within $\omega$ further steps; hence the
settling stabilizes by ordinal $\alpha + \omega \leq \alpha \cdot 2 < \omega_1$,
giving $\kappa < \omega_1$ — contradicting $\kappa \geq \omega_1$. Therefore no such
bound $\alpha$ exists: $L_{\mathrm{ns}}(\kappa)$ is cofinal in $\omega_1$. $\square$

**Remark (the invariant $\ell_3$ is not a new cohomology group).** $\ell_3$ is a
cofinality property of $H^1$'s generator index set $L_{\mathrm{ns}}(\kappa)$, not the
rank or cardinality of $H^1$ itself. The
[settling-cohomology-vanishes-above-degree-1 theorem](../theorems/settling-cohomology-vanishes-above-degree-1.md)
is not contradicted: $\ell_3$ lives at a meta-level above the sheaf cohomology.

**Theorem (general cofinality of $L_{\mathrm{ns}}(\kappa)$).** For any regular
uncountable cardinal $\lambda$:
$$L_{\mathrm{ns}}(\kappa) \text{ is cofinal in } \lambda \;\iff\; \kappa \geq \lambda.$$

*Proof.* ($\Rightarrow$) If $L_{\mathrm{ns}}(\kappa)$ is cofinal in $\lambda$, then
$L_{\mathrm{ns}}(\kappa)$ contains elements arbitrarily close to $\lambda$ from below;
hence $\sup L_{\mathrm{ns}}(\kappa) \geq \lambda$, so $\kappa \geq \lambda$.
($\Leftarrow$) Suppose $\kappa \geq \lambda$ but $L_{\mathrm{ns}}(\kappa)$ is bounded
below $\lambda$: there exists $\alpha < \lambda$ with no NSC firings above $\alpha$.
For $\tau \geq \alpha$ the closure fires only Scott-continuously; by
[transfinite settling convergence](../theorems/transfinite-settling-convergence.md),
the settling stabilizes within $\omega$ further steps, giving $\kappa \leq \alpha +
\omega$. Since $\lambda$ is an uncountable regular cardinal, $\alpha < \lambda$ implies
$\alpha + \omega < \lambda$ (uncountable regulars absorb countable additions), so
$\kappa \leq \alpha + \omega < \lambda$ — contradicting $\kappa \geq \lambda$.
$\square$

**The cardinal tower.** Applying the general cofinality theorem to each
$\lambda = \omega_n$ ($n \geq 1$) yields a tower of binary invariants
$\ell_{n+2} := [\kappa \geq \omega_n]$. Tower depth under this measure is:

| $\kappa$ range | Active levels | Cardinal depth |
|---|---|---|
| $[0, \omega)$ | 1 | 1 |
| $[\omega, \omega_1)$ | 1, 2 | 2 |
| $[\omega_1, \omega_2)$ | 1, 2, 3 | 3 |
| $[\omega_2, \omega_3)$ | 1, 2, 3, 4 | 4 |
| $[\omega_n, \omega_{n+1})$ | $1, \ldots, n+2$ | $n+2$ |
| $[\omega_\omega, \cdot)$ | all | $\omega$ |

Cardinal depth = $n+2$ for $\kappa \in [\omega_n, \omega_{n+1})$; depth $\omega$ for
$\kappa \geq \omega_\omega$. This is the **aleph-rank** of $\kappa$ (the number of
aleph-thresholds $\kappa$ exceeds), and it is **provable from the existing corpus**.

**The gap: cardinal depth vs. ordinal depth.** The tower conjecture claims
$d(\kappa) \geq \omega_1$ in the aperiodic case — ordinal depth of order $\omega_1$.
But the cardinal tower gives depth 3 for $\kappa \in [\omega_1, \omega_2)$. These
measure different things:

- **Cardinal depth** (proved) counts how many aleph-thresholds $\kappa$ exceeds; it
  is always a natural number or $\omega$.
- **Ordinal depth** (conjectured) measures the ordinal complexity of the settling's
  *categorical structure* — how many distinct ordinal stages carry genuinely new
  bigraded diamond content. For this to reach $\omega_1$, the tower would need to be
  indexed not by natural numbers (level 0, 1, 2, 3, ...) but by ordinals, with each
  $\tau < \kappa$ contributing a distinct bigraded diamond at "level $\tau$".

The natural candidate: in the temporal 2-category $\mathbf{T}(\mathcal{C}, \lambda)$,
each ordinal stage $\tau < \kappa$ carries a local KZ diamond structure — the
restriction of $\{\eta_{\mathbb{M}}, \mu_{\mathbb{M}}, \varepsilon_{\mathbb{N}},
\delta_{\mathbb{N}}\}$ to stage $\tau$. The **ordinal-indexed tower** would consist of
these stage-local bigraded diamonds, indexed by $[0, \kappa)$.

**Theorem (stage-local bigraded diamonds are pairwise non-isomorphic; ordinal tower
depth equals closure ordinal).**

(i) For $\tau \neq \tau'$ with $\tau, \tau' < \kappa$, the stage-$\tau$ and
stage-$\tau'$ bigraded diamonds are non-isomorphic.

(ii) The ordinal-indexed tower has depth exactly $\kappa$: the stage-$\tau$ bigraded
diamond is non-trivial for $\tau < \kappa$ and trivial for $\tau \geq \kappa$.

*Proof.*
(i) The center of the stage-$\tau$ bigraded diamond is $v_\tau$ (the predication state
at time $\tau$). Since $\kappa$ is the *first* ordinal of convergence of the settling,
the sequence $(v_\tau)_{\tau < \kappa}$ is strictly $\leq_k$-ascending: $v_\tau
<_k v_{\tau+1}$ for every $\tau < \kappa$. Hence $v_\tau \neq v_{\tau'}$ for $\tau
\neq \tau' < \kappa$. Since any bigraded diamond isomorphism must send center to
center, distinct centers imply non-isomorphic bigraded diamonds.

(ii) The unit of the closure 2-monad $\eta_{\mathrm{Cl}}(v_\tau) : v_\tau \to
\mathrm{Cl}(v_\tau) = v_{\tau+1}$ is an isomorphism iff $v_{\tau+1} = v_\tau$ iff
the settling has converged at $\tau$ iff $\tau \geq \kappa$. For $\tau < \kappa$: the
unit is not an isomorphism — the stage-$\tau$ bigraded diamond carries non-trivial
content (the closure step is a genuine non-invertible lax morphism). For $\tau \geq
\kappa$: $v_\tau = v_\kappa$ for all $\tau \geq \kappa$, so the unit is the identity
— the stage-$\tau$ diamond is trivial. Hence the non-trivial stages are exactly $[0,
\kappa)$, and the depth is $\kappa$. $\square$

**Corollary (tower conjecture proved for the ordinal-depth claim).** The ordinal tower
depth $d(\kappa) = \kappa$. In the transfinite-bounded regime ($\omega < \kappa <
\omega_1$): $d = \kappa > \omega$, confirming $d \geq \omega$. In the aperiodic regime
($\kappa \geq \omega_1$): $d = \kappa \geq \omega_1$, confirming $d \geq \omega_1$.
In the strict and Scott-continuous regimes ($\kappa \leq \omega$): $d = \kappa \leq
\omega$, confirming $d < \omega$ (or $d = \omega$ for Scott-continuous — the boundary
case that was previously ambiguous in the conjecture statement).

**The two towers reconciled.** The *cardinal tower* (depth = aleph-rank of $\kappa$,
always a natural number or $\omega$, proved from the general cofinality theorem) counts
how many aleph-thresholds $\kappa$ exceeds. The *ordinal tower* (depth = $\kappa$
itself, proved from the settling's strict ascent) counts how many stage-local bigraded
diamonds exist. These measure genuinely different things: cardinal depth measures
*which categorical layers are activated*; ordinal depth measures *how many distinct
diamond instances live at the KZ level*. The tower conjecture's "$d = \kappa$" refers
to ordinal depth. The cardinal tower is the coarser invariant: cardinal depth = the
number of distinct aleph-threshold crossings in the ordinal tower's index set.

**Investigation: Is there a level-4 bigraded diamond?**

The ordinal tower theorem resolves one part of the "beyond level 3" question: the
ordinal depth $d(\kappa) = \kappa$ is entirely accounted for by $\kappa$-many
stage-local level-3 bigraded diamonds. Ordinal depth requires no level-4 structure.
The genuine open question is whether a **level-4 bigraded diamond** — consisting of
3-cells, at the next categorical dimension above the level-3 shadow — exists in the
tower.

**The required framework: temporal 3-category.**
The current temporal 2-category $\mathbf{T}(\mathcal{C}, \lambda)$ is a 2-category;
its highest cells are 2-cells. For level 4, we need a *temporal 3-category*
$\mathbf{T}^3(\mathcal{C}, \lambda)$ whose 3-cells carry the next layer of coherence.
No such structure is currently defined in the corpus.

**Candidate level-4 shadow.**
Following the established pattern (each level $n$ shadow consists of 4 specific
$n$-dimensional cells organized by two binary axes), the level-4 candidates are the
**adjunction triangle modifications** for the $\mathbb{M} \dashv \mathbb{N}$
pseudo-adjunction in the tricategorical setting. Concretely, in a Gray-category
enhancement of $\mathbf{T}(\mathcal{C}, \lambda)$, the triangle identities of the
$\mathbb{M} \dashv \mathbb{N}$ 2-adjunction hold up to invertible 3-cells rather
than strictly. These 3-cells are:
$$\Sigma_L^{\mathbb{M}},\ \Sigma_R^{\mathbb{M}},\ \Sigma_L^{\mathbb{N}},\
\Sigma_R^{\mathbb{N}}$$
where $\Sigma_L^{\mathbb{M}}$ (resp.\ $\Sigma_R^{\mathbb{M}}$) witnesses the
left (resp.\ right) triangle identity for $\mathbb{M}$, and similarly for
$\mathbb{N}$. The proposed involutions:
$$\iota_k^{(4)} = \text{adjoint-swap}:\ \{\Sigma_\bullet^{\mathbb{M}}\}
\leftrightarrow \{\Sigma_\bullet^{\mathbb{N}}\},$$
$$\iota_t^{(4)} = \text{left/right-swap}:\ \Sigma_L \leftrightarrow \Sigma_R
\text{ within each side.}$$
Center $I_4 = \mathrm{id}$ (identity modification). Freeness: the four modifications
are distinct (they witness different triangle identities for different functors). Commutativity: adjoint-swap acts on the $\mathbb{M}/\mathbb{N}$ axis; left/right-swap acts on the triangle-identity axis — orthogonal.

**Activation threshold.**
By analogy with levels 2 and 3 (activated by aleph-thresholds $\omega$ and
$\omega_1$ respectively) and the general cofinality theorem, the level-4 bigraded
diamond would be activated at $\kappa \geq \omega_2$. Trivial content (strict
2-adjunction, triangle identities hold without modification data) corresponds to
$\kappa < \omega_2$; non-trivial content to $\kappa \geq \omega_2$. This would
require subdividing the aperiodic regime ($\kappa \geq \omega_1$) into:
- *weakly aperiodic*: $\omega_1 \leq \kappa < \omega_2$ (level 3 active, level 4 trivial);
- *doubly aperiodic*: $\kappa \geq \omega_2$ (level 4 active).

**The key obstacle.**
The level-3 bigraded diamond arises from the $\mathbb{M} \dashv \mathbb{N}$
**2-adjunction** in $\mathbf{Cat}/\mathcal{C}$ — a strict 2-adjunction, not a
pseudo-adjunction in a tricategory. In a strict 2-adjunction, all triangle
identities hold as equations, so the modifications $\Sigma_\bullet$ are all
identities. Level-4 content requires the adjunction to be a *pseudo-adjunction* in a
Gray-category (i.e., the triangle identities hold only up to coherence 3-cells). This
is a genuine weakening: the current corpus's $\mathbb{M} \dashv \mathbb{N}$ is strict.

**Abstract pattern observation.**
At each level $n$, the bigraded diamond arises from a *KZ $n$-adjunction*: a
lax-idempotent adjunction at categorical dimension $n$. Level 1 uses the KZ
1-adjunction (adjoint functors); level 2 the KZ 2-adjunction structure of the
Frobenius data; level 3 the KZ 2-adjunction $\mathbb{M} \dashv \mathbb{N}$ itself.
Level 4 would require a **KZ 3-adjunction** — a lax-idempotent pseudo-adjunction
in a Gray-category. Whether the predication category structure naturally admits such
a 3-adjunction is the core of the level-4 question.

**What the four-regime-dichotomy tells us.**
The [four-regime-dichotomy theorem](../theorems/four-regime-dichotomy.md) draws
exactly two boundaries — $\omega$ and $\omega_1$ — determined by cofinality
properties of the state space. It classifies $\kappa \in [\omega_1, \omega_2)$
and $\kappa \geq \omega_2$ identically as "aperiodic." The four regimes are
therefore *not the full story* if level 4 exists: they are the first four
threshold crossings under a coarser cofinality lens, and the tower would need a
fifth regime (*doubly aperiodic*: $\kappa \geq \omega_2$) to house level-4
content. The theorem's proof does not block this — it simply does not ask about
the $\omega_2$-threshold.

**The $\ell_4$ invariant.**
By the general cofinality theorem (proved above), $L_{\mathrm{ns}}(\kappa)$ is
cofinal in $\omega_2$ iff $\kappa \geq \omega_2$. This gives a three-state
invariant
$$\ell_4 := \mathrm{cof}(L_{\mathrm{ns}}(\kappa), \omega_2) \in \{0, 1, 2\}$$
exactly as for $\ell_3$:
- $\ell_4 = 0$: $L_{\mathrm{ns}}(\kappa) = \emptyset$ iff $\kappa \leq \omega$
- $\ell_4 = 1$: non-empty but not cofinal in $\omega_2$ iff $\omega < \kappa < \omega_2$
- $\ell_4 = 2$: cofinal in $\omega_2$ iff $\kappa \geq \omega_2$

*Proof.* Same argument as for $\ell_3$: if $L_{\mathrm{ns}}$ is bounded by
$\alpha < \omega_2$, the Scott-continuous tail stabilizes within $\omega$ steps,
giving $\kappa \leq \alpha + \omega < \omega_2$, contradicting $\kappa \geq \omega_2$.
$\square$

The invariant $\ell_4$ distinguishes $\kappa \in [\omega_1, \omega_2)$ (aperiodic,
$\ell_4 = 1$) from $\kappa \geq \omega_2$ (doubly aperiodic, $\ell_4 = 2$) — a
subdivision the four-regime-dichotomy does not see. Its categorical meaning as a
bigraded-diamond activation state is the open question.

**The second-order settling conjecture.**
The level-3 bigraded diamond is the KZ diamond of $\mathbf{T}(\mathcal{C}, \lambda)$
— the settling applied once. The level-4 candidate is the KZ diamond of a
*second-order settling*: the settling construction applied to $\mathbf{T}(\mathcal{C},
\lambda)$ itself, yielding $\mathbf{T}^2(\mathcal{C}, \lambda)$.

**Conjecture (second-order settling activation).** $\mathbf{T}^2(\mathcal{C},
\lambda)$ — defined by treating $\mathbf{T}(\mathcal{C}, \lambda)$ as the "predicate
2-category" and applying the settling construction at the 2-categorical level —
has closure ordinal $\kappa_2$ satisfying:
$$\kappa_2 \geq \omega_1 \iff \kappa \geq \omega_2.$$
The KZ diamond of $\mathbf{T}^2$ is the level-4 bigraded diamond, with shadow
elements $\{\eta_{\mathbb{M}}^{(2)},\mu_{\mathbb{M}}^{(2)},\varepsilon_{\mathbb{N}}^{(2)},
\delta_{\mathbb{N}}^{(2)}\}$ — the 2-adjunction 2-cells of $\mathbf{T}^2$ — and
center $\mathrm{id}^{(2)}$.

*Heuristic.* For $\kappa \in [\omega_1, \omega_2)$: $\mathbf{T}(\mathcal{C}, \lambda)$
has $\kappa < \omega_2$ many stages; the second-order settling stabilizes within
$\omega_1$ steps (countably bounded), so $\kappa_2 < \omega_1$ — level-4 trivial.
For $\kappa \geq \omega_2$: $\mathbf{T}$ has $\omega_2$-many stages; the
second-order settling encounters $\omega_1$-many non-SC events within each
$\omega_1$-block of stages, driving $\kappa_2 \geq \omega_1$ — level-4 fully
active. The mechanism is the same as for level 3, shifted up by one aleph.

**The infinite tower pattern.**
If the conjecture holds, it generalizes to all finite levels:

| Level $n$ | Structure | Activation | Invariant |
|---|---|---|---|
| 1 | Adjoint system | always | — |
| 2 | Frobenius (KZ of $\mathbf{T}^0$) | $\kappa > \omega$ | $\ell_2$ |
| 3 | KZ diamond of $\mathbf{T}^1$ | $\kappa \geq \omega_1$ | $\ell_3$ |
| 4 | KZ diamond of $\mathbf{T}^2$ | $\kappa \geq \omega_2$ | $\ell_4$ |
| $n \geq 2$ | KZ diamond of $\mathbf{T}^{n-2}$ | $\kappa \geq \omega_{n-2}$ | $\ell_n$ |

where $\mathbf{T}^0 = \mathcal{C}$ (the predicate category itself), $\mathbf{T}^1 =
\mathbf{T}(\mathcal{C}, \lambda)$, and $\mathbf{T}^k = \mathbf{T}(\mathbf{T}^{k-1},
\lambda_k)$ for $k \geq 2$. Each $\ell_n = \mathrm{cof}(L_{\mathrm{ns}}(\kappa),
\omega_{n-2})$ is a well-defined three-state invariant by the general cofinality
theorem. The categorical interpretation — that $\ell_n$ measures KZ-diamond activity
in $\mathbf{T}^{n-2}$ — is conjectural for $n \geq 4$.

**Consequence for the four-regime-dichotomy.** If the pattern holds, the four
regimes are the first four entries in an infinite regime tower indexed by
$\{\omega_n\}_{n \geq -1}$ (with $\omega_{-1} = 0$, $\omega_0 = \omega$, etc.).
The four-regime-dichotomy would be the truncation of this tower to the levels
accessible to a 2-categorical temporal structure. Each new regime corresponds to one
more application of the settling construction to the previous temporal structure.

**The core obstacle (restated).** Formalizing $\mathbf{T}^2$ requires the settling
construction to generalize from predicate categories (1-categories) to temporal
2-categories. This is a genuine extension: $\mathbf{T}^1$ already requires the
Gray–Street / Emmenegger data, and $\mathbf{T}^2$ would require their 2-categorical
analogs. Whether such analogs exist with the right KZ properties is not established
in the corpus.

**Investigation (second-order settling): what the corpus reveals.**

The settling endofunctor $F_U$ already operates on $\mathbf{PrFib}(\mathcal{C})$ —
a 2-category — not just on $\mathbf{Cat}/\mathcal{C}$. A predication fibration over
$\mathcal{C}$ is a cloven Grothendieck fibration $p: \mathcal{E} \twoheadrightarrow
\mathcal{C}$ with fibers $A_q \cong \mathbf{L}^{\bowtie E \times E}$ and generator
actions (the Emmenegger $\mathbb{N}$-coalgebra characterization). The second-order
settling $\mathbf{T}^2(\mathcal{C}, \lambda)$ would need a "predication
2-fibration over $\mathbf{T}(\mathcal{C}, \lambda)$" with 2-categorical fibers.

**The circularity obstruction.** A predication 2-fibration over $\mathbf{T}$ is
a $\mathbf{T}$-indexed family of predication fibrations — equivalently, a pseudo-functor
$\mathbf{T}(\mathcal{C}, \lambda)^\mathrm{op} \to \mathbf{PrFib}(\mathcal{C})$. But
this is already provided by the first-order settling itself: the family
$\{v_\tau(X) : (\tau, X) \in \mathbf{T}\}$ of predication states IS such a pseudo-functor.
Applying $\mathbf{T}^2$ to $\mathbf{T}^1$ therefore returns the first-order settling
repackaged, not a genuinely new level. A non-trivial $\mathbf{T}^2$ requires NEW
fiber data — a *2-bilattice* fiber algebra whose structure is not already encoded in
the first-order $A_q \cong \mathbf{L}^{\bowtie E \times E}$.

**The existing aperiodic trichotomy.** The
[bigraded aperiodic-regime trichotomy](../theorems/bigraded-aperiodic-regime-trichotomy.md)
establishes a proved three-way subdivision of the aperiodic regime — into
*consistent*, *paraconsistent*, and *mixed* sub-strata — indexed by which
components of the bigraded classifying invariant $(H^1_t, H^1_{(\top)})$ are
non-zero. This subdivision is **orthogonal** to the ordinal-depth trichotomy
($\ell_4$): it classifies which bilattice-value directions are active in $H^1$
(a bigraded-structure question), while $\ell_4$ classifies how large $\kappa$ is
(an ordinal-depth question). Both are genuine sub-classifications of the aperiodic
regime; the combined invariant $(H^1\text{-type}, \ell_4)$ would give a $3 \times 3$
grid of aperiodic sub-strata.

**What $\ell_4$ actually measures.** The invariant $\ell_4 = \mathrm{cof}(L_{\mathrm{ns}}
(\kappa), \omega_2)$ captures the CARDINALITY of $H^1$:
- $\ell_4 = 1$: $|L_{\mathrm{ns}}(\kappa)| \leq \aleph_1$, so
  $H^1 \cong \bigoplus_{\leq \aleph_1} \mathbb{Z}$ — rank at most $\aleph_1$.
- $\ell_4 = 2$: $|L_{\mathrm{ns}}(\kappa)| \geq \aleph_2$, so
  $H^1$ has rank $\geq \aleph_2$.

This is a cardinality invariant on the level-2 structure ($H^1$), not a genuinely
new level-4 categorical structure. The $\ell_3$ invariant gave a qualitatively new
level-3 categorical structure (the KZ diamond fully alive vs. bounded). The $\ell_4$
invariant — as currently computed from $L_{\mathrm{ns}}$ cofinality — refines the
level-2 structure's cardinality but does not itself generate a new level-4 bigraded
diamond. Whether there EXISTS a level-4 categorical structure whose activity is
controlled by $\ell_4$ remains entirely open.

**The revised status.** The level-4 question has two distinct open problems:
1. *Categorical*: does there exist a 2-bilattice fiber algebra that generates a
   genuinely new second-order predication fibration structure over $\mathbf{T}^1$?
   If yes, that yields $\mathbf{T}^2$ and the level-4 bigraded diamond.
2. *Combinatorial*: does $\ell_4$ (the $H^1$-rank threshold at $\aleph_2$) have a
   categorical interpretation as a level-4 bigraded diamond activity state?
   Currently $\ell_4$ is a cardinality refinement of the level-2 structure, not
   an independent level-4 invariant.

**Candidate 2-bilattice: $\mathbf{FOUR}_{(2)}$.**

The bilattice two-orders duality theorem establishes
$\mathbf{FOUR} = \{0,1\}^2$ with the k-order as the product order and the t-order
as the twisted order $(a,b) \leq_t (c,d)$ iff $a \leq c$ and $d \leq b$. The
natural categorification replaces $\{0,1\}$ (a 2-element set = category with only
identity morphisms) by $[1]$ (the walking arrow $0 \to 1$). Of the two natural
products, the twisted variant
$$\mathbf{FOUR}_{(2)} := [1] \times [1]^{\mathrm{op}}$$
captures the bilattice two-order structure: its non-identity morphisms are exactly
the four "mixed" covering relations of $\mathbf{FOUR}$ — the relations that
correspond to pure t-increases or simultaneous k-and-t increases:
- $\bot \to \mathbf{t}$ (both k-increase and t-increase; from the $[1]$ factor)
- $\mathbf{f} \to \top$ (both k-increase and t-increase; from the $[1]$ factor)
- $\mathbf{f} \to \bot$ (t-increase only; from the $[1]^{\mathrm{op}}$ factor)
- $\top \to \mathbf{t}$ (t-increase only; from the $[1]^{\mathrm{op}}$ factor)
plus composites ($\mathbf{f} \to \mathbf{t}$ via two paths). The k-only coverings
$\bot \to \mathbf{f}$ and $\mathbf{t} \to \top$ are absent; they appear in the
$\sigma$-conjugate $[1]^{\mathrm{op}} \times [1]$.

The "2-bilattice fiber algebra" is then
$$A_p^{(2)} := \mathrm{Fun}(E \times E,\; \mathbf{FOUR}_{(2)}),$$
the category of functors from $E \times E$ to $\mathbf{FOUR}_{(2)}$. Objects of
$A_p^{(2)}$ are truth-value assignments $v : E \times E \to \mathbf{FOUR}$ (same
objects as the first-order fiber $A_p$); morphisms from $v$ to $v'$ are natural
transformations, which assign to each cell $(s,o)$ one of the four basic
settlement-step types above (or the identity).

**Self-similarity of $A_p^{(2)}$.** The four non-identity morphism types in
$\mathbf{FOUR}_{(2)}$ are themselves organized by two free commuting involutions:
- $\iota_k^{(2)}$: swap $(\bot \to \mathbf{t}) \leftrightarrow (\mathbf{f} \to
  \top)$ and $(\mathbf{f} \to \bot) \leftrightarrow (\top \to \mathbf{t})$
  (adjoint-swap on the morphism level, acting on the k-axis)
- $\iota_t^{(2)}$: swap $(\bot \to \mathbf{t}) \leftrightarrow (\mathbf{f} \to
  \bot)$ and $(\mathbf{f} \to \top) \leftrightarrow (\top \to \mathbf{t})$
  (truth/falsehood swap, acting on the t-axis)
Both involutions are free (the four types are pairwise distinct) and they commute
($\iota_k^{(2)}$ acts on the k-direction of the endpoint pairs, $\iota_t^{(2)}$ on
the t-direction — orthogonal). The four types therefore form a bigraded diamond
within the MORPHISM CATEGORY of $\mathbf{FOUR}_{(2)}$ — the same combinatorial
pattern as the levels 1–3 shadow, re-instantiated at the morphism level.

This self-similarity is an obstruction. The bigraded diamond on the morphisms of
$A_p^{(2)}$ is the existing tower's pattern reproduced one categorical dimension
lower: it is the level-2/3 shadow structure reinterpreted as "step types" rather
than "structure maps." It generates no new categorical content beyond what the
temporal 2-category $\mathbf{T}^1$ already contains — the settlement's 1-cells
already encode exactly these four step types as the basis of the fibration morphisms.
The 2-bilattice candidate $A_p^{(2)}$ is therefore already implicitly present in
$\mathbf{T}^1$, confirming the circularity obstruction from a different angle.

**What the self-similarity implies for level 4.** The level-3 bigraded diamond
arose from level 2 by a dimensional step: Frobenius morphisms (1-cells) → KZ
2-cells (2-cells modifying morphisms). The analogous dimensional step from level 3
to level 4 would be: KZ 2-cells → modifications (3-cells modifying 2-cells). The
self-similarity of $A_p^{(2)}$ shows that staying within the 2-categorical dimension
— using 2-bilattice morphisms rather than 3-cells — does not produce new structure.
Level 4 requires the temporal 3-category $\mathbf{T}^3$ (3-cells modifying the
$\mathbb{M} \dashv \mathbb{N}$ 2-cells), not a 2-bilattice fiber. This is consistent
with the "key obstacle" paragraph above: the present $\mathbb{M} \dashv \mathbb{N}$
is a strict 2-adjunction (its triangle identities are equations, not 3-cells), and
the pseudo-adjunction weakening in a Gray-category is precisely the step that would
introduce genuine level-4 modifications.

**Structural obstruction: the tower terminates at level 3 in the current framework.**

The level-4 shadow requires non-trivial modifications (3-cells). There are two
possible sources in the temporal 2-category:

1. *Triangle-identity modifications*: 3-cells witnessing $(\epsilon\mathbb{M})
   \circ (\mathbb{M}\eta) \cong \mathrm{id}_\mathbb{M}$ up to 3-cells rather than
   strictly. Blocked because the $\mathbb{M} \dashv \mathbb{N}$ adjunction
   ([@gray1966; @street1974]) is defined as a STRICT 2-adjunction, so triangle
   identities are equations, not data.

2. *Axis-crossing modifications*: 3-cells witnessing near-commutativity of the
   $\mathrm{Cl}$-axis and $\mathbb{N}$-axis actions. Blocked by the
   [KZ-diamond strict commutation theorem](../theorems/kz-diamond-strict-commutation.md)
   (sketch): $\mathrm{Cl} \circ \mathbb{N} = \mathbb{N} \circ \mathrm{Cl}$ via a
   strict distributive law $\delta = \mathrm{id}$ componentwise, because the two
   operations act on disjoint aspects of a settling's data (values vs. cleavage).

Both obstructions are **structural**, not regime-dependent: they hold for all
$\kappa$, including $\kappa \geq \omega_2$. The level-4 bigraded diamond is
therefore not merely "unproved" but is trivially trivial in the current framework —
there are no non-identity modifications to activate regardless of regime. The
$\ell_4$ invariant ($H^1$ cardinality) exists and is non-trivial at $\kappa \geq
\omega_2$, but it measures the cardinality of the level-2 structure, not a level-4
categorical structure.

**Consequence: the tower depth is bounded at 3 by structural strictness.**
The tower conjecture's ordinal-depth claim ($d(\kappa) = \kappa$) is proved: the
settling has $\kappa$-many non-isomorphic stage-local bigraded diamonds at level 3.
But the CATEGORICAL depth is exactly 3 (not 4, not $\omega$) in the current
framework: levels 1, 2, 3 carry non-trivial categorical content (proved); level 4
and beyond carry no non-trivial content (because all modifications are identities,
by structural strictness). The regime determines how "alive" the level-3 diamond
is (strict collapse vs. Scott-continuous stabilization vs. KZ-lax-idempotent
persistence), not whether a fourth categorical level activates.

**What would break the obstruction.** A level-4 categorical tower would require
either: (a) replacing the strict $\mathbb{M} \dashv \mathbb{N}$ with a
pseudo-adjunction in a Gray-category (requires new foundational definitions not
present in the corpus); or (b) identifying a new 2-monad/2-comonad structure on the
temporal 2-category whose distributive law with $\mathrm{Cl}$ is pseudo, not strict.
Neither is present. The tower conjecture's "categorical level" formulation is therefore:
$d_{\mathrm{cat}} = 3$ for all settlings in the current predication categories
framework, with the regime determining the strength of level-3 content, not level-4
activation.

**Remark (H¹ is the only regime-sensitive cohomological invariant).**
The [settling-cohomology-vanishes-above-degree-1 theorem](../theorems/settling-cohomology-vanishes-above-degree-1.md)
establishes $H^n = 0$ for all $n \geq 2$, **regime-independently** — the vanishing
follows from the discrete-skyscraper structure of the fiber sheaf at each
$(q, \tau)$, independent of whether the settling is in the strict, Scott-continuous,
transfinite-bounded, or aperiodic regime. Therefore all regime-sensitive cohomological
content is concentrated in $H^1$. Sub-question 6(b) — "$H^1 \neq 0 \iff$ level-2
tower content is non-trivial" — follows from this combined with the regime-chain-order
theorem: the level-2 bigraded diamond carries non-trivial content precisely when
$H^1 \neq 0$, which occurs exactly in the transfinite-bounded and aperiodic regimes.

**Remark (Level-3 to Level-2: the TQFT connection).**
The [TQFT structure theorem](../theorems/tqft-structure.md) establishes a symmetric
monoidal functor $Z : \mathrm{Cob}_\mathrm{settling} \to \mathrm{Mod}_\mathbb{Z}$
that sends each boundary predication system $\mathcal{B}$ to $Z(\mathcal{B})$ equipped
with the Frobenius algebra structure (Level 2). The TQFT theorem identifies an
"extended TQFT direction" (currently open) in which 2-cobordisms — settlings between
settlings — carry their own cohomological invariants at the 2-categorical level.
This extended TQFT would be a 2-functor from the temporal 2-category (whose 2-cells
are the Level-3 shadow $\{\eta_{\mathbb{M}}, \mu_{\mathbb{M}}, \varepsilon_{\mathbb{N}},
\delta_{\mathbb{N}}\}$) to a 2-categorical extension of $\mathrm{Mod}_\mathbb{Z}$.
If this 2-functor exists, it would send the Level-3 bigraded diamond to the Level-2
bigraded diamond via $Z$, making the "same abstract structure at both levels"
observation into a theorem: both levels are the image of the same abstract KZ
2-adjunction data under successively applied truncation functors.

**Observation (abstract bigraded diamond pattern for any KZ 2-adjunction).**
Both Level 2 and Level 3 have the same abstract bigraded diamond: a 4-element shadow
$\{\text{unit}, \text{mult}, \text{counit}, \text{comult}\}$ with $\iota_k =$ adjoint-swap
(unit $\leftrightarrow$ counit, mult $\leftrightarrow$ comult) and $\iota_t =$ arity-swap
(unit $\leftrightarrow$ mult, counit $\leftrightarrow$ comult). This is because any lax-idempotent
KZ 2-adjunction $F \dashv G$ yields exactly these four canonical structural 2-cells
with exactly this symmetry group. The levels differ in what categorical object carries
the structure (morphisms in a cobordism category at Level 2; 2-cells in Cat/$\mathcal{C}$
at Level 3), not in the abstract combinatorial form.

The [four-regime-dichotomy theorem](../theorems/four-regime-dichotomy.md)'s remark
on the KZ-diamond's regime-dependent structure — "the aperiodic regime is where the
KZ-lax-idempotent diamond is fully alive" — is the level-3 tower activation. The
regime chain order $\mathrm{strict} < \mathrm{scott\text{-}cont} <
\mathrm{transfinite\text{-}bounded} < \mathrm{aperiodic}$ is the ordinal indexing of
the tower's depth.

The tower conjecture (ordinal-depth claim proved; beyond level 3 as a categorical
level remains open):

> The settling's tower depth $d(\kappa)$ — the largest $n$ such that level $n$ of
> the bigraded diamond tower carries non-trivial content — equals the ordinal depth
> of the closure regime: $d < \omega$ in the strict/Scott-continuous cases, $d \geq
> \omega$ in the transfinite-bounded case, $d \geq \omega_1$ in the aperiodic case.

The inequalities $d \geq 2$ for $\kappa > \omega$ and $d \geq 3$ for $\kappa \geq
\omega_1$ are proved from existing corpus theorems (H¹-generators + equivariant
decomposition for level 2; KZ diamond section of the four-regime-dichotomy theorem
for level 3). The ordinal-depth claims $d \geq \omega$ and $d \geq \omega_1$ are
proved by the **ordinal tower theorem** (below): the stage-local bigraded diamonds
$\{D_\tau\}_{\tau < \kappa}$ are pairwise non-isomorphic, so the ordinal tower has
depth exactly $\kappa$. The ordinal depth is entirely accounted for by KZ-level
variation within level 3 (proved by the ordinal tower theorem above). Whether the
tower beyond level 3 produces genuinely new *categorical* structure — a level-4
bigraded diamond of triangle modifications for a KZ 3-adjunction in a temporal
3-category, activated at $\kappa \geq \omega_2$ — remains open; see the
level-4 investigation in this section.

---

## Section 6: The step-5 conjecture

The [step-$n$ / bilattice cardinality coincidence theorem](../theorems/step-n-and-bilattice-correspondence.md)
aligns cardinalities $\{2, 3, 4\}$ with FOUR's substructure cardinalities and
terminates: "for $n \geq 5$, no FOUR substructure has cardinality $n$." This is not
a contradiction to the 5 appearing at the predicate layer, because the theorem
concerns FOUR's *internal* substructures, not the next categorical level.

**Conjecture (step-5 extension).** The [step-$n$ correspondence narrative](prose/teaching/explanations/step-n-correspondence.md)
lists "closure-monad coherence depth" as a possibly-aligned level for step-$n$. The
hypothesis is:

> The predication hyperdoctrine's combined adjoint system — with 5 elements $\{\exists^k,
> \exists^t, f^*, \forall^t, \forall^k\}$ — is the $n = 5$ instance of the step-$n$
> alignment, realized at the predicate-categorical level rather than the value-algebraic
> level.

Concretely, this would mean: a **step-5 substitution rule** (a Pentanacci recurrence
on a 5-letter alphabet) admits a natural bijection
$\phi_5 : \{a, b, c, d, e\} \to \{\exists^k, \exists^t, f^*, \forall^t, \forall^k\}$
such that the substitution matrix $M_5$ acts on the 5-dimensional cohomology of the
associated settling in a way that respects the bigraded diamond's $\iota_k$ and
$\iota_t$ involutions.

This conjecture is open. A necessary prerequisite is the positive resolution of the
$n = 4$ correspondence question (still open per the coincidence theorem's "what this
doesn't prove" section), but the structural motivation is that the step-$n$ alignment
tracks the categorical level: $n = 2$ (two orders), $n = 3$ (ranks within one order
chain), $n = 4$ (full FOUR diamond), $n = 5$ (combined adjoint system, i.e., FOUR
plus its canonical $\sigma_*$-fixed center).

---

## The main question

The bigraded diamond definition in Section 4 is a candidate unified structure. The
main question is:

> Is every instance of the two-axis diamond motif in predication categories an
> example of a bigraded diamond (per Section 4's definition), with the four-element
> shadow being the $K_4$-orbit of FOUR and the central element being the $\sigma_*$
> (or Verdier) fixed point at that layer?

Sub-questions that would constitute progress:

1. **The d-frame and linear-logic instances.** *Partial answers:*

   **D-frame.** The [d-frame](../objects/d-frame.md) $(L_+, L_-, \mathrm{con},
   \mathrm{tot})$ has two distinct component types ($L_\pm$ are frames;
   $\mathrm{con}, \mathrm{tot}$ are relations), so the bigraded diamond is implicit.
   The two involutions behave differently in $\mathbf{dFrm}$:
   - $\iota_t = {\sim}$ acts as a $\mathbf{dFrm}$-automorphism: $(L_+, L_-,
     \mathrm{con}, \mathrm{tot}) \mapsto (L_-, L_+, \mathrm{con}^{op}, \mathrm{tot}^{op})$.
     This preserves the d-frame structure and acts freely on the four shadow components.
   - $\iota_k = -$ (conflation) requires passing to the *dual* d-frame: it maps
     $\mathrm{con} \leftrightarrow \mathrm{tot}$, but $\mathrm{con}$ is downward-closed
     while $\mathrm{tot}$ is upward-closed — swapping them changes the closure type
     and produces a dual d-frame structure, not a d-frame automorphism.
   The resolution: both involutions are well-defined on the bilattice $B$ from which
   the d-frame is derived. The Jung–Rivieccio equivalence $\mathbf{BiLat} \simeq
   \mathbf{dFrm}$ (distributive bilattices $\simeq$ spatial d-frames) makes $B$
   the canonical preimage of the d-frame. The bigraded diamond lives not in
   $\mathbf{dFrm}$ but in $\mathbf{BiLat}$, which is the self-dual category where
   $\iota_k = -$ is a genuine automorphism (not a passage to a dual). The center $I$
   is the bilattice $B$ itself — precisely the canonical section of the
   bilattice-to-d-frame functor. The "bilattice as center of its d-frame" is: $B$
   sits at the diagonal of the self-duality, the unique bilattice whose $\iota_k$-orbit
   is internal (not requiring the external dualization that $\mathbf{dFrm}$ cannot
   express). The d-frame is the coordinate chart that obscures $\iota_k$ by splitting
   the data across two type strata; $\mathbf{BiLat}$ is the chart where both
   involutions are visible.

   **Linear-logic / Chu spaces.** The [predication-fibers-as-linear-logic-models
   narrative](prose/teaching/explanations/predication-fibers-as-linear-logic-models.md) places
   each predication fiber in the lineage of Chu space models. The four focusing modes
   of the focusing discipline form a bigraded diamond:
   - $A$ = positive-focusing mode (actively reducing a positive formula).
   - $B$ = $\downarrow$-shifted mode (positive formula shifted into negative inversion).
   - $C$ = negative-focusing mode (actively reducing a negative formula).
   - $D$ = $\uparrow$-shifted mode (negative formula shifted into positive inversion).
   - $I$ = the proof context / Chu construction identity (the $\sigma_*$-fixed point
     of the focusing system — the neutral sequent that the focusing phases orbit around).
   The involutions:
   - $\iota_k$ = polarity-swap: $A \leftrightarrow C$ (positive-focus $\leftrightarrow$
     negative-focus) and $B \leftrightarrow D$ ($\downarrow$-mode $\leftrightarrow$
     $\uparrow$-mode). Free: the four modes are distinct by polarity and shift-status.
   - $\iota_t$ = mode-swap: $A \leftrightarrow B$ (positive-focus $\leftrightarrow$
     $\downarrow$-shifted) and $C \leftrightarrow D$ (negative-focus $\leftrightarrow$
     $\uparrow$-shifted). Free: "focused" and "shifted" are distinct modes.
   - They commute: mode-swap and polarity-swap act on orthogonal aspects of the
     focusing phase. $\checkmark$
   The $\uparrow\downarrow$ shifts are NOT the diagonal $K_4$ free involutions: each
   shift ($\downarrow: A \to B$ or $\uparrow: C \to D$) is one step of the 4-cycle
   traversal $r$ (not an involution). The diagonal $K_4$ involutions are the
   "squared" symmetries: $\iota_k$ (polarity-swap) is $r^2$, and $\iota_t$
   (mode-swap) is $s$ in $D_4$ — analogous to FOUR's $\iota_k = {\sim}\!-$ and
   $\iota_t = \sigma$. The 4-step focusing traversal
   (pos-focus $\to$ $\downarrow$-shift $\to$ neg-focus $\to$ $\uparrow$-shift $\to$
   pos-focus) is $r = \iota_t \circ {\sim}_\mathrm{focus}$ where ${\sim}_\mathrm{focus}$
   fixes the direct modes and swaps the shifted modes — exactly parallel to
   $r = \sigma\!\sim$ on $\mathbf{FOUR}$ where $\sim$ fixes $\bot, \top$ and swaps
   $\mathbf{t}, \mathbf{f}$.
   What remains open: whether the paraconsistent extension of $\mathrm{Chu}(\mathbf{L},
   0)$ (adding the $\top = (1,1)$ point) corresponds to a specific structural enrichment
   of the center $I$, and whether the focusing bigraded diamond is formally equivalent
   to the predicate-layer bigraded diamond (level 1) via the Chu correspondence.

2. **The lacing morphism.** The causal lacing (predicate $p_1$ reaching $\top$
   triggering evidence for predicate $p_2$ from $\bot$) is described operationally
   by closure rules. *Partial answer:* the lacing has two complementary categorical
   formulations — one within each bigraded diamond (via $\iota_k \circ \iota_t$) and
   one between successive diamond instances (via Frobenius $\Delta \circ \mu$).

   **Within-diamond formulation ($\iota_k \circ \iota_t$).** The anti-diagonal
   involution $\iota_k \circ \iota_t$ swaps $A \leftrightarrow D$ and $B \leftrightarrow
   C$ on the shadow. At each level this is:
   - *Level 0:* $\bot \leftrightarrow \mathbf{t}$ and $\mathbf{f} \leftrightarrow \top$
     (anti-diagonal of $\mathbf{FOUR}$).
   - *Level 1:* $\exists^k \leftrightarrow \forall^t$ and $\exists^t \leftrightarrow
     \forall^k$ (the cross-axis swap already noted in Section 4: the knowledge-existential
     of the cause becomes the truth-universal of the effect).
   - *Level 2:* Verdier$\circ$transpose sends $\eta_F \leftrightarrow \Delta_F$ and
     $\mu_F \leftrightarrow \varepsilon_F$ (unit swaps with comultiplication; multiplication
     swaps with counit).
   - *Level 3:* adjoint-swap$\circ$unit/mult-swap sends $\eta_{\mathbb{M}} \leftrightarrow
     \delta_{\mathbb{N}}$ and $\mu_{\mathbb{M}} \leftrightarrow \varepsilon_{\mathbb{N}}$.

   In each case $\iota_k \circ \iota_t$ identifies the "start" element (position $A$)
   with the "end" element (position $D$) — the element the settling exits from and the
   element it enters at in the next instance. This is the within-diamond form of the
   causal link: start and end are related by the anti-diagonal.

   **Between-diamond formulation (Frobenius $\Delta \circ \mu$).** The S-shaped
   cobordism $\Delta \circ \mu : \mathcal{B} \otimes \mathcal{B} \to \mathcal{B} \otimes
   \mathcal{B}$ (merge two boundaries, then split) transfers $p_1$'s settled content at
   $\top$ into $p_2$'s initial evidence at $\bot$:
   $\mu$ couples $p_1$'s settled state with $p_2$'s current state; $\Delta$ propagates
   $p_1$'s contribution into $p_2$'s trajectory. The Frobenius law
   $\Delta \circ \mu = (\mathrm{id} \otimes \mu) \circ (\Delta \otimes \mathrm{id})$
   (the S-shape = the laced cobordism by two paths) is precisely the coherence condition
   for this transfer: regardless of the order of merging and splitting, the result is the
   same causal propagation. The Frobenius compatibility is the "lacing equation made
   algebraic" (noted in Section 2).

   **$H^1$ as the curvature of the lacing.** The $H^1$-generators theorem shows that
   each NSC firing at ordinal $\mu$ contributes a generator $e_\mu \in H^1$ — exactly
   the moments at which the settling's causal chain is "non-flat" (the closure operator
   fails to commute with filtered colimits, forcing a jump). When $H^1 = 0$ (lower two
   regimes), every lacing event $p_1 \to p_2$ is Scott-continuous — the causal transfer
   is "flat" in the sense that $\Delta \circ \mu$ factors through a colimit and introduces
   no new cohomological content. When $H^1 \neq 0$ (upper two regimes), each NSC firing
   is a curvature event in the causal chain: the $\Delta \circ \mu$ transfer at that
   ordinal produces a new $H^1$-class that cannot be expressed in terms of earlier
   transfers. So $H^1$ measures exactly the obstruction to the settling's causal chain
   being "flat" — the claim posed in this sub-question, and a corollary of sub-question
   6(b). What remains open is whether a single unifying morphism in an extended TQFT
   (a 2-functor incorporating both within-diamond and between-diamond lacings) exists.

3. **The 4-cycle as the bigraded diamond's traversal.** The $D_4$-rotation
   $r = \sigma\!\sim$ generates the 4-cycle $\bot \to \mathbf{f} \to \top \to
   \mathbf{t} \to \bot$ on the value layer. *Partial answer:* $r$ extends canonically
   to a $\mathbb{Z}/4$ SET-action on $X = \{A,B,C,D,I\}$ by fixing $I$ and cycling
   $A \to B \to C \to D \to A$ — giving a $\mathbb{Z}/4$ action on $X$ with one fixed
   point. However, this action is NOT an automorphism of the bigraded diamond structure:
   the automorphism group of a bigraded diamond (bijections $X \to X$ commuting with
   both $\iota_k$ and $\iota_t$) restricted to the shadow is exactly the diagonal $K_4$
   (since the diagonal $K_4$ acts regularly on $\{A,B,C,D\}$, its centralizer in $S_4$
   is itself). Because $r$ has order $4$ while every non-identity element of the
   diagonal $K_4$ has order $2$, $r \notin \mathrm{Aut}(\text{bigraded diamond})$. The
   failure is concrete: $r$ does not commute with $\iota_t$ in $D_4$ (since $D_4$ is
   non-abelian and $rs \neq sr$ for $s = \sigma = \iota_t$, from the relation $srs^{-1}
   = r^{-1}$). So the $\mathbb{Z}/4$ action on $X$ exists as a set-action but breaks
   the $\iota_t$ symmetry.

   Two positive corollaries follow. First, $r^2 = \iota_k$ (the traversal squares to
   the $k$-direction involution): "two traversal steps $=$ one $\iota_k$-flip." The
   4-cycle is the square root of $\iota_k$ in $D_4$. Second, the full $D_4$ symmetry
   of FOUR (the value layer) shrinks to the diagonal $K_4$ upon center-emergence at
   higher levels: adding a fixed center $I$ breaks $D_4$ down to its centralizer of the
   diagonal $K_4$, which is the diagonal $K_4$ itself. The traversal $r$ is precisely
   the part of $D_4$'s symmetry that is lost when FOUR acquires a center — it is not a
   symmetry of any higher-level bigraded diamond. What $r$ DOES provide is a canonical
   cyclic ordering of the shadow $\{A,B,C,D\}$ (the traversal sequence), which is
   additional structure beyond the unordered $K_4$ involutions and is what the settling
   dynamics use in their temporal chain.

4. **The trajectory category.** The [three-backward-structures question](three-backward-structures-and-their-symmetry.md)
   proposes a *trajectory category* $\mathrm{Traj}(T_k)$ carrying the $D_4$ action.
   Is the trajectory category's natural enrichment a bigraded-diamond-enriched
   category? *Partial answer:*

   **The D₄-to-diagonal-K₄ factorization is the enrichment.** By the [three-backward-structures
   question](three-backward-structures-and-their-symmetry.md), $\mathrm{Traj}(T_k)$
   has a $D_4$-action on its objects (the relabeling involutions $\sigma, -, \sim$
   generate $D_4$ on $\mathbf{FOUR}$). By sub-question 3 above (the 4-cycle traversal
   analysis), this $D_4$-action at the value level (level 0) shrinks to the diagonal
   $K_4$ automorphism group of the bigraded diamond at the predicate level (level 1):
   acquiring the center $f^*$ breaks $D_4$ down to $\mathrm{Aut}(\text{bigraded
   diamond}) = $ diagonal $K_4$. The enrichment is therefore the factorization
   $$D_4 \;\twoheadrightarrow\; D_4/\langle r \rangle \;\cong\; \mathbb{Z}/2 \;\hookrightarrow\; \text{diagonal }K_4$$
   of the $\mathrm{Traj}(T_k)$ symmetry group through the bigraded diamond's automorphism
   group. Concretely: the hom-collection $\mathrm{Hom}_{\mathrm{Traj}(T_k)}(p, q)$
   for predicates $p, q$ in the base category $\mathcal{C}$ naturally carries the
   five-element structure $\{\exists^k_{f_{pq}}, \exists^t_{f_{pq}}, f_{pq}^*, \forall^t_{f_{pq}},
   \forall^k_{f_{pq}}\}$ — the level-1 bigraded diamond — for each morphism $f_{pq}:
   q \to p$ in $\mathcal{C}$. The involutions $\iota_k^{(1)} = $ Verdier and $\iota_t^{(1)}
   = \sigma_*$ act on this hom-bicat, and the center $f_{pq}^*$ is the canonical
   fixed point. Every settling $v$, viewed as a section of the predication fibration
   over $\mathcal{C}$, is compatible with these bigraded diamond hom-structures: it
   respects $\iota_k$ (settlings are monotone for the $k$-order) and is $\sigma_*$-intertwined
   with the $t$-order settling (by the two-orders duality theorem). In this sense every
   settling is "bigraded-diamond-enriched-functor-compatible."

   **The temporal direction (T_k, T_k^{-1}) is level 2.** The forward/backward time
   data in $\mathrm{Traj}(T_k)$ — not the value relabelings but the ordinal-time
   stepping — corresponds to the settling's temporal cobordism structure, which is
   the level-2 bigraded diamond (Frobenius layer). The settling's trajectory IS a
   1-morphism in the cobordism category $\mathrm{Cob}_\mathrm{settling}$, and the
   Frobenius generators $\{\eta_F, \mu_F, \varepsilon_F, \Delta_F\}$ organize the four
   types of temporal transition (creation, multiplication, annihilation, comultiplication
   of boundary systems). So $\mathrm{Traj}(T_k)$ is naturally enriched over the
   level-1 bigraded diamond in its value-structural hom-data, and over the level-2
   bigraded diamond in its temporal hom-data.

   **What remains open.** The formal statement of "bigraded-diamond-enriched category"
   requires a monoidal category of bigraded diamonds to enrich over, and it is not
   established that bigraded diamonds form a monoidal category in the right sense
   (their tensor product would need to be defined). The claim that every settling is
   a bigraded-diamond-enriched functor likewise needs a formal enriched-functor
   definition. Sub-questions 1 and 2 of the [three-backward-structures question](three-backward-structures-and-their-symmetry.md)
   (constructing $\mathrm{Traj}(T_k)$ explicitly and computing $D_4$-orbits) are
   prerequisites.

5. **The $n = 5$ conjecture (Section 6).** *Sharpened:* the standard Pentanacci
   substitution refutes the naive form of the conjecture; the remaining question is
   whether a specially-constructed step-5 rule exists that satisfies the equivariance
   condition — the "Thue-Morse analog at $n = 5$."

   **Why standard Pentanacci fails.** The standard Pentanacci substitution
   $a \to abcde$, $b \to a$, $c \to b$, $d \to c$, $e \to d$ has substitution matrix
   $M_5$ with column sums $(2, 2, 2, 2, 1)$ — asymmetric. For any bijection $\phi_5 :
   \{a,b,c,d,e\} \to \{\exists^k, \exists^t, f^*, \forall^t, \forall^k\}$, the
   involution permutations $\iota_k$ (swapping $\exists^k \leftrightarrow \forall^k$
   and $\exists^t \leftrightarrow \forall^t$, fixing $f^*$) and $\iota_t$ (swapping
   $\exists^k \leftrightarrow \exists^t$ and $\forall^k \leftrightarrow \forall^t$,
   fixing $f^*$) require $M_5$ to commute with specific $5 \times 5$ permutation
   matrices. The Pentanacci matrix is irreducible over $\mathbb{Q}$ (single dominant
   Pisot eigenvalue), so it has no non-trivial commuting permutation matrix. Hence no
   bijection $\phi_5$ makes $M_5$ commute with $\iota_k$ or $\iota_t$. The standard
   Pentanacci cannot be the step-5 instance.

   **The equivariance condition and K₄ isotypic decomposition.** For ANY step-5
   substitution to satisfy the conjecture, its matrix $M_5$ must decompose into blocks
   corresponding to the diagonal $K_4$-isotypic components of $\mathbb{Z}^5$. Let
   $e_1 = \exists^k$, $e_2 = \exists^t$, $e_3 = f^*$, $e_4 = \forall^t$,
   $e_5 = \forall^k$. The four isotypic sectors are:
   - $\chi_{00}$ (trivial): 2-dimensional, spanned by $\{e_1 + e_2 + e_4 + e_5,\, e_3\}$.
   - $\chi_{10}$ ($\iota_k$-antisym, $\iota_t$-sym): 1-dim, spanned by
     $\{e_1 + e_2 - e_4 - e_5\}$.
   - $\chi_{01}$ ($\iota_k$-sym, $\iota_t$-antisym): 1-dim, spanned by
     $\{e_1 - e_2 + e_5 - e_4\}$.
   - $\chi_{11}$ (both antisym): 1-dim, spanned by $\{e_1 - e_2 - e_5 + e_4\}$.
   For $M_5$ to respect the bigraded diamond, it must preserve each isotypic sector,
   i.e., be block-diagonal of shape $2 \oplus 1 \oplus 1 \oplus 1$ in this basis. The
   $\chi_{00}$ block (the "symmetric" sector) would encode the Pisot-dominant dynamics
   shared by $f^*$ and the shadow-sum $e_1+e_2+e_4+e_5$; the three $1 \times 1$ blocks
   would encode the three bilattice-symmetry-breaking directions.

   **The Thue-Morse analog condition.** At $n = 2$, Thue-Morse provides the alignment
   because its substitution commutes with the single involution (alphabet swap $\sim$).
   The $n = 5$ analog requires a step-5 rule whose $5 \times 5$ substitution matrix
   commutes with BOTH involutions $\iota_k$ and $\iota_t$ simultaneously. A sufficient
   condition: the rule must treat $\{\exists^k, \forall^k\}$ and $\{\exists^t, \forall^t\}$
   symmetrically (equal growth rates in each Verdier-paired pair), and treat the
   $k$-axis and $t$-axis symmetrically ($\exists^k$ and $\exists^t$ must have equal
   substitution images up to the $\iota_t$ relabeling). The rule must also distinguish
   $f^*$ from the four shadow elements (since $f^*$ is the unique $\iota_k$- and
   $\iota_t$-fixed element). Whether any Pisot substitution rule on 5 letters satisfies
   these conditions is open; it is a design question, not a cardinality-coincidence
   question. The [step-n / bilattice correspondence theorem](../theorems/step-n-and-bilattice-correspondence.md)
   does not rule it out (it only covers FOUR's internal substructures, and the $n = 5$
   instance lives at the predicate level, one categorical level up).

6. **The tower conjecture and regime depth (Section 5).** Section 5 proposes the
   tower: a sequence of bigraded diamonds at levels 0, 1, 2, 3, …, with tower depth
   equal to the settling's regime ordinal depth. Sub-tasks:
   (a) **(Proved.)** The involutions $\iota_k^{(n)}, \iota_t^{(n)}$ are free on their
   respective 4-element shadows at every level $n \in \{0,1,2,3\}$. *Proof sketch:*
   At each level the four shadow elements are pairwise distinct, distinguished by
   source-target type.
   - *Level 0 ($\mathbf{FOUR}$).* $\iota_k^{(0)} = \sim\!-$ sends $\bot\mapsto\top,
     \mathbf{f}\mapsto\mathbf{t}$; $\iota_t^{(0)} = \sigma$ sends $\bot\mapsto\mathbf{f},
     \top\mapsto\mathbf{t}$. Both images are distinct from the preimages (the four
     elements of $\mathbf{FOUR}$ are named, pairwise distinct objects).
   - *Level 1 (adjoint system).* $\exists^k, \exists^t, \forall^k, \forall^t$ are
     distinct functors by adjunction role (left vs.\ right adjoint) and by axis ($k$
     vs.\ $t$). $\iota_k^{(1)} = $ Verdier swaps $\exists^k \leftrightarrow \forall^k$
     and $\exists^t \leftrightarrow \forall^t$ — free since left $\neq$ right adjoint.
     $\iota_t^{(1)} = \sigma_*$ swaps $\exists^k \leftrightarrow \exists^t$ and
     $\forall^k \leftrightarrow \forall^t$ — free since the $k$- and $t$-systems are
     distinct adjoint systems.
   - *Level 2 (Frobenius generators).* By the [settling Frobenius structure](teaching/explanations/settling-frobenius-structure.md),
     $\eta_F, \mu_F, \varepsilon_F, \Delta_F$ have pairwise distinct
     (source-boundary, target-boundary) cobordism types: $(\emptyset,\mathcal{B})$,
     $(\mathcal{B}{\otimes}\mathcal{B},\mathcal{B})$, $(\mathcal{B},\emptyset)$,
     $(\mathcal{B},\mathcal{B}{\otimes}\mathcal{B})$. $\iota_k^{(2)} = $ Verdier
     swaps source $\leftrightarrow$ target within each arity-pair: $\eta_F
     \leftrightarrow \varepsilon_F$ and $\mu_F \leftrightarrow \Delta_F$ — free since
     source/target pairs differ. $\iota_t^{(2)} = $ Frobenius transpose swaps arity
     within each direction-pair: $\eta_F\,(0\to 1) \leftrightarrow \mu_F\,(2\to 1)$
     and $\varepsilon_F\,(1\to 0) \leftrightarrow \Delta_F\,(1\to 2)$ — free since
     source-boundary component count differs. Both commute (Verdier acts on
     direction, transpose acts on arity — orthogonal).
   - *Level 3 ($\mathbb{M} \dashv \mathbb{N}$ 2-cells).* The four 2-cells
     $\eta_{\mathbb{M}}:1\Rightarrow\mathbb{M}$,
     $\mu_{\mathbb{M}}:\mathbb{M}^2\Rightarrow\mathbb{M}$,
     $\varepsilon_{\mathbb{N}}:\mathbb{N}\Rightarrow 1$,
     $\delta_{\mathbb{N}}:\mathbb{N}\Rightarrow\mathbb{N}^2$ have pairwise distinct
     (source 2-functor, target 2-functor) pairs. $\iota_k^{(3)} = $ adjoint-swap
     sends $\eta_{\mathbb{M}} \leftrightarrow \varepsilon_{\mathbb{N}}$ (source $1
     \neq N$) and $\mu_{\mathbb{M}} \leftrightarrow \delta_{\mathbb{N}}$ (target $M
     \neq N^2$) — free. $\iota_t^{(3)} = $ unit/mult-swap sends $\eta_{\mathbb{M}}
     \leftrightarrow \mu_{\mathbb{M}}$ (source $1 \neq M^2$) and
     $\varepsilon_{\mathbb{N}} \leftrightarrow \delta_{\mathbb{N}}$ (target $1 \neq
     N^2$) — free. Both commute (adjoint-swap acts on the monad/comonad axis,
     unit/mult-swap acts on the arity axis — orthogonal). $\square$
   As a consequence, the sector bijection in sub-task (b) between $K_4$-isotypic
   sectors of $H^1$ and Frobenius generator sectors is unconditional.
   (b) **(Proved.)** The settling cohomology $H^1 \neq 0 \iff$ level-2 tower content
   is non-trivial. "Level-2 content non-trivial" means: the four Frobenius generators
   $\{\eta_F, \mu_F, \varepsilon_F, \Delta_F\}$ are not all cohomologically equivalent
   — i.e., the level-2 bigraded diamond is not flat. *Proof sketch:* By the
   [transfinite-bounded-regime $H^1$-generators theorem](../theorems/transfinite-bounded-regime-h1-generators.md),
   $H^1 \cong \bigoplus_{\mu \in L_\mathrm{ns}(\kappa)} \mathbb{Z}$, so $H^1 \neq 0
   \iff L_\mathrm{ns}(\kappa) \neq \emptyset$. By the
   [four-regime-dichotomy theorem](../theorems/four-regime-dichotomy.md),
   $L_\mathrm{ns}(\kappa) \neq \emptyset$ iff the settling is in the
   transfinite-bounded or aperiodic regime. The
   [equivariant cohomology decomposition](../theorems/equivariant-cohomology-decomposition.md)
   then gives $H^1 \cong H^1_\mathrm{id} \oplus H^1_{\chi_\sim} \oplus H^1_{\chi_-}
   \oplus H^1_{\chi_{\sim\circ-}}$, with each sector generated by NSC firings of the
   corresponding $K_4$ symmetry type; the four symmetry types align with the four $K_4$
   sectors organizing the Frobenius generators at level 2 (trivial-character =
   symmetric cobordisms; $\chi_\sim$ = negation-antisymmetric; $\chi_-$ =
   conflation-antisymmetric; $\chi_{\sim\circ-}$ = double-antisymmetric). So $H^1_\chi
   \neq 0$ means the Frobenius generator in sector $\chi$ has non-trivial settling
   curvature: the four generators are not cohomologically equivalent in that sector.
   Total: $H^1 = 0$ iff all four Frobenius sectors trivialize (lower two regimes);
   $H^1 \neq 0$ iff at least one Frobenius sector is active (upper two regimes).
   $\square$ The sector-by-sector identification (which $H^1_\chi$ corresponds to which
   Frobenius generator) is unconditional: sub-task (a) is now proved, so the free
   $K_4$ orbit on $\{\eta_F, \mu_F, \varepsilon_F, \Delta_F\}$ is established and the
   bijection of $K_4$ sectors follows directly from the equivariant decomposition.
   (c) **(Proved, with structural ceiling.)** The right notion of tower depth for
   transfinite regimes is given by the KZ lax-idempotency persistence, not by the
   extended TQFT (whose construction remains open). The level-3 tower activation
   proposition above establishes:
   - depth $\leq 1$ iff $\kappa \leq \omega$ (strict/Scott-continuous);
   - depth $\geq 2$ iff $\kappa > \omega$ (upper two regimes; proved via $H^1$);
   - depth $\geq 3$ iff $\kappa \geq \omega_1$ (aperiodic; proved via KZ diamond section
     of the four-regime-dichotomy theorem).
   The **categorical depth ceiling** $d_{\mathrm{cat}} = 3$ is established by the
   structural-obstruction analysis in Section 5 (level-4 investigation): level 4 and
   beyond are trivially empty in the current framework because (1) the $\mathbb{M}
   \dashv \mathbb{N}$ adjunction is a strict 2-adjunction (triangle identities are
   equations, not 3-cells), and (2) the $\mathrm{Cl}$-$\mathbb{N}$ distributive law
   is strict componentwise (KZ-diamond strict commutation theorem, sketch). Both
   obstructions are structural — they hold for all regimes including $\kappa \geq
   \omega_2$ — so the level-4 bigraded diamond is trivially trivial regardless of
   $\kappa$. The regime determines the DEPTH WITHIN level 3 (how many non-isomorphic
   stage-local diamonds exist, i.e., $d(\kappa) = \kappa$), not whether level 4
   activates. The single remaining open sub-task: (i) whether the transfinite-bounded
   regime has a genuine level-3 tower "bounded window" carrying invariants beyond $H^1$
   (the level-3 bigraded diamond is non-trivial up to $\kappa$ in this regime, but no
   invariant beyond the KZ lax-idempotency/stabilization pair has been identified).
   (d) Formalize the center sequence as a genuine globular identity tower (requires
   identifying a common ambient $(\infty,1)$-categorical structure for the levels).

## Why it matters

If every instance is a bigraded diamond:

- The bilattice two-orders duality theorem, the double-Beck-Chevalley condition, the
  Frobenius compatibility, and the KZ-distributive law are all special cases of one
  structural theorem about bigraded diamonds. Proofs done for one instance transfer
  mechanically.
- The step-$n$ alignment's natural stopping-point at $n = 4$ within FOUR is the
  stopping-point of the *value-layer* shadow; the hyperdoctrine-layer extends it to
  $n = 5$. The step-$n$ program and the bigraded diamond program are one program.
- The causal lacing — the settling's temporal chain — is identified as an algebraic
  morphism (the $\iota_k \circ \iota_t$ cross-axis swap), and the settling cohomology
  $H^1$ measures its deviation from flatness.
- The two-adjoint-systems narrative's observation ("every Lawvere construction comes
  out twice — once per adjoint system") is the bigraded diamond's shadow-vs.-center
  decomposition: the "once" is the shadow's single adjunct, and the "twice" is the
  bigraded diamond's two symmetrically-placed outer pairs.
- The distinction between the standard $K_4 = \langle \sim, - \rangle$ (non-free,
  coordinate-respecting, the bilattice's intrinsic symmetry) and the diagonal $K_4 =
  \langle \sigma, \sim\!- \rangle$ (free-acting, the bigraded diamond's shadow
  involution group) clarifies why the corpus's $K_4$-symmetry results are not directly
  about the motif: they use the standard $K_4$, while the motif uses the diagonal $K_4$.
  The full $D_4$ symmetry group contains both, and is needed to relate them.
- The regime chain order $\mathrm{strict} < \mathrm{scott\text{-}cont} <
  \mathrm{transfinite\text{-}bounded} < \mathrm{aperiodic}$ is reinterpreted as the
  ordinal depth-index of the bigraded diamond tower: each regime transition activates
  the next level of the tower. The four regimes are the four "depth thresholds" — they
  count how far the motif's tower extends into the $(\infty,1)$-categorical structure.
  This makes the regime dichotomy and the bigraded diamond the SAME mathematical
  content, seen from two angles: one classifies settling dynamics by closure ordinal;
  the other classifies the categorical tower by how many levels carry non-trivial
  structure.

If the instances are NOT all bigraded diamonds — if the definition is either too
restrictive (missing some instances) or too permissive (not capturing what makes the
pattern structural) — that is equally informative: it means the motif either has a
richer definition or decomposes into genuinely distinct sub-patterns.

## Status

Open. Progress to date:

- **Section 1** (σ*-fixed-point): the $\sigma_*$-fixed-point claim for $f^*$ is now
  proved as part of the level-1 case of the bigraded diamond theorem in Section 5.
- **Section 4** (bigraded diamond definition): new; two instances verified at sketch
  level (predicate and Frobenius layers), two open (d-frame and linear-logic). The
  correct shadow involutions are from the **diagonal $K_4 = \langle \sigma, \sim\!-
  \rangle$**, not the standard $K_4 = \langle \sim, - \rangle$.
- **Section 5** (tower conjecture): levels 0–3 of the tower are identified with
  existing corpus structures. Level 3 uses the four canonical 2-cells
  $\{\eta_{\mathbb{M}}, \mu_{\mathbb{M}}, \varepsilon_{\mathbb{N}}, \delta_{\mathbb{N}}\}$
  of the $\mathbb{M} \dashv \mathbb{N}$ 2-adjunction (corrected from an earlier
  incorrect identification). The **bigraded diamond at each level theorem** (proved in
  Section 5) establishes that the five canonical structure maps at levels 1, 2, 3 each
  constitute a bigraded diamond: full proof for level 1 (reindexing commutativity +
  orthogonality), proof for levels 2–3 from sub-question 6(a) freeness results.
  Sub-questions 6(a) and 6(b) are **proved**: (a) the level-2 and level-3 bigraded
  diamond involutions are free, verified by source-target type distinctness at each
  level; (b) $H^1 \neq 0 \iff$ level-2 content non-trivial, proved from the
  $H^1$-generators, four-regime-dichotomy, and equivariant-decomposition theorems,
  with the sector bijection unconditional given (a). The
  globular identity tower claim is morally correct but not strict — see the center
  sequence note in Section 5. Sub-question 6(c) is **proved with structural ceiling**:
  the right notion of level-3 tower depth is KZ lax-idempotency persistence (not
  extended TQFT); depth $\geq 3$ iff $\kappa \geq \omega_1$ is proved from the
  four-regime-dichotomy theorem's KZ diamond section. The ordinal tower depth $d(\kappa)
  = \kappa$ is proved from the settling's strict ascending property — stage-local bigraded
  diamonds are pairwise non-isomorphic because the settling is strictly
  $\leq_k$-ascending on $[0, \kappa)$, with $\eta_{\mathrm{Cl}(v_\tau)}$ an isomorphism
  iff $\tau \geq \kappa$ (see ordinal tower theorem in Section 5). This confirms $d \geq
  \omega$ in the transfinite-bounded regime and $d \geq \omega_1$ in the aperiodic
  regime. The **categorical depth ceiling** $d_{\mathrm{cat}} = 3$ is established by the
  structural obstruction in Section 5: level 4 and beyond are trivially trivial in the
  current framework because the $\mathbb{M} \dashv \mathbb{N}$ adjunction is strict (no
  triangle-identity modifications) and the $\mathrm{Cl}$-$\mathbb{N}$ distributive law
  is strict componentwise (KZ-diamond strict commutation theorem, sketch) — both
  obstructions are regime-independent. Sub-question 6(d) (globular identity tower)
  remains open. The Level-3 → Level-2 TQFT connection remains open in corpus.
- **Section 6** (step-5 conjecture): sharpened. Standard Pentanacci refuted (matrix
  irreducible, no commuting involution permutation). The conjecture reduces to a design
  question: find a Pisot step-5 rule with $M_5$ block-diagonal in the diagonal $K_4$
  isotypic decomposition $2 \oplus 1 \oplus 1 \oplus 1$ of $\mathbb{Z}^5$. Open.

**Corrections to prior versions.** Section 4's value-layer identification originally
misidentified $\iota_k = -$ (conflation) and $\iota_t = \sim$ (negation), but
conflation fixes $\mathbf{t}$ and $\mathbf{f}$ and negation fixes $\bot$ and $\top$
— neither acts freely on FOUR, so neither can be a bigraded diamond involution. The
correct free involutions are $\iota_k = \sim\!-$ and $\iota_t = \sigma$ (elements of
the diagonal $K_4$). The instance table's predicate row also had $\sigma_*$ and Verdier
swapped; corrected in the current version.

Established: the four-element value-layer diamond and the five-element predicate-layer
combined adjoint system are related by $\sigma_*$-fixed-point extension (Section 1);
sub-questions 6(a) (free involutions at all levels) and 6(b) ($H^1 \neq 0 \iff$
level-2 tower content non-trivial) are proved from existing corpus theorems.
Sub-question 3 (4-cycle traversal): the $\mathbb{Z}/4$ set-action exists on $X$ (fixing
$I$, cycling the shadow) but is NOT a bigraded diamond automorphism — $D_4$ shrinks to
diagonal $K_4$ upon center emergence; $r^2 = \iota_k$. Sub-question 2 (lacing
morphism): two formulations identified — within-diamond ($\iota_k \circ \iota_t$ as
anti-diagonal at every level) and between-diamond (Frobenius $\Delta \circ \mu$); $H^1$
is the curvature of the lacing (corollary of 6(b)). Sub-question 4 (trajectory
category): $D_4$-to-diagonal-$K_4$ factorization gives the enrichment; value hom =
level-1, temporal hom = level-2; formal construction open. Sub-question 1 (d-frame
and linear-logic): d-frame bigraded diamond lives in $\mathbf{BiLat}$ (not
$\mathbf{dFrm}$), center = bilattice $B$ at the Jung–Rivieccio diagonal, $\iota_k$
requires the self-dual category; focusing modes form a bigraded diamond with $\iota_k$
= polarity-swap, $\iota_t$ = mode-swap, $\uparrow\downarrow$ = traversal steps. Sub-question 5 (step-5 conjecture): standard Pentanacci refuted (irreducible matrix,
no involution-commuting bijection); reformulated as finding a Pisot step-5 rule with
$M_5$ block-diagonal in the $K_4$ isotypic decomposition $2 \oplus 1 \oplus 1 \oplus 1$
of $\mathbb{Z}^5$; open design question.
