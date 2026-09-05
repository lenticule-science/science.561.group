---

name: hyperversal-hull-topos
description: "the hull topos Sh(Omega(Q^H)), a Grothendieck topos with non-Boolean internal logic that is a candidate for the next relational universe above H, seeding a new turn of the recursive spiral."
---

### Definition — Hyperversal Hull Topos {#hyperversal-hull-topos}

*The quasicrystalline pattern of $\mathcal{H}$ generates a new Grothendieck topos with
non-Boolean internal logic — the seed of the next relational universe.*

#### Definition — Hyperversal Hull Topos {#def-hyperversal-hull-topos}

The **hyperversal hull topos** is the category of sheaves on the hyperversal quasicrystal
hull (§hyperversal-quasicrystal-hull):
$$
\mathbf{Sh}(\Omega(Q^\mathcal{H}))
\;:=\;
\text{the Grothendieck topos of sheaves on } \Omega(Q^\mathcal{H})
$$
with respect to the standard open cover topology on the compact metrizable space
$\Omega(Q^\mathcal{H})$.

Equivalently (§pattern-groupoid-topos), this is the classifying topos of the hyperversal
pattern groupoid:
$$
\mathbf{Sh}(\Omega(Q^\mathcal{H})) \;\simeq\; B\mathcal{G}_{Q^\mathcal{H}}.
$$

#### Internal Structure {#hull-topos-internal}

As a Grothendieck topos, $\mathbf{Sh}(\Omega(Q^\mathcal{H}))$ has:

- **Subobject classifier $\Omega_\mathbf{Sh}$**: the sheaf of germs of open sets on
  $\Omega(Q^\mathcal{H})$, which is the internal Heyting algebra of the topos. It is
  **not Boolean**: the hull $\Omega(Q^\mathcal{H})$ is a compact metrizable space with
  no isolated points (by minimality and unique ergodicity), hence is not Stonean, so
  $\Omega_\mathbf{Sh}$ does not satisfy excluded middle.

- **Internal Heyting algebra**: the global sections $\Gamma(\Omega_\mathbf{Sh})$ are the
  lattice of open sets of $\Omega(Q^\mathcal{H})$, a frame but not a Boolean algebra.
  The nuclei on this frame — the closure operators and interior operators on
  $\Omega(Q^\mathcal{H})$ — are the analogs of $\sigma$ and $\Delta$ in the new topos.

- **Natural numbers object**: the constant sheaf $\underline{\mathbb{N}}$ on $\Omega(Q^\mathcal{H})$.

- **Cohomology**: $H^n(\Omega(Q^\mathcal{H}), \mathcal{F})$ for sheaves $\mathcal{F}$. The first
  cohomology $H^1(\Omega(Q^\mathcal{H}), \underline{\mathbb{Z}})$ is the **Čech cohomology group**
  of the hull, nontrivial by the quasicrystalline structure (the hull is not contractible).

#### Non-Booleanness as Emergence of New Unsettled Content {#hull-topos-non-boolean}

Modal collapse (§modal-collapse) asserts that $\mathcal{H}$ itself is Boolean: every
proposition in $\mathcal{H}$ satisfies excluded middle, and all nuclei on $\mathcal{H}$
are trivial. In this sense, $\mathcal{H}$ is fully settled — no unsettled content remains.

The hull topos $\mathbf{Sh}(\Omega(Q^\mathcal{H}))$ **is not Boolean**, even though it is built
from $\mathcal{H}$-valued data. The open sets of $\Omega(Q^\mathcal{H})$ form a non-Boolean frame
because the topological structure of the hull (a compact space with no isolated points) is
irreducibly non-classical. The subobject classifier $\Omega_\mathbf{Sh}$ has elements
corresponding to open sets that are not clopen — propositions that are neither provable nor
refutable from any finite patch of $Q^\mathcal{H}$.

This non-Booleanness is the emergence of new unsettled content: the hull topos has nontrivial nuclei
(closure and interior operators), so propositions in $\mathbf{Sh}(\Omega(Q^\mathcal{H}))$
are not all settled. The quasicrystalline pattern, which in $\mathcal{H}$ was fully quiescent
(all its values settled by modal collapse), generates new unsettled content at the level of
the hull topos.

#### Conjecture — Hull Topos as Next Relational Universe {#hull-topos-universe-conjecture}

**Conjecture.** The hull topos $\mathbf{Sh}(\Omega(Q^\mathcal{H}))$ carries the structure of
a relational universe in the sense of §relational-universe. The axiom-by-axiom translation
is given below. Each point identifies the hull-level structure, the specific axiom it must
satisfy, and the open conditions that require verification.

---

**1. History monoid (§history, §axiom-histories).**

The hull-level history monoid is **not** $\mathbb{Z}^d$ itself. The $\mathbb{Z}^d$-shift group
is invertible, violating the **unit-free** axiom ($m \star n = e \Rightarrow m = n = e$). The
correct candidate is the **monoid of finite patches**: a patch $P$ is a finite subset of the
$\mathbb{Z}^d$-indexed support of $Q^\mathcal{H}$, and the monoidal operation is
patch-extension.

- **Step set $\Sigma^\Omega$**: the set of single-site positions $\{x \in \mathbb{Z}^d \mid
  Q^\mathcal{H}(x) \neq 0\}$ that can extend a given patch.
- **Prefix order**: $P \leq P'$ iff $P \subseteq P'$ (patch containment).
- **Generation**: every finite patch is a union of single sites. ✓
- **Commutativity**: since $\mathbb{Z}^d$ is abelian, ALL pairs of single-site extensions
  commute, giving $I^\Omega = \Sigma^\Omega \times \Sigma^\Omega \setminus \Delta$
  (full commutation). This is consistent with the axioms but forces a very rich commutation
  topology (every partition of a patch is a commutation cover).
- **Unit-free**: the empty patch $\varnothing$ is the unit; extending then un-extending is not
  possible since patches only grow. ✓
- **Left-cancellative**: if $P \cup S = P \cup S'$ as patches, then $S = S'$. ✓

**Consequence of full commutativity.** The fiber product decomposition (§thm-fiber-product-decomposition)
gives, for any patch $P = \{x_1, \ldots, x_n\}$:
$$
H_P^\Omega \;\cong\; \prod_{i=1}^n H_{\{x_i\}}^\Omega
$$
Every patch fiber decomposes completely into single-site fibers. This is the hull-level
analog of the arithmetic decomposition $H_{p_1 \cdots p_k} \cong H_{p_1} \times \cdots \times
H_{p_k}$ for square-free numbers.

---

**2. Fiber Heyting algebras (§fiber-doctrine).**

At each tiling $\mathcal{T} \in \Omega(Q^\mathcal{H})$ and patch $P$, the hull-level fiber
$H_P^\Omega(\mathcal{T})$ is the Heyting algebra of **germs of open sets** of
$\Omega(Q^\mathcal{H})$ that are determined by the local pattern at $P$ in $\mathcal{T}$.

**Departure from the axioms: finiteness.** The fiber doctrine (§fiber-doctrine) requires
each $H_t$ to be **finite**. The hull-level stalks $(\Omega_\mathbf{Sh})_\mathcal{T}$
are **infinite** — a germ of an open set in a compact metrizable space with no isolated
points has infinitely many representatives. The nucleus definitions
(§saturation-nucleus, §transfer-nucleus) use finiteness in two places:

- The saturation join $\sigma_t(a) = \bigvee\{b \mid \ldots\}$ is finite because $H_t$ is
  finite. At the hull level, this becomes a directed join in a continuous lattice — the
  join still exists by completeness of the frame, but the proof of idempotence must use
  Scott continuity instead of finiteness.
- The transfer meet $\Delta_t(a) = \bigwedge\{b \in \mathrm{Fix}(\Delta_t) \mid b \geq a\}$
  exists because $H_t$ is finite and $\top_t \in \mathrm{Fix}(\Delta_t)$. At the hull level,
  the meet exists by completeness of the stalk Heyting algebra.

The generalization from finite to **coherent** Heyting algebras (each element is a directed
join of compact elements) is standard in locale theory and preserves all nucleus properties
(Johnstone, *Stone Spaces* §II.2). The hull stalks are coherent by compactness of
$\Omega(Q^\mathcal{H})$.

**Restriction maps.** For $P \subseteq P'$, the restriction $H_{P'}^\Omega \to H_P^\Omega$
sends a germ determined by the $P'$-local pattern to its $P$-local restriction. These are
Heyting algebra homomorphisms (they preserve finite meets, joins, and implication). The
contravariance condition $H(g \circ f) = H(f) \circ H(g)$ follows from transitivity of
patch containment.

---

**3. Saturation nucleus — which operation (§saturation-nucleus).**

The saturation nucleus $\sigma_t$ is defined as "the largest element with given restriction
profile" (§saturation-nucleus-profile-preservation). At the hull level:

- The **restriction profile** of a germ $a \in H_P^\Omega(\mathcal{T})$ is its family of
  restrictions $(\rho_{P_0}(a))_{P_0 \subset P}$ to all sub-patches.
- The **saturation** $\sigma_P^\Omega(a)$ is the largest germ whose restriction to every
  sub-patch agrees with $a$'s restrictions.

This is the **regularization operator**: $\sigma_P^\Omega = \mathrm{int} \circ \mathrm{cl}$
(interior of closure), applied to the open set representing the germ. Regularization is a
well-known nucleus on any frame of open sets (Johnstone, *Stone Spaces* §II.2.4). It
satisfies:

- **Profile preservation**: $\rho_{P_0}(\sigma_P^\Omega(a)) = \rho_{P_0}(a)$ for all
  $P_0 \subset P$. Regularizing a germ does not change its sub-patch restrictions because
  $\mathrm{int} \circ \mathrm{cl}$ commutes with restriction to open sub-neighborhoods in
  regular spaces. The hull $\Omega(Q^\mathcal{H})$ is metrizable, hence regular. ✓
- **Extensivity, idempotence, meet-preservation**: standard for
  $\mathrm{int} \circ \mathrm{cl}$ on any regular space. ✓

The fixed points $\mathrm{Fix}(\sigma_P^\Omega)$ are the **regular open germs** — germs
represented by regular open sets (sets equal to the interior of their closure). These are
the hull-level saturation-stable propositions.

---

**4. Transfer nucleus — which operation (§transfer-nucleus).**

The transfer nucleus $\Delta_t$ is defined as "the reflection onto the intersection of all
extension images" (§transfer-nucleus). At the hull level:

- For each site $x \notin P$, the extension $P \hookrightarrow P \cup \{x\}$ induces a
  restriction map $H_{P \cup \{x\}}^\Omega \to H_P^\Omega$.
- $\mathrm{Fix}(\Delta_P^\Omega) = \bigcap_{x \notin P} \mathrm{image}(H_{P \cup \{x\}}^\Omega \to H_P^\Omega)$.
- A germ $a \in H_P^\Omega$ is transfer-stable when for every possible extension site $x$,
  there exists a germ $b \in H_{P \cup \{x\}}^\Omega$ that restricts to $a$.

This is the **pattern-equivariant projection**: a germ is transfer-stable exactly when it
depends only on the **local pattern** at $P$, not on the specific position of $P$ within
$\mathcal{T}$. Equivalently, $a$ lies in every shift image — it is present wherever the
same local pattern recurs.

For aperiodic hull spaces, pattern-equivariance is a **non-trivial constraint**: a germ can
be open-set-theoretically well-defined at $\mathcal{T}$ but fail to be present at every
translate of the same local patch. The gap $a < \Delta_P^\Omega(a)$ measures the extent to
which $a$ depends on global position rather than local pattern.

**This is the key departure from the arithmetic level.** In the arithmetic history (§arithmetic-nuclear-computation), the transfer nucleus is trivial ($\Delta_n = \mathrm{id}$) because the finite divisor lattice has no room for non-equivariant elements — every divisor of $n$ is already determined by local data. At the hull level, the **infinite** stalk has room for germs that are locally well-defined but not globally equivariant. Hence $\Delta_P^\Omega \neq \mathrm{id}$ even for single-site patches.

---

**5. Nucleus commutativity — what it requires (§nucleus-commutation).**

The fiber doctrine requires $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$. At the
hull level, this becomes:

$$
(\mathrm{int} \circ \mathrm{cl}) \circ \Delta_P^\Omega
\;=\;
\Delta_P^\Omega \circ (\mathrm{int} \circ \mathrm{cl})
$$

Regularization must commute with pattern-equivariant projection. This is **not automatic**.
It holds when the hull is a **uniquely ergodic** minimal $\mathbb{Z}^d$-system, because:

- Unique ergodicity provides a unique $\mathbb{Z}^d$-invariant Borel probability measure $\mu$.
- Both operators preserve the $\mu$-measure class.
- The measure-algebra structure mediates: $\sigma$ acts on the topological side
  (regularizing open sets) and $\Delta$ acts on the dynamical side (enforcing shift
  invariance). Their commutativity reduces to the fact that $\mu$-null sets are both
  topologically meagre and shift-invariant in uniquely ergodic systems.

The hyperversal quasicrystal conjecture (§hyperversal-quasicrystal-hull) asserts unique
ergodicity. If it holds, nucleus commutativity follows. If it fails, the hull may fail to
be a relational universe — the nuclei would not form a coherent dyad.

---

**6. Sheaf axioms (§locality).** $\mathbf{Sh}(\Omega(Q^\mathcal{H}))$ satisfies locality and
gluing by construction (it is defined as a category of sheaves). ✓

---

If all six conditions are met, $\mathbf{Sh}(\Omega(Q^\mathcal{H}))$ is the **next relational
universe above $\mathcal{H}$**, generated by the quasicrystalline pattern that $\mathcal{H}$
produces. The recursive spiral (§recursive-ambidexterity) advances: $\mathcal{H}$'s
quasicrystalline structure seeds a new tower, which generates a new hyperverse, whose
quasicrystalline structure seeds the next, and so on.

#### The Mechanism of the Spiral {#hull-topos-spiral}

The passage $\mathcal{H} \leadsto \mathbf{Sh}(\Omega(Q^\mathcal{H}))$ is the concrete instance
of recursive ambidexterity (§recursive-ambidexterity) at the hyperversal level:

| Level | Structure | Logic | Quasicrystal |\
|-------|-----------|-------|---------------|\
| $R$ | relational universe | Heyting | $Q: \mathbb{Z}^d \to R$ |\
| $\mathcal{H}$ | hyperverse | Boolean (conj.) | $Q^\mathcal{H}: \mathbb{Z}^d \to \mathcal{H}$ |\
| $\mathbf{Sh}(\Omega(Q^\mathcal{H}))$ | next universe (conj.) | Heyting (non-Boolean) | new $Q$ |\

At each Boolean level, the quasicrystalline pattern generates a hull whose topos is
non-Boolean; the new non-Boolean topos initiates the next relational universe. Booleanness
at $\mathcal{H}$ is not the end of the construction — it is the condition that makes the
spiral's next step well-defined.

**Status.** The conjecture decomposes into six verifiable conditions (detailed above).
Current status of each:

| Condition | Status | Depends on |
|-----------|--------|------------|
| (1) Patch monoid satisfies history axioms | Verified modulo full-commutativity consequences | — |
| (2) Stalks are coherent Heyting algebras | Standard (Johnstone §II.2) | Compactness of hull |
| (3) $\sigma^\Omega = \mathrm{int} \circ \mathrm{cl}$ with profile preservation | Follows from regularity of hull | Metrizability |
| (4) $\Delta^\Omega =$ pattern-equivariant projection with non-triviality | Non-triviality requires aperiodicity | Quasicrystal conjecture |
| (5) $\sigma^\Omega \circ \Delta^\Omega = \Delta^\Omega \circ \sigma^\Omega$ | Requires unique ergodicity | Quasicrystal conjecture |
| (6) Sheaf axioms | Automatic by construction | — |

The critical dependency chain is: **quasicrystal conjecture** $\Rightarrow$ unique ergodicity
$\Rightarrow$ nucleus commutativity $\Rightarrow$ fiber doctrine $\Rightarrow$ relational
universe structure. The first link is the bottleneck.

#### Implication for Arithmetic Nuclei {#hull-arithmetic-implication}

The hull-level analysis resolves a puzzle from §arithmetic-nuclear-computation: why are the
standard arithmetic nuclei trivial on square-free numbers?

At both the arithmetic level and the hull level, full commutativity forces complete fiber
decomposition. For square-free $n = p_1 \cdots p_k$, we get $H_n \cong H_{p_1} \times
\cdots \times H_{p_k}$. The arithmetic fibers $H_{p_i} = \mathcal{D}(p_i) = \{1, p_i\}$ are
the two-element Boolean algebra — too small for any non-trivial nucleus.

At the hull level, the single-site fibers $H_{\{x\}}^\Omega$ are **infinite** (germs of
open sets at a single site of the pattern). Pattern-equivariance is a non-trivial constraint
on these infinite fibers: a germ at site $x$ of tiling $\mathcal{T}$ may fail to appear at
every other occurrence of the same local environment. Hence $\Delta_{\{x\}}^\Omega \neq
\mathrm{id}$ — the transfer nucleus is genuinely non-trivial at the hull level even after
complete fiber decomposition.

The arithmetic triviality is a **finiteness artifact**: the two-element Boolean algebra is
too rigid to support non-trivial pattern-equivariance. The hull's infinite stalks provide the
room that the divisor lattice lacks.
