---
name: predication-fiber-functor
description: "The contravariant functor F: C^op → DBiLat(L) assigning to each predicate q its predication-fiber-algebra A_q and to each predicate-category morphism f: q → p the bilattice-homomorphism reindexing f*: A_p → A_q. The raw data the predication-fibration packages via Grothendieck construction. The predicating-tier precursor of the positing-tier predication-fibration."
symbol: "F"
depends-on: [predicate-category, predication-fiber-algebra, bilattice-homomorphism, predicate-specialization, predicate-converse, predicate-subject-projection, predicate-object-projection]
derives-from: docs/dev/scraps/predication-fiber-functor.md
---

# Predication fiber functor

The assignment of each predicate `q` to its predication-fiber-algebra `A_q = L^⋈^(E×E)` extends to a contravariant functor

$$F : \mathcal{C}^{\mathrm{op}} \longrightarrow \mathbf{DBiLat}(\mathbf{L})$$

from the predicate-category `C` (op-ed) to the category of distributive bilattices over `L` (with bilattice-homomorphisms as morphisms).

This is the **raw data** of the substrate's fiber structure: each predicate paired with its value-algebra, each predicate-morphism paired with its reindexing. The Grothendieck construction packages this functor into a fibered category (the predication-fibration), but at the data level the fiber-functor IS the substrate's fiber structure.

## Generator action

The four canonical morphism classes of `C` induce `F`'s action explicitly:

**Specialization `f: q → p` with sub-support inclusion `ι_f: dom(q) ↪ dom(p)`:**
$$f^*(v)(s, o) = \begin{cases} v(s, o) & \text{if } (s, o) \in \mathrm{dom}(q), \\ \bot & \text{otherwise.} \end{cases}$$

The unspecialized cells take `⊥`. This is the bilattice-bottom of the knowledge order — "no evidence at the unspecialized region."

**Converse `f: p^c → p`:** the swap of the entity-pair index `(s, o) ↦ (o, s)`:
$$f^*(v)(s, o) = v(o, s).$$

**Subject-projection `f: q → p`:** collapse to the subject-diagonal `(s, o) ↦ (s, s)`:
$$f^*(v)(s, o) = v(s, s).$$

**Object-projection `f: q → p`:** collapse to the object-diagonal `(s, o) ↦ (o, o)`:
$$f^*(v)(s, o) = v(o, o).$$

## Each generator is a bilattice-homomorphism

**Theorem.** Each `F(f)` is a bilattice-homomorphism on `A_p → A_q`.

*Proof.* Each generator acts on the uniform fiber-algebra `L^⋈^(E×E)` by **cellwise reindexing**:

$$f^*(v)(s, o) = v(g(s, o))$$

for an index map `g: E × E → E × E` — partial for specialization (off-`dom(q)` cells take `⊥`).

The four index maps are:

- specialization: `g` = restriction along `ι_f`.
- converse: `g(s, o) = (o, s)`.
- subject-projection: `g(s, o) = (s, s)`.
- object-projection: `g(s, o) = (o, o)`.

Because the bilattice operations `∧_t, ∨_t, ∧_k, ∨_k` and negation `~` are all **pointwise on the `E × E` index**, any cellwise reindexing preserves them. Concretely: if `(v ∧_k v')(s, o) = v(s, o) ∧_k v'(s, o)`, then

$$f^*(v \wedge_k v')(s, o) = (v \wedge_k v')(g(s, o)) = v(g(s, o)) \wedge_k v'(g(s, o)) = f^*(v)(s, o) \wedge_k f^*(v')(s, o).$$

Same argument for `∨_k`, `∧_t`, `∨_t`, and `~`. So `f*` is a bilattice-hom. □

## Functoriality

`F(id_p) = id_{A_p}` because the identity specialization (with `dom(q) = dom(p)` and `ι_f = id`) induces the identity restriction.

For composition: `F(g ∘ f) = F(f) ∘ F(g)` follows from composition of index maps. The four generator types are **closed under composition**:

- Two specializations compose as a specialization with nested sub-support: `dom(s_2 ∘ s_1) = dom(s_1) ∩ dom(s_2)`.
- Two converses compose to the identity via the double swap: `(s, o) ↦ (o, s) ↦ (s, o)`.
- Converse composed with subject-projection yields object-projection: `(s, o) ↦ (o, s) ↦ (o, o)`.
- Subject-projection composed with subject-projection yields subject-projection (idempotent).
- Symmetric facts for object-projection compositions.

Each resulting composite lies in the same four-class inventory. So `F` is well-defined on all of `C`, not just on the generator class. (This closure-under-composition is also why the four classes EXHAUST the natural bilattice-homomorphisms — see `bilattice-homomorphism-naturality`.)

## Why this lives at predicating tier

`F` is the **raw data** of the substrate's fiber structure at the value-algebra level:

- Each `F(q) = A_q` is a fiber-algebra — a predicating-tier object.
- Each `F(f) = f*` is a bilattice-homomorphism — a predicating-tier morphism (it acts on predication-fiber-algebras).
- The functoriality conditions are predicate-category-level coherence.

All ingredients are predicating-tier. The fiber-functor is the **predicating-tier presentation** of the bundle.

The **Grothendieck construction** packages this same data into a fibered category — the predication-fibration. The two presentations are equivalent under Grothendieck, but they correspond to different operational needs:

| Presentation | Tier | Operational role |
|---|---|---|
| `predication-fiber-functor` (this $thing) | predicating | raw data: fiber-algebras + reindexings indexed by `C` |
| `predication-fibration` | positing | the Grothendieck-packaged fibered category that positing's closure-rules ACT on |

Predicating's per-fiber operations (evidence-injection at one cell, one predicate) use only the per-predicate fiber-algebra data — the functor's per-object values `F(q) = A_q`. Predicating does NOT need the bundle's structural packaging.

Positing's multi-predicate closure-rules use the reindexings ESSENTIALLY (to fire rules whose antecedent and consequent are at different predicates). This is when the bundle's structure becomes operationally active. At that point, the Grothendieck-packaged predication-fibration is the right form.

So the fiber-functor lives at predicating tier as raw data; the fibration lives at positing tier as the operationally-active packaging.

## Position

`transfinite-predication-category/hacking/library/predication-fiber-functor/`. Predicating tier — the precursor presentation of the fibration's data. Wrapped in `hacking/` because the derivation that this typed functor is a hacked term of transfinite-predication-category is admitted from substrate setup.

## Derivation source

Adapted from `predication-categories/theorems/predication-fiber-functor.md` (archive status: proved, with Lean references). The archive content is in essentially current grammar; this restatement only reframes against the four-object grammar and the predicating/positing-tier distinction derived in `lab/answers/2026-05-28-active-predication-next-invariants.md`.
