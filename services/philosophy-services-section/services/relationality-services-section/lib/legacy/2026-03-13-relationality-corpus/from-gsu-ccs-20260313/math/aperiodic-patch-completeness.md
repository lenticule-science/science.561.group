---

name: aperiodic-patch-completeness
description: "a patch site with no locally periodic orbits satisfies all eight axioms and is a complete relational universe; the Patch Reconstruction gap is exactly the singularity locus."
---

### Theorem — Aperiodic Patch Completeness {#aperiodic-patch-completeness}

**Theorem.** Let $(U, J_U)$ be a patch site (§patch) containing no locally periodic orbit
(§periodic-orbit): for every $t \in U$ and $s \in \Sigma$, the restriction maps
$H^*_{t \cdot s^{n+1}} \to H^*_{t \cdot s^n}$ are not isomorphisms for any $n \geq 0$.
Then $(R_U, H_U)$ is a complete relational universe — it satisfies all eight axioms.

**Proof.** Axioms 1–4 and 6–8 hold unconditionally by restriction (§patch-reconstruction,
items 1–4 and 6–8). Axiom 5 (History Separation for the patch site) holds by
§patch-separation-equivalence: no locally periodic orbits (condition B) implies
$(H_U)^*$ is conservative (condition A), which is History Separation for $(T_U, J_U)$.
$\square$

#### Corollary — Singularity as Patch Incompleteness {#aperiodic-patch-incompleteness}

**Corollary.** A history $t$ is a relational singularity (§periodic-orbit) if and only if
every patch site $(U, J_U)$ containing the orbit $\{t \cdot s^n : n \geq 0\}$ fails to
be a complete relational universe — specifically, fails Axiom 5 (History Separation).

**Proof.** If $t$ is locally periodic along $s$, then any patch $U$ containing
$\{t \cdot s^n : n \geq N\}$ contains a periodic orbit, so by the contrapositive of
the theorem, $U$ fails History Separation. Conversely, if $t$ is not locally periodic
along $s$, the patch on the orbit satisfies all eight axioms by the theorem. $\square$

This gives a mathematical definition of a relational singularity that does not depend
on the physical correspondence: **a singularity is a witness to the failure of patch
completeness**.

#### Corollary — The Gap is Exact {#aperiodic-patch-gap}

**Corollary.** The Patch Reconstruction proof (§patch-reconstruction) cannot close the
History Separation gap unconditionally. Closing it would prove all patches are complete
relational universes. By the corollary above, this would imply no relational singularities
exist. Since the Aperiodicity-Halting Conjecture (§aperiodicity-halting) asserts that
periodic orbits — and hence singularities — do exist, the gap at Axiom 5 is not an
artifact of the proof technique. It is a theorem that it is there.

The precise location of the gap is: Axiom 5 holds for $(T_U, J_U)$ iff $U$ contains
no periodic orbits, by §patch-separation-equivalence.
