---

name: hyperversal-fiber-doctrine
description: "the hyperversal fiber doctrine — each fiber algebra H_t^H of H is the colimit of the tower of finite Heyting algebras H_t^(n), conjectured to be Boolean under modal collapse, with all nuclei trivial."
---

### Conjecture — Hyperversal Fiber Doctrine {#hyperversal-fiber-doctrine}

The fiber doctrine (§fiber-doctrine) states that each fiber $H_t$ in the Relational Universe
is a finite Heyting algebra. The **hyperversal fiber doctrine** is the corresponding statement
about the fiber algebras of the Relational Hyperverse $\mathcal{H}$.

#### Definition — Hyperversal Proposition Fiber {#hyperversal-fiber-algebra}

For each history $t$, the **hyperversal proposition fiber** is
$$
H_t^\mathcal{H}
\;:=\;
\varinjlim_n H_t^{(n)},
$$
the colimit of the tower of fiber algebras $H_t^{(0)} \hookrightarrow H_t^{(1)} \hookrightarrow H_t^{(2)} \hookrightarrow \cdots$
in the category of Heyting algebras, where each inclusion $H_t^{(n)} \hookrightarrow H_t^{(n+1)}$
is the tower fiber seeding map (§tower-fiber-seeding): the fixed fiber $(H_t^{(n)})^*$ is
identified with the free carrier $H_t^{(n+1)}$ at the next level.

More explicitly: the tower of fiber algebras at $t$ is
$$
H_t^{(0)}
\;\hookrightarrow\;
(H_t^{(0)})^* = H_t^{(1)}
\;\hookrightarrow\;
(H_t^{(1)})^* = H_t^{(2)}
\;\hookrightarrow\; \cdots
$$
Each term is a sub-Heyting-algebra of the previous one's free carrier, and each inclusion
is the canonical inclusion of the fixed fiber into the next level's free carrier.

#### The Doctrine {#hyperversal-fiber-doctrine-statement}

**Conjecture (Hyperversal Fiber Doctrine).** The hyperversal fiber algebra $H_t^\mathcal{H}$
satisfies:

1. **Colimit Heyting algebra.** $H_t^\mathcal{H}$ is a Heyting algebra — the colimit of a
   filtered diagram of Heyting algebra inclusions is again a Heyting algebra, since Heyting
   algebra structure is preserved under filtered colimits.

2. **Nuclear triviality.** The nuclei $\sigma_t^\mathcal{H}$ and $\Delta_t^\mathcal{H}$,
   defined as the colimits of the level-$n$ nuclei, are both trivial:
   $\sigma_t^\mathcal{H} = \Delta_t^\mathcal{H} = \mathrm{id}_{H_t^\mathcal{H}}$.
   Equivalently, $(H_t^\mathcal{H})^* = H_t^\mathcal{H}$. This is the fiber-level statement
   of the Nuclear Triviality conjecture (§modal-collapse).

3. **Booleanness.** Furthermore, $H_t^\mathcal{H}$ is **Boolean**: excluded middle holds,
   $a \vee \neg a = \top$ for all $a \in H_t^\mathcal{H}$. This is the fiber-level statement
   of the Booleanness conjecture (§modal-collapse).

4. **No new fiber content at the limit.** Every element of $H_t^\mathcal{H}$ is the image of
   some $a^{(n)} \in H_t^{(n)}$ under the colimit inclusion — there are no "genuinely new"
   elements in $H_t^\mathcal{H}$ that do not arise from any finite level.

#### Contrast with the Fiber Doctrine {#hyperversal-fiber-doctrine-contrast}

| | Fiber doctrine (§fiber-doctrine) | Hyperversal fiber doctrine |
|---|---|---|
| Fiber algebra | $H_t$ finite Heyting algebra | $H_t^\mathcal{H}$ countably filtered colimit of Heyting algebras |
| Logic | Intuitionistic (excluded middle may fail) | Boolean (excluded middle holds, conj.) |
| Nuclei | $\sigma_t, \Delta_t$ nontrivial in general | $\sigma_t^\mathcal{H} = \Delta_t^\mathcal{H} = \mathrm{id}$ (conj.) |
| Fixed fiber | $H_t^* \subsetneq H_t$ in general | $(H_t^\mathcal{H})^* = H_t^\mathcal{H}$ (conj.) |
| Stabilization | $\mathrm{Stab}_t \neq \mathrm{id}$ in general | $\mathrm{Stab}_t^\mathcal{H} = \mathrm{id}$ (conj.) |

The hyperversal fiber is maximally settled: every proposition is its own stable form. The
becoming-machinery of the fiber doctrine — nuclei, stabilization, the gap between $H_t$ and
$H_t^*$ — has been exhausted.

#### The Non-Boolean Seed {#hyperversal-fiber-doctrine-seed}

Although $H_t^\mathcal{H}$ is conjectured Boolean, the hull topos
$\mathbf{Sh}(\Omega(Q^\mathcal{H}))$ (§hyperversal-hull-topos) built from the hyperversal
quasicrystalline pattern is NOT Boolean. Its fiber algebras (the stalks of the subobject
classifier at points of $\Omega(Q^\mathcal{H})$) are new non-trivially nuclear Heyting
algebras — the free carriers of the next turn of the spiral. The hyperversal fiber doctrine
is simultaneously a closure theorem (the current tower is exhausted) and an opening theorem
(the hull topos fiber algebras begin a new fiber doctrine one level up).

**Status.** All four points are conditional on the Modal Collapse conjecture (§modal-collapse),
specifically: (a) the explicit definition of $H_t^\mathcal{H}$ as a filtered colimit (given
here), (b) compatibility of nuclei with the colimit (requires §modal-collapse status item b),
and (c) finite witnessing of stabilization (requires §modal-collapse status item c). Booleanness
additionally requires §modal-collapse status items d and e.
