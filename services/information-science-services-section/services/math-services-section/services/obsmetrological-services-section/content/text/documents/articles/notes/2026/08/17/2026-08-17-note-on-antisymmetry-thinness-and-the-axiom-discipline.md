# Note on Antisymmetry, Thinness, and the Axiom Discipline

**Abstract.** This note gives the mathematical content of the corpus's axiom policy — the
rule that a declaration is finished when `#print axioms` reports what was intended, and that
`Quot.sound` is admitted where `propext` is not. Four results. **(1)** `propext` is not merely
*analogous* to antisymmetry; it *is* `le_antisymm` for the entailment preorder on `Prop`, so
admitting it asserts that mutual entailment forces identity. **(2)** Proof irrelevance in Lean 4
is definitional, not axiomatic, which stratifies the working settings into three levels —
`Prop + propext` (poset), `Prop` alone (preorder), `Type` (genuine category) — of which only the
third supports proof-relevant structure. No axiom policy can move a development from the second
level to the third. **(3)** Every monad on a thin 2-category is idempotent up to isomorphism, and
strictly idempotent if the carrier is additionally skeletal; hence Kock–Zöberlein lax-idempotence
is a *vacuous* condition on any locally thin carrier. It is thinness, not antisymmetry, that does
the damage here — antisymmetry only upgrades "idempotent up to iso" to "idempotent on the nose".
This corrects a weaker claim the author of this note stated first. **(4)** A completion taken to
gain inverses must be taken in the category where the structure lives: the difference quotient
that produces ℤ from ℕ, applied naively to a two-axis epistemic tally, identifies the knowledge
top with the knowledge bottom. The note closes with the practical rules that follow, including
why reflective normalisation is axiom-free where propositional rewriting is not.

Results (1)–(2) and the supporting kernel facts are machine-checked in Lean 4.31; results
(3)–(4) are pen-and-paper and are marked as such. The note distils a Claude Code session of
2026-08-17 in the `emsenn/info` repository.

---

## 1. The setting

Most Lean developments treat axioms as infrastructure: `Classical.choice` is used freely,
`propext` passes unremarked, and a declaration is finished when it typechecks. This corpus
takes the opposite view, and not from fastidiousness. The axiom list of a declaration records
**which identifications its proof was willing to make**, and in a development whose subject is
the failure of identification — opaque marks, unwitnessable distinctions, residue that survives
predication — those commitments are not overhead around the mathematics. They are the
mathematics.

Two axioms sit on the boundary and the difference between them organises everything below.

```lean
Quot.sound : r a b → Quot.mk r a = Quot.mk r b
propext    : (a ↔ b) → a = b
```

`Quot.sound` is *stipulated* identification. One constructs an object and declares, as part of
its construction, which of its points it is unable to tell apart. The quotient records exactly
that relation and nothing further; the collapse is local, chosen, and carried by the type.

`propext` is *inferred* identification. Two propositions entail one another, therefore they are
the same proposition. Nothing was declared; identity was deduced from equivalence, globally, for
every proposition in the ambient universe at once.

Both are "identify along an equivalence". The difference is **who declares the equivalence and
over what**. §2 makes this precise.

## 2. `propext` is the antisymmetry of the entailment preorder

**Proposition 2.1.** *Let `p ≤ q` abbreviate `p → q` for `p q : Prop`. Then `≤` is a preorder on
`Prop`, `Iff p q` is precisely `(p ≤ q) ∧ (q ≤ p)`, and `propext` is exactly the antisymmetry law
for `≤`.*

*Proof.* Reflexivity is `id`; transitivity is composition, `fun h₁ h₂ => h₂ ∘ h₁`. `Iff` is by
definition the pair of implications `⟨mp, mpr⟩`, which is the conjunction of `p ≤ q` and
`q ≤ p`. Substituting, the type of `propext` reads

```lean
∀ {p q : Prop}, p ≤ q → q ≤ p → p = q
```

which is the statement `le_antisymm` for `(Prop, ≤)`. ∎

This is an identity of statements, not a family resemblance. `Prop` carries a preorder whether
or not anyone writes it down — it is the preorder every Lean proof is written inside — and
`propext` is the assertion that this preorder is a partial order.

**Corollary 2.2.** *`propext` holds if and only if `Prop` is its own Lindenbaum–Tarski algebra.*

The Lindenbaum–Tarski construction quotients a preorder of propositions by mutual entailment to
obtain a poset. `Quot.sound` suffices to *build* that quotient — one may form
`Quot (fun p q => p ↔ q)` and obtain the algebra as a constructed object, with the collapse
recorded in the type. `propext` asserts instead that the quotient map is already an isomorphism:
that `Prop` was the Lindenbaum–Tarski algebra all along, and the collapse needed no construction
because it was never avoidable.

That is the precise sense in which the two axioms differ in kind rather than in strength. One
lets you build the collapse where you want it. The other imposes it everywhere, in advance.

**Corollary 2.3.** *A development whose objects of study are structures strictly weaker than
partial orders has, in admitting `propext`, assumed the negation of its subject matter at the
base of its ambient logic.*

This is not a contradiction — one may consistently study preorders inside a logic whose
propositions form a poset — but it is a discipline failure of the kind that produces theorems
weaker than they appear. §4 exhibits the mechanism.

## 3. Thinness is definitional, and it stratifies the settings

**Proposition 3.1** (machine-checked). *Proof irrelevance is definitional in Lean 4: the
following is proved by `rfl` and depends on no axioms.*

```lean
theorem irrelevant (p : Prop) (h₁ h₂ : p) : h₁ = h₂ := rfl
```

**Corollary 3.2** (machine-checked). *Every `Prop`-valued relation is thin: for
`R : α → α → Prop` and `w₁ w₂ : R a b`, one has `w₁ = w₂` by `rfl`, axiom-free.*

The consequence is structural and is routinely missed. A category enriched in `Prop` has
hom-*objects* that are propositions, hence at most one arrow between any two objects: it is a
**preorder**. Adding `propext` — antisymmetry — makes it **skeletal**, i.e. a **poset**. Neither
choice affects thinness, because thinness is upstream of both, in the kernel's conversion rule.

| Setting | Hom cardinality | Skeletal | Residue | Is a |
|---|---|---|---|---|
| `Prop` + `propext` | ≤ 1 | yes | none | partial order |
| `Prop` alone | ≤ 1 | no | none | preorder |
| `Type` | arbitrary | n/a | survives | category |

**Corollary 3.3.** *No axiom policy yields proof relevance.* Retiring `propext` moves a
development from the first row to the second — a real and machine-checkable assertion, namely
that antisymmetry is nowhere assumed — but the hom-objects remain propositions and remain thin.
Residue requires leaving `Prop`, which is a change of definition, not of axiom budget.

The practical instruction: **decide which row a construction needs before writing it.** A
proof-relevant notion written into `Prop` is not a leaner presentation of itself. It is a
different, thinner object which has already discarded the data that made it worth studying, and
no later theorem can recover it.

## 4. Lax-idempotence is vacuous on a thin carrier

*(Pen-and-paper. Not Lean-checked.)*

**Proposition 4.1.** *Let `(P, ≤)` be a preorder, `T : P → P` monotone, equipped with
`η : ∀ x, x ≤ T x` and `μ : ∀ x, T (T x) ≤ T x` — that is, a monad on `P` regarded as a thin
category. Then `T (T x) ≅ T x` for every `x`. If `P` is additionally a poset, `T (T x) = T x`.*

*Proof.* From `η x : x ≤ T x` and monotonicity of `T`, `T x ≤ T (T x)`. Together with
`μ x : T (T x) ≤ T x` this gives mutual comparability, i.e. isomorphism in the thin category `P`.
Antisymmetry upgrades the isomorphism to an equality. ∎

Note what was *not* used: the lax-idempotence condition. The proof needs only that `T` is a
monotone monad.

**Corollary 4.2.** *Kock–Zöberlein lax-idempotence is a vacuous condition on any locally thin
2-category.*

A KZ 2-monad is one carrying a specified adjunction `T η_A ⊣ μ_A` (equivalently, a specified
comparison 2-cell subject to coherence). Where hom-categories are thin, all parallel 2-cells are
equal, so an adjunction between parallel 1-cells is a *property* and not *data* — there is
nothing for the KZ structure to be. Every monad on such a carrier is already idempotent up to
the unique isomorphism, by 4.1, whether or not anyone asserts laxness.

**Correction.** The author of this note first stated that *antisymmetry* trivialises
lax-idempotence. That is too weak and misidentifies the culprit. Thinness alone forces
`T² ≅ T`; antisymmetry only strengthens the conclusion from isomorphism to equality. The
consequence for practice is therefore stronger than first claimed: retiring `propext` does **not**
rescue a lax structure. A carrier whose hom-objects are propositions will trivialise laxness
regardless of the axiom budget.

**Corollary 4.3.** *For lax-idempotence to carry information, the hom-objects must be
`Type`-valued.* The 2-cell that expresses `Cl (Cl v) ≤ Cl v` as a genuine comparison, rather than
as an equality in disguise, must be an inhabitant of a type with more than one possible
inhabitant. This is the same requirement as §3's third row, arrived at independently: the
witness must be data.

The general pattern worth internalising: `∃ C, P C` discards `C`; `{ C // P C }` retains it and
lands in `Type`. Where `C` is a bound, a covering, or a residue — where it *is* the object under
study — the existential is a lossy encoding, and the loss is invisible because `Prop` makes every
two witnesses equal by conversion.

## 5. Where `propext` enters, mechanically

Three channels account for essentially all of it. None is a mistake; each is what the tool in
question *is*.

### 5.1 Quotient lifting into `Prop`

`Quotient.lift` has signature

```lean
Quotient.lift (f : α → β) (h : ∀ a b, a ≈ b → f a = f b) : Quotient s → β
```

The obligation `h` is an equality **in the codomain**. Taking `β := Prop` therefore owes an
equality of propositions, which is `propext` and can be nothing else. Taking `β := Bool` owes an
equality of booleans — ordinary data, dischargeable by case analysis:

```lean
def leB : Q → Q → Bool := Quotient.lift₂ Pre.leB (fun _ _ _ _ ha hb => Pre.leB_respects ha hb)
def le (a b : Q) : Prop := leB a b = true
```

The route requires decidability and closes without it. For an undecidable order — a constructive
real order, for instance — no `Bool` carrier exists, and the correct move is representative
quantification, defining the relation on the quotient by quantifying over representatives rather
than lifting a function into `Prop` at all.

### 5.2 Propositional rewriting

Simplification normalises a propositional goal by rewriting `p` to `p = True`. The core lemmas
that do this — `eq_true`, `eq_false`, and the propositional simplification set built on them —
are *equalities between propositions*, hence `propext` by 2.1. Any simplification call that
touches a `Prop` carries the axiom, whatever the goal was nominally about. This is not a defect
in the tactic; propositional rewriting is exactly the operation `propext` licenses.

### 5.3 Partiality

Truncated subtraction on ℕ forces a case split on which argument dominates, and discharging the
cases rewrites propositions. Division behaves likewise. Partial operations are therefore an
axiom channel in disguise, and totalising them — completing a monoid to a group — removes the
case split and the axiom together. When an algebraic improvement and a hygiene improvement arrive
by the same move, that is usually evidence the move was structurally right rather than
cosmetically convenient.

## 6. Completion must be taken where the structure lives

*(Pen-and-paper. Not Lean-checked.)*

Group completion is the left adjoint `K` to the forgetful functor `Ab → CommMon`. For the
additive naturals it is realised as

```
K(ℕ) ≅ ℕ × ℕ / (a,b) ~ (c,d) ⟺ a + d = c + b
```

and this is the standard route to ℤ. The construction is clean, and — because it is a quotient —
it costs `Quot.sound` and no more.

The caution is about *what one applies it to*. Suppose a carrier is a two-coordinate epistemic
tally `⟨pos, neg⟩`, with `pos` counting evidence told-true and `neg` counting evidence
told-false, ordered by a knowledge order in which `⟨0,0⟩` is "told nothing" and `⟨1,1⟩` is "told
both". As a commutative monoid under coordinatewise addition this is the free commutative monoid
on two generators, and its group completion is computed **axis-wise**:

```
K(ℕ × ℕ) ≅ K(ℕ) × K(ℕ) ≅ ℤ × ℤ
```

because `K` is a left adjoint and preserves coproducts, and the two coordinates are independent
generators. The knowledge order survives; `⟨1,1⟩` and `⟨0,0⟩` remain distinct.

The *difference* quotient does something else entirely. Imposing
`(a,b) ~ (c,d) ⟺ a + d = c + b` on the two-coordinate tally identifies `⟨1,1⟩` with `⟨0,0⟩` —
told-both with told-nothing. It is `K` applied along the **truth-order projection**, and it
collapses precisely the dimension that a four-valued epistemic semantics exists to keep.

**Principle 6.1.** *The forgetful functor determines what survives the completion. Name it before
taking the adjoint.* Completing a bilattice-valued carrier "to get subtraction" by imposing a
difference relation is not a completion of that carrier; it is a completion of its truth-order
image, and the knowledge order is the cost.

**Corollary 6.2.** *A coboundary theory over two-axis tally coefficients wants `ℤ × ℤ`, with the
induced bilattice, not `ℤ`.* The alternating sum then cancels — the obstruction that motivated
completing in the first place is removed — while the epistemic content that motivated the tally
is preserved. The one-axis construction remains the right object when the carrier genuinely is
one axis; the error is only in applying it across two.

## 7. Reflective normalisation: coherence with a certificate

The reflex, once propositional simplification is unavailable, is to hand-write chains of
rewrites. This is the wrong lesson and following it produces unmaintainable proof in quantity.

Under the Curry–Howard–Lambek correspondence a proof term *is* a morphism. A rewrite chain is
therefore a composite arrow, constructed anonymously, at one call site — a morphism that ought to
have been named. The characteristic example is the four-term rearrangement

```
(a + b) + (c + d) = (a + c) + (b + d)
```

which is not a lemma-shaped inconvenience but the statement that `+ : M × M → M` is a monoid
homomorphism from the product monoid. (Eckmann–Hilton is the degenerate consequence when two
unital operations satisfy it.) Proved once, it discharges every well-definedness obligation of a
difference quotient — respect of addition, transitivity of the cross-sum relation, both
distributive laws, associativity — because those obligations are all instances of the same arrow.

The general form is **reflective normalisation**. Let `Term` be the initial algebra of the
signature, `eval : Term → M` the unique homomorphism into the model, and `norm : Term → NF` a
computable normalisation with soundness

```lean
theorem eval_norm (e : Term) : eval (norm e) = eval e
```

To prove `eval e₁ = eval e₂` one computes `norm e₁` and `norm e₂`, checks syntactic equality —
decidable, on **data** — and concludes by `eval_norm` twice. No proposition is ever rewritten:
the equation being proved lives in the carrier `M`, not in `Prop`, so §5.2's channel is never
opened. Simplification is a normaliser without a certificate; a reflective tactic is the same
normaliser with its coherence theorem attached, and the theorem is what makes it clean.

The cost of this discipline is therefore **not** measured in rewrite chains. It is measured in
*missing named theorems*, each instantiated at many sites, and that is a far smaller number. The
working heuristic: writing the same chain a second time means a theorem has been found; name it.

## 8. What the discipline buys, and what it does not

**Buys.** A machine-checked assertion, quantified over the whole development, that antisymmetry
is nowhere assumed — by 2.1, precisely what an axiom trace free of `propext` states. For a corpus
whose central claim is that its structures are weaker than posets, this is that claim, verified
rather than asserted.

**Does not buy.** Residue, proof relevance, or non-degenerate laxness. By 3.3 those are blocked
by definitional thinness, and by 4.2 the blockage is independent of the axiom budget. They
require `Type`-valued hom-objects, which is a modelling decision taken at definition time.

The two programmes are distinct and should not be conflated. Retiring `propext` is a statement
about what the development *assumes*; moving off `Prop` is a statement about what it can
*express*. A development can complete the first and remain entirely unable to state the theorems
the second exists to make available.

---

## Provenance

This note distils a Claude Code session of 2026-08-17 in the `emsenn/info` repository.
Propositions 3.1 and 3.2, Proposition 2.1's statement, and the axiom behaviour described in §5.1
were verified in Lean 4.31 against the corpus's toolchain. Propositions 4.1–4.3 and §6 are
pen-and-paper and have not been formalised; §6 in particular states a caution about a
construction pattern rather than a theorem about any existing corpus declaration. The correction
recorded in §4 is to a claim first made, and stated too weakly, within that same session.
