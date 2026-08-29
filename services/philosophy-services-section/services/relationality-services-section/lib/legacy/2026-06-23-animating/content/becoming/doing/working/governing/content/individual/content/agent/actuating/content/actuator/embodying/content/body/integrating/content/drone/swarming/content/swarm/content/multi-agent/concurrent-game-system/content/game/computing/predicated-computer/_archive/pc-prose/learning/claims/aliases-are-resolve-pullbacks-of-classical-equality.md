---
title: "Aliases are resolve-pullbacks of classical equality"
status: draft
date: 2026-05-17
type: claim
class: theorem-with-proof-sketch
depends-on:
  - theories/.../predication-categories/code/structures/classical-equality.md
  - theories/.../predication-categories/code/structures/paraconsistent-equality.md
  - theories/.../predication-categories/code/transformers/predicate-specialization.md
  - theories/.../predication-categories/concepts/predication-cell.md
  - theories/.../predication-categories/concepts/synonymy.md
  - theories/.../predication-categories/code/structures/q-fuzzy-equivalence.md
  - code/structures/entity.md
  - code/structures/predication-cell.md
  - code/structures/predicate.md
relates-to:
  - prose/learning/questions/what-are-aliases.md
  - prose/learning/surveys/aliases-may-2026.md
---

# Aliases are resolve-pullbacks of classical equality

## Statement

An **alias** is a predication cell of the form $(e, \text{accepts-alias}, \sigma)$, where $e \in E$ is a canonical substrate entity and $\sigma \in \Sigma$ is a surface form (a kebab-case slug not used as the canonical address of any other entity). The set of aliases on $e$ extends the partial *resolve function* $\rho : \Sigma \rightharpoonup E$ to admit alternate surface forms for $e$. **The alias relation on surface forms is the pullback of classical equality on entities along the resolve function**:

$$\sigma_1 \sim_{\text{alias}} \sigma_2 \;\iff\; \rho^*(=_E)(\sigma_1, \sigma_2) = \mathbf{t}$$

where $=_E$ is the classical equality predicate on $E$ (per [`classical-equality`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/classical-equality.md)) and $\rho^*$ is the predicate-specialization pullback along $\rho$. The alias relation is therefore exactly as well-behaved as classical equality on entities is — reflexive, symmetric, transitive, and two-valued.

The editing discipline (no chains, no semantic variation, no compatibility-shim renames) is **not** a mathematical property of the alias relation; it is an additional substrate-edit constraint preventing the mathematical alias relation from being extended in ways inconsistent with operative invariants.

## Setup

Let the substrate be a predication hyperdoctrine $\mathfrak{P}$ over an entity set $E$, a predicate category $\mathcal{C}$, and a bilattice $\mathbf{L}^\bowtie$ (the four-bilattice). Predications are cells $\phi = (s, p, o)$ with $s, o \in E$ and $p \in \text{Ob}(\mathcal{C})$; values live in the predication-fiber algebra $A_p$ over $E \times E$ and take values in $\mathbf{L}^\bowtie$.

Records reside at concrete filesystem paths. Each record has a canonical address — the kebab-case slug forming its filename. Define:

- **Canonical-address set** $\Sigma_E \subseteq \Sigma$: the set of slugs that are canonical addresses for some entity. $\Sigma_E$ is in bijection with $E$ by construction (one record per entity, one canonical slug per record).
- **Alias-form set** $\Sigma_A = \Sigma \setminus \Sigma_E$: candidate surface forms not used as canonical addresses.
- **Resolve function** $\rho : \Sigma \rightharpoonup E$: the partial function from surface forms to entities. On canonical addresses, $\rho$ is the canonical-address bijection; on alias forms, $\rho$ is defined iff some entity $e \in E$ carries the predication $(e, \text{accepts-alias}, \sigma)$ in its fiber.

Identity-by-relations (per [`entity`](../../../code/structures/entity.md)) makes the canonical-address bijection well-defined: an entity *is* the predication-graph neighborhood reachable from its address; addresses are handles on entities.

## Definition

A **canonical record** is a substrate file at `<path>/<slug>.md`. The entity is the predication-graph node addressable by `<slug>` — i.e., by the file's basename. The frontmatter `name:` field is a *cell* on the record carrying the entity's human-readable name; it is not the address and does not participate in the canonical-address branch of $\rho$.

An **alias declaration** is a frontmatter entry `aliases: [σ_1, σ_2, ...]` on a canonical record, where each $\sigma_i \in \Sigma_A$. The declaration asserts the substrate predications

$$(e, \text{accepts-alias}, \sigma_1), (e, \text{accepts-alias}, \sigma_2), \ldots$$

in $e$'s fiber.

The **resolve function** $\rho$ is then:

$$\rho(\sigma) = \begin{cases} e & \text{if } \sigma \text{ is the file basename of } e\text{'s canonical record} \\ e & \text{if } \exists e \in E : (e, \text{accepts-alias}, \sigma) \text{ holds in } e\text{'s fiber} \\ \text{undefined} & \text{otherwise.} \end{cases}$$

An **alias** is a pair $(\sigma, e)$ with $\sigma \in \Sigma_A$ such that $\rho(\sigma) = e$.

## Theorems

### Theorem 1 (alias-pullback)

The relation $\sigma_1 \sim_{\text{alias}} \sigma_2$ on the domain of $\rho$ is the pullback of classical equality along $\rho$:

$$\sigma_1 \sim_{\text{alias}} \sigma_2 \;\iff\; \rho(\sigma_1) =_E \rho(\sigma_2)$$

where $=_E$ is the classical-equality predicate (per [@classical-equality]) taking values in $\{\mathbf{t}, \mathbf{f}\}$.

**Proof sketch.** $\rho$ is a partial function from $\Sigma$ to $E$. Classical equality on $E$ is a predicate $=_E : E \times E \to \{\mathbf{t}, \mathbf{f}\}$ with $=_E(e_1, e_2) = \mathbf{t}$ iff $e_1 = e_2$ as elements of $E$ (per [`classical-equality`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/classical-equality.md), Eq. $=_E$).

The predicate-specialization morphism induced by $\rho$ — formally, the morphism $\rho^* : =_E \to (=_\Sigma|_{\text{dom}(\rho)})$ in $\mathcal{C}$ with sub-support inclusion $\iota : \Delta_{\text{dom}(\rho)} \hookrightarrow \text{dom}(=_\Sigma)$ — pulls back classical equality on $E$ to a predicate on $\text{dom}(\rho) \subseteq \Sigma$:

$$\rho^*(=_E)(\sigma_1, \sigma_2) = =_E(\rho(\sigma_1), \rho(\sigma_2)).$$

By the predicate-specialization formula (per [`predicate-specialization`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/transformers/predicate-specialization.md), Eq. $f^*$), this equals $\mathbf{t}$ iff $\rho(\sigma_1) = \rho(\sigma_2)$, and $\mathbf{f}$ otherwise. By the definition of $\sim_{\text{alias}}$ as "same canonical entity after resolution," the two relations coincide. $\square$

### Theorem 2 (alias-equivalence)

$\sim_{\text{alias}}$ is an equivalence relation on $\text{dom}(\rho)$.

**Proof sketch.** Reflexivity: $\rho(\sigma) = \rho(\sigma)$ for any $\sigma \in \text{dom}(\rho)$, so $\sim_{\text{alias}}$ is reflexive. Symmetry: $\rho(\sigma_1) = \rho(\sigma_2)$ implies $\rho(\sigma_2) = \rho(\sigma_1)$. Transitivity: $\rho(\sigma_1) = \rho(\sigma_2)$ and $\rho(\sigma_2) = \rho(\sigma_3)$ imply $\rho(\sigma_1) = \rho(\sigma_3)$. All three follow from the underlying classical equality on $E$ being an equivalence (it is — equality is the trivially-reflexive-symmetric-transitive relation). The pullback of an equivalence relation along a function is an equivalence relation on the function's domain. $\square$

### Theorem 3 (alias-is-non-content)

For any predication cell $\phi = (s, p, o)$ with $s = \rho(\sigma)$ or $o = \rho(\sigma)$ for some $\sigma \in \text{dom}(\rho)$, the value $v(p)(s, o) \in \mathbf{L}^\bowtie$ is independent of the choice of $\sigma$ within $\rho^{-1}(\{s\})$ (or $\rho^{-1}(\{o\})$).

**Proof sketch.** Predication cells are indexed over $E \times \Pi \times E$ (per [`predication-cell-set`](../../../code/structures/predication-cell.md)); the cell's value lives in $A_p$ indexed by $(s, o) \in E \times E$, not over $\Sigma \times \Pi \times \Sigma$. Surface forms $\sigma$ enter the substrate only through the resolve function $\rho$; once $\rho$ has produced $s, o \in E$, the cell value $v(p)(s, o)$ is determined by the entities, not the surface forms used to address them. Therefore, for any $\sigma_1, \sigma_2 \in \rho^{-1}(\{s\})$:

$$v(p)(\rho(\sigma_1), o) = v(p)(s, o) = v(p)(\rho(\sigma_2), o)$$

and similarly for the object position. The cell's value is invariant under choice of alias-form. $\square$

### Theorem 4 (no-chain-by-uniqueness)

If the resolve function $\rho$ is well-defined as a *function* (i.e., each $\sigma \in \Sigma$ maps to at most one entity), then no surface form $\sigma$ can be simultaneously the canonical address of one entity and an alias of another.

**Proof sketch.** Suppose for contradiction $\sigma$ is the canonical address of $e_1$ and also satisfies $(e_2, \text{accepts-alias}, \sigma)$ for $e_2 \neq e_1$. Then $\rho(\sigma) = e_1$ (by the canonical-address branch) and $\rho(\sigma) = e_2$ (by the alias branch), contradicting $e_1 \neq e_2$ and $\rho$ being a function. Therefore $\sigma$ cannot occupy both positions. $\square$

**Corollary.** The no-chain rule (an alias entry on a record cannot itself be the target of another alias entry) is enforced by uniqueness of resolution. Substrate-level lints that prohibit chained aliases operationalize this uniqueness; chains are admissible only when Theorem 4's hypothesis fails, which it does not in a conformant substrate.

### Theorem 5 (alias-distinct-from-synonymy)

The alias relation $\sim_{\text{alias}}$ and the synonymy relation $\sim_{\text{syn}}$ (per [@synonymy]) are equivalence relations on **structurally distinct objects** and are therefore not comparable as equivalence relations on a single underlying set.

**Proof sketch.** Synonymy is an equivalence relation on **predication settlings** $v : \Pi \to \prod_p A_p$ — entire valuations of the substrate. Per the synonymy definition (per [`synonymy`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/synonymy.md)), $v \sim_{\text{syn}} v'$ iff there exists an invertible settling-morphism $v \to v'$ that commutes with the closure endofunctor — a *dynamic* equivalence that preserves inferential structure.

Alias is an equivalence relation on **surface forms** $\sigma \in \Sigma$ — substrate addresses. By Theorem 1, the relation is the resolve-pullback of classical equality on entities — a *static* equivalence that records which surface forms address the same entity.

The two relations live at different levels of the predication-hyperdoctrine. There is no inclusion of $\text{dom}(\sim_{\text{alias}}) = \text{dom}(\rho) \subseteq \Sigma$ into $\text{dom}(\sim_{\text{syn}}) = \text{Settlings}(\mathfrak{P})$ that respects the relations' structure. They classify different things: synonymy classifies entire substrate states up to dynamic equivalence; alias classifies surface forms up to coincident resolution. $\square$

### Theorem 6 (alias-as-strict-fiber-equivalence)

For any two surface forms $\sigma_1, \sigma_2 \in \text{dom}(\rho)$, $\sigma_1 \sim_{\text{alias}} \sigma_2$ iff the fibers of $\sigma_1$ and $\sigma_2$ under the predication-fibration (the set of cells in which the resolved entity appears as subject or object) are **identical**, not merely q-fuzzy-equivalent for some $q < 1$.

**Proof sketch.** Let $\rho(\sigma_1) = \rho(\sigma_2) = e$. The fiber over $e$ in the predication-fibration is the set $\{(s, p, o) \in \Phi : s = e \text{ or } o = e\}$ together with each cell's value in $A_p$. Surface forms $\sigma_1, \sigma_2$ both address the same fiber via $\rho$.

The q-fuzzy-equivalence machinery (per [`q-fuzzy-equivalence`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/q-fuzzy-equivalence.md)) admits *graded error* on the equivalence: hom-objects bounded below by $q$ in the hom-quantale. For $q = 1$ (the unit), the equivalence is strict — the round-trip compositions are isomorphic to the identity. For $q \prec 1$, there is genuine error tolerated by the equivalence.

For aliases, Theorem 3 establishes that the cell values are *identical* (not merely close) across alias-forms. Therefore the fiber-equivalence is strict, corresponding to $q = 1$. Aliases are the $q = 1$ case of q-fuzzy fiber-equivalence; fuzzier equivalences ($q < 1$) would admit graded error in cell values, which the alias discipline forbids. $\square$

**Corollary.** Synonymy and aliases differ on the q-fuzzy axis as well: synonymy admits structural variation up to settling-shift and base-element relabeling (it is a coarse equivalence in the categorical sense, with non-trivial cohomological invariants in the aperiodic regime per [`synonymy`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/synonymy.md)); aliases admit no variation whatsoever (strict $q = 1$).

### Theorem 7 (retired-forms-are-not-aliases)

If a surface form $\sigma$ was once the canonical address of entity $e$ but has been retired in favor of a new canonical address $\sigma'$, then $\sigma$ is not an alias of $e$ — even though prior substrate states satisfied $\rho_{\text{prior}}(\sigma) = e$.

**Proof sketch.** Retirement is a substrate edit producing the predications $(e, \text{retired-prior-address}, \sigma)$ and renaming the canonical record so that $\sigma'$ is now the file basename of $e$'s canonical record. The post-retirement resolve function $\rho$ is undefined on $\sigma$: $\sigma$ is no longer the canonical address of $e$ (the canonical-address branch fails because $e$'s record's file basename is now $\sigma'$); $\sigma$ is also not in $e$'s `aliases:` list (the alias branch fails because retirement explicitly does not preserve the prior address as an alias). Therefore $\rho(\sigma)$ is undefined, $\sigma \notin \text{dom}(\rho)$, and by the definition of alias as a pair $(\sigma, e)$ with $\rho(\sigma) = e$, $\sigma$ is not an alias of $e$. $\square$

**Corollary.** That aliases are not compatibility shims for renames-in-flight is structurally enforced by retirement being a substrate edit that does *not* extend the resolve function with the retired form. The distinction is encoded in which predicate (`retired-prior-address-of` vs `accepts-alias`) is used in the substrate edit, not as an additional rule about aliases.

### Theorem 8 (alias-admits-orthographic-variation-but-not-semantic-or-morphological)

The alias relation $\sim_{\text{alias}}$ does not, by itself, restrict which surface forms may be declared as aliases. The **orthographic-only** editing discipline — admitting transliteration variants, diacritic-stripped forms, and other *spelling* differences for what is genuinely one entity — is an *editing constraint*, not a property of $\sim_{\text{alias}}$.

**Proof sketch.** The resolve function $\rho$ is extensional: it is determined by which `accepts-alias` cells the substrate carries. Whether $(\text{wolakȟota}, \text{accepts-alias}, \text{wolakhota})$ holds is a substrate-content question — the edit produced the cell. Whether $(\text{citation}, \text{accepts-alias}, \text{reference})$ holds is also a substrate-content question, and an edit could produce that cell too. Both declarations would be syntactically well-formed and would extend $\rho$ accordingly. So would $(\text{script}, \text{accepts-alias}, \text{scripts})$ — but `script` and `scripts` are distinct entities, not alias variants, so that declaration is inadmissible under the editing discipline.

The semantic and morphological content of surface forms is not visible to $\rho$. The constraint that distinguishes admissible aliases (`wolakhota` for `wolakȟota`) from inadmissible ones (`scripts` for `script`; `reference` for `citation`) governs *which substrate edits are admissible*, not the alias relation as defined. The constraint lives in the linting and review apparatus, not in the relation itself. $\square$

**Corollary.** The orthographic-only constraint is enforced at the substrate-edit level (lints, contributor review). The alias relation is more permissive than the constraint; the constraint is implemented as an editing rule atop the underlying mathematical structure. Cases treated as distinct entities (singular/plural, verb inflections, related-but-different concepts) get their own canonical records, not alias declarations.

## What this resolves about the open question

The open question [`what-are-aliases`](../questions/what-are-aliases.md) raised five sub-questions. This claim resolves each:

1. **What is an alias, structurally?** A predication cell of the form $(e, \text{accepts-alias}, \sigma)$, equivalent to extending the resolve function $\rho$ with the pair $(\sigma, e)$. Aliases are predications, not derived equivalence-classes, not extra-substrate labels.

2. **What is the relation of alias to identity-by-relations?** Aliases preserve fiber content (Theorem 3); the entity's predication-graph neighborhood is unchanged by which surface form addresses it. Identity-by-relations holds: the entity is its fiber; aliases are non-content addresses.

3. **What variation may an alias absorb?** Mathematically: any. Under the editing discipline (Theorem 8): only orthographic — transliteration and diacritic variation for what is genuinely one entity. The relation admits more than the editing discipline; the discipline is implemented as an editing constraint. Cases that look like morphological variation (singular/plural, verb inflection) are distinct entities with their own canonical records, not aliases.

4. **Can aliases chain?** $\sim_{\text{alias}}$ is transitive (Theorem 2). The no-chain rule is enforced by the uniqueness of $\rho$ as a function (Theorem 4): a single $\sigma$ cannot simultaneously be canonical and alias, so chained declarations are structurally impossible.

5. **Is alpha-equivalence the right formal model?** Not directly. Alpha-equivalence applies to *bound* names (per the Pitts-Gabbay nominal-sets apparatus; per Cohen-Coquand-Huber-Mörtberg cubical type theory's path-equality). Substrate slugs are *free* names — fixed reference, not scope-bound reference. The right formal model is classical equality pulled back along a resolve function, as established by Theorem 1.

## Relation to the surveyed literature

The survey [`aliases-may-2026`](../surveys/aliases-may-2026.md) identified four phenomena the word "alias" sometimes covers (§11): aliases proper, synonymy, co-reference, contextual identity.

- **Aliases proper** is what this claim formalizes. Resolve-pullback of classical equality. Identical fiber content (Theorem 3). Strict q=1 equivalence (Theorem 6).
- **Synonymy** is the math tree's $\sim_{\text{syn}}$ — distinct from $\sim_{\text{alias}}$ by Theorem 5.
- **Co-reference** is discourse-internal; lives outside the substrate. Not addressed here.
- **Contextual identity** (Halpin-Presutti, lenticular lenses) admits context-dependent equivalence; context-independent aliases under this claim correspond to the trivial context case.

The deployed practice the survey documents — ORCID iDs, DOI, ROR, DIDs, Wikidata Q-IDs, BIBFRAME URIs, Schema.org @id, SKOS prefLabel/altLabel — separates canonical identifier from surface-form labels. The same separation operates here: canonical addresses are identity-handles; aliases are alternate-form labels resolved through $\rho$.

The `owl:sameAs` problem documented at scale (Raad et al. 2019; 2.8%–20% error rate in deployed `sameAs` statements) is empirical evidence that *transitive identity claims at scale* are fragile. The no-chain rule (Theorem 4 corollary) prevents reproducing the `sameAs` failure modes: by enforcing $\rho$ as a function, alias declarations are never closed under transitivity, unintended equivalence-clusters do not form, and the compositional errors that `sameAs` accumulates in the wild are not admitted.

## Open extensions

This claim does not address:

- **Federation of aliases across substrates.** When two independent substrates import each other's records, do their alias declarations compose? The math admits this (the union of two resolve functions remains a function iff the surface-form domains are disjoint or agree on overlaps); the constraint for cross-substrate coordination is a separate question.

- **Aliases under settling evolution.** Substrate edits add and remove predications over time. The resolve function $\rho_t$ is time-indexed. The cell $(e, \text{accepts-alias}, \sigma)$ may be present at time $t$ and absent at time $t' > t$ (the alias was retired). The temporal-2-category apparatus (per the math tree's [`temporal-2-category.md`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/temporal-2-category.md)) could carry this; this claim does not develop it.

- **Multi-language aliases.** Wikidata's per-language `altLabel` mechanism allows different alternate forms in different language contexts. Multi-language aliases are not addressed here; under such an extension the resolve function generalizes to $\rho : \Sigma \times \text{Language} \rightharpoonup E$, and the alias relation becomes context-indexed in the lenticular-lens sense.

- **Aliases as a richer fiber-equivalence than q=1.** Theorem 6 establishes the q=1 case. A future extension might admit q<1 aliases for cases where the substrate carries provisional or contested alias declarations (e.g., an alias under dispute, recorded but with weakened semantics). This would require articulating what the q-grading means for alias content; not done here.

## Promotion path

This claim is `status: draft`. To advance to settled:

1. Audit the proofs against the cited math tree records to ensure no step appeals to apparatus not yet earned.
2. Author the [`alias`](../../teaching/explanations/alias.md) concept record at `prose/teaching/explanations/` lifting the informal exposition of this claim's content.
3. Author the [`alias`](../../../code/structures/alias.md) structure record at `code/structures/` carrying the math.
4. Author the [`alias`](../../../work/governance/rules/specifications/alias.md) specification at `work/governance/rules/specifications/` carrying the implementation rules.
5. The claim then becomes the authority record the three layers cite back to.

## Provenance

The mathematical apparatus cited:

- [`classical-equality`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/classical-equality.md) — the $\leq_t$-Lawvere image of the diagonal; two-valued equality predicate.
- [`paraconsistent-equality`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/paraconsistent-equality.md) — the $\leq_k$-version; ⊤ on diagonal, ⊥ off. Not used directly in the main theorems but available for a paraconsistent variant.
- [`predicate-specialization`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/transformers/predicate-specialization.md) — the morphism $f : q \to p$ in $\mathcal{C}$ with pullback $f^*$.
- [`q-fuzzy-equivalence`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/q-fuzzy-equivalence.md) — the quantale-graded equivalence apparatus, with $q = 1$ as the strict-equivalence case used here.
- [`synonymy`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/synonymy.md) — the settling-level equivalence the alias relation is distinguished from.
- [`predication-cell`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md) — the assertion-position concept; cells indexed over $E \times \Pi \times E$, not over $\Sigma$.
- [`entity`](../../../code/structures/entity.md) — an entity is individuated by its address and characterized by its cells.

The literature backing the editing-constraint-vs-relation distinction:

- The survey [`aliases-may-2026`](../surveys/aliases-may-2026.md), particularly §10.6 on the `owl:sameAs` problem and §11 on the four-phenomena cut.
- Raad, Pernelle, Saïs, Beek, van Harmelen (*Semantic Web* 2019) — empirical error rates that motivate the no-chain rule.

This claim does not cite the survey as authority; the survey is research output. The claim cites the math tree records and the substrate records directly.

## Status

`status: draft`. The proofs are sketches, not fully formalized. A Lean formalization is possible against the [`PredicationCategories`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/lean/) Lean library, particularly the `PredicateMap.specPullback` and `PredicateMap.fiberSpec` lemmas already there.

The claim is left at draft until:
- The proofs are reviewed by emsenn against the math tree records.
- The downstream three-layer encoding (concept / structure / spec) is authored and consistent with the claim.
- The Lean formalization (if pursued) confirms the proof sketches.
