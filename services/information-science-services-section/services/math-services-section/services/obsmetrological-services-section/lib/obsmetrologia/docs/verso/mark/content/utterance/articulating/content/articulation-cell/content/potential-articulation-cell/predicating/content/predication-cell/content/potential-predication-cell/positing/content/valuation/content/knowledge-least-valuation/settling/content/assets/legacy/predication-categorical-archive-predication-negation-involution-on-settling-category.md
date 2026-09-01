---
type: theorem
status: proved
depends-on: [negation-twisted-settling, predication-settling, negation, equivariant-settling-cohomology, internal-z2-gauge]
see-also: [klein-four-symmetry, antonymy, negation-invisibility, bilattice-negation-on-d-frame-valued-sheaves]
---

# Negation involution on the settling category

The pointwise negation map

$$\sim : \mathbf{PS}(B) \to \mathbf{PS}(B), \qquad v \mapsto \sim(v),$$

is a well-defined strict involution on the object-set of the predication settling category over any base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$. It preserves the settling bound $\lambda$, the regime, and the firing-ordinal set of every settling. Its action on synonym classes is trivial (by [negation-invisibility](negation-invisibility.md)); its action on strong-MLD classes is non-trivial exactly in the transfinite-bounded and aperiodic regimes.

## Proof

**Well-definedness.** By [negation-twisted settling](../objects/negation-twisted-settling.md), $\sim(v)$ is a valid predication settling over the same base for every $v \in \mathbf{PS}(B)$.

**Involution.** $\sim(\sim(v)) = v$ pointwise, since $\sim \sim a = a$ on $\mathbf{L}$ (negation is involutive). $\square$

**Preservation of regime and firing ordinals.** By the regime-preservation and firing-pattern-preservation results of [negation-twisted settling](../objects/negation-twisted-settling.md). $\square$

**Trivial action on synonym classes.** By [negation-invisibility](negation-invisibility.md): $v \sim_{\mathrm{syn}} \sim(v)$ for all $v$, so $[\sim(v)]_{\mathrm{syn}} = [v]_{\mathrm{syn}}$. $\square$

**Non-trivial action on strong-MLD classes.** In the transfinite-bounded and aperiodic regimes, $v \not\sim_{\mathrm{sMLD}} \sim(v)$ whenever $v$ has any NSC firing that is not a $\top$-firing — because $\sim$ flips truth-only $\leftrightarrow$ falsity-only firing types, changing $\tau^{\mathbb D}$. This is the content of the strong-MLD witness in [strong-mld-via-composed-duality](strong-mld-via-composed-duality.md): the truth-only/falsity-only antipodal pair exhibits exactly this non-triviality. $\square$

## Relationship to bilattice-negation-on-d-frame-valued-sheaves

The functor $\mathbb{D}_{\mathrm{val}}: \mathrm{Sh}_{\mathbf{dFrm}}(\mathbf{T}^*) \to \mathrm{Sh}_{\mathbf{dFrm}}(\mathbf{T}^*)$ established in [bilattice-negation-on-d-frame-valued-sheaves](bilattice-negation-on-d-frame-valued-sheaves.md) is the sheaf-level lift of the settling-level involution $\sim$ established here: $\mathbb{D}_{\mathrm{val}}(\mathcal{F}_v) \cong \mathcal{F}_{\sim(v)}$. The present theorem is the settling-object-level statement; the bilattice-negation theorem is the sheaf-functor-level statement.

## The $K_4$ picture

The present theorem establishes the $\{1, \sim\}$ factor of the [Klein-four symmetry](teaching/explanations/klein-four-symmetry.md) at the settling-object level. The full $K_4 = \{1, \sim, -, \sim \circ -\}$ acts at the bilattice level, but only $\{1, \sim\}$ lifts to the settling category as $\leq_k$-monotone sequences: conflation $-$ is $\leq_k$-antitone and maps settlings to $\leq_k$-descending sequences (valid only in the dual settling category). The full $K_4$ symmetry acts at the level of d-frame-valued sheaves via the composed duality $\mathbb{D} = \mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{\mathrm{val}}$.
