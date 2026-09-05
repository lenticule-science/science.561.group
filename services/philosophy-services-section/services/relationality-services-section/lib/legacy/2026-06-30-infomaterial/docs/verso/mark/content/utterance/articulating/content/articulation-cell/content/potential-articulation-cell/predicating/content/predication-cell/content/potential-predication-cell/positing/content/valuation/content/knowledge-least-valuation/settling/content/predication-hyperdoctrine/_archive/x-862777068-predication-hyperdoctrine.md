---
name: predication-hyperdoctrine
description: "A predication-fibration that additionally verifies (B1k)/(B1t) quantifier adjoints, (B2k)/(B2t) Frobenius reciprocity, (B3) Beck-Chevalley coherence, and (B4) comprehension. Two parallel hyperdoctrinal adjoint systems, one for knowledge-order and one for truth-order."
depends-on: [predication-fibration, knowledge-order, truth-order, predicate-category, twist-product-fusion]
derives-from: docs/dev/scraps/predication-hyperdoctrine.md
---

# Predication hyperdoctrine

A predication-hyperdoctrine is a predication-fibration `(E, p: E → C^op)` that additionally verifies the five hyperdoctrinal conditions (B1)–(B4) below, in BOTH the knowledge-order enrichment and the truth-order enrichment. The two orders give two parallel systems of quantifier adjoints with independent Frobenius and Beck-Chevalley behavior.

## (B1) Quantifier adjoints

For every morphism `f: q → p` in the predicate-category `C`, the reindexing functor `f*: E_p → E_q` has both a left and a right adjoint in EACH order:

**(B1k) Knowledge-order adjoints.**
$$\exists_f^k \;\dashv\; f^* \;\dashv\; \forall_f^k$$
in the `≤_k`-enrichment.

**(B1t) Truth-order adjoints.**
$$\exists_f^t \;\dashv\; f^* \;\dashv\; \forall_f^t$$
in the `≤_t`-enrichment.

The four predicate-category generator classes (specialization, converse, subject-projection, object-projection) all give rise to reindexings with both adjoint systems present.

## (B2) Frobenius reciprocity

For every `f: q → p`, every `α ∈ E_p`, and every `φ ∈ E_q`:

**(B2k) Frobenius for `∧_k`.**
$$\exists_f^k\bigl(f^*(\alpha) \wedge_k \phi\bigr) \;\cong\; \alpha \wedge_k \exists_f^k(\phi).$$

**(B2t) Frobenius for `∧_t`.**
$$\exists_f^t\bigl(f^*(\alpha) \wedge_t \phi\bigr) \;\cong\; \alpha \wedge_t \exists_f^t(\phi).$$

Frobenius is what makes existential quantification "commute appropriately" with the meets — it is the structural condition that lets one move an `∃` outside a meet with an unquantified factor.

### Frobenius for `⊙` fails

The twist-product-fusion `⊙` on `L^⋈` is **non-integral**: its monoidal unit `⟨1, 1⟩ = ⊤` is not the `≤_t`-top `t`, and its absorber `f` is not the `≤_k`-bottom `⊥`. Specialization's `∃_f` extends by `⊥` (for `≤_k`) or `f` (for `≤_t`); Frobenius demands the connective's absorber align with the extension value.

| Connective | `≤_k`-absorber | `≤_t`-absorber | Frobenius holds? |
|---|---|---|---|
| `∧_k` | `⊥` | – | yes (B2k) |
| `∧_t` | – | `f` | yes (B2t) |
| `⊙` | `f` | – | **fails for `≤_k`** |

So `≤_k`-Frobenius-for-`⊙` fails for three of the four generator classes (specialization, subject-projection, object-projection — the converse class is exempt by the swap structure). This failure is the formal reason `⊙`-quantification is not part of the hyperdoctrinal structure and instead enters as a separate connective.

## (B3) Beck-Chevalley coherence

For every pullback square in the predicate-category `C`

```
    P --p_A--> A
    |          |
   p_B         f
    |          |
    v          v
    B ---g---> C
```

and every `φ ∈ E_B`, the canonical natural transformation

$$\exists_{p_A}^{k/t}\bigl(p_B^* \phi\bigr) \;\to\; f^*\bigl(\exists_g^{k/t} \phi\bigr) \quad \in \mathcal{E}_A$$

is an isomorphism, for both the `≤_k`- and `≤_t`-adjoint systems. Dually for `∀`.

Beck-Chevalley is what makes existential and universal quantifiers respect the pullback structure of `C`: quantifying along a pulled-back arrow equals pulling back a quantification along the original arrow. Without (B3), quantifier scoping behaves incoherently across reindexings.

The Beck-Chevalley condition fixes which `C`-structures permit hyperdoctrinal predication. Concretely: `C` must have finite limits (in particular, pullbacks) for B3 to even be stated. Substrate practice ensures `C`'s finite-limit existence through the four-generator construction with finite predicate-set.

## (B4) Comprehension

For every `p ∈ C`, the **extension functor**

$$\mathrm{Ext}^t : \mathcal{C}/p \to \mathcal{E}_p, \qquad (g: q \to p) \;\mapsto\; \exists_g^t(\mathbf{1}_q^t)$$

has a right adjoint `{p : -}_t: E_p → C/p`, where `1_q^t` is the `≤_t`-terminal of the fiber `E_q` (the constant-`t` valuation). The analogous right adjoint `{p : -}_⊤` for the `≤_k`-system also exists.

Comprehension is the structural condition that supports forming a sub-predicate from a fiber-algebra element. In classical hyperdoctrines this is the source of the equality predicate. The two parallel comprehension systems here produce TWO derived equality predicates:

- `{p : v}_t` — classical equality (the truth-order comprehension).
- `{p : v}_⊤` — paraconsistent equality (the knowledge-order comprehension).

The two extensions answer different questions about a sub-predicate: classical equality asks "are these the same in truth," paraconsistent equality asks "are these the same in evidence (including contradictory evidence)."

## Property-like (Kelly–Lack 1997)

By Kelly–Lack's property-like theorem, conditions (B1)–(B4) are **properties** of the underlying predication-fibration, not additional structural data. A predication-fibration either verifies these properties (becoming a predication-hyperdoctrine) or fails to; no independent choice of hyperdoctrine structure is made.

This is structurally crucial: it means the question "is this fibration a hyperdoctrine?" is yes-or-no, not "with which hyperdoctrine structure?" Hyperdoctrinality is intrinsic to the fibration, not extra equipment.

## Two parallel adjoint systems — structural significance

The simultaneous presence of `≤_k`- and `≤_t`-hyperdoctrinal structure is **structurally distinctive** of bilattice-valued predication. The fiber algebra has two natural orders, and BOTH support adjoint structure. This is not what classical hyperdoctrines do.

In a classical hyperdoctrine (fibers are Heyting algebras, single order `≤`), there is one `∃ ⊣ f^* ⊣ ∀` system and one comprehension. Classical equality comes from comprehension on this single system.

Here, the bilattice structure produces TWO systems, hence two equalities (classical and paraconsistent). This is the formal expression of why bilattice-valued predication carries strictly more information than classical predication: the paraconsistent equality detects evidence-of-difference that classical equality cannot (e.g., one `⊤` cell vs one `⊥` cell are paraconsistent-distinct but classically-equal under truth-order projection).

## Worked example: identity reindexing

For `f = id_p: p → p`, all four adjoints `∃^k`, `∀^k`, `∃^t`, `∀^t` are identity functors on `E_p`. Frobenius reduces to `α ∧_k φ ≅ α ∧_k φ` (trivially true). Beck-Chevalley reduces to the trivial pullback `id*α ≅ id*α`. Comprehension `{p : v}_t` recovers the canonical extension of `v` viewed as a sub-predicate of `p`'s top.

This is the minimal sanity check; the substance of the hyperdoctrine conditions appears at non-identity reindexings, where the four generator classes (specialization, converse, projections) all impose distinct non-trivial structure.

## Position

`transfinite-predication-category/hacking/library/predication-hyperdoctrine/`. Predicating tier. The hyperdoctrine structure equips the fibration with predicate-category-indexed quantification — that quantification IS what predicating's evidence-injection function gets to range over.

## Derivation source

Adapted from `predication-categories/objects/predication-hyperdoctrine.md`, preserved verbatim at `docs/dev/scraps/predication-hyperdoctrine.md`. The scrap is in essentially current grammar.
