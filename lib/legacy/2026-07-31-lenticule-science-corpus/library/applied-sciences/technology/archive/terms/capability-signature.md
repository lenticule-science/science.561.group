---
id: capability-signature
description: "A CapabilitySignature is a morphism κ: ParamNames → Types — a finite function that assigns a type to each parameter name, specifying the minimum typed interface any bearer of a role must provide. The defining structure: the params: block of a FARS spec IS a capability signature; filling a role is providing an implementation of that block. Two capability signatures have a subsumption morphism ι: κ₁ → κ₂ (read: κ₂ subsumes κ₁) when every parameter in κ₁ appears in κ₂ with the same type. Satisfaction: agent a satisfies κ at history t iff for every (name, type) in κ, a provides a doubly-settled value of that type."
defines: CapabilitySignature
related: Role, RelationalUniverseMorphism, RelationalUniverse, Area, Norm
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  parameter-names: relational-universe
  type-assignment: relational-universe-morphism
output: relational-universe-morphism
ast:
  interface-morphism:
    - type-assignment:
        - parameter-names
    - subsumption:
        - type-assignment
        - type-assignment
---

# Capability Signature

## Formal definition

A **CapabilitySignature** is a morphism:

$$\kappa : \mathrm{ParamNames} \to \mathrm{Types}$$

where $\mathrm{ParamNames}$ is a finite set of parameter names and $\mathrm{Types}$ is the type vocabulary of the relational universe:

$$\mathrm{Types} = \{\mathrm{relational\text{-}universe},\; \mathrm{relational\text{-}universe\text{-}morphism},\; \mathrm{charter},\; \mathrm{person},\; \mathrm{area},\; \mathrm{relational\text{-}history},\; \ldots\}$$

The morphism $\kappa$ assigns each parameter name $n_i \in \mathrm{ParamNames}$ a type $\kappa(n_i) \in \mathrm{Types}$, declaring what kind of object any bearer must supply for parameter $n_i$.

**In FARS**: the `params:` block of any spec file is a capability signature. Every key in `params:` is a parameter name; every value is a type from the vocabulary above. An entity satisfies a spec's capability signature iff it provides a value of the declared type for every parameter.

**Three invariants.** $\kappa$ is a capability signature iff:

1. **Finiteness**: $|\mathrm{dom}(\kappa)| < \infty$ — capability signatures are finite; they specify a decidable minimum interface, not an open-ended one. An infinite interface cannot be checked for satisfaction at any history.

2. **Type discipline**: every $\kappa(n_i) \in \mathrm{Types}$ — each parameter is assigned a type from the vocabulary, not an informal description. The type determines what kind of object counts as a valid implementation of the parameter.

3. **Name uniqueness**: parameter names within a single signature are distinct — $\kappa$ is a function, not a multimap. Two parameters requiring the same type must have distinct names to be distinct parameters.

## Subsumption morphism

A **subsumption morphism** $\iota : \kappa_1 \hookrightarrow \kappa_2$ exists (read: $\kappa_2$ **subsumes** $\kappa_1$, written $\kappa_1 \preceq \kappa_2$) iff:

$$\mathrm{dom}(\kappa_1) \subseteq \mathrm{dom}(\kappa_2) \quad \text{and} \quad \forall n \in \mathrm{dom}(\kappa_1) : \kappa_2(n) = \kappa_1(n)$$

Every parameter required by $\kappa_1$ appears in $\kappa_2$ with the same type. $\kappa_2$ is at least as demanding as $\kappa_1$; satisfying $\kappa_2$ entails satisfying $\kappa_1$.

**The subsumption morphism is the inclusion morphism** $\iota : \mathrm{dom}(\kappa_1) \hookrightarrow \mathrm{dom}(\kappa_2)$ in the category of finite sets, equipped with the type-compatibility condition. Capability signatures ordered by $\preceq$ form a preorder category: objects are capability signatures, morphisms are subsumption inclusions, and morphism composition is inclusion composition.

**Role hierarchy as subsumption.** A role hierarchy (RBAC or Parsonian) is a choice of subsumption morphisms between the capability signatures of the roles. If $\iota : \kappa_{R_1} \hookrightarrow \kappa_{R_2}$ exists, then role $R_2$ is more specific than $R_1$; filling $R_2$ entails filling $R_1$.

## Satisfaction

**Satisfaction proposition.** For agent $a$ and capability signature $\kappa$ at history $t$, define:

$$s_{a,\kappa} \in H_t$$

as the proposition "agent $a$ satisfies capability signature $\kappa$ at history $t$."

**Satisfaction operativity.** Agent $a$ operatively satisfies $\kappa$ at $t$ iff:

$$s_{a,\kappa} \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$$

This requires: for every $(n_i, \tau_i) \in \kappa$, there is a doubly-settled value-proposition $v_{a,n_i}^{\tau_i} \in H^*_t$ witnessing that $a$ provides an element of type $\tau_i$ for parameter $n_i$.

**Theorem (Subsumption Satisfaction Monotonicity).** If $\iota : \kappa_1 \hookrightarrow \kappa_2$ is a subsumption morphism and $s_{a,\kappa_2} \in H^*_t$, then $s_{a,\kappa_1} \in H^*_t$.

*Proof sketch.* $s_{a,\kappa_2} \in H^*_t$ means every parameter in $\kappa_2$ is doubly-settled for $a$. Since $\mathrm{dom}(\kappa_1) \subseteq \mathrm{dom}(\kappa_2)$ and types agree on $\mathrm{dom}(\kappa_1)$, the doubly-settled value-propositions for $\kappa_2$ restrict to doubly-settled value-propositions for $\kappa_1$. Therefore $s_{a,\kappa_1} \in H^*_t$. $\square$

## In FARS

The capability signature of a spec is exactly its `params:` block. The type vocabulary is the set of spec ids used as param types in the system (relational-universe, relational-universe-morphism, charter, etc.). Every spec defines a capability signature; an entity that provides implementations for all declared params satisfies the spec's capability signature.

The subsumption morphism between spec capability signatures exists when one spec's params are a subset of another's (with matching types). The RBAC role hierarchy is the file-system realization of this: a spec that inherits another's full params block is strictly more demanding.

## Open questions

- Whether the type vocabulary $\mathrm{Types}$ should itself be formalized as an object in the relational universe — whether there is a presheaf of types $\mathcal{T} : T^{\mathrm{op}} \to \mathbf{Set}$ assigning to each history the set of types available at that history, and whether capability signatures are then morphisms in the slice category over $\mathcal{T}$.
- Whether capability signatures can include **dependent types** — whether the type of one parameter can depend on the value provided for another, and whether this dependence requires an extension of the subsumption morphism (from a simple inclusion to a morphism in a category of dependent types).
- Whether the satisfaction proposition $s_{a,\kappa}$ is **jointly generated** by the family of individual value-propositions $\{v_{a,n_i}^{\tau_i}\}$ — whether $s_{a,\kappa} = \bigwedge_{i} v_{a,n_i}^{\tau_i}$ in the Heyting algebra $H_t$, making satisfaction the meet of all individual parameter satisfactions; and whether this join/meet characterization simplifies the proof of Subsumption Satisfaction Monotonicity.
