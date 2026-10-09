---
id: flatfile-agent-resource-system-params
description: "The params: frontmatter field of a spec, understood as a CapabilitySignature over the the corpus sort vocabulary — a finite function κ: ParamNames → FARSSorts assigning a the corpus sort (a spec id used as a type) to each named parameter slot. The defining structure: the params: block of every the corpus spec is a 0-ary Signature over the set of declared spec ids; it specifies what typed values must be provided to instantiate the spec. Two specs have a subsumption morphism ι: κ₁ → κ₂ when every param in κ₁ appears in κ₂ with the same sort — satisfying the more demanding spec entails satisfying the less demanding one. The output: field specifies the sort produced by a spec that satisfies its own params block."
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  spec-id: relational-universe
  param-names: relational-universe
  sort-assignment: relational-universe-morphism
output: relational-universe-morphism
ast:
  capability-signature-over-fars-sorts:
    - param-names:
        - spec-id
    - sort-assignment:
        - param-names
        - fars-sort-vocabulary
---

# Params

## Formal definition

The `params:` field of a spec is a [CapabilitySignature](../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/capability-signature.md) $\kappa_P$ whose sort set is the **the corpus sort vocabulary**:

$$\kappa_P : \mathrm{ParamNames}_P \to \mathcal{S}_\mathrm{the corpus}$$

where:
- $\mathrm{ParamNames}_P$ is the finite set of parameter names declared in the `params:` field of spec $P$ (e.g., `vessel`, `persons`, `role-assignment`, `mandate`)
- $\mathcal{S}_\mathrm{the corpus}$ is the **the corpus sort vocabulary** — the set of spec identifiers that function as types in the system: $\{\mathtt{relational\text{-}universe},\; \mathtt{relational\text{-}universe\text{-}morphism},\; \mathtt{person},\; \mathtt{vessel},\; \mathtt{charter},\; \mathtt{area},\; \mathtt{norm},\; \ldots\}$; each sort names a spec in `spec/` and therefore names a kind of structured object
- $\kappa_P(n_i) = s_j$ asserts that parameter $n_i$ of spec $P$ requires a value of sort $s_j$ — an object that satisfies the spec with id $s_j$

**The output field.** Every spec with a params block also carries an `output:` field specifying a sort $\mathrm{out}_P \in \mathcal{S}_\mathrm{the corpus}$. This is the **result sort** — the sort of the object the spec produces when its params block is satisfied. The params block $\kappa_P$ together with $\mathrm{out}_P$ form the **functional profile** of spec $P$: $\kappa_P \Rightarrow \mathrm{out}_P$.

**Three invariants.** $\kappa_P$ is a valid params block iff:

1. **Sort groundedness**: every sort $s \in \mathrm{img}(\kappa_P)$ and the output sort $\mathrm{out}_P$ are spec ids that resolve to an existing entity in the system. A param whose sort has no corresponding spec creates vocabulary debt — an edge whose label has no node. Every sort in $\kappa_P$ must name a spec that has been declared before $\kappa_P$ is used.

2. **Name uniqueness within spec**: parameter names within a single spec's params block are distinct — $\kappa_P$ is a function, not a multimap. Two params of the same sort must have distinct names (e.g., `source: person` and `target: person` are distinct params).

3. **Finiteness**: $|\mathrm{ParamNames}_P| < \infty$. A params block with infinitely many parameters cannot be satisfied at any history.

## The the corpus sort vocabulary

The sort vocabulary $\mathcal{S}_\mathrm{the corpus}$ is managed as a the corpus entity: each sort $s \in \mathcal{S}_\mathrm{the corpus}$ must have a corresponding spec with `id: s` in the `spec/` directory. The sort vocabulary is exactly the set of `id:` values of existing specs.

This means:
- Adding a new sort = writing a new spec
- A sort is well-typed iff its spec exists
- Using an undeclared sort in a params block creates a dangling reference — a capability signature over a non-existent sort

The sort vocabulary is not closed a priori; it is whatever the current spec corpus defines. New sorts enter through spec declaration, not through modification of a central type registry.

## Subsumption between params blocks

**Definition.** A **subsumption morphism** $\iota : \kappa_{P_1} \hookrightarrow \kappa_{P_2}$ between two params blocks exists iff:

$$\mathrm{ParamNames}_{P_1} \subseteq \mathrm{ParamNames}_{P_2} \quad \text{and} \quad \forall n \in \mathrm{ParamNames}_{P_1} : \kappa_{P_2}(n) = \kappa_{P_1}(n)$$

Spec $P_2$ is **more demanding** than $P_1$: satisfying $P_2$'s params block entails satisfying $P_1$'s. This is the formal meaning of `extends:` in the corpus frontmatter — $P_2$ extends $P_1$ iff $\iota : \kappa_{P_1} \hookrightarrow \kappa_{P_2}$.

**Theorem (Params Subsumption Satisfaction).** If $\iota : \kappa_{P_1} \hookrightarrow \kappa_{P_2}$ and a spec instance $M$ satisfies $\kappa_{P_2}$ at history $t$, then $M$ satisfies $\kappa_{P_1}$ at history $t$.

*Proof sketch.* Satisfaction of $\kappa_{P_2}$ means every parameter in $\mathrm{ParamNames}_{P_2}$ has a doubly-settled value-proposition for $M$ at $t$. Since $\mathrm{ParamNames}_{P_1} \subseteq \mathrm{ParamNames}_{P_2}$ and sorts agree, the value-propositions for $\kappa_{P_2}$ restrict to value-propositions for $\kappa_{P_1}$. $\square$

## Satisfaction in the corpus

**Definition.** A **spec instance** is a binding $\mu : \mathrm{ParamNames}_P \to \mathrm{Objects}$ assigning an object $\mu(n_i)$ of sort $\kappa_P(n_i)$ to each parameter name. The satisfaction proposition for instance $\mu$ of spec $P$ at history $t$ is $\mathrm{inst}_{P,\mu} \in H_t$.

**Operative satisfaction.** $\mathrm{inst}_{P,\mu} \in H^*_t$ iff for every $(n_i, s_i) \in \kappa_P$, the value-proposition $v_{\mu(n_i),s_i} \in H^*_t$ — every bound value is doubly settled as being of the required sort.

## Nuclear derivation

**Param-binding propositions.** For each parameter $n_i \in \mathrm{ParamNames}_P$ and provided value $v_i$, define $b_{P,n_i,v_i} \in H_t$ as the proposition "value $v_i$ of sort $\kappa_P(n_i)$ is bound to parameter $n_i$ of spec $P$ at history $t$.$"$

**Operative satisfaction condition.** $\mathrm{inst}_{P,\mu} \in H^*_t$ iff $\forall n_i \in \mathrm{ParamNames}_P : b_{P,n_i,\mu(n_i)} \in H^*_t$.

**Sort-grounding proposition.** For each sort $s \in \mathrm{img}(\kappa_P)$, define $\mathrm{grnd}_s \in H_t$ as the proposition "sort $s$ has a corresponding spec in the system at history $t$.$"$ An ungrounded sort leaves all bindings for that parameter in $H_t \setminus \mathrm{Fix}(\sigma_t)$ — they cannot be meaning-settled because the sort itself is unsettled.

**Failure modes.**

| Failure | Nuclear characterization | Symptom |
|---|---|---|
| **Dangling sort** | $\mathrm{grnd}_s \notin H^*_t$ for some $s \in \mathrm{img}(\kappa_P)$ | Param cannot be type-checked; binding never meaning-settles |
| **Missing param** | $b_{P,n_i,v_i} \notin H_t$ for required $n_i$ | Partial instance; spec not fully instantiated |
| **Type mismatch** | $b_{P,n_i,v_i} \in H_t$ but $v_i$ does not satisfy sort $\kappa_P(n_i)$ | Binding meaning-settles falsely; execution-settlement fails |
| **Circular sort** | $s \in \mathrm{img}(\kappa_P)$ and $P \in \mathrm{ParamNames}_s$ | Sort grounding produces fixed-point loop; no history at which both settle |

## Open questions

- Whether the the corpus sort vocabulary $\mathcal{S}_\mathrm{the corpus}$ should be formalized as a presheaf $\mathcal{T} : T^{\mathrm{op}} \to \mathbf{Set}$ assigning to each history the set of currently-declared sorts, making sort availability history-relative, or whether $\mathcal{S}_\mathrm{the corpus}$ is a global constant.
- Whether partial satisfaction (providing only some params) should generate a **residual params block** $\kappa_P \setminus \kappa_{P'}$ — the signature of remaining unfilled parameters — making partial instantiation a morphism in the preorder of params blocks.
- Whether the `extends:` relation exactly corresponds to subsumption morphisms between params blocks, or whether extension carries additional structure beyond type compatibility (e.g., behavioral obligations).
