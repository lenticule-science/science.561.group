---
type: claim
status: proved
depends-on:
  - ../code/structures/eff.md
  - ../code/structures/four.md
  - ../code/transformers/double-negation-nucleus.md
see-also:
  - ../questions/what-is-the-theory-of-computing.md
  - eff-is-minimum-level.md
references:
  - Hyland 1982
  - Belnap 1977
---

# FOUR is the image of Ω_Eff under the double-negation nucleus

## Statement

The bilattice $\mathbf{FOUR} \cong \mathbf{2} \times \mathbf{2}$ of computational truth values is the image of the subobject classifier $\Omega_{\mathbf{Eff}}$ under the double-negation nucleus, defined by the internal map $\rho(P) = (\neg\neg P,\; \neg\neg\neg P) \in \Omega_{\mathrm{cl}} \times \Omega_{\mathrm{cl}} \cong \mathbf{2} \times \mathbf{2}$. This map is internal to $\mathbf{Eff}$; $\mathbf{FOUR}$ is not an external structure imposed from outside.

## Proof

The double-negation topology $j = \neg\neg: \Omega_{\mathbf{Eff}} \to \Omega_{\mathbf{Eff}}$ is a Lawvere-Tierney nucleus on $\mathbf{Eff}$: it is idempotent ($j \circ j = j$, since $\neg\neg\neg\neg P \Leftrightarrow \neg\neg P$ in any Heyting algebra), above the identity ($j(P) \geq P$ in the internal order, since $P \Rightarrow \neg\neg P$), and preserves finite meets ($\neg\neg(P \wedge Q) \Leftrightarrow \neg\neg P \wedge \neg\neg Q$). The sheaves of this nucleus form the classical subtopos of $\mathbf{Eff}$ whose subobject classifier $\Omega_{\mathrm{cl}} \cong \mathbf{2}$ (Boolean, two elements), because $j$-closed propositions are those for which $\neg\neg P \Leftrightarrow P$ — the propositions with decidable truth values.

Define $\rho: \Omega_{\mathbf{Eff}} \to \mathbf{2} \times \mathbf{2}$ by $\rho(P) = (\neg\neg P,\; \neg\neg\neg P)$. The four values of $\mathbf{FOUR}$ correspond to the four cases:

| $\neg\neg P$ | $\neg\neg\neg P$ | Name | Computational meaning |
|---|---|---|---|
| $\mathbf{t}$ | $\mathbf{f}$ | $\mathbf{t}$ (verified) | $P$ has a realizer; $\neg P$ does not |
| $\mathbf{f}$ | $\mathbf{t}$ | $\mathbf{f}$ (refuted) | $P$ has no realizer; $\neg P$ does |
| $\mathbf{f}$ | $\mathbf{f}$ | $\bot$ (undecidable) | Neither $P$ nor $\neg P$ is $\neg\neg$-closed |
| $\mathbf{t}$ | $\mathbf{t}$ | $\top$ (contradictory) | Logically impossible in a consistent theory |

The case $(\mathbf{f}, \mathbf{f})$ — the undecidable value $\bot$ — is forced for non-trivial behavioral predicates of programs by Rice's theorem: for any such predicate $P$, neither $P$ nor $\neg P$ has a realizer, so $\neg\neg P$ and $\neg\neg\neg P$ are both false classically. The case $(\mathbf{t}, \mathbf{t})$ is classically impossible in any consistent theory (it would require both $P$ and $\neg P$ to have realizers, which contradicts the $\mathcal{K}_1$-computation's ability to run any program: $\neg P$ in $\mathbf{Eff}$ means $P \Rightarrow \bot$, and the existence of a realizer for both $P$ and $P \Rightarrow \bot$ gives a realizer for $\bot$, which would require a computation that halts with an output for all inputs — something not achievable for $\bot_{\mathbf{Eff}}$).

The map $\rho$ is defined entirely within $\mathbf{Eff}$'s internal language using the double-negation nucleus, which is an internal morphism.

## Significance

$\mathbf{FOUR}$ is not a meta-level framework imposed on computation from outside — it is a categorical consequence of $\mathbf{Eff}$'s double-negation topology. The two-dimensional truth structure (truth dimension: $\neg\neg P$; decidability dimension: $\neg\neg\neg P$) derives from the single Lawvere-Tierney nucleus $j = \neg\neg$ that is already present in $\mathbf{Eff}$ as a consequence of its Heyting-valued internal logic and Rice's theorem.

The internal Heyting algebra of $\mathbf{Eff}$ and the external $\mathbf{FOUR}$ operate at different levels and are compatible: the internal logic governs what is derivable inside the topos; $\mathbf{FOUR}$ is the settled-state structure that describes how propositions look from outside once computation has terminated.
