/-!
# MeetPay — pay-the-meet between witnesses of one quantity, per site

Specification: the Tidepool protocol, revision 3, section 2.8 (pay-the-meet, per site) and Appendix A.3
(`SiteWitnessV1.meetOf`, `TidepoolTreasuryV1.pullDistributable`).

Pay-the-meet applies to **one quantity reported by two witnesses**: a site's own cycle inflow `T`,
told once by its treasury and once by a relayer or challenger. The treasury may distribute no more than
the *meet* (the lesser) of the two reports; the disagreement, the *held mass*, stays in the treasury
until a settlement releases it. An untold second witness is bottom and the local figure pays in full.
There is no cross-site minimum: two sites' totals are different quantities in different assets and are
never met; the global distributable is the sum of per-site pays.

What this module fixes:

* **Two witnesses** (`pay`, `heldMass`): `pay a b = min a b`, `heldMass a b = max a b - min a b`
  (the subtraction carries `min_le_max`, so it is the absolute difference and never a truncation that
  stands in for a revert). `pay_le_both`, `pay_greatest` (it is the greatest lower bound),
  `held_mass_zero_iff_agree`, `pay_add_mass_eq_max` (paid plus held is the larger report, so nothing is
  lost between the two witnesses).
* **Several challengers** (`payAll`): the local report met with every claim, `claims.foldr min local` (the Lean binder is `own`; `local` is a keyword).
  `payAll_le_each`, `payAll_le_local`, `payAll_greatest`, `payAll_perm` (the order of challengers is
  irrelevant), `untold_pays_local` (no claims: the local figure pays in full), and `payAll_single`
  (one challenger is `pay`).
* **Per site** (`perSiteSum`): a list of `(local, claims)` pairs, one per site, each in its own asset.
  `per_site_sum_le_total` (the global distributable never exceeds the sum of local reports),
  `per_site_sum_cons` / `per_site_sum_append` (it is additive: a site's meet does not depend on any
  other site), and `per_site_held_conserves` (paid plus held, summed over the sites, is the sum of the
  local reports).

Everything is over `Nat`. `min`, `max` and the guarded subtraction never exceed their arguments, so on
`uint256` inputs the realizers (`SiteWitnessV1.meetOf`, `TidepoolTreasuryV1.pullDistributable`) cannot
overflow; only `perSiteSum` adds, and the contracts never form that sum on chain (each site pulls its
own meet in its own asset), so its `uint256` bound is the off-chain reconciler's concern.
-/

namespace Obsmetrologia
namespace Economics
namespace MeetPay

/-! ## Two witnesses of one quantity -/

/-- **The meet.** What two reports of one quantity both support: the lesser. -/
def pay (a b : Nat) : Nat := min a b

/-- **The held mass.** The disagreement of the two reports: the larger less the smaller. The subtraction
is guarded by `min_le_max`, so this is the absolute difference. -/
def heldMass (a b : Nat) : Nat := max a b - min a b

/-- The hypothesis the held-mass subtraction carries. -/
theorem min_le_max' (a b : Nat) : min a b ≤ max a b := by omega

theorem pay_le_left (a b : Nat) : pay a b ≤ a := by unfold pay; omega
theorem pay_le_right (a b : Nat) : pay a b ≤ b := by unfold pay; omega

/-- **The meet is below both reports.** -/
theorem pay_le_both (a b : Nat) : pay a b ≤ a ∧ pay a b ≤ b :=
  ⟨pay_le_left a b, pay_le_right a b⟩

/-- **The meet is the greatest such bound**: anything below both reports is below the meet. -/
theorem pay_greatest (a b x : Nat) (ha : x ≤ a) (hb : x ≤ b) : x ≤ pay a b := by
  unfold pay; omega

theorem pay_comm (a b : Nat) : pay a b = pay b a := by unfold pay; omega

theorem heldMass_comm (a b : Nat) : heldMass a b = heldMass b a := by unfold heldMass; omega

/-- **Agreement holds nothing.** The held mass is zero exactly when the two witnesses agree. -/
theorem held_mass_zero_iff_agree (a b : Nat) : heldMass a b = 0 ↔ a = b := by
  unfold heldMass
  exact ⟨fun h => by omega, fun h => by omega⟩

/-- **Nothing is lost between the witnesses.** Paid plus held is the larger report. -/
theorem pay_add_mass_eq_max (a b : Nat) : pay a b + heldMass a b = max a b := by
  unfold pay heldMass; omega

/-- The held mass is at most the larger report. -/
theorem heldMass_le_max (a b : Nat) : heldMass a b ≤ max a b := by unfold heldMass; omega

/-- Held mass as a distance: the larger report is the smaller plus the held mass. -/
theorem max_eq_pay_add_mass (a b : Nat) : max a b = pay a b + heldMass a b :=
  (pay_add_mass_eq_max a b).symm

/-- An agreeing pair pays in full. -/
theorem pay_self (a : Nat) : pay a a = a := by unfold pay; omega

/-- An untold witness counted as zero would pay nothing; the second witness being untold is bottom and
is *not* that case: see `untold_pays_local`. -/
theorem pay_zero_left (b : Nat) : pay 0 b = 0 := by unfold pay; omega

/-! ## Several challengers -/

/-- **Pay against every challenger.** The local report met with each claim. (The binder is `own` because
`local` is a Lean keyword.) -/
def payAll (own : Nat) (claims : List Nat) : Nat := claims.foldr min own

@[simp] theorem payAll_nil (own : Nat) : payAll own [] = own := rfl
@[simp] theorem payAll_cons (own c : Nat) (cs : List Nat) :
    payAll own (c :: cs) = min c (payAll own cs) := rfl

/-- **An untold second witness pays the local figure in full.** -/
theorem untold_pays_local (own : Nat) : payAll own [] = own := rfl

/-- One challenger is the two-witness meet. -/
theorem payAll_single (own c : Nat) : payAll own [c] = pay own c := by
  simp only [payAll_cons, payAll_nil, pay]; omega

/-- **Never above the local report.** -/
theorem payAll_le_local (own : Nat) (claims : List Nat) : payAll own claims ≤ own := by
  induction claims with
  | nil => exact Nat.le_refl _
  | cons c cs ih => simp only [payAll_cons]; omega

/-- **Below every challenger's claim.** -/
theorem payAll_le_each (own : Nat) (claims : List Nat) (c : Nat) (hc : c ∈ claims) :
    payAll own claims ≤ c := by
  induction claims with
  | nil => exact absurd hc (by simp)
  | cons d ds ih =>
    simp only [payAll_cons]
    rcases List.mem_cons.mp hc with h | h
    · subst h; omega
    · have := ih h; omega

/-- **The greatest such bound**: whatever is below the local report and every claim is below the pay. -/
theorem payAll_greatest (own : Nat) (claims : List Nat) (x : Nat) (hl : x ≤ own)
    (hc : ∀ c ∈ claims, x ≤ c) : x ≤ payAll own claims := by
  induction claims with
  | nil => exact hl
  | cons d ds ih =>
    simp only [payAll_cons]
    have h1 : x ≤ d := hc d (List.mem_cons_self ..)
    have h2 : x ≤ payAll own ds := ih (fun c hc' => hc c (List.mem_cons_of_mem _ hc'))
    omega

/-- Either the local report pays in full or some claim is the pay. -/
theorem payAll_eq_local_or_mem (own : Nat) (claims : List Nat) :
    payAll own claims = own ∨ payAll own claims ∈ claims := by
  induction claims with
  | nil => left; rfl
  | cons d ds ih =>
    simp only [payAll_cons]
    rcases ih with h | h
    · by_cases hd : d ≤ payAll own ds
      · right; rw [Nat.min_eq_left hd]; exact List.mem_cons_self ..
      · left; rw [Nat.min_eq_right (by omega)]; exact h
    · by_cases hd : d ≤ payAll own ds
      · right; rw [Nat.min_eq_left hd]; exact List.mem_cons_self ..
      · right; rw [Nat.min_eq_right (by omega)]; exact List.mem_cons_of_mem _ h

/-- **The order of challengers is irrelevant**: any two orderings pay the same. -/
theorem payAll_perm (own : Nat) {cs ds : List Nat} (h : cs.Perm ds) :
    payAll own cs = payAll own ds := by
  apply Nat.le_antisymm
  · exact payAll_greatest own ds _ (payAll_le_local own cs)
      (fun c hc => payAll_le_each own cs c (h.mem_iff.mpr hc))
  · exact payAll_greatest own cs _ (payAll_le_local own ds)
      (fun c hc => payAll_le_each own ds c (h.mem_iff.mp hc))

/-- Challengers may be told in two batches: the pay of the concatenation. -/
theorem payAll_append (own : Nat) (cs ds : List Nat) :
    payAll own (cs ++ ds) = payAll (payAll own ds) cs := by
  induction cs with
  | nil => rfl
  | cons c cs ih => simp only [List.cons_append, payAll_cons, ih]

/-- **The held mass against the local report**, as the treasury keeps it: the local report less the pay.
The subtraction carries `payAll_le_local`. -/
def heldAll (own : Nat) (claims : List Nat) : Nat := own - payAll own claims

theorem pay_add_heldAll (own : Nat) (claims : List Nat) :
    payAll own claims + heldAll own claims = own := by
  have := payAll_le_local own claims
  unfold heldAll; omega

/-- With no second witness nothing is held. -/
theorem heldAll_nil (own : Nat) : heldAll own [] = 0 := by unfold heldAll; simp

/-! ## Per site -/

/-- **The global distributable**: the sum of per-site pays. A site is its local report with the claims
told against it, in that site's own asset; sites are never met against each other. -/
def perSiteSum (sites : List (Nat × List Nat)) : Nat :=
  (sites.map fun s => payAll s.1 s.2).sum

/-- The sum of the local reports. -/
def localSum (sites : List (Nat × List Nat)) : Nat := (sites.map Prod.fst).sum

/-- The held mass summed over the sites. -/
def heldSum (sites : List (Nat × List Nat)) : Nat :=
  (sites.map fun s => heldAll s.1 s.2).sum

@[simp] theorem per_site_sum_nil : perSiteSum [] = 0 := rfl
@[simp] theorem per_site_sum_cons (s : Nat × List Nat) (ss : List (Nat × List Nat)) :
    perSiteSum (s :: ss) = payAll s.1 s.2 + perSiteSum ss := by
  simp [perSiteSum]

/-- **Additive over sites**: one site's meet does not depend on any other site. -/
theorem per_site_sum_append (xs ys : List (Nat × List Nat)) :
    perSiteSum (xs ++ ys) = perSiteSum xs + perSiteSum ys := by
  simp [perSiteSum, List.sum_append]

/-- **The global distributable never exceeds the sum of local reports.** -/
theorem per_site_sum_le_total (sites : List (Nat × List Nat)) :
    perSiteSum sites ≤ localSum sites := by
  induction sites with
  | nil => exact Nat.le_refl _
  | cons s ss ih =>
    have h := payAll_le_local s.1 s.2
    simp only [per_site_sum_cons, localSum, List.map_cons, List.sum_cons] at ih ⊢
    omega

/-- **Paid plus held, over the sites, is the sum of the local reports.** -/
theorem per_site_held_conserves (sites : List (Nat × List Nat)) :
    perSiteSum sites + heldSum sites = localSum sites := by
  induction sites with
  | nil => rfl
  | cons s ss ih =>
    have h := pay_add_heldAll s.1 s.2
    simp only [per_site_sum_cons, heldSum, localSum, List.map_cons, List.sum_cons] at ih ⊢
    omega

/-- With every second witness untold, every site pays in full. -/
theorem per_site_sum_untold (ls : List Nat) :
    perSiteSum (ls.map fun l => (l, ([] : List Nat))) = ls.sum := by
  induction ls with
  | nil => rfl
  | cons l ls ih => simp [per_site_sum_cons, ih]

/-! ## House cases -/

example : pay 10 7 = 7 := by decide
example : heldMass 10 7 = 3 := by decide
example : heldMass 7 10 = 3 := by decide
example : pay 7 7 + heldMass 7 7 = 7 := by decide
example : payAll 10 [] = 10 := by decide
example : payAll 10 [7, 12, 3] = 3 := by decide
example : payAll 10 [12, 15] = 10 := by decide
example : perSiteSum [(10, [7]), (5, []), (8, [20, 6])] = 18 := by decide
example : localSum [(10, [7]), (5, []), (8, [20, 6])] = 23 := by decide
example : heldSum [(10, [7]), (5, []), (8, [20, 6])] = 5 := by decide

end MeetPay
end Economics
end Obsmetrologia
