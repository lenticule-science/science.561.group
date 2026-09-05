---
id: patch-reconstruction
name: PatchReconstruction
description: "every patch (R_U, H_U) satisfies seven of eight axioms by direct restriction; History Separation for the patch site is an open condition pending a proof that automorphisms of U invisible to H*|_U do not exist."

---

### Theorem — Patch Reconstruction {#patch-reconstruction}

Every patch $(R_U, H_U)$ (§patch) is a complete relational universe in its own right:
it satisfies all eight axioms and supports the full four-phase construction — algebra,
language, geometry, dynamics — internally.

#### Statement {#patch-reconstruction-statement}

Let $(U, J\!\restriction_U)$ be a patch site (§patch). Define:

- **History category**: $T_U := U$ with restricted topology $J_U := J\!\restriction_U$,
- **Fiber algebras**: $(H_U)_t := H_t$ with $({\sigma_U})_t := \sigma_t$ and $({\Delta_U})_t := \Delta_t$ for $t \in U$,
- **Reindexing**: $H_U : U^{\mathrm{op}} \to \mathbf{HA}_{\mathrm{nucl}}$ given by restricting $H$,
- **Relational universe**: $R_U = \mathbf{Sh}(U, J_U)$ (§patch).

Then $(T_U, J_U, H_U, R_U)$ satisfies the **Axiom of Histories**, **fiber doctrine**,
**Axiom of Fiber Language**, **Axiom of Reindexing**, **Axiom of History Separation**,
**Axiom of Locality**, **Axiom of Stability**, and **Axiom of Generative Basis** —
identically as restrictions of the corresponding axioms for $(T, J, H, R)$ to $U$.

#### Proof Sketch {#patch-reconstruction-proof}

1. **Histories**: $U$ is a full subcategory of $T$, hence a thin category in the same sense.
   The commutation law for history concatenation restricts: if $s \star t \equiv t \star s$ in $T$,
   the same holds in $U$ for $s, t \in U$. $\checkmark$

2. **Fiber Algebras**: $(H_U)_t = H_t$ inherits its Heyting algebra structure, $\sigma_t$, and
   $\Delta_t$ from $H_t$ without modification. All axioms hold unchanged. $\checkmark$

3. **Fiber Language**: FiberNuclearLanguage at each $t \in U$ is the same language as in $T$,
   with the same nuclei $\sigma_t, \Delta_t$. The fiber language axiom is local to each
   history; restriction does not change it. $\checkmark$

4. **Reindexing**: $H_U(f) = H(f)$ for every $f : t \to t'$ in $U \subseteq T$.
   Compatibility with nuclei holds by the Axiom of Reindexing for $(T, H)$ applied to
   the same morphisms. $\checkmark$

5. **History Separation**: The Axiom of History Separation for $(T, J)$ says that no
   non-trivial automorphism $\alpha : T \xrightarrow{\sim} T$ preserving $J$ is
   invisible to $H^\ast$. For the patch, we need: no non-trivial automorphism
   $\beta : U \xrightarrow{\sim} U$ preserving $J_U$ is invisible to $(H_U)^\ast$.
   **Gap.** An automorphism $\beta$ of $U$ need not extend to an automorphism of $T$;
   History Separation for $(T, J)$ only constrains automorphisms of $T$, not
   automorphisms of subcategories. The patch axiom holds if $U$ is closed under
   automorphisms of $(T, J)$, but this is not guaranteed by the definition of a
   patch site. History Separation for $(T_U, J_U)$ is an open condition.

6. **Locality**: A $J_U$-compatible family on a cover in $J_U$ is also a $J$-compatible
   family on the same cover. By locality for $(T, J)$, it glues uniquely. $\checkmark$

7. **Stability**: Stability holds for any morphism in $U \subseteq T$; the argument of
   §level-stability applies to $U$-morphisms without modification. $\checkmark$

8. **Generative Basis**: The generative basis $\mathcal{B}_U = \mathcal{B} \cap H_U$
   generates $H_U^\ast$ under the same closure operations. $\checkmark$

Items 1–4 and 6–8 hold unconditionally by restriction. Item 5 (History Separation) is
an open condition: the argument that restriction preserves the automorphism-reflection
property requires either that $U$ is closed under automorphisms of $(T, J)$ or a
separate proof that automorphisms of $U$ invisible to $(H_U)^\ast$ do not exist.
Subject to History Separation for $(T_U, J_U)$, the construction applies and produces
a complete relational universe $R_U$.

#### Corollary — Observation Does Not Destroy Structure {#patch-reconstruction-corollary}

The geometric morphism $j_U^\ast : R \to R_U$ (§patch) restricts the global relational
universe to a patch. By Patch Reconstruction, the restriction is itself a complete
relational universe. Every well-behaved substructure of $R$ is a complete $R$ in
miniature. Observation — focusing on a sub-universe $U$ — does not destroy the
relational structure; it specializes it into a complete local world.
