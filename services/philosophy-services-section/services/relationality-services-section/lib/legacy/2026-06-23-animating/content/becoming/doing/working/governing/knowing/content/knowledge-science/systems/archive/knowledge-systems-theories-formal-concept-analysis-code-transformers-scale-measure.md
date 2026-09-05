---
type: morphism
class: context-projection
status: stable
depends-on: [formal-context, scale]
see-also: [conceptual-projection]
---

# Scale-measure

The morphism by which a many-valued context is projected to a binary context via a chosen scale (per [scale](teaching/explanations/scale.md)). Given a many-valued context $(G, M, W, I)$ where $I: G \times M \rightharpoonup W$, and for each many-valued attribute $a \in M$ a scale $\mathbb{S}_a = (W_a, N_a, J_a)$ with $W_a \supseteq \mathrm{range}(I({-}, a))$, the **derived (binary) context** $\mathbb{K}_{\mathbb{S}}$ has:

- Object set $G$ (unchanged).
- Attribute set $\bigsqcup_{a \in M} N_a$ (the disjoint union of all scale attributes).
- Incidence $g \, I_{\mathbb{S}} \, n_a \iff I(g, a) \, J_a \, n_a$ (object $g$ has scale-attribute $n_a$ iff the value of $a$ on $g$ stands in the scale relation to $n_a$).

The scale-measure morphism $\mathbb{K} \to \mathbb{K}_{\mathbb{S}}$ depends on the choice of scales; different scale choices produce different binary derivations of the same many-valued context.

## Functoriality

For fixed scales, scale-measure is a functor from many-valued contexts (with object-preserving scale-respecting maps as morphisms) to binary contexts. The concept lattice of the derivation $\mathbb{K}_{\mathbb{S}}$ is what FCA practitioners actually compute when they work with non-binary data; the choice of scales is recorded as a methodological commitment of the analysis.

## Scale-measure as substrate refinement

Read against the predicated framing: scale-measure corresponds to the substrate operation of *predicate refinement along [specialize](../../predicated-knowledge-systems/morphisms/specialize.md)*. The many-valued attribute $a$ becomes a family of binary predicates indexed by the scale attributes $N_a$, related by specialisation morphisms determined by the scale's incidence $J_a$. The derived binary context is the substrate restricted to the refined predicate vocabulary.
