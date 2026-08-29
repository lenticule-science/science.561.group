---
kind: question
status: open
explores: [bitopological-settling-site-functoriality, sheaf-functoriality-on-bitopological-site, settling-cohomology]
---

# Six-functor formalism for settling cohomology

[Sheaf functoriality on the bitopological settling site](../theorems/sheaf-functoriality-on-bitopological-site.md) gives a two-functor pair $(\Phi^*, \Phi_*)$ for predication-hyperdoctrine morphisms — a *geometric morphism* of Grothendieck topoi. This is two functors of the standard six.

Open: develop the full six-functor formalism in the settling-cohomology setting, adding $\Phi_!$ (proper direct image), $\Phi^!$ (exceptional inverse image), $\otimes$ (tensor), and $\mathcal{H}om$ (internal hom).

In the [@kashiwara-schapira2006] framework, the six functors satisfy:

- Adjunctions $\Phi_! \dashv \Phi^!$ and $\Phi^* \dashv \Phi_*$.
- A projection formula relating $\Phi_!$ and $\otimes$.
- Base-change isomorphisms relating $\Phi_!$ and $\Psi^*$ for cartesian squares.
- Verdier duality $\mathbb{D}$ exchanging $\Phi_!$ with $\Phi_*$ and $\Phi^!$ with $\Phi^*$.

For the bitopological settling site, building these requires:

- A notion of "proper" morphism between [bitopological settling sites](../objects/bitopological-settling-site.md). Candidate: morphisms induced by hyperdoctrine morphisms with bounded settling-shift.
- A dualizing complex on $\mathbf{T}^*$. The [paired Priestley space](../objects/paired-priestley-space.md) structure suggests a candidate.
- Verification of the six-functor axioms in the present setting.

A full six-functor formalism would make base-change, projection-formula, and duality arguments available off-the-shelf, simplifying many computations and enabling structural arguments not currently accessible.

Related: [Verdier duality on the bitopological settling site](verdier-duality-on-bitopological-site.md) is a sub-question of this one — Verdier duality is the $\mathbb{D}$ part of the six-functor package, and Curry's cellular sheaf/cosheaf duality on the paired-Priestley site is the natural concrete construction. [Bilattice-valued sheaves](bilattice-valued-sheaves.md) is upstream: a six-functor formalism in the current $\mathbf{Ab}$-valued setting is one project; doing it in a bilattice-native value category is a substantially different project. Settle the value-category question first if the goal is structurally-faithful invariants, before investing in six-functor infrastructure.

**Update from the d-frame chapter.** The bilattice-valued cohomology infrastructure now substantively in place — [Q-enriched sheaves on Grothendieck sites](../objects/quantale-enriched-sheaf.md), [Lawvere Laplacian extension theorem](../theorems/lawvere-laplacian-grothendieck-sites.md) (draft), [Q-enriched cohomology](../objects/q-enriched-cohomology.md) defined — provides the foundation a bilattice-native six-functor formalism would build on. Specifically: the geometric morphism $(\Phi^*, \Phi_*)$ pair in the Q-enriched setting is the natural starting point; the four remaining functors ($\Phi_!$, $\Phi^!$, $\otimes$, $\mathcal{H}om$) require additional structural commitments (proper-morphism notion, dualizing complex, internal hom) that are independent of value-category choice but interact with the Q-enrichment.

**Update from the Verdier duality chapter.** The Verdier duality $\mathbb{D}$-functor — one of the six — is now the subject of its own chapter: [Verdier duality on the bitopological settling site](../theorems/verdier-duality-bitopological-site.md) (sketch). The chapter's two-dualities-composing structure (spatial Verdier × value-category swap) is a substantive piece of the six-functor package specific to the d-frame setting. The remaining four functors ($\Phi_!$, $\Phi^!$, $\otimes$, $\mathcal{H}om$) build on top of the Verdier work; with Verdier in place, the six-functor question reduces to characterizing those four functors in the Q-enriched cellular setting.
