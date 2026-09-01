import Obsmetrologia.Calculus.Order.NumberTheoryCombinatorics
import Obsmetrologia.Calculus.Order.SetNumberGraphTheory

/-!
# Factorization — the categorical primitive and its arithmetic projection

This module formalizes the corpus node **factorization** (read at
`content/_archive/library/science/mathematics/_archive/from-discourse-domain-locus-math/factorization/factorization.md`):

> "Factorization is breaking a process into steps. … In category theory, a morphism
> `f : A → C` factors through `B` when there exist morphisms `g : A → B` and `h : B → C`
> such that `f = h ∘ g`. … In arithmetic, factoring 12 gives 2 × 2 × 3 — the number
> broken into pieces that multiply to rebuild it."

The node `requires: [morphism, composition]` and `defines: factors-through`. It carries
**both faces** of one idea: the categorical primitive `factors-through` (a process passes
through a waypoint) and its **arithmetic projection** (a number breaks into a product). We
formalize each.

## (A) The categorical face — `factors-through` and the image factorization system

`FactorsThrough f B := ∃ g h, f = h ∘ g` is the corpus definition transcribed to Lean
functions. Its canonical instance is the **image / epi–mono factorization system**: every
function `f : A → B` factors as a *surjection onto its image* followed by an *injection*.
We model the image concretely as the subtype `{ b // ∃ a, f a = b }`, corestrict `f` to it
(the epi `e`), and include it back (the mono `ι`); then `f = ι ∘ e`, `e` is surjective, and
`ι` is injective. This is the waypoint `B` "doing real work" that the node describes.

## (B) The arithmetic face — the Fundamental Theorem of Arithmetic

A **prime factorization** of `n` is a `List Nat` of primes whose product is `n`
(`IsPrimeFactorization`). We prove the FTA in both halves:

* **Existence** (`prime_factorization_exists`): every `n ≥ 2` is a product of primes, by
  strong induction (`Nat.strongRecOn`). If `n` has no proper divisor `≥ 2` it is itself
  prime (`[n]`); otherwise split off such a divisor and recurse on both pieces, appending.
* **Uniqueness** (`prime_factorization_unique`): any two prime factorizations of the same
  `n` are **permutations** of each other (`List.Perm`). Proven by induction on the first
  list using **Euclid's lemma** (`Prime.euclid`, from `NumberTheoryCombinatorics`): the head
  prime divides the product = the other list's product, so it divides — hence equals — some
  prime there; erase that matching prime from the second list and recurse on the cancelled
  products. This is an up-to-order uniqueness statement (full `List.Perm`), not a
  sorted-normal-form substitute.

`Prime`, `Dvd`, and `Prime.euclid` are reused verbatim from `Obsmetrologia.NumberTheory`; the
`Nat`/`List`/`Set` machinery from `Obsmetrologia.SetNumberGraphTheory` and Lean core.
-/

namespace Obsmetrologia
namespace Factorization

open Obsmetrologia.NumberTheory (Prime Dvd dvd_iff)

/-! # =====================================================================
    # (A) The categorical primitive: `factors-through`
    # ===================================================================== -/

/-- **Factorization, the categorical primitive** (`factorization.md`). A morphism
`f : A → C` *factors through* `B` when there exist `g : A → B` and `h : B → C` with
`f = h ∘ g` — the process `A → C` decomposes into `A → B` followed by `B → C`, passing
through the waypoint `B`. Here morphisms are functions and composition is `∘`. -/
def FactorsThrough {A C : Type} (f : A → C) (B : Type) : Prop :=
  ∃ (g : A → B) (h : B → C), f = h ∘ g

/-- Factoring through the **codomain itself is trivial** (`f = id ∘ f`): every process
passes through its own result. The content of the node is when the waypoint is a *smaller*
intermediate, as in the image factorization below. -/
theorem factorsThrough_self {A C : Type} (f : A → C) : FactorsThrough f C :=
  ⟨f, id, rfl⟩

/-- **Composition factors through its midpoint.** A composite `h ∘ g : A → C` factors
through the intermediate `B` it is built from — the waypoint is literally present. -/
theorem factorsThrough_comp {A B C : Type} (g : A → B) (h : B → C) :
    FactorsThrough (h ∘ g) B :=
  ⟨g, h, rfl⟩

/-! ## The image / epi–mono factorization system -/

/-- The **image** of `f : A → B`: the subtype of those `b : B` actually hit by `f`,
`{ b // ∃ a, f a = b }`. This is the concrete waypoint of the canonical factorization. -/
def Image {A B : Type} (f : A → B) : Type := { b : B // ∃ a, f a = b }

/-- The **corestriction** `e : A → Image f`, sending `a` to `f a` (witnessed by `a`
itself). This is the surjective (epi) half. -/
def corestrict {A B : Type} (f : A → B) (a : A) : Image f := ⟨f a, a, rfl⟩

/-- The **inclusion** `ι : Image f → B`, forgetting the witness. This is the injective
(mono) half. -/
def incl {A B : Type} (f : A → B) (b : Image f) : B := b.val

/-- **The factorization equation.** `f = ι ∘ e`: the function equals its inclusion-of-the
-corestriction. The image is a genuine waypoint `f` passes through. -/
theorem image_factor {A B : Type} (f : A → B) : f = incl f ∘ corestrict f := rfl

/-- The corestriction is **surjective** (an epimorphism): every element of the image is
hit, because it carries a witness `a` with `f a = b`. -/
theorem corestrict_surjective {A B : Type} (f : A → B) :
    ∀ b : Image f, ∃ a, corestrict f a = b := by
  intro b
  obtain ⟨bv, a, ha⟩ := b
  exact ⟨a, Subtype.ext ha⟩

/-- The inclusion is **injective** (a monomorphism): two image points with the same
underlying value are equal (subtype extensionality). -/
theorem incl_injective {A B : Type} (f : A → B) :
    ∀ {b₁ b₂ : Image f}, incl f b₁ = incl f b₂ → b₁ = b₂ := by
  intro b₁ b₂ h
  exact Subtype.ext h

/-! # =====================================================================
    # (B) The arithmetic projection: prime factorization
    # ===================================================================== -/

/-- A **prime factorization** of `n`: a `List Nat` all of whose entries are prime and whose
product is `n` (`factorization.md`: "factoring 12 gives 2 × 2 × 3 — pieces that multiply to
rebuild it"). `List.prod` over `Nat` multiplies with `1` for the empty list. -/
def IsPrimeFactorization (l : List Nat) (n : Nat) : Prop :=
  (∀ p ∈ l, Prime p) ∧ l.prod = n

/-! ## Existence by strong induction -/

/-- A proper divisor `d` (`2 ≤ d < n`, `d ∣ n`) cofactors with another proper divisor:
`n = d * c` with `2 ≤ c < n`. The arithmetic split that drives the existence recursion. -/
theorem cofactor_of_proper_dvd {n d : Nat} (hn : 2 ≤ n) (hd2 : 2 ≤ d) (hdn : d < n)
    (hdvd : d ∣ n) : ∃ c, n = d * c ∧ 2 ≤ c ∧ c < n := by
  obtain ⟨c, hc⟩ := hdvd
  refine ⟨c, hc, ?_, ?_⟩
  · -- c ≥ 2: c = 0 forces n = 0; c = 1 forces n = d < n.
    rcases c with _ | _ | c
    · rw [Nat.mul_zero] at hc; omega
    · rw [Nat.mul_one] at hc; omega
    · omega
  · -- c < n: from n = d*c with d ≥ 2, c < d*c = n (using c ≥ 1). `2*c ≤ d*c`, then omega.
    have hc1 : 1 ≤ c := by
      rcases c with _ | c
      · rw [Nat.mul_zero] at hc; omega
      · omega
    have hmul : 2 * c ≤ d * c := Nat.mul_le_mul_right c hd2
    omega

/-- **Existence of a prime factorization** (`prime_factorization_exists`). Every `n ≥ 2` is
a product of primes (`factorization.md`, the arithmetic face). Strong induction on `n`
(`Nat.strongRecOn`): decide whether `n` has a *proper* divisor `d` with `2 ≤ d < n`.

* If **not**, then `n` is prime — any divisor `d` of `n` has `d ≤ n` and, were `d ≠ 1, n`,
  would be a proper divisor `2 ≤ d < n`, contradiction — so `[n]` works.
* If **so**, split `n = d * c` with `2 ≤ d, c < n` (`cofactor_of_proper_dvd`); recurse on
  both `d` and `c` and append the two factor lists. -/
theorem prime_factorization_exists :
    ∀ n, 2 ≤ n → ∃ l, IsPrimeFactorization l n := by
  intro n
  induction n using Nat.strongRecOn with
  | ind n ih =>
    intro hn
    -- Decidable: does n have a proper divisor d, 2 ≤ d < n?
    refine (inferInstance : Decidable (∃ d, d < n ∧ 2 ≤ d ∧ d ∣ n)).byCases ?_ ?_
    · -- composite: split and recurse
      rintro ⟨d, hdn, hd2, hdvd⟩
      obtain ⟨c, hc, hc2, hcn⟩ := cofactor_of_proper_dvd hn hd2 hdn hdvd
      obtain ⟨ld, hld⟩ := ih d hdn hd2
      obtain ⟨lc, hlc⟩ := ih c hcn hc2
      refine ⟨ld ++ lc, ?_, ?_⟩
      · intro p hp
        rcases List.mem_append.mp hp with hp | hp
        · exact hld.1 p hp
        · exact hlc.1 p hp
      · rw [List.prod_append, hld.2, hlc.2, ← hc]
    · -- prime: no proper divisor ⇒ n itself is prime, [n] works
      intro hno
      have hprime : Prime n := by
        refine ⟨hn, ?_⟩
        intro dd hdd
        -- dd ∣ n (our Dvd ⇒ core ∣); dd ≤ n; if dd ≠ 1, n then 2 ≤ dd < n, contradiction.
        have hdvd : dd ∣ n := (dvd_iff dd n).mp hdd
        have hdle : dd ≤ n := Nat.le_of_dvd (by omega) hdvd
        refine (inferInstance : Decidable (dd = 1)).byCases (fun h => Or.inl h) ?_
        intro hne1
        refine (inferInstance : Decidable (dd = n)).byCases (fun h => Or.inr h) ?_
        intro hnen
        -- dd ≠ 0 (0 ∤ n since n ≥ 2): if dd = 0 then n = 0.
        have hd0 : dd ≠ 0 := by
          intro h; rw [h] at hdvd; obtain ⟨c, hc⟩ := hdvd; rw [Nat.zero_mul] at hc; omega
        exact absurd ⟨dd, by omega, by omega, hdvd⟩ hno
      exact ⟨[n], by intro p hp; rw [List.mem_singleton.mp hp]; exact hprime,
             by show n * 1 = n; rw [Nat.mul_one]⟩

/-! ## Uniqueness up to permutation, via Euclid's lemma -/

/-- **Product is invariant under permutation.** Reordering a list of `Nat`s does not change
its product (`Nat` multiplication is commutative and associative). Proven by induction on
the `List.Perm` derivation. Needed by `prime_factorization_unique` to cancel along the
erase-permutation. -/
theorem perm_prod : ∀ {l₁ l₂ : List Nat}, l₁.Perm l₂ → l₁.prod = l₂.prod := by
  intro l₁ l₂ h
  induction h with
  | nil => rfl
  | cons a _ ih => rw [List.prod_cons, List.prod_cons, ih]
  | swap a b l =>
    rw [List.prod_cons, List.prod_cons, List.prod_cons, List.prod_cons,
        ← Nat.mul_assoc, ← Nat.mul_assoc, Nat.mul_comm a b]
  | trans _ _ ih1 ih2 => rw [ih1, ih2]

/-- A prime dividing the **product of a list of primes** divides — hence equals — one of
them. The list-level form of Euclid's lemma: `Prime.euclid` says a prime in `a · (rest.prod)`
divides the head or the rest; recursing on the rest pins it to a single equal prime. (Each
list entry is prime, so "divides a prime" collapses to "equals it" via `only_divisors`.) -/
theorem prime_dvd_prod_eq {p : Nat} (hp : Prime p) :
    ∀ {l : List Nat}, (∀ q ∈ l, Prime q) → Dvd p l.prod → ∃ q ∈ l, p = q := by
  intro l
  induction l with
  | nil =>
    intro _ hdvd
    -- p ∣ 1 ⇒ p ≤ 1, contradicting p ≥ 2.
    exfalso
    have hp1 : p ∣ (1 : Nat) := (dvd_iff p 1).mp (by simpa using hdvd)
    have hle := Nat.le_of_dvd Nat.one_pos hp1
    have := hp.two_le
    omega
  | cons a l ih =>
    intro hprimes hdvd
    -- p ∣ a * l.prod ⇒ p ∣ a ∨ p ∣ l.prod (Euclid).
    have hsplit : Dvd p a ∨ Dvd p l.prod := by
      have hd : Dvd p (a * l.prod) := by
        have : (a :: l).prod = a * l.prod := List.prod_cons
        rw [this] at hdvd; exact hdvd
      exact hp.euclid hd
    rcases hsplit with hda | hdl
    · -- p ∣ a, a prime ⇒ p = a (p ≠ 1 since p ≥ 2; only divisors of a are 1, a).
      have ha : Prime a := hprimes a (List.mem_cons_self ..)
      rcases ha.only_divisors p hda with h1 | hpa
      · exact absurd h1 (by have := hp.two_le; omega)
      · exact ⟨a, List.mem_cons_self .., hpa⟩
    · -- p ∣ rest.prod: recurse.
      obtain ⟨q, hq, hpq⟩ := ih (fun q hq => hprimes q (List.mem_cons_of_mem _ hq)) hdl
      exact ⟨q, List.mem_cons_of_mem _ hq, hpq⟩

/-- **Cancellation.** A prime `p` is `≥ 2`, so it is nonzero and can be cancelled from a
product equation `p * x = p * y ⇒ x = y`. -/
theorem prime_mul_cancel {p x y : Nat} (hp : Prime p) (h : p * x = p * y) : x = y :=
  Nat.eq_of_mul_eq_mul_left (by have := hp.two_le; omega) h

/-- **`a ∈ l ⇒ l ~ a :: l.erase a`**, the erase-permutation, proven Classical-free (core's
`List.perm_cons_erase` pulls `Classical.choice`, which the no-free-data law forbids). By
induction on `l`, splitting on the *decidable* head equality `b = a`
(`Decidable.byCases`, not excluded middle). -/
theorem perm_cons_erase : ∀ {a : Nat} {l : List Nat}, a ∈ l → l.Perm (a :: l.erase a) := by
  intro a l h
  induction l with
  | nil => exact absurd h List.not_mem_nil
  | cons b l ih =>
    refine (inferInstance : Decidable (b = a)).byCases ?_ ?_
    · intro hba; subst hba; rw [List.erase_cons_head]
    · intro hba
      have hmem : a ∈ l := by
        rcases List.mem_cons.mp h with h' | h'
        · exact absurd h'.symm hba
        · exact h'
      have hbne : ¬ (b == a) = true := by simp [beq_iff_eq, hba]
      rw [List.erase_cons_tail hbne]
      exact (List.Perm.cons b (ih hmem)).trans (List.Perm.swap a b (l.erase a))

/-- **Uniqueness of prime factorization, up to order** (`prime_factorization_unique`). Any
two prime factorizations of the same `n` are **permutations** of each other (`List.Perm`).

Induction on the first list `l₁`:
* `[]`: both products are `1`; the second list of primes can have no entry (each `≥ 2`
  would make the product `≥ 2`), so it too is `[]`.
* `p :: l₁`: `p` divides `n = l₂.prod`, so by `prime_dvd_prod_eq` it **equals** some prime
  `p ∈ l₂`. Erase that occurrence; cancel `p` from the product equation
  (`prime_mul_cancel`) to get matching products of the shortened lists; recurse to a `Perm`
  of `l₁` with `l₂.erase p`, then re-insert `p` (`List.perm_cons_erase`). -/
theorem prime_factorization_unique :
    ∀ {l₁ l₂ : List Nat} {n : Nat},
      IsPrimeFactorization l₁ n → IsPrimeFactorization l₂ n → l₁.Perm l₂ := by
  intro l₁
  induction l₁ with
  | nil =>
    intro l₂ n h1 h2
    -- l₁ = [] ⇒ n = 1 ⇒ l₂ = [].
    have hn : n = 1 := by have := h1.2; simpa using this.symm
    have hl2 : l₂ = [] := by
      cases l₂ with
      | nil => rfl
      | cons a l =>
        exfalso
        have ha : Prime a := h2.1 a (List.mem_cons_self ..)
        have hprod : (a :: l).prod = n := h2.2
        rw [List.prod_cons, hn] at hprod
        -- a * l.prod = 1 ⇒ a = 1, contradicting a ≥ 2.
        have : a ∣ (1 : Nat) := ⟨l.prod, hprod.symm⟩
        have := Nat.le_of_dvd Nat.one_pos this
        have := ha.two_le; omega
    rw [hl2]
  | cons p l₁ ih =>
    intro l₂ n h1 h2
    have hp : Prime p := h1.1 p (List.mem_cons_self ..)
    -- p ∣ n = l₂.prod, and l₂ is all primes, so p = some entry of l₂.
    have hpn : Dvd p l₂.prod := by
      have hprod : (p :: l₁).prod = n := h1.2
      rw [List.prod_cons] at hprod
      have hl2 : l₂.prod = n := h2.2
      refine ⟨l₁.prod, ?_⟩
      rw [hl2, ← hprod]
    obtain ⟨q, hq, hpq⟩ := prime_dvd_prod_eq hp h2.1 hpn
    subst hpq
    -- erase one occurrence of p from l₂; products: p * l₁.prod = p * (l₂.erase p).prod.
    have hperm2 : l₂.Perm (p :: l₂.erase p) := perm_cons_erase hq
    have hprodl2 : l₂.prod = p * (l₂.erase p).prod := by
      have := hperm2
      -- products are equal along a Perm (proved below as perm_prod), inlined:
      have hpe : l₂.prod = (p :: l₂.erase p).prod := perm_prod hperm2
      rw [hpe, List.prod_cons]
    -- now cancel p.
    have heq : p * l₁.prod = p * (l₂.erase p).prod := by
      have e1 : (p :: l₁).prod = n := h1.2
      rw [List.prod_cons] at e1
      have e2 : l₂.prod = n := h2.2
      rw [hprodl2] at e2
      rw [e1, e2]
    have hcancel : l₁.prod = (l₂.erase p).prod := prime_mul_cancel hp heq
    -- recurse: l₁ and l₂.erase p are both prime-factorizations of l₁.prod.
    have hfac1 : IsPrimeFactorization l₁ l₁.prod :=
      ⟨fun r hr => h1.1 r (List.mem_cons_of_mem _ hr), rfl⟩
    have hfac2 : IsPrimeFactorization (l₂.erase p) l₁.prod :=
      ⟨fun r hr => h2.1 r (List.mem_of_mem_erase hr), hcancel.symm⟩
    have hrec : l₁.Perm (l₂.erase p) := ih hfac1 hfac2
    -- p :: l₁  ~  p :: (l₂.erase p)  ~  l₂.
    exact (hrec.cons p).trans hperm2.symm

/-! # =====================================================================
    # Theorems
    # ===================================================================== -/

/-- **`factorization_system`.** The image / epi–mono factorization system: every
function `f : A → B` factors as a **surjection onto its image** followed by an
**injection** (`factorization.md`, the categorical face). Bundles:

* `FactorsThrough f (Image f)` — `f` factors through its image (the waypoint);
* the explicit equation `f = ι ∘ e`;
* the **epi** half: the corestriction `e` is surjective onto the image;
* the **mono** half: the inclusion `ι` is injective.

This realizes the node's "the intermediate is doing real work — a necessary waypoint": the
image is exactly the part of `B` the process passes through. -/
theorem factorization_system {A B : Type} (f : A → B) :
    FactorsThrough f (Image f) ∧
    f = incl f ∘ corestrict f ∧
    (∀ b : Image f, ∃ a, corestrict f a = b) ∧
    (∀ {b₁ b₂ : Image f}, incl f b₁ = incl f b₂ → b₁ = b₂) :=
  ⟨⟨corestrict f, incl f, image_factor f⟩,
   image_factor f,
   corestrict_surjective f,
   incl_injective f⟩

/-- **`fundamental_theorem_of_arithmetic`.** The arithmetic face of factorization
(`factorization.md`: "factoring 12 gives 2 × 2 × 3"). The Fundamental Theorem of
Arithmetic, both halves:

* **Existence** — every `n ≥ 2` is a product of primes;
* **Uniqueness** — any two prime factorizations of the same `n` are permutations of each
  other (an up-to-order uniqueness, via Euclid's lemma `Prime.euclid`).

Together: the prime factorization of a number exists and is unique up to the order of the
factors. -/
theorem fundamental_theorem_of_arithmetic :
    (∀ n, 2 ≤ n → ∃ l, IsPrimeFactorization l n) ∧
    (∀ {l₁ l₂ : List Nat} {n : Nat},
      IsPrimeFactorization l₁ n → IsPrimeFactorization l₂ n → l₁.Perm l₂) :=
  ⟨prime_factorization_exists, @prime_factorization_unique⟩

/-! ## The divisor shroud — primality as the acyclic case

The **shroud** of `n` is its nontrivial divisors, those strictly between `1` and
`n`. It plays for divisibility the role the cover-nerve cycle set plays for
coordination: `n` is prime exactly when its shroud is empty
(`prime_iff_shroud_empty`) — the acyclic case, only the trivial factorization `1·n`,
nothing to precipitate further. A composite's shroud is inhabited: it carries a
load-bearing factorization the way a nonzero `Ȟ¹` carries a load-bearing cycle. A
prime is the residue that does not settle into a product — the un-factorable atom
left when everything composite has precipitated out. -/

/-- The **divisor shroud** of `n`: its nontrivial divisors, strictly between `1` and
`n`. Empty exactly for primes (and `0`, `1`). -/
def divisorShroud (n : Nat) : List Nat :=
  (List.range n).filter (fun d => decide (2 ≤ d) && decide (d < n) && decide (n % d = 0))

/-- Membership in the shroud is a nontrivial divisor. -/
theorem mem_divisorShroud (n d : Nat) :
    d ∈ divisorShroud n ↔ (2 ≤ d ∧ d < n ∧ n % d = 0) := by
  unfold divisorShroud
  rw [List.mem_filter, List.mem_range]
  constructor
  · rintro ⟨hlt, hb⟩
    rw [Bool.and_eq_true, Bool.and_eq_true] at hb
    exact ⟨of_decide_eq_true hb.1.1, of_decide_eq_true hb.1.2, of_decide_eq_true hb.2⟩
  · rintro ⟨h2, hlt, hmod⟩
    refine ⟨hlt, ?_⟩
    rw [Bool.and_eq_true, Bool.and_eq_true]
    exact ⟨⟨decide_eq_true h2, decide_eq_true hlt⟩, decide_eq_true hmod⟩

/-- **A number is prime exactly when its divisor shroud is empty.** Primality is the
acyclic case of divisibility: no nontrivial divisor, only the trivial factorization
`1·n`. The prime is the un-precipitated atom — the divisibility-lattice analogue of a
forest, carrying no factorization cycle to settle. -/
theorem prime_iff_shroud_empty (n : Nat) (hn : 2 ≤ n) :
    Prime n ↔ ∀ d, ¬ d ∈ divisorShroud n := by
  constructor
  · intro hp d hd
    rw [mem_divisorShroud] at hd
    obtain ⟨h2, hlt, hmod⟩ := hd
    rcases hp.only_divisors d ((dvd_iff d n).mpr (Nat.dvd_of_mod_eq_zero hmod)) with h | h <;>
      omega
  · intro hempty
    refine ⟨hn, fun d hd => ?_⟩
    have hdn : d ∣ n := (dvd_iff d n).mp hd
    have hmod : n % d = 0 := Nat.mod_eq_zero_of_dvd hdn
    have hdle : d ≤ n := Nat.le_of_dvd (by omega) hdn
    have hd0 : d ≠ 0 := by rintro rfl; simp at hmod; omega
    rcases Nat.lt_or_ge d 2 with hlo | h2
    · exact Or.inl (by omega)
    · rcases Nat.lt_or_ge d n with hlt | hge
      · exact absurd ((mem_divisorShroud n d).mpr ⟨h2, hlt, hmod⟩) (hempty d)
      · exact Or.inr (Nat.le_antisymm hdle hge)

/-- **The prime `7` has an empty shroud.** Concrete witness of the acyclic case. -/
theorem shroud_seven_empty : divisorShroud 7 = [] := by decide

/-- **The composite `6` carries a load-bearing shroud** — its nontrivial divisors
`2` and `3`, the factorization cycle a prime lacks. -/
theorem shroud_six_load_bearing : divisorShroud 6 = [2, 3] := by decide

end Factorization
end Obsmetrologia
