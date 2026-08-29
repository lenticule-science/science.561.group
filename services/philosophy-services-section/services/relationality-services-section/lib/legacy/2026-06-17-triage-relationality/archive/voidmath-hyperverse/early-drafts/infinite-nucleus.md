---
setting: infinite
description: >
  Consolidation of nucleus content for the infinite / coalgebra setting. In the infinite
  setting there are no meets, no joins, no equality — only the directional relation. The
  classical closure-operator definition (extensive + strictly idempotent + meet-preserving)
  does not apply. What applies: a map j on the preorder with j∘j ≤ j (KZ lax idempotence)
  and a ≤ j(a) (extensiveness as a directional claim). Meet-preservation has no direct
  analog without meets. This file is largely underdeveloped in the old drafts — stating
  what IS and ISN'T known is the goal here.
sources:
  - relational-history-fiber-nucleus.md (definition section — but mixed finite/infinite)
  - finite-nucleus-bypass-idempotence.md (KZ correction, now understood as infinite-setting)
---

# Nucleus (Infinite Setting)

**Setting: infinite coalgebra. No ground term. No meets. No joins. No equality. Only the
directional relation (the preorder ≤).**

The finite nucleus (finite-nucleus.md) is a closure operator on a Heyting algebra — it
needs meets, joins, and equality to even state its properties. None of those are available
here. The infinite-setting analog is genuinely different and is substantially underdeveloped
in the old drafts.

---

## Step IN1 — What Transfers and What Doesn't {#step-in1}

### Qualities
- **Quality IN1.1** — **Extensiveness transfers** as a directional claim: a map j on the
  preorder satisfies a ≤ j(a) for all a. This uses only the preorder ≤, which is available
  in the infinite setting. No lattice operations needed.
- **Quality IN1.2** — **Strict idempotence does not transfer.** j(j(a)) = j(a) uses
  equality. The infinite setting has no equality, only ≤. Importing this condition here
  is an infinite/finite error.
- **Quality IN1.3** — **KZ lax idempotence** is the operative condition: j∘j ≤ j, i.e.,
  j(j(a)) ≤ j(a) for all a. This uses only ≤. Combined with Quality IN1.1 (a ≤ j(a)),
  we get a ≤ j(a) and j(j(a)) ≤ j(a) — two directional claims, no equality.
- **Quality IN1.4** — **Meet-preservation does not transfer.** j(a ∧ b) = j(a) ∧ j(b)
  requires both meets (∧) and equality. Neither is available. There is no direct infinite
  analog of this condition without first defining what "meet" means in the infinite setting.

### The step

The classical nucleus axioms split cleanly: extensiveness survives as-is (directional
claim); idempotence survives only in the lax form; meet-preservation has no analog yet.
What the infinite-setting nucleus IS remains open in the old drafts.

---

## Step IN2 — The KZ Lax Idempotence Condition {#step-in2}

### Things
- **Thing IN2.1** — A map j on the infinite preorder satisfying Quality IN1.1 (a ≤ j(a))
  and Quality IN1.3 (j(j(a)) ≤ j(a)).

### Qualities
- **Quality IN2.1** — From a ≤ j(a) applied to j(a): j(a) ≤ j(j(a)). Combined with
  j(j(a)) ≤ j(a) (Quality IN1.3), we get j(j(a)) ≤ j(a) ≤ j(j(a)). In the finite
  setting, mutual ≤ gives equality, recovering strict idempotence. **In the infinite
  setting, mutual ≤ does not give equality** — there is no antisymmetry available. The
  two directional claims coexist without collapsing.
- **Quality IN2.2** — The lax condition j∘j ≤ j is what the KZ-doctrine (lax-idempotent
  monad) requires in an order-enriched category. It is not a weakening of the finite
  condition for convenience — it is the condition appropriate to a setting with only ≤.

### The step

Quality IN2.1 is the key asymmetry between finite and infinite: in the finite setting,
j(j(a)) ≤ j(a) and j(a) ≤ j(j(a)) collapse to equality because antisymmetry holds.
In the infinite setting they don't collapse. The two directional claims are both true and
remain distinct. This is intentional — the infinite setting is the study of what doesn't
collapse.

**What the old drafts got wrong here:** The annotations in the idempotence files said
"strict equality is wrong, use KZ lax condition" and attributed this to both σ_t and Δ_t.
The KZ correction is correct for the infinite setting. But the proofs in those files used
meets and joins — they were finite proofs. The correction was right; it was applied to
the wrong files.

---

## Step IN3 — What Is Missing {#step-in3}

### Qualities
- **Quality IN3.1** — No construction of a nucleus-analog from old drafts lives entirely
  in the infinite setting. Every construction in the old material (profile classes,
  Fix(j), restriction maps, Heyting algebra homomorphisms) assumes the cone lattice
  structure — finite setting.
- **Quality IN3.2** — The infinite-setting "closure" analog, if it exists, must be defined
  directly from the directional relation of the infinite coalgebra (Steps 1–10 of
  infinite-voidmath.md), without reference to meets, joins, or equality.
- **Quality IN3.3** — The fixed-point subalgebra Fix(j) from the finite setting has no
  direct analog here. In the infinite setting, "fixed point" would require j(a) ≤ a and
  a ≤ j(a) — two directional claims. Whether this is the right notion of fixed point for
  the infinite nucleus is open.

### The step

The infinite-nucleus content is substantially absent from the old drafts. The old files
that mention ClosureBypass and VoidCone are using vocabulary from annotations that pointed
toward the infinite setting, but the actual proof content beneath those annotations was
always in the finite setting.

What needs to be derived fresh from infinite-voidmath.md Steps 1–10, without importing
finite-setting machinery:
- A precise definition of the infinite-setting nucleus analog
- A proof of extensiveness (a ≤ j(a)) for whatever that analog is
- A proof or refutation of KZ lax idempotence (j∘j ≤ j) for that analog
- A statement of what replaces meet-preservation, if anything does
