---

name: construction-observation-dyad
description: "Construction-Observation Dyad — H (sheaf of propositions, built from below) and H∨ = [H,Ω] (observation sheaf, testing from above) are the two poles; convergence is H* × (H∨)* → Ω separating (§observation-duality)."
---

### Theorem — The Construction–Observation Dyad {#construction-observation-dyad}

The **construction–observation dyad** is the duality between the two directions in which
the stable propositions of $R$ can be approached: by building them from below (the sheaf
$H$ of propositions) and by testing them from above (the observation sheaf $H^\vee = [H, \Omega]$).

#### The Two Poles {#construction-observation-dyad-poles}

| Pole | Object | Direction |
|------|--------|-----------|
| **Construction** | $H$ — the sheaf of propositions | Building from atoms upward via $U_G$ |
| **Observation** | $H^\vee = [H, \Omega]$ — the observation sheaf | Testing predicates against $\Omega$ downward |
| **Convergence** | $H^* \times (H^\vee)^* \to \Omega$ separating | Observation Duality (§observation-duality) |

**Construction pole.** The sheaf $H : T^\mathrm{op} \to \mathbf{HA_{nucl}}$ assembles
the fiber Heyting algebras into a global object. Its sections are propositions built up
from the history structure: they record what holds at each history and how it restricts
along prefix extensions.

**Observation pole.** The observation sheaf $H^\vee := [H, \Omega]$ is the internal hom
into the subobject classifier. Its sections at $t$ are $\Omega$-valued predicates on $H$
at history $t$ — the observable tests that can be applied to propositions. The dual nuclei
$(\sigma^\vee, \Delta^\vee)$ on $H^\vee$ are defined by precomposition.

#### Convergence {#construction-observation-dyad-convergence}

The Observation Duality theorem (§observation-duality) establishes the convergence: at the
doubly-stable level, the natural pairing
$$
\langle -, - \rangle : H^* \times (H^\vee)^* \longrightarrow \Omega
$$
is **separating**: distinct stable propositions are separated by stable observations,
and distinct stable observations are separated by stable propositions. Construction and
observation agree on exactly what is stable.

**Open step.** The separation and co-separation claims depend on a generation argument
for $(H^\vee)^*$ that has not been completed (§observation-duality). They hold fiberwise
for finite Heyting algebras via Birkhoff duality, but the assembly into global sections
is an open step.

#### Level {#construction-observation-dyad-level}

This is a universe-level dyad: both poles live at the level of $R = \mathbf{Sh}(T,J)$,
not at the level of an individual fiber. The fiber-level analogue is the
saturation–transfer dyad (§saturation-transfer-dyad), where the single-fiber $H_t$
replaces the global $H$ and the two nuclei $\sigma_t$/$\Delta_t$ replace the
construction/observation directions.
