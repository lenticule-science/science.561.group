---

name: calculus-for-crossdiscipline-claims
date-created: 2025-12-14
introduces: specification
---

### Primitives

**1) Fragment (primitive, local scope)**  
A fragment is a container for reasoning under controlled assumptions.

- **F := ⟨A, K, Π⟩**
  - **A**: assumptions (axioms, constraints, conventions)
  - **K**: claims currently admitted in the fragment
  - **Π**: provenance map, Π(c) = minimal support record for claim c  
    (sources, derivations, or “trusted inputs”)

Assumption dependence is not optional: every non-axiom claim must have a provenance record.

**2) Support edge (primitive, local scope)**  
A support edge is a directed relation `S ⟶ c` where `S` is a set of claims/assumptions and `c` is a claim.  
It’s the atomic unit of “why.”

**3) Compatibility predicate (primitive, local scope)**  
`Compat(F, G)` answers whether fragments can be combined without immediate contradiction *under declared assumptions*.

---

### Derived operators

**4) Closure (derived, local scope)**  
`Cl(F)` adds all claims derivable from A ∪ K using the allowed inference rules **R** in that fragment.

- `Cl(F)` depends on:  
  - the rule set **R** (explicit)  
  - resource bounds (optional): depth, time, or “permitted theory”

This is the first “impress me” lever: closure is never global by default; it’s *scoped and parameterized*.

**5) Minimal support extraction (derived, local scope)**  
For a claim `c ∈ Cl(F)`, define `MS_F(c)` as the smallest (w.r.t. set inclusion) support set that still entails c, according to Π + R.  
If there are multiple minima, you keep the set of minima.

This gives you **explainability with edge-case handling** (non-uniqueness) without pretending supports are canonical.

**6) Delta (derived, cross-fragment)**  
`Δ(F → G)` is the *smallest* set of assumption/claim changes required so that `Compat(Cl(F), Cl(G))` holds, plus the induced provenance edits.

This is “debugging” at the level of *model boundaries* rather than sentences.

---

### Heuristics

**7) Tension index (heuristic, local-to-cross)**  
A number (or ordering) estimating “how expensive” it is to merge fragments: contradictions, support overlap, and closure explosion.

Not truth—just a steering function.

---

## What this buys you: a nontrivial worked use

Suppose we have a research program where you’re constantly switching among math, software architecture, and implementation. The classic failure mode is **illicit globalism**: something proven “in math mode” quietly becomes a design invariant in “runtime mode,” then becomes a test oracle in “implementation mode,” even though each move silently changed assumptions.

We model each mode as a fragment:

- **Fᴹ (math)**: Aᴹ includes axioms/definitions; Rᴹ includes proof rules.
- **Fᴬ (architecture)**: Aᴬ includes design constraints (latency, ergonomics, versioning); Rᴬ includes refinement rules (“if invariant, then representable in schema”).
- **Fᴵ (implementation)**: Aᴵ includes language/tool constraints; Rᴵ includes operational semantics, testability constraints.

Now the *useful* question isn’t “is claim c true?”  
It’s:

> In which fragments does `c` survive closure, and what’s the delta cost to make it survive elsewhere?

### Example claim
Let `c := “Normalization is confluent.”`

- In **Fᴹ**, `Cl(Fᴹ)` might include c with support `MS_Fᴹ(c) = {termination, local confluence}` (Newman’s lemma style), plus precise definitions.
- In **Fᴬ**, the same English sentence might be intended as “canonicalization yields unique normal forms,” which additionally needs:
  - determinism of the normalization strategy,
  - stability under version changes,
  - a representation invariant compatible with serialization.
- In **Fᴵ**, you may discover the chosen strategy is not terminating on some inputs (resource bounds, recursion limits, or a bug), so c *fails*.

### Delta analysis instead of argument
Compute `Δ(Fᴹ → Fᴵ)`:

Typical minimal deltas look like:
- add a **restriction** on the term language (exclude constructs causing divergence), or
- add a **fuel / step bound** and weaken c to “confluent up to k steps,” or
- change implementation strategy (e.g., memoization + occurs-check) and update provenance.

The point: you don’t “debate” c; you **refine it into fragment-compatible variants** with explicit cost.

---

## A sharp insight: closure is the silent killer

In practice, most incoherence isn’t from contradictions in K; it’s from **uncontrolled closure**:

- You import a powerful rule set R into a fragment that was only meant to be lightweight.
- `Cl(F)` explodes and drags in commitments you never priced in.
- Later fragments inherit those commitments as if they were axioms.

So an operationally useful invariant is:

> **Every fragment must declare its closure regime** (rule set + bounds).  
> Otherwise “what follows” is undefined, and provenance becomes theater.

This is a concrete, enforceable discipline:
- If a claim is used as an invariant across modes, it must come with **(i)** fragment label(s), **(ii)** minimal supports, and **(iii)** the delta plan if the claim fails under another closure regime.

---

## If you want to push this further

Two natural extensions that stay coherent:

1) **Typed claims**: distinguish *semantic* claims (about objects) vs *governance* claims (about allowed rules/assumptions). Governance claims should not be casually imported.

2) **Bidirectional deltas**:  
`Δ(F → G)` is not symmetric. That asymmetry encodes “where you pay the complexity tax.”
