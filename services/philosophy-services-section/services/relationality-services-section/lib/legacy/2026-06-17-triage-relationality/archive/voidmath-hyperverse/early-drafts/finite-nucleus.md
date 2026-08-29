---
setting: finite
description: >
  Consolidation of nucleus content for the finite / cone-lattice setting. A nucleus j on
  a fiber Heyting algebra H is an endomorphism that is extensive, strictly idempotent, and
  meet-preserving. Its fixed points form a sub-Heyting-algebra Fix(j). The j-residuation
  j⊃ gives H a j-modified Heyting structure H^j whose quotient by the nucleus kernel is
  isomorphic to Fix(j). Three nucleus instances — saturation σ (local to one fiber),
  transfer Δ (tower-crossing, touches the infinite structure), joint retraction π
  (composite of both) — mark the boundary between finite and infinite content.
---

# Nucleus (Finite Setting)

**Setting: cone lattice / fiber Heyting algebra. Meets, joins, and equality are all available.**

One bypass closure j on the fiber H. Three properties.

---

## Step FN1 — Definition {#step-fn1}

### Things
- **Thing FN1.1** — The fiber H: a Heyting algebra. Closed under ∧, ∨, ⇒, ⊥, ⊤.
- **Thing FN1.2** — The bypass closure j: an endomorphism j: H → H satisfying the three
  qualities below.

### Qualities
- **Quality FN1.1** — j is **extensive**: for all a ∈ H, a ≤ j(a).
- **Quality FN1.2** — j is **strictly idempotent**: for all a ∈ H, j(j(a)) = j(a).
- **Quality FN1.3** — j is **meet-preserving**: for all a, b ∈ H, j(a ∧ b) = j(a) ∧ j(b).

### The step

Each quality follows from how bypass closures are constructed — see Steps FN2–FN4.
Together they characterize exactly the maps that arise as closure operators on a lattice.

---

## Step FN2 — Extensiveness {#step-fn2}

### Qualities
- **Quality FN2.1** — j is extensive. Two construction patterns each force this directly.

### Acts
- **Act FN2.1** — Construction Pattern I (join-inclusive): j(a) = ∨{b ∈ H : profile(b) ≤
  profile(a)}. The input a satisfies its own profile condition, so a is one term in the
  join. Therefore a ≤ j(a). ∎ For σ this holds at t ≠ ε; see Step FN10 for the ε case.
- **Act FN2.2** — Construction Pattern II (meet-above): j(a) = ∧{b ∈ Fix(j) : b ≥ a}.
  Every b in the defining set satisfies b ≥ a. The meet is a lower bound of the set, so
  j(a) ≥ a. ∎

---

## Step FN3 — Idempotence {#step-fn3}

### Qualities
- **Quality FN3.1** — j is strictly idempotent: j(j(a)) = j(a) for all a.
- **Quality FN3.2** — In the finite setting, j(j(a)) = j(a). In the infinite coalgebra,
  j∘j ≤ j. The two conditions belong to different settings; each is correct in its own.

### Acts
- **Act FN3.1** — Idempotence via Pattern I: j(a) has the same profile as a (applying j
  does not change the restriction profile). So j(j(a)) runs over the same profile class as
  j(a). The join is the same. j(j(a)) = j(a). ∎ For σ this holds at t ≠ ε; see Step FN10.
- **Act FN3.2** — Idempotence via Pattern II: j(a) ∈ Fix(j) by construction. For any
  c ∈ Fix(j), j(c) = c — the defining set for j(c) has c as its own minimum. Applied to
  c = j(a): j(j(a)) = j(a). ∎

---

## Step FN4 — Meet-Preservation {#step-fn4}

### Qualities
- **Quality FN4.1** — j is meet-preserving: j(a ∧ b) = j(a) ∧ j(b).

### Acts
- **Act FN4.1** — Meet-preservation via Pattern I:
  - (≤) By profile-preservation of j, ρ(j(a) ∧ j(b)) = ρ(j(a)) ∧ ρ(j(b)) = ρ(a) ∧
    ρ(b) = ρ(a ∧ b), so j(a) ∧ j(b) is in the defining set for j(a ∧ b), giving
    j(a) ∧ j(b) ≤ j(a ∧ b).
  - (≥) Any c with ρ(c) ≤ ρ(a ∧ b) satisfies ρ(c) ≤ ρ(a) and ρ(c) ≤ ρ(b), so
    c ≤ j(a) and c ≤ j(b), hence c ≤ j(a) ∧ j(b). Therefore j(a ∧ b) ≤ j(a) ∧ j(b). ∎
- **Act FN4.2** — Meet-preservation via Pattern II:
  - j(a) and j(b) are both in Fix(j). Fix(j) is closed under ∧, so j(a) ∧ j(b) ∈ Fix(j).
    Since j(a) ≥ a and j(b) ≥ b, the meet is above a ∧ b, so j(a ∧ b) ≤ j(a) ∧ j(b).
  - j(a) ∧ j(b) is the minimal Fix(j)-element above a ∧ b (Fix(j) closed under ∧). So
    j(a) ∧ j(b) ≤ j(a ∧ b). Equality follows. ∎

---

## Step FN5 — Fixed-Point Sub-Algebra {#step-fn5}

### Things
- **Thing FN5.1** — Fix(j) = {a ∈ H : j(a) = a}: the fixed-point set of j.

### Qualities
- **Quality FN5.1** — Fix(j) is a sub-Heyting-algebra of H: closed under ∧, ∨, ⇒, ⊥, ⊤.
  Closed under ∧ by meet-preservation; ⊤ ∈ Fix(j) by extensiveness (j(⊤) ≥ ⊤ and ⊤ is
  maximum); the rest follow from the Heyting algebra structure and the nucleus axioms.
- **Quality FN5.2** — For any a ∈ H and c ∈ Fix(j): a ≤ c iff j(a) ≤ c. j is the
  left adjoint of the inclusion Fix(j) ↪ H: it is the reflection of H onto Fix(j).

### The step

Fix(j) inherits full Heyting algebra structure. j is the reflection of H onto Fix(j):
applying j once is the canonical map from H into Fix(j).

---

## Step FN6 — Nucleus Residuation {#step-fn6}

### Things
- **Thing FN6.1** — The greatest preimage j⁻¹(c): for c ∈ Fix(j), the greatest x ∈ H
  with j(x) ≤ c. Since j is extensive, j(x) ≤ c and c ∈ Fix(j) forces j(j(x)) = j(x) ≤ c,
  so max{x : j(x) ≤ c} = max{x : j(x) = c}.

$$
j^{-1}(c) \;:=\; \max\{\, x \in H \mid j(x) \leq c \,\}
$$

  **Existence.** The set {x : j(x) ≤ c} contains ⊥ and is closed under arbitrary joins
  (j preserves directed joins as a closure operator on a complete lattice). Its join is
  the greatest preimage.

  **Relation to the kernel.** j⁻¹(c) is the maximum of the kernel class
  [c]~_j = {x : j(x) = c}: every class has a unique top element.

- **Thing FN6.2** — The j-residuation j⊃(a, b): the greatest x ∈ H satisfying
  j(a ∧ x) ≤ j(b).

$$
j\!\supset\!(a,b) \;:=\; j^{-1}\!\bigl(j(a) \Rightarrow j(b)\bigr)
$$

  where j(a) ⇒ j(b) is the implication inside Fix(j). Exists by Thing FN6.1 since
  j(a) ⇒ j(b) ∈ Fix(j).

### Qualities
- **Quality FN6.1** — Galois connection: j(a ∧ b) ≤ j(c) iff b ≤ j⊃(a, c). Proof: by
  meet-preservation, j(a ∧ x) = j(a) ∧ j(x). The condition j(a) ∧ j(x) ≤ j(c) is
  equivalent (by the Heyting adjunction in Fix(j)) to j(x) ≤ j(a) ⇒ j(c). The greatest
  x satisfying this is j⁻¹(j(a) ⇒ j(c)) = j⊃(a, c) by Thing FN6.1. ∎
- **Quality FN6.2** — Stability under composition: if b ≤ j⊃(a, c) and d ≤ j⊃(c, e),
  then b ∧ d ≤ j⊃(a, e). Proof: by the Galois connection, j(a ∧ b) ≤ j(c) and
  j(c ∧ d) ≤ j(e). Then j(a ∧ b ∧ d) ≤ j(c ∧ d) ≤ j(e), so b ∧ d ≤ j⊃(a, e). ∎
- **Quality FN6.3** — j⊃(a, b) with j = id gives the raw fiber implication a ⇒ b.
  j⊃ mediates implication through j: it asks what is sufficient for j(b) given j(a).

### Instances

- **j = σ (saturation):** σ⊃(a, b) is the greatest x with σ(a ∧ x) ≤ σ(b). Operates
  within a single fiber.
- **j = Δ (transfer):** Δ⊃(a, b) is the greatest x with Δ(a ∧ x) ≤ Δ(b). Crosses
  levels of the tower: sufficiency is measured through transfer-settled forms.
- **j = π (joint retraction):** π⊃(a, b) is the greatest x with π(a ∧ x) ≤ π(b).
  Mediates through both saturation and transfer closure.

---

## Step FN7 — The j-Preorder Heyting Algebra and Quotient {#step-fn7}

### Things
- **Thing FN7.1** — The j-preorder on H: a ≤_j b iff j(a) ≤ j(b). Reflexive and
  transitive. Two elements a, b with j(a) = j(b) are equivalent under ≤_j and distinct
  in H.
- **Thing FN7.2** — The j-modified Heyting algebra H^j: the structure
  (H, ∧, j∘∨, j⊃, j(⊥), j(⊤)) with the j-preorder. Meet is unchanged from H. Join
  becomes j(a ∨ b). Implication is j⊃ from Step FN6. Bottom is j(⊥), top is j(⊤).
- **Thing FN7.3** — The nucleus kernel ~_j: a ~_j b iff j(a) = j(b). An equivalence
  relation on H.
- **Thing FN7.4** — The quotient H^j / ~_j: equivalence classes of H under ~_j.

### Qualities
- **Quality FN7.1** — H^j is a Heyting algebra in the j-preorder. The adjunction
  b ∧ a ≤_j c iff b ≤_j j⊃(a, c) holds by the Galois connection of Quality FN6.1. ∎
- **Quality FN7.2** — j(a ∨ b) is the join of a and b in the j-preorder. Three conditions:
  - a ≤_j j(a ∨ b): j(a) ≤ j(a ∨ b) by monotonicity of j. ✓
  - b ≤_j j(a ∨ b): j(b) ≤ j(a ∨ b) by monotonicity of j. ✓
  - Universality: if j(a) ≤ j(d) and j(b) ≤ j(d), then j(a) ∨ j(b) ≤ j(d), so
    a ∨ b ≤ j(a) ∨ j(b) ≤ j(d) (using extensiveness a ≤ j(a)), hence
    j(a ∨ b) ≤ j(j(d)) = j(d), i.e., j(a ∨ b) ≤_j d. ✓ ∎
  The result j(a ∨ b) always lies in Fix(j) by idempotence: j(j(a ∨ b)) = j(a ∨ b).
- **Quality FN7.3** — For a, b ∈ Fix(j), the join in Fix(j) is j(a ∨ b): the least
  fixed point of j above a ∨ b. The inclusion Fix(j) ↪ H^j preserves joins because
  both sides use j(a ∨ b).
- **Quality FN7.4** — Fix(j) → H^j is a Heyting algebra homomorphism. Fix(j) → H
  preserves ∧ and ⇒ but carries the Fix(j)-join j(a ∨ b) to a position that may differ
  from the raw H-join a ∨ b when a ∨ b ∉ Fix(j).
- **Quality FN7.5** — H^j / ~_j ≅ Fix(j) as Heyting algebras. j: H → Fix(j) is a
  surjective Heyting algebra homomorphism from H^j whose kernel is exactly ~_j. Join
  preservation uses Quality FN7.3: j(j(a ∨ b)) = j(a ∨ b) = j(j(a) ∨ j(b)). ∎
- **Quality FN7.6** — H^j and Fix(j) have different underlying sets when Fix(j) ⊊ H.
  The isomorphism H^j / ~_j ≅ Fix(j) holds at the quotient level.

### The step

H^j and the quotient give two views of what j does. H^j is H itself with j baked into
its join and implication — elements become equivalent when j cannot distinguish them.
The quotient collapses those classes to single points, recovering Fix(j).

### Instances and the finite/infinite boundary

- **j = σ (saturation):** Fix(σ) is the saturation-stable sub-algebra. The σ-join is
  a ∨^σ b = σ(a ∨ b): the least saturation-stable element above a ∨ b. H^σ/~_σ ≅ Fix(σ).
  Operates entirely within one fiber at one level. Purely finite.

- **j = Δ (transfer):** Fix(Δ) is the transfer-stable sub-algebra. The Δ-join is
  a ∨^Δ b = Δ(a ∨ b): the least transfer-stable element above a ∨ b. H^Δ/~_Δ ≅ Fix(Δ).
  Δ crosses levels of the tower; where the infinite structure enters the fiber algebra.

- **j = π (joint retraction, σ followed by Δ):** Fix(π) = H*. The π-join is
  a ∨^π b = π(a ∨ b): the least doubly-stable element above a ∨ b. H^π/~_π ≅ H*.

### Coarseness order of kernels

Since π = σ∘Δ and both σ and Δ are extensive (a ≤ σ(a) ≤ π(a) and a ≤ Δ(a) ≤ π(a)),
the kernels satisfy:

$$
{\sim_\sigma} \;\subseteq\; {\sim_\pi}
\qquad\text{and}\qquad
{\sim_\Delta} \;\subseteq\; {\sim_\pi}.
$$

The π-kernel identifies at least as many pairs as either σ or Δ alone. Each kernel class
[c]~_j has a canonical maximum representative j⁻¹(c) (Thing FN6.1). The three maximum
representatives of a given a are σ⁻¹(σ(a)), Δ⁻¹(Δ(a)), π⁻¹(π(a)), with
π⁻¹(π(a)) ≥ σ⁻¹(σ(a)) and π⁻¹(π(a)) ≥ Δ⁻¹(Δ(a)).

---

## Step FN8 — Fixed-Point Determination {#step-fn8}

### Qualities
- **Quality FN8.1** — j is uniquely determined by Fix(j). If j₁ and j₂ are nuclei on H
  with Fix(j₁) = Fix(j₂), then j₁ = j₂.
- **Quality FN8.2** — For any nucleus j on H:

$$
j(a) \;=\; \bigwedge\{\, s \in \mathrm{Fix}(j) : s \geq a \,\}.
$$

  This is Construction Pattern II (Act FN2.2), proved here as a characterization that
  determines j uniquely from Fix(j).

### Acts
- **Act FN8.1** — Proof of Quality FN8.2. Let S = Fix(j) and j̄(a) = ∧{s ∈ S : s ≥ a}.
  The set is non-empty since j(a) ∈ S and j(a) ≥ a. We show j(a) = j̄(a):
  - (j(a) ≥ j̄(a)): j(a) ∈ S and j(a) ≥ a, so j(a) is one summand in the meet.
    Therefore j̄(a) ≤ j(a).
  - (j(a) ≤ j̄(a)): j is meet-preserving, so j(j̄(a)) = j(∧{s ∈ S : s ≥ a}) =
    ∧{j(s) : s ∈ S, s ≥ a} = ∧{s : s ∈ S, s ≥ a} = j̄(a), where the third equality
    uses s ∈ S = Fix(j). So j̄(a) ∈ Fix(j). By monotonicity, j(a) ≤ j(j̄(a)) = j̄(a).
  - Combined: j(a) = j̄(a). ∎
  - Uniqueness: j₁(a) = ∧{s ∈ Fix(j₁) : s ≥ a} = ∧{s ∈ Fix(j₂) : s ≥ a} = j₂(a)
    when Fix(j₁) = Fix(j₂). ∎

### Application — non-commutativity

When σ∘Δ ≠ Δ∘σ, (Δ∘σ)² ≠ Δ∘σ. Proof: suppose (Δ∘σ)² = Δ∘σ. Then Δ∘σ is a nucleus
with Fix(Δ∘σ) = H*. By Quality FN8.1, any nucleus with Fix = H* equals ∧{s ∈ H* : s ≥ a},
which is unique. So Δ∘σ = σ∘Δ — contradicting σ∘Δ ≠ Δ∘σ. ∎

---

## Step FN9 — Nucleus Submonoid {#step-fn9}

### Things
- **Thing FN9.1** — The set {id, σ, Δ, π} under composition, where π = σ∘Δ. This is
  the sub-monoid generated by {σ, Δ} when σ∘Δ = Δ∘σ. When σ∘Δ ≠ Δ∘σ, σΔ and Δσ are
  distinct, and the generated sub-monoid contains at least the elements
  σΔ, Δσ, σΔσ, ΔσΔ, ... as further distinct composites.

### Qualities
- **Quality FN9.1** — σ∘σ = σ and Δ∘Δ = Δ (Step FN3). Every run of consecutive equal
  factors collapses to one.
- **Quality FN9.2** — In the nucleus order (j ≤ k iff j(a) ≤ k(a) for all a):
  id ≤ σ ≤ π and id ≤ Δ ≤ π. Under σ∘Δ = Δ∘σ, the four elements {id, σ, Δ, π} are
  isomorphic to {0,1}² with coordinatewise order: id ↔ (0,0), σ ↔ (1,0),
  Δ ↔ (0,1), π ↔ (1,1). This ordering holds for the four named elements regardless
  of whether further composites exist.
- **Quality FN9.3** — Each of the four elements maps to its fixed-point sub-algebra:

| Nucleus | Fixed-point sub-algebra |
|---------|------------------------|
| id      | H (full fiber)          |
| σ       | Fix(σ) (saturation-active) |
| Δ       | Fix(Δ) (transfer-active)   |
| π       | H* (doubly stable)          |

  Fix(π) ⊊ Fix(σ) ⊊ H and Fix(π) ⊊ Fix(Δ) ⊊ H in any non-trivial fiber. Distinct
  fixed-point sets give distinct nuclei (Quality FN8.1).

### The step

The ordering and fixed-point assignments of the four named elements are sound. Whether
{id, σ, Δ, π} is the complete generated sub-monoid depends on whether σ∘Δ = Δ∘σ. The
asymmetry of σ (local, one fiber) and Δ (tower-crossing) is where that question lives.

---

## Step FN10 — Definition of σ (Saturation Nucleus) {#step-fn10}

### Things
- **Thing FN10.1** — The restriction maps ρ_{t₀} = H(i_{t₀,t}): H_t → H_{t₀} for each
  proper sub-history t₀ < t. These are Heyting algebra homomorphisms (they preserve ∧,
  ∨, ⇒, ⊥, ⊤) — the fact used in Step FN4's meet-preservation proof.
- **Thing FN10.2** — The restriction profile of a ∈ H_t: the tuple (ρ_{t₀}(a))_{t₀ < t}
  of values in the sub-fibers.
- **Thing FN10.3** — The restriction profile class of a: the set of all b ∈ H_t with
  ρ_{t₀}(b) ≤ ρ_{t₀}(a) for all t₀ < t.

### Qualities
- **Quality FN10.1** — σ_t = η_t* ∘ η_t, where η_t: H_t → H_t^sh is the sheafification
  unit of the propositional presheaf H over the history site (T, J), and η_t* is the
  right-adjoint inclusion back into H_t. The profile-class formula in Quality FN10.2 is
  a derived characterization valid at t ≠ ε.

- **Quality FN10.2** — For t with at least one proper sub-history (t ≠ ε):

$$
\sigma_t(a) \;=\; \bigvee\{\, b \in H_t \mid \rho_{t_0}(b) \leq \rho_{t_0}(a) \;\text{ for all } t_0 < t \,\}
$$

  σ_t(a) is the largest element of H_t with the same restriction profile as a. Since a
  itself satisfies the condition, σ_t(a) ≥ a. This is Construction Pattern I of Step FN2.
  Profile preservation: ρ_{t₀}(σ_t(a)) = ρ_{t₀}(a) for all t₀ < t — applying σ expands
  a within H_t while holding all sub-history values fixed.

- **Quality FN10.3 — Boundary at ε.** At ε (the empty history) the profile-class
  formula gives σ_ε(a) = ⊤_ε for all a, since the condition is vacuous. The correct
  σ_ε is determined by the Grothendieck topology J and its covering family at ε.

  The J-cover at ε is {g, g'} — the two one-step extensions. A pair
  (a_g, a_{g'}) ∈ H_g × H_{g'} is compatible when ρ_{ε,g}(a_g) = ρ_{ε,g'}(a_{g'})
  in H_ε. σ_ε(a) is the canonical amalgamation of the pair (ρ_g(a), ρ_{g'}(a)) under
  this compatibility condition. Acts FN2.1 and FN3.1 apply at t ≠ ε.

- **Quality FN10.4** — a ∈ Fix(σ_t) iff a is the maximum of its profile class: every
  b ∈ H_t with the same restriction profile as a satisfies b ≤ a. Equivalently,
  σ_t(a) = a.

- **Quality FN10.5** — σ is the backward-facing nucleus: oriented toward the accumulated
  sub-histories. It looks backward through the restriction maps ρ_{t₀} to find the
  maximum element of H_t with the same sub-history values as a. Δ is the forward-facing
  nucleus, oriented toward the next level of the tower.
