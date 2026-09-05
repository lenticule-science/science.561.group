---
id: shadow-of-the-future
name: ShadowOfTheFuture
description: "The Shadow of the Future — infinite propagation of the transfer condition may make the settled layer H_t* undetermined by any finite-depth approximation."
---

### Conjecture — The Shadow of the Future {#shadow-of-the-future}

#### Setup — Future Extensions and the Transfer Witness {#shadow-setup}

The transfer nucleus $\Delta_t$ is defined by the one-step extensions of the history $t$
(§delta-linking, Transfer Witness Characterization):
$$
a \in \mathrm{Fix}(\Delta_t)
\;\iff\;
\forall\, s \in \Sigma,\; s \perp t:\; a \in \mathrm{image}\bigl(H(i_{s,t})\bigr),
$$
where $i_{s,t}: t \to s \star t$ is the extension morphism and $H(i_{s,t}): H_{s \star t} \to H_t$
is the corresponding restriction map. A proposition $a \in H_t$ is transfer-stable —
fixed by $\Delta_t$ — exactly when every possible one-step extension $s \star t$ of $t$
has some proposition $b \in H_{s \star t}$ that restricts to $a$.

Since $\Delta_t$ is extensive ($a \leq \Delta_t(a)$, see §delta-linking, Adjoint
Characterization), the map $\Delta_t$ sends $a$ to the **minimal transfer-stable
element above $a$**: the least element of $\mathrm{Fix}(\Delta_t)$ that is $\geq a$.
When $a \notin \mathrm{Fix}(\Delta_t)$, the gap $\Delta_t(a) > a$ is the amount by which
the future demands more of $a$ than $a$ currently provides. Some extension $s \star t$
has no proposition that restricts to $a$: $a$ is unwitnessed in that future.

**Definition — The Future Requirement.** The **future requirement** of $a$ at $t$ is the
element $\Delta_t(a) \in H_t$: the minimal strengthening of $a$ that is witnessed by every
one-step extension. When $a = \Delta_t(a)$, the future places no additional requirement
on $a$ — it is already witnessed by all extensions. When $a < \Delta_t(a)$, the future
demands something strictly stronger than $a$.

#### The Propagation Observation {#shadow-propagation}

The definition of $\Delta_t$ looks only one step ahead. The $\Delta$-Lifting Lemma
(§delta-linking, §delta-lifting) shows this is deceptive.

**Lemma (recalled).** If $a \in \mathrm{Fix}(\Delta_t)$, then for each $s \perp t$
there exists a canonical transfer $\widetilde{a}_{s,t} \in H_{s \star t}$ satisfying:

1. $H(i_{s,t})(\widetilde{a}_{s,t}) = a$ (restricts back to $a$);
2. $\widetilde{a}_{s,t} \in \mathrm{Fix}(\Delta_{s \star t})$ (is itself transfer-stable
   at $s \star t$).

The canonical transfer is not merely a lift — it is a *settled* lift. So being in
$\mathrm{Fix}(\Delta_t)$ requires that the lift to each one-step extension is itself
liftable to all of *its* one-step extensions, and those lifts are liftable further, and
so on. The $\Delta$-Lifting Lemma propagates the transfer condition upward through
the entire extension tree.

**Observation.** The inclusion $H_t^* \subset \mathrm{Fix}(\Delta_t)$ is the local
statement; the global statement is that $a \in H_t^*$ requires coherent liftability to
*every* finite-depth extension tree rooted at $t$: for every sequence of steps
$s_1, \ldots, s_k$ with $s_i \perp (s_{i-1} \star \cdots \star s_1 \star t)$, the
successive canonical transfers
$$
\widetilde{a}_{s_1,\,t} \in H_{s_1 \star t}^*,\quad
\widetilde{\widetilde{a}}_{s_2,\,s_1 \star t} \in H_{s_2 \star s_1 \star t}^*,\quad \ldots
$$
must each exist and be settled at their respective histories.

This is immediate from the Lifting Lemma by induction on tree depth. It is an observation,
not a conjecture. The conjecture is whether the infinite coherence condition is strictly
stronger than any finite approximation.

#### The Conjecture — Infinite Depth Is Necessary {#shadow-conjecture}

**Conjecture (Infinite Propagation).** There exist histories $t$, propositions $a \in H_t$,
and integers $N \geq 1$ such that $a$ is *finitely settled at depth $N$* — liftable along
every extension tree of depth $\leq N$, with each lift settled at its history — but is *not*
settled: $a \notin H_t^*$ because some extension tree of depth $N+1$ has no settled lift.

Equivalently: the settled layer $H_t^*$ is not determined by the depth-$N$ approximation
$R_N = \mathbf{Sh}(T^{(\leq N)}, J|_{T^{(\leq N)}})$ for any finite $N$. Determining
$H_t^*$ requires the full limit $R = \mathrm{colim}_n R_n$ (§depth-filtration).

If true, this has a structural consequence: **the present is not locally determined by
the present.** The settled sub-algebra $H_t^* \subset H_t$ is a global invariant of the
entire history site $(T,J)$ — not of the fiber $H_t$ alone, nor of the $N$-neighborhood of
$t$ in the history category for any finite $N$.

**What would confirm the conjecture.** A concrete construction: take a history monoid
$\mathbb{M}(\Sigma, I)$ with a growing "commutation frontier" — as the history depth
increases, new commuting step-pairs appear that are commuting of each other but not of
the existing history. The resulting extension trees would have first failure at arbitrarily
large depth, producing propositions finitely settled at depth $N$ for every $N$ but not
settled overall.

**What would refute the conjecture.** A compactness argument showing that transfer
stability at all one-step extensions, together with the Axiom of Finite Generation
(§generative-basis), implies transfer stability at all depths — i.e., the infinite
coherence condition collapses to the one-step condition under finite generation.

#### Non-Local Pressure {#shadow-nonlocal}

Whether or not the Infinite Propagation conjecture is true, the following structural
consequence holds immediately from the transfer witness characterization:

**Corollary — Non-Local Pressure.** The settled layer $H_t^*$ is sensitive to the
commutation structure at histories remote from $t$. Specifically, suppose the commutation
relation $I$ is modified to $I'$ by making a previously dependent pair of steps $(s, s')$
commuting. If $s$ and $s'$ appear only at history distance $> N$ from $t$ (they are not
steps that can immediately extend $t$), then:

1. New extension trees of depth $> N$ become available to $t$ in the history category
   $(T, I')$ that did not exist in $(T, I)$.
2. A proposition $a \in H_t^{*(I)}$ that was settled in $(T, I)$ may fail to lift along
   these new trees in $(T, I')$.
3. Hence $a$ may no longer be settled: $a \notin H_t^{*(I')}$.

The present history $t$ "feels" a change in commutation structure at distance $> N$ through
the propagation of the transfer condition. This is not action at a distance in a
causal sense — the propagation is through the algebraic structure of the history monoid, not
through time. But it is non-local: what counts as settled at $t$ is determined by the
global topology of the extension set, not by any bounded neighborhood.

**The mechanism via the Axiom of Locality.** The Axiom of Locality (§locality) equips
the fiber sheaf $H$ with the commutation topology $J$ built from commutation-partition covers.
A covering family of $t$ is a collection of sub-histories whose commuting sub-structure
jointly covers $t$ (§locality, §commutation-topology). Adding the
pair $(s, s')$ to $I$ adds new covering families involving $s$ and $s'$, which imposes
new gluing conditions: propositions on $t$ must now be consistent with how they assemble
from (and into) covering families that involve the new commuting structure. The gluing
axiom is the mechanism by which future constraints propagate to the present.

#### Shadow Obstruction {#shadow-obstruction}

**Conjecture (Shadow Obstruction).** Let $a \in H_t$ with $a \in \mathrm{Fix}(\sigma_t)$
(backward-stable) but $a \notin \mathrm{Fix}(\Delta_t)$ (not transfer-stable). Then
the gap $\Delta_t(a) > a$ generates a nonzero cohomological obstruction:
$$
[\partial(a)] \in H^1(T, J;\, E_0) \neq 0,
$$
where $\partial: \Gamma(V/E_0) \to H^1(T,J;\,E_0)$ is the connecting homomorphism
(§cohomology).

**The intuition.** The class $[\partial(a)]$ measures the failure of $a$ to be the
restriction of a coherent global section of the mode sheaf $V$. A proposition with
$a \notin \mathrm{Fix}(\Delta_t)$ is not in the image of the restriction map from some
extension $s \star t$: it cannot be assembled from data at $s \star t$. By the sheaf
condition (§locality), this means $a$ is locally consistent (satisfies gluing within
its own neighborhood) but globally inconsistent (fails to glue when extensions are
included in the covering). This is precisely the structure detected by $H^1$.

By the Convergence Conjecture (§cohomological-tunneling, §cohomological-tunneling): as
the depth-filtration tower deepens, all $H^1$ classes are exhausted. Every shadow
obstruction — every gap $\Delta_t(a) > a$ — is eventually resolved. At the stage of
resolution, the mode $a$ undergoes cohomological tunneling: it drops discontinuously
to a globally consistent state, in which the gap $\Delta_t(a) - a$ has been absorbed
into the sheaf structure. At that stage, the future requirement on $a$ has been met —
not by changing $a$, but by the global sheaf structure adjusting to witness $a$ at the
new depth.

**The shadow and the spectral mass.** The defect operator $\delta_t$ and spectral mass
$M_t(\delta) = \mathrm{Tr}(\delta_t)$ (§spectral-decomposition) quantify unsettled
relational history at $t$. The Shadow Obstruction conjecture, if true, would identify
the contribution to $M_t(\delta)$ from transfer-instability: each $a$ with
$\Delta_t(a) > a$ contributes a mode to $M_t(\delta)$ weighted by the magnitude of the
gap. The Spectral Schwarzschild radius $r_s(\delta_t) = 2M_t(\delta)$ would then have
a direct interpretation: it is the "radius" within which future requirements on present
propositions remain unsatisfied — the zone in which the shadow of the future has not
yet been resolved.

**Status.** Stub. Requires:
(a) A construction confirming Infinite Propagation: a history monoid and proposition
    settled at all finite depths but not overall.
(b) A proof of the Shadow Obstruction: that $\Delta_t(a) > a$ implies $[\partial(a)] \neq 0$.
    This requires connecting the transfer witness condition to the short exact sequence
    $0 \to E_0 \to V \to V/E_0 \to 0$ in §cohomology.
(c) A quantitative relation between the shadow gap $\Delta_t(a) - a$ (in the Heyting order
    on $H_t$) and the eigenvalue of $a$ under $\delta_t$, making precise how much
    transfer-instability contributes to the spectral mass $M_t(\delta)$.
(d) The Non-Local Pressure corollary as a precise functor: the map $I \mapsto (H_t^*)^I$
    should be expressible as a contravariant functor on the poset of commutation relations,
    and the sensitivity to remote changes should be a non-continuity statement for that
    functor with respect to some natural topology on commutation relations.
