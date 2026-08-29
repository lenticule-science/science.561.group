---
type: morphism
class: cross-system-operation
status: sketch
depends-on:
  - ../objects/semiotic-system.md
  - teaching/explanations/code.md
  - teaching/explanations/semiosphere.md
see-also:
  - specialization.md
  - codeswitching.md
  - ../../../../information/theories/knowledge-systems/theories/predicated-knowledge-systems/morphisms/federate.md
  - questions/translation-as-fiber-morphism.md
  - references/lotman1990.md
  - references/jakobson1959.md
---

# Translation

The operation that maps sign-relations in one [semiotic system](../objects/semiotic-system.md) into sign-relations in another, under an *explicit cross-system identity-mapping* that asserts which sign-objects in the two systems are the same and which are not.

Lotman (per [Lotman 1990](references/lotman1990.md)) treats translation as the *primitive* operation of the [semiosphere](teaching/explanations/semiosphere.md): a semiosphere is alive in proportion to its translation activity at its boundary; without translation, the semiosphere fragments into mutually opaque sub-spheres. Jakobson's three kinds — intralingual, interlingual, intersemiotic (per [jakobson1959](references/jakobson1959.md)) — are special cases of the operation, parameterised by where the source and target systems sit in the semiosphere.

## Operational signature

$$\mathrm{translate}: \mathcal{S}_1 \times \mathcal{S}_2 \times \mathrm{IdMap}(\mathcal{S}_1, \mathcal{S}_2) \to (K_{\mathcal{S}_1} \to K_{\mathcal{S}_{12}})$$

— given two semiotic systems and an identity-mapping asserting which sign-objects (and possibly interpretants) are identified across them, translation produces a coded-pairing in the federated system $\mathcal{S}_{12}$ on the union of the two systems' inventories.

## Construction

For systems $\mathcal{S}_1 = (V_1, O_1, I_1, K_1, R_1, \Sigma_1)$ and $\mathcal{S}_2 = (V_2, O_2, I_2, K_2, R_2, \Sigma_2)$ and identity-mapping $\iota$:

- $V_{12} := V_1 \cup V_2$.
- $O_{12} := O_1 \cup_\iota O_2$ (union under the identity-mapping's object-identifications).
- $I_{12} := I_1 \cup I_2$ together with cross-system interpretant-bridges supplied by $\iota$.
- $K_{12}$ is the union of the two codes, with cross-system pairings derived from $\iota$. When the codes assign incompatible interpretants to identified sign-objects, the substrate's bilattice records the contestation as $\top$.
- $R_{12} := R_1 \cup R_2$.
- $\Sigma_{12}$ is the federated semiosphere — possibly a new semiosphere at the boundary of the original two.

## Substrate-level structural facts

**Translation is federate.** Per the [translation-as-fiber-morphism](questions/translation-as-fiber-morphism.md) open question, translation reads as the substrate's [federate](../../../../information/theories/knowledge-systems/theories/predicated-knowledge-systems/morphisms/federate.md) operation under the identification of each semiotic system with a scope on the substrate. The identity-mapping $\iota$ is exactly federate's identity-mapping; the bilattice contestation channel handles untranslatable sign-objects directly.

**Translation is non-destructive.** No sign-relation is destroyed by translation; untranslatable content is recorded as $\top$-pressure or as silence ($\bot$) in the federated state. The original systems remain recoverable by projection.

**Translation requires an explicit identity-mapping.** Per Eco's *On Translation* (and the substrate-level federate discipline), translation cannot guess that $\mathcal{S}_1$'s sign-object $o$ and $\mathcal{S}_2$'s sign-object $o'$ refer to the same thing without an explicit assertion. The identity-mapping is itself a sign-relation in a meta-system (the translator's interpretive frame); translations differ when their identity-mappings differ.

**Translation respects the closure-regime join.** Translating a Scott-continuous system with a transfinite-bounded one gives a transfinite-bounded federation; translation never demotes a regime.

## Operational consequences

**(O1) Translation has a canonical incompleteness.** The identity-mapping is rarely total; cross-system pairings outside its support are silences or contestations. The translator's *interpretive choices* live in extending $\iota$ beyond its automatic part.

**(O2) Translation interacts with [codeswitching](codeswitching.md).** Within a federated system $\mathcal{S}_{12}$, a sign-act can codeswitch (use one of the two source codes for a portion) without translating (without invoking the identity-mapping). Codeswitching is intra-federated-state; translation is the federation's construction.

**(O3) Translation generates new sign-relations.** A successful translation of an untranslated sign-vehicle creates a *new* coded-pairing in $\mathcal{S}_{12}$ that did not exist in either source. The discipline carries this generation as substrate-level evidence of the translator's interpretive contribution.
