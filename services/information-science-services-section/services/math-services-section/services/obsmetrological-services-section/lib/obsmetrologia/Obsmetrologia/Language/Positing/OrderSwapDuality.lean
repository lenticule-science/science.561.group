import Obsmetrologia.Language.Positing.Four

/-!
# Order-swap duality — σ transports knowledge theory to truth theory

`Settling` generated the **knowledge** order `≤ₖ` and `TruthOrder` the **truth**
order `≤ₜ` on the *same* four readings. `Four` exhibited the Klein-four symmetry
`⟨~, −⟩`, whose elements each preserve one order and reverse the other. There is a
fifth symmetry of FOUR that neither group element is: the **order-swap involution**
`σ`, which does not preserve either lattice individually — it **exchanges** the two
orders.

In the corpus (`pre-bilattice/.../two-orders-duality`, `truth-order-closure`), `σ`
is the involution

    σ : ⊥ₖ ↔ f,   t ↔ ⊤ₖ

i.e. `σ(⊥ₖ)=f, σ(f)=⊥ₖ, σ(t)=⊤ₖ, σ(⊤ₖ)=t`. In slot coordinates this is
`σ⟨a,b⟩ = ⟨a, ¬b⟩` (keep the positive slot, flip the negative one) — **distinct**
from negation `∼⟨a,b⟩ = ⟨b,a⟩`, which swaps `t ↔ f`. `σ` is its own kind of map:
it is exactly the bijection that carries the `≤ₖ`-Hasse diagram onto the `≤ₜ`-Hasse
diagram.

This module proves:

1. **`σ` is involutive** — `σ(σ c) = c`.
2. **`σ` is an order-iso `(Reading,≤ₖ) ≅ (Reading,≤ₜ)`** — `KLE a b ↔ TLE (σ a) (σ b)`
   (and the inverse direction `TLE a b ↔ KLE (σ a) (σ b)`). So `σ` carries the
   knowledge order to the truth order and back; the two bounded lattices are
   isomorphic posets.
3. **`σ` is a lattice homomorphism across the orders**: `σ(joinK a b) = joinT (σ a) (σ b)`
   and `σ(meetK a b) = meetT (σ a) (σ b)` (and the converses) — the `TruthOrder`
   module's `joinT`/`meetT` are literally the `σ`-images of `joinK`/`meetK`.
4. **The transport meta-lemma** (the connective tissue): given *hypotheses* that
   `j : Reading→Reading` is inflationary / monotone / idempotent in the **knowledge**
   order — NOT importing `Settling.Closure` — the conjugate `σ ∘ j ∘ σ` is
   inflationary / monotone / idempotent in the **truth** order. Hence every
   `≤ₖ`-closure σ-conjugates to a `≤ₜ`-closure (and, by `σ`-involutivity, conversely).
   Truth-order closure theory need not be re-proved; it is `σ`-transported from
   knowledge theory. The packaged `Settling.Closure → TruthOrder.TClosure` functor is
   given as a corollary that *uses* the hypotheses' instances.
-/

namespace Obsmetrologia
namespace Reading

/-! ## The order-swap involution σ -/

/-- The **order-swap involution** `σ : Reading → Reading`. In slot coordinates
`σ⟨a,b⟩ = ⟨a, ¬b⟩`: keep the positive (evidence-for) slot, flip the negative
(evidence-against) slot. This is the bijection that swaps the extremes of the two
orders, `⊥ₖ ↔ f` and `t ↔ ⊤ₖ`.

Distinct from negation `negate ⟨a,b⟩ = ⟨b,a⟩` (which swaps `t ↔ f`) and from
conflation `conflate ⟨a,b⟩ = ⟨¬b,¬a⟩` (which swaps `⊥ₖ ↔ ⊤ₖ`): `σ` is the one
symmetry of FOUR that belongs to *neither* order's automorphism group, because it
exchanges the orders. -/
def swap (a : Reading) : Reading := ofSlots a.pos (!a.neg)

@[simp] theorem swap_pos (a : Reading) : (swap a).pos = a.pos := by
  simp [swap]
@[simp] theorem swap_neg (a : Reading) : (swap a).neg = !a.neg := by
  simp [swap]

/-! ### The action of σ on the four readings (the table σ : ⊥ₖ↔f, t↔⊤ₖ) -/

@[simp] theorem swap_kBot : swap kBot = tBot := rfl
@[simp] theorem swap_tBot : swap tBot = kBot := rfl
@[simp] theorem swap_tTop : swap tTop = kTop := rfl
@[simp] theorem swap_kTop : swap kTop = tTop := rfl

/-- The order-swap table, all four together. -/
theorem swap_table :
    swap kBot = tBot ∧ swap tBot = kBot ∧ swap tTop = kTop ∧ swap kTop = tTop :=
  ⟨rfl, rfl, rfl, rfl⟩

/-! ### (1) σ is involutive -/

/-- **`σ` is an involution**: `σ(σ c) = c`. The order-swap is its own inverse, so it
is a duality, not a one-way collapse. -/
@[simp] theorem swap_swap (a : Reading) : swap (swap a) = a := by cases a <;> rfl

/-- `σ` is distinct from each Klein-four element: it agrees with none of
`negate`, `conflate`, `negConf` on all of FOUR (witnessed at `⊥ₖ`). -/
theorem swap_ne_negate : swap kBot ≠ negate kBot := by decide
theorem swap_ne_conflate : swap kBot ≠ conflate kBot := by decide
theorem swap_ne_negConf : swap kBot ≠ negConf kBot := by decide
theorem swap_ne_id : swap kBot ≠ kBot := by decide

/-! ## (2) σ is an order-iso (Reading,≤ₖ) ≅ (Reading,≤ₜ) -/

/-- **`σ` carries `≤ₖ` to `≤ₜ`.** `KLE a b ↔ TLE (σ a) (σ b)`: the order-swap is an
order-isomorphism from the knowledge order to the truth order. Proven by
cases-exhaustion then `decide` on the Boolean `leK`/`leT`. -/
theorem swap_kle_tle (a b : Reading) : KLE a b ↔ TLE (swap a) (swap b) := by
  cases a <;> cases b <;> decide

/-- **`σ` carries `≤ₜ` to `≤ₖ`.** `TLE a b ↔ KLE (σ a) (σ b)` — the inverse
direction. Together with `swap_kle_tle` this is the full poset isomorphism
`(Reading,≤ₖ) ≅ (Reading,≤ₜ)`. -/
theorem swap_tle_kle (a b : Reading) : TLE a b ↔ KLE (swap a) (swap b) := by
  cases a <;> cases b <;> decide

/-- The same fact stated on the swapped arguments: `≤ₜ` of `σ`-images is exactly
`≤ₖ` of the originals. -/
theorem tle_swap_iff (a b : Reading) : TLE (swap a) (swap b) ↔ KLE a b :=
  (swap_kle_tle a b).symm

/-- `σ` maps the knowledge-bottom/top to the truth-bottom/top: the bounds transport. -/
theorem swap_bounds : swap kBot = tBot ∧ swap kTop = tTop := ⟨rfl, rfl⟩

/-! ## (3) σ is a cross-order lattice homomorphism

The `TruthOrder` operations `joinT`/`meetT` are literally the `σ`-images of the
`Settling`/`Positing` operations `joinK`/`meetK`. -/

/-- **`σ(a ∨ₖ b) = (σ a) ∨ₜ (σ b)`** — `σ` carries the knowledge-join to the
truth-join. So `joinT` *is* `σ`-conjugated `joinK`. -/
theorem swap_joinK (a b : Reading) : swap (joinK a b) = joinT (swap a) (swap b) := by
  cases a <;> cases b <;> rfl

/-- **`σ(a ∧ₖ b) = (σ a) ∧ₜ (σ b)`** — `σ` carries the knowledge-meet to the
truth-meet. -/
theorem swap_meetK (a b : Reading) : swap (meetK a b) = meetT (swap a) (swap b) := by
  cases a <;> cases b <;> rfl

/-- The converse identity: `σ(a ∨ₜ b) = (σ a) ∨ₖ (σ b)`. By `σ`-involutivity the
homomorphism runs both ways — the two bounded lattices are `σ`-conjugate. -/
theorem swap_joinT (a b : Reading) : swap (joinT a b) = joinK (swap a) (swap b) := by
  cases a <;> cases b <;> rfl

/-- The converse meet identity: `σ(a ∧ₜ b) = (σ a) ∧ₖ (σ b)`. -/
theorem swap_meetT (a b : Reading) : swap (meetT a b) = meetK (swap a) (swap b) := by
  cases a <;> cases b <;> rfl

/-- Stated as the matching identity the spec names: `joinT a b = σ (joinK (σ a) (σ b))`,
i.e. truth-join is the `σ`-conjugate of knowledge-join (the form used to *transport*
a `joinK` fact to a `joinT` fact). -/
theorem joinT_eq_conj (a b : Reading) : joinT a b = swap (joinK (swap a) (swap b)) := by
  cases a <;> cases b <;> rfl

theorem meetT_eq_conj (a b : Reading) : meetT a b = swap (meetK (swap a) (swap b)) := by
  cases a <;> cases b <;> rfl

/-! ## (4) The transport meta-lemma — every ≤ₖ-closure σ-conjugates to a ≤ₜ-closure

These take the three closure properties as **hypotheses** in the knowledge order and
conclude them in the truth order for the conjugate `σ ∘ j ∘ σ`. No `Settling.Closure`
is imported here: this is the pure transport principle. -/

/-- The `σ`-conjugate of an endomap: `conj j := σ ∘ j ∘ σ`. -/
def conj (j : Reading → Reading) : Reading → Reading := fun a => swap (j (swap a))

/-- `conj` is involutive on endomaps: `conj (conj j) = j`. -/
theorem conj_conj (j : Reading → Reading) : conj (conj j) = j := by
  funext a; simp [conj, swap_swap]

/-- **Transport of inflation.** If `j` is `≤ₖ`-inflationary (`∀ a, KLE a (j a)`) then
its conjugate `σ∘j∘σ` is `≤ₜ`-inflationary. Apply `σ` to the knowledge inflation at
`σ a` and read it back through the order-iso. -/
theorem conj_infl (j : Reading → Reading)
    (hj : ∀ a, KLE a (j a)) : ∀ a, TLE a (conj j a) := by
  intro a
  -- knowledge inflation at the point σ a:  KLE (σ a) (j (σ a))
  have hk : KLE (swap a) (j (swap a)) := hj (swap a)
  -- transport via the order-iso:  TLE (σ(σ a)) (σ (j (σ a)))
  have ht : TLE (swap (swap a)) (swap (j (swap a))) := (swap_kle_tle _ _).1 hk
  -- σ(σ a) = a and σ (j (σ a)) = conj j a
  simpa [conj, swap_swap] using ht

/-- **Transport of monotonicity.** If `j` is `≤ₖ`-monotone then `σ∘j∘σ` is
`≤ₜ`-monotone. A `≤ₜ`-step `TLE a b` becomes a `≤ₖ`-step under `σ`, `j` preserves it,
and `σ` carries it back to a `≤ₜ`-step. -/
theorem conj_mono (j : Reading → Reading)
    (hj : ∀ a b, KLE a b → KLE (j a) (j b)) :
    ∀ a b, TLE a b → TLE (conj j a) (conj j b) := by
  intro a b hab
  -- TLE a b  ⇒  KLE (σ a) (σ b)
  have hk : KLE (swap a) (swap b) := (swap_tle_kle a b).1 hab
  -- j preserves it
  have hjk : KLE (j (swap a)) (j (swap b)) := hj _ _ hk
  -- carry back to ≤ₜ via the iso
  have ht : TLE (swap (j (swap a))) (swap (j (swap b))) := (swap_kle_tle _ _).1 hjk
  simpa [conj] using ht

/-- **Transport of idempotence.** If `j` is idempotent (`∀ a, j (j a) = j a`) then so
is `σ∘j∘σ`. Purely equational: the inner `σ∘σ` cancels. -/
theorem conj_idem (j : Reading → Reading)
    (hj : ∀ a, j (j a) = j a) : ∀ a, conj j (conj j a) = conj j a := by
  intro a
  simp only [conj, swap_swap, hj]

/-! ### Packaged: the closure-transport functor

Using the three transport lemmas, an actual `Settling.Closure` (knowledge order)
yields a `TruthOrder.TClosure` (truth order). The reverse functor follows by
`σ`-involutivity. This is where the meta-lemma meets the already-built structures —
`TruthOrder.TClosure` need not re-prove anything. -/

/-- Every `≤ₖ`-closure `c` σ-conjugates to a `≤ₜ`-closure. Its `op` is `σ ∘ c.op ∘ σ`,
and the three fields are exactly the transport lemmas applied to `c`'s fields. -/
def Closure.toTClosure (c : Closure) : TClosure where
  op := conj c.op
  infl := conj_infl c.op c.infl
  mono := conj_mono c.op c.mono
  idem := conj_idem c.op c.idem

/-- Every `≤ₜ`-closure σ-conjugates back to a `≤ₖ`-closure — the reverse transport, by
the same lemmas with the orders swapped. -/
def TClosure.toClosure (c : TClosure) : Closure where
  op := conj c.op
  infl := by
    intro a
    have hk : TLE (swap a) (c.op (swap a)) := c.infl (swap a)
    have ht : KLE (swap (swap a)) (swap (c.op (swap a))) := (swap_tle_kle _ _).1 hk
    simpa [conj, swap_swap] using ht
  mono := by
    intro a b hab
    have hk : TLE (swap a) (swap b) := (swap_kle_tle a b).1 hab
    have hjk : TLE (c.op (swap a)) (c.op (swap b)) := c.mono _ _ hk
    have ht : KLE (swap (c.op (swap a))) (swap (c.op (swap b))) := (swap_tle_kle _ _).1 hjk
    simpa [conj] using ht
  idem := by intro a; simp only [conj, swap_swap, c.idem]

/-- The two transports are mutually inverse on the underlying `op` — the conjugation
is an involution on closures, matching `swap_swap`. -/
theorem toClosure_toTClosure_op (c : Closure) :
    (Closure.toTClosure c).toClosure.op = c.op := by
  show conj (conj c.op) = c.op
  exact conj_conj c.op

/-! ### Worked transport: the canonical join closures correspond

`Settling.joinClosure k` (raise toward `k` by `∨ₖ`) σ-conjugates to
`TruthOrder.joinTClosure (σ k)` (raise toward `σ k` by `∨ₜ`) — the concrete instance
of the meta-lemma, witnessing that the canonical closures of the two orders are
`σ`-images of one another. -/
theorem toTClosure_joinClosure_op (k : Reading) :
    (Closure.toTClosure (joinClosure k)).op = (joinTClosure (swap k)).op := by
  funext a
  show swap (joinK k (swap a)) = joinT (swap k) a
  rw [swap_joinK, swap_swap]

/-- Consequently the `σ`-conjugate of knowledge-settling `⊥ₖ → k` is truth-settling
`f → σ k`: transport carries the settled value `k` to its `σ`-image `σ k`. -/
theorem swap_settle_joinClosure (k : Reading) :
    swap (settle (joinClosure k) kBot) = settleT (joinTClosure (swap k)) tBot := by
  rw [settle_kBot, settleT_tBot]

end Reading
end Obsmetrologia
