---
id: universe-soundness
name: UniverseSoundness
description: "Soundness at the Universe Level"
---

### Theorem — Soundness at the Universe Level {#universe-soundness}

The fiber-level soundness (§soundness) assembles into a statement about morphisms
in $R$: the family of fiber interpretations is natural in $t$, hence constitutes a
morphism of sheaves.

**Theorem — Soundness (universe level, Prop fragment).** For every closed derivable
judgment $dash M : \mathsf{Prop}$:

1. The universe-level interpretation $\llbracket dash M : \mathsf{Prop} 
rbracket$
   is a global section of $H \in R$ (equivalently, a morphism $\mathbf{1} 	o H$ in $R$)
   and is independent of the derivation.

2. If $dash M \equiv N : \mathsf{Prop}$ is derivable, then
   $\llbracket dash M : \mathsf{Prop} 
rbracket = \llbracket dash N : \mathsf{Prop} 
rbracket$
   as global sections of $H$.

*Proof.* By §soundness, each $\llbracket M 
rbracket_t \in H_t$ is well-defined.
Naturality: for $f : t 	o t'$ in $T$, $H(f) : H_{t'} 	o H_t$ is a Heyting algebra
homomorphism preserving $\sigma_{t'}, \Delta_{t'}$ (§reindexing), so
$H(f)(\llbracket M 
rbracket_{t'}) = \llbracket M 
rbracket_t$
holds by induction on the Heyting-modal structure of $M$: each constructor in the
$\mathsf{Prop}$ fragment is interpreted by an operation that $H(f)$ preserves.
By the Axiom of Locality, this compatible family assembles to a global section of $H$. $\square$

**Remark — Higher types.** For a judgment $\Gamma dash M : A$ with a non-trivial
context or a type $A$ involving function types, the universe-level interpretation requires
sheaves $\llbracket \Gamma 
rbracket$ and $\llbracket A 
rbracket$ constructed from
the CCC structure of $R$ (§ambient-topos), and the interpretation is a natural transformation
between those sheaves, not merely a family of fiberwise elements. The argument extends once
the CCC structure is available, but the present proof establishes only the Prop fragment.
**Corollary — Closed Propositions.** {#cor-closed-propositions} Let $\vdash M :
\mathsf{Prop}$ and $\vdash N : \mathsf{Prop}$ be closed terms. Then:
$$
\vdash M \equiv N : \mathsf{Prop}
\;\;\Longleftrightarrow\;\;
\llbracket \vdash M : \mathsf{Prop} \rrbracket = \llbracket \vdash N : \mathsf{Prop} \rrbracket \in H.
$$
*Proof.* The "only if" direction is Soundness (both levels). The "if" direction is
Completeness (§completeness). $\square$
