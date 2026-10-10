---
title: "Theory-side research notes — three places where dev plans ask the theory questions it cannot yet answer"
description: "Hard theoretical work on three sites where pypredcomp dev documentation raises questions the predication-categories / predicated-computing theory does not yet answer in published form. For each site: diagnose the gap (where the dev plan needs theory it does not have), then develop a candidate answer grounded in the existing theory family, with explicit citations into theories/. Distinct from the placeholder-theorem audit and the repair-lifecycle audit, which catalogue the gaps; this note attempts the theory work the gaps demand."
kind: survey
status: draft
date: 2026-05-03
surfaces:
  - "../surveys/placeholder-theorems-2026-05-03.md"
  - "../surveys/repair-lifecycle-grounding-2026-05-03.md"
  - "../questions/v0.4-cross-peer-clock-meet.md"
default-disposition: "captain-review-then-promote-findings-to-library-authoring-tasks"
---

# Theory-side research notes (2026-05-03)

The placeholder-theorem audit ([`placeholder-theorems-2026-05-03.md`](placeholder-theorems-2026-05-03.md)) and the repair-lifecycle audit ([`repair-lifecycle-grounding-2026-05-03.md`](repair-lifecycle-grounding-2026-05-03.md)) catalogue **where** the theory is silent.
The captain question [`v0.4-cross-peer-clock-meet.md`](../questions/v0.4-cross-peer-clock-meet.md) frames a federation decision the theory is, on the audit's reading, also silent on.
This survey is different: it does the **theoretical work** the gaps demand.
It picks three high-yield sites, treats each as a research question for the theory family (`predication-categories` primary, `predicated-computing` secondary), and develops candidate answers with full citations into [`theories/`](../../../../../../../../theories/).

The three sites are:

1. **The cross-peer clock-meet question (N / O / P).** The captain question reads as a substrate-engineering choice between three options; this note argues the question is **not well-formed** as posed, because the theory already determines most of the answer and the remaining residual is regime-specific.
2. **`federation-fuel-as-tensor-distributivity` (placeholder #1).** The placeholder cites a phantom object `lawvere-quantale-of-fuel`; this note shows the placeholder collapses to a corollary of [`cost-composition-via-lawvere-quantale`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md) and [`federation-path-metrics-multiplicative`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-path-metrics-multiplicative.md) under the standard quantale distributivity, and writes the corollary out.
3. **The 4-state vs 2-state witness-lifecycle gap.** The repair-lifecycle audit reports primary theory mandates a 2-state arrow (open → settled, monotone in $\leq_k$) while the spec carries a 4-state lifecycle (open / triaged / repaired / settled).
  This note argues the 4-state view is the regime-determined trajectory under [`closure-rule-system-realizes-closure-2-monad`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/closure-rule-system-realizes-closure-2-monad.md), not extra structure — and derives **when** it is load-bearing.

Each section closes with a *math-side authoring proposal*: the specific entities (theorems / objects / examples) the library would gain, the dependencies they would carry, and the placeholder-theorem they would discharge.

---

## §1. The cross-peer clock-meet question is not well-formed

The captain question [`v0.4-cross-peer-clock-meet.md`](../questions/v0.4-cross-peer-clock-meet.md) presents three options:

- **N.** Regime-meet on heartbeat-ordinal-domain.
- **O.** Per-peer ordinal namespaces with content-addressed total order.
- **P.** Wallclock + bounded-drift envelope.

The agent recommends N on cost grounds.
We argue the theory already determines the answer, and the answer is **neither N nor O nor P as posed** — but a regime-stratified disposition that reduces to the trivial answer in two of the four regimes.

### §1.1. What the theory already says

Three load-bearing facts from the published theory:

**Fact A — Federation-convergence is order-independent on endpoint state in strict and Scott-continuous regimes.** [`federation-convergence`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md) proves that for two substrates sharing $(\mathcal{S}, \mathbf{L}^\bowtie, \mathcal{C}, E)$,

$$v^\infty(p) = \mathrm{cl}_p\!\left(\bigvee_k U\right)$$

regardless of message-arrival order.
The Knaster–Tarski-flavoured *closure-merge commutation lemma* $\mathrm{cl}_p(\mathrm{cl}_p(X) \vee_k Y) = \mathrm{cl}_p(X \vee_k Y)$ does the work; it only needs the four [`closure-operator`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) axioms (monotone in $\leq_k$, inflationary, idempotent, $\mathcal{C}$-natural) and content-addressed deduplication via [`hash-discipline`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/hash-discipline.md). **No cross-peer ordering primitive is consumed in the proof.**

**Fact B — Wallclock is not consulted for correctness.** [`monotonic-clock-discipline`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/monotonic-clock-discipline.md) Part 2 says reducers are pure on substrate-resident inputs only; wallclock readings are content if recorded, not host-reads.
This eliminates option P at the theory level — not as a captain preference but as a mandate of the published theorem.
P is non-conformant.

**Fact C — Substrate ordinals are per-substrate by construction.** [`time-and-event-ordinals`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/time-and-event-ordinals.md) (cited by [`clock`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/clock.md)) gives each substrate operation a fresh ordinal greater than all prior ordinals **in that substrate's event log**.
There is no published theory object "global ordinal" or "cross-peer ordinal-meet"; the substrate ordinal is parochial to the substrate that issued it.

### §1.2. The three options re-examined under Facts A–C

**Option N (regime-meet on heartbeat-ordinal-domain) is mis-named.** [`network-algebraic-contract.md`](../specs/network/network-algebraic-contract.md) §1.3 — and the underlying theorem [`regime-classification-for-substrate`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/regime-classification-for-substrate.md) — defines the regime-meet over the *regime lattice* $\mathrm{strict} \le \mathrm{Scott\text{-}continuous} \le \mathrm{transfinite\text{-}bounded} \le \mathrm{aperiodic}$.
This lattice has nothing to do with ordinal-domains.
Calling option N "regime-meet on heartbeat-ordinal-domain" suggests the regime-meet *can* be parametrised over a heartbeat-ordinal axis; the published theorem does not define such a parametrisation.
The option as written conflates two distinct meets:

- the regime-meet on the four-element chain of regimes (published, load-bearing in `network-algebraic-contract.md` §1.3),
- a hypothetical meet on per-substrate ordinal-domain *types* (`linear-ordinal` / `dense-ordinal` / `partial-ordinal` — a typology the question proposes but the theory does not name).

Authoring the second meet would be *new structural commitment* in the math, not the agent's claimed minimal extension.
The honest description of N is "**propose a new ordinal-domain-type classifier and define a meet on it, in addition to the existing regime-meet**."
That is a math-side authoring task with no current theorem to anchor it.

**Option O (per-peer namespaces, content-addressed total order) is theory-conformant but only needed in a subset of regimes.** Per Fact A, in strict and Scott-continuous regimes we do not need a cross-peer total order at all — federation-convergence holds on endpoint state.
Per [`federation-convergence`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md) §"Regime hypotheses", the transfinite-bounded and aperiodic regimes **must ship trajectory** (the firing-ordinal record); the trajectory carries the substrate's per-substrate firing-ordinal pattern, and merging two trajectories requires the trajectories to be ordered relative to each other — but only as labels on increments, not as a load-bearing total order on outcomes.

The minimal cross-peer ordering needed is therefore: **on trajectory increments (not on outcome state), tag each increment with `(peer-id, substrate-ordinal)` and break ties by the canonical-form hash of the increment record**, citing [`hash-injectivity-under-canonical-form`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md).
This is option O, restricted to where it is load-bearing.

**Option P is refused at theory level by Fact B.** Not a captain decision.

### §1.3. The theory-determined disposition

The disposition the theory determines, in the four regimes:

| Regime | Cross-peer ordering required? | Mechanism |
|---|---|---|
| Strict | **No.** Endpoint-state federation suffices by [`federation-convergence`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md). | Closure-merge commutation; no ordering primitive. |
| Scott-continuous | **No.** Same. | Same. |
| Transfinite-bounded | **Yes, on trajectory increments only.** | `(peer-id, substrate-ordinal)` lexicographic; ties by canonical-form hash. |
| Aperiodic | **Yes, on trajectory increments only.** | Same. |

The captain question's framing — "the substrate's options reduce to three" — is wrong on the theory's terms: in strict and Scott-continuous regimes there is no question (per Fact A), and in the transfinite-bounded and aperiodic regimes the question is about labeling trajectory increments (not about ordering substrate outcomes), and is settled by the existing hash-injectivity theorem.

The captain decision the question really demands is therefore not "N vs O vs P" but a different one: **does the v0.4 federation slice support transfinite-bounded / aperiodic federation at all, or is v0.4 federation restricted to the Scott-continuous prefix?** That is a scoping decision, not an algebraic decision, and it is a captain prerogative the theory does not pre-empt.

### §1.4. Math-side authoring proposal

To discharge this site cleanly the library would gain one theorem and zero new objects:

- **theorem `cross-peer-trajectory-ordering-is-content-addressed`** (predicated-computing/theorems/).
  Claim: in transfinite-bounded and aperiodic regimes, the cross-peer ordering on trajectory increments needed for [`federation-convergence`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md) §"Regime hypotheses" is uniquely determined by `(peer-id, substrate-ordinal)` lexicographic with canonical-form-hash tie-break, and this ordering reproduces the same final $H^1$ pattern as any extension to a total order.
  Depends-on: `federation-convergence`, `hash-injectivity-under-canonical-form`, `time-and-event-ordinals`, `monotonic-clock-discipline`.
  See-also: `four-regime-dichotomy`.

The theorem discharges the captain question (becomes "the question is theory-determined, not captain-decidable") and replaces option N's mis-naming.
No new object is needed; `regime-record` and the substrate-ordinal concept already exist.

The placeholder-theorem `cross-peer-trajectory-ordering-is-content-addressed` is a **substrate-side** result citing math-side primitives that all already exist; it can be authored without modifying [`predication-categories`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/).

---

## §2. `federation-fuel-as-tensor-distributivity` is a corollary, not a placeholder

Placeholder #1 in [`placeholder-theorems-2026-05-03.md`](placeholder-theorems-2026-05-03.md) cites `theories/.../objects/lawvere-quantale-of-fuel.md` as a math-side anchor. **That object does not exist on disk.** What does exist:

- [`cost-composition-via-lawvere-quantale`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md) — the substrate's cost-composition theorem, anchoring the substrate in the Lawvere quantale $(\mathcal{V}, \otimes, k, \bigvee)$ with v0.2 default carrier $V = [0,\infty]$, tensor $\otimes = +$, unit $k = 0$, joins $\bigvee = \min$ (under the cost-order convention spelled out below);
- [`federation-path-metrics-multiplicative`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-path-metrics-multiplicative.md) — the path-metric multiplicativity theorem;
- [`network-algebraic-contract.md`](../specs/network/network-algebraic-contract.md) §1.3 — the regime-meet at handshake.

The placeholder's content reduces to two facts that any unital quantale supplies by definition: (i) **$\otimes$ preserves arbitrary joins** in each argument (the standard quantale axiom — $a \otimes (\bigvee_i b_i) = \bigvee_i (a \otimes b_i)$ and dually on the left); (ii) **$\otimes$ is monotone** in each argument (immediate from (i): if $b \le b'$ then $a \otimes b \le a \otimes b'$, since $a \otimes b' = a \otimes (b \vee b') = (a \otimes b) \vee (a \otimes b')$).

A note on order convention.
The Lawvere quantale of fuel uses the **cost order**: $r \le_{\mathcal{V}} r'$ iff $r$ is "no worse than" $r'$ — concretely, in the v0.2 default $\mathcal{V} = ([0,\infty], +, 0)$ with the **reversed** real order ($r \le_{\mathcal{V}} r'$ iff $r \ge r'$ as reals), so the join $\bigvee$ in $\mathcal{V}$ is $\min$ as reals and the unit $k = 0$ is the top.
With this orientation $\otimes = +$ does preserve $\bigvee = \min$: $a + \min(b, c) = \min(a + b, a + c)$.
The admissibility statement "cost within envelope" is then $r \le_{\mathcal{V}} E_\rho$, i.e. $r \ge E_\rho$ as reals — the envelope is the **floor** in $\mathcal{V}$ of admissible cost; equivalently the maximum tolerated cost as reals.

### §2.1. Statement of the corollary

**Corollary (federation-fuel-as-tensor-distributivity).** Let $\mathcal{V} = (V, \otimes, k, \bigvee)$ be the substrate's cost quantale per [`cost-composition-via-lawvere-quantale`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md).
Let a federation message traverse a multi-hop relay path $P = (p_1, \ldots, p_n)$ with per-hop fuel costs $r_1, \ldots, r_n \in V$.
Let the regime-meet $\rho$ at handshake (per [`network-algebraic-contract.md`](../specs/network/network-algebraic-contract.md) §1.3) determine the per-hop rate envelope $E_\rho \in V$.
Then:

1. **Path-cost composes hop-wise.** The pre-admit fuel forecast for the path is $\mathrm{forecast}(P) = \bigotimes_{i=1}^{n} r_i$, computable left-to-right (or in any associative order) without consulting the envelope at composition time.
2. **Per-hop admissibility lifts to path admissibility, monotonically.** If every hop is individually admissible — $r_i \le_{\mathcal{V}} E_\rho$ for each $i$ — then by monotonicity of $\otimes$ in each argument (the consequence of join-preservation noted above), $\bigotimes_{i=1}^{n} r_i \;\le_{\mathcal{V}}\; \bigotimes_{i=1}^{n} E_\rho \;=\; E_\rho^{\otimes n}$.
  Equivalently the path-level cost is bounded above (in $\mathcal{V}$'s order) by the $n$-fold $\otimes$-power of the envelope, so the admission decision is **decomposable**: a path passes admission whenever every hop passes its own envelope check, and the path-level forecast then carries the same bound by composition.
3. **Decomposition is one-sided.** The converse does not hold in general: a path-level bound $\bigotimes r_i \le_{\mathcal{V}} E_\rho^{\otimes n}$ does not entail per-hop $r_i \le_{\mathcal{V}} E_\rho$.
  Per-hop admission therefore remains the load-bearing check; the corollary lets the substrate forecast the path-level total cheaply, but does not compress the per-hop checks themselves.

### §2.2. Proof sketch

(1) is [`federation-path-metrics-multiplicative`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-path-metrics-multiplicative.md) restated.
(2) follows by induction on $n$ from monotonicity of $\otimes$: assuming $\bigotimes_{i<n} r_i \le_{\mathcal{V}} \bigotimes_{i<n} E_\rho$ and $r_n \le_{\mathcal{V}} E_\rho$, monotonicity in each argument gives $\bigotimes_{i \le n} r_i = (\bigotimes_{i<n} r_i) \otimes r_n \le_{\mathcal{V}} (\bigotimes_{i<n} E_\rho) \otimes E_\rho = \bigotimes_{i \le n} E_\rho$.
Monotonicity itself is a consequence of the standard quantale axiom that $\otimes$ preserves $\bigvee$ in each argument; no extra hypothesis on $\mathcal{V}$ is required.
(3) is a counterexample observation in the v0.2 default ($+$ on $[0,\infty]$): per-hop $r_i \ge E_\rho$ for each $i$ does not follow from $\sum r_i \ge n E_\rho$ — one cheap hop and one expensive hop can sum within the bound while the expensive hop violates per-hop.
The pre-admit-vs-consume forecast property is per [`network-algebraic-contract.md`](../specs/network/network-algebraic-contract.md) §1.2 ("MUST forecast the multi-hop fold *before* admit, not at consume time").

There is no genuine new structure here — only the standard quantale axiom that $\otimes$ preserves joins (whence $\otimes$ is monotone), applied at the federation surface.
The placeholder's name suggested a substantive theorem; the content is a short corollary about how per-hop admissibility lifts under $\otimes$.

### §2.3. What the placeholder needed but doesn't have

The phantom object `lawvere-quantale-of-fuel.md` was the placeholder's anchor.
The corollary above does not need a new *object* — it needs only the existing theorems plus the standard quantale distributivity.
But for documentation hygiene, an object that names the substrate's choice of quantale would be useful:

- **object proposal `cost-quantale-of-fuel`** (predicated-computing/objects/).
  The substrate-content entity declaring the substrate's $\mathcal{V}$, $\otimes$, $k$, $\bigvee$ structure. v0.2 default $([0,\infty], +, \min, \inf)$.
  Realizes the math-side `lawvere-quantale` (which exists in `predication-categories/objects/`? — to verify).
  Citable by [`closure-rule-system`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/objects/closure-rule-system.md), by `regime-record`, and by every wire spec.
  `version-hash`-able for federation.

This object is the substrate-side container the placeholder intended; calling it `cost-quantale-of-fuel` (or simply `quantale-of-fuel`) and dropping the spurious "lawvere" qualifier (already implicit in the math) sharpens its identity.

### §2.4. Math-side authoring proposal

- **theorem `federation-fuel-as-tensor-distributivity`** (predicated-computing/theorems/).
  State the corollary in §2.1; depends-on `cost-composition-via-lawvere-quantale`, `federation-path-metrics-multiplicative`, `cost-quantale-of-fuel` (new), `network-algebraic-contract` (substrate side), `regime-classification-for-substrate`.
  Class: engineering-claim.
  Status: proved (proof is the §2.2 sketch).
- **object `cost-quantale-of-fuel`** (predicated-computing/objects/).
  As §2.3.

These two entities discharge placeholder #1 and remove the phantom citation from `cost-composition-via-lawvere-quantale.md` (which currently links to a nonexistent file).

---

## §3. The 4-state witness-lifecycle is the regime-determined trajectory

The repair-lifecycle audit ([`repair-lifecycle-grounding-2026-05-03.md`](repair-lifecycle-grounding-2026-05-03.md)) reports that primary theory mandates a 2-state arrow on a witness's lifecycle:

- pre-state: open (input-hash $v_\tau$),
- post-state: settled (output-hash $v_{\tau+1}$, with $v_{\tau+1} \geq_k v_\tau$ per [`closure-driven-settling-monotonicity`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-driven-settling-monotonicity.md)).

The spec [`_patterns/witness-lifecycle.md`](../specs/_patterns/witness-lifecycle.md) (cited by `network-algebraic-contract.md` §1.1) carries a 4-state lifecycle: **open / triaged / repaired / settled**.
The audit treats the discrepancy as primary theory being silent on the intermediate states, requiring a math-side extension to legitimise them.

We argue: **primary theory is not silent — it is regime-uniform, and the 4-state view is the regime-determined trajectory of a single 2-state arrow.** No math-side extension is needed in strict and Scott-continuous regimes; in transfinite-bounded and aperiodic regimes, the 4-state lifecycle becomes the load-bearing trajectory record [`federation-convergence`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md) §"Regime hypotheses" already mandates.

### §3.1. The 4-state lifecycle as a closure-2-monad path

Per [`closure-rule-system-realizes-closure-2-monad`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/closure-rule-system-realizes-closure-2-monad.md), the substrate's settlement is the iteration of the closure 2-monad $\mathrm{Cl}^\mathcal{S}$.
The unit $\eta$ embeds a value in its closure; the multiplication $\mu$ collapses nested closures.
A single witness records one $\eta;\mu$ application — equivalently one closure step — taking $v_\tau$ to $v_{\tau+1}$ via possibly several intermediate sub-applications recorded in the witness's `intermediate-hashes` field (see [`witness`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/objects/witness.md), `Structural fields`, `intermediate-hashes`).

The 4 substrate states correspond to four layers of the closure trajectory:

| Spec state | Closure-2-monad layer | Witness field |
|---|---|---|
| **open** | $v_\tau$ — pre-application valuation | `input-hash` |
| **triaged** | $\eta(v_\tau)$ — embedded in the closure but no rule fired yet | `intermediate-hashes[0]` |
| **repaired** | $\mathrm{Cl}^\mathcal{S}(\eta(v_\tau))$ post one rule-application layer, before the lax-idempotence multiplier $\mu$ collapses to fixed point | `intermediate-hashes[1]` |
| **settled** | $\mu(\mathrm{Cl}^2(v_\tau)) = \mathrm{cl}_p(v_\tau) = v_{\tau+1}$ — fixed point of the closure operator | `output-hash` |

By [`closure-2-monad-lax-idempotence`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md) (Kelly–Lack property-likeness), the trajectory's intermediate states are equivalent to the endpoint *up to canonical iso* — being settled is a property of the valuation, not extra structural data.
Hence the 4-state view is **trajectory information**, not new structure: it records the path the closure took, but the only externally observable claim is the endpoint's $\geq_k$-monotone arrow from `open` to `settled`.

### §3.2. When the trajectory is load-bearing

[`federation-convergence`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md) §"Regime hypotheses" is unambiguous about when trajectory information is load-bearing:

- **Strict and Scott-continuous regimes.** Federation can ship endpoint state alone; the trajectory is observable but not required for cross-substrate convergence.
  The 4-state lifecycle is **engineering ergonomics** — it gives auditors and operators visibility into where in the closure-step a long-running rule is — without changing the substrate's correctness algebra.
- **Transfinite-bounded and aperiodic regimes.** Federation must ship trajectory; otherwise the $H^1$ cohomological invariant is lost (per `federation-convergence` §"What the theorem rules out", bullet 4).
  The 4-state lifecycle becomes **load-bearing**: each intermediate state is a non-Scott-continuous firing ordinal that contributes a $\mathbb{Z}$-generator to $H^1$ of the merged settling, and federation that elides it loses MLD-class-distinguishing structure.

The audit's framing — "primary theory mandates 2-state, spec carries 4-state, gap" — is a regime-uniform reading of a regime-stratified situation.
The published theory mandates 2-state **at the endpoint-state level** (which is what `closure-driven-settling-monotonicity` is about) and mandates trajectory **at the regime-conditional federation level** (which is what `federation-convergence` §"Regime hypotheses" is about).
The 4-state spec is consistent with both.

### §3.3. Engineering consequence

Two consequences for the dev plan:

- **No primary-theory extension is needed to legitimise the 4-state lifecycle.** The witness object's existing `intermediate-hashes` field (per [`witness`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/objects/witness.md)) is the substrate-side container for the 4-state record; the lifecycle pattern in [`_patterns/witness-lifecycle.md`](../specs/_patterns/witness-lifecycle.md) is a substrate-engineering convention on which intermediate hashes get named which spec-state, not a math claim.
- **The 4-state lifecycle's load-bearingness is regime-conditional.** A v0.2b substrate restricted to Scott-continuous regime can implement the 4-state lifecycle as observability-only.
  A v0.4 federation slice that admits transfinite-bounded peers must enforce the 4-state lifecycle as substrate-content (the trajectory must be in the federated witness, not just the endpoint), per `federation-convergence` §"What the theorem rules out".

This sharpens the repair-lifecycle audit's recommendation.
The audit suggested authoring a math-side theorem to legitimise the 4-state lifecycle.
The right authoring is not a legitimisation theorem but a **regime-conditional federation rule**:

### §3.4. Math-side authoring proposal

- **theorem `witness-lifecycle-trajectory-is-regime-conditional-federation-content`** (predicated-computing/theorems/).
  Claim: in strict and Scott-continuous regimes, a witness's `intermediate-hashes` field is engineering-observability content; in transfinite-bounded and aperiodic regimes, it is load-bearing federation content per [`federation-convergence`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md).
  Depends-on: `federation-convergence`, `closure-rule-system-realizes-closure-2-monad`, `closure-2-monad-lax-idempotence` (math-side), `witness` (substrate-side object), `four-regime-dichotomy`.
  Class: engineering-claim.
  Status: proved (proof is the §3.1 + §3.2 argument).

The theorem discharges placeholder #4 (`witness-as-cell` per the placeholder-theorem audit), removes the repair-lifecycle audit's claimed gap, and explicitly closes the regime-conditional federation loop.

---

## §4. Summary

Three sites; in all three, the dev plan's question about theory-side silence is answerable from existing theory once the right citations are made:

| Site | Audit claim | Theory-side finding | Math authoring needed |
|---|---|---|---|
| §1 cross-peer clock-meet | "captain decision between N/O/P" | Theory determines: trivial in strict/Scott-cont; content-addressed trajectory tagging in tb/aperiodic. P refused by `monotonic-clock-discipline`. N as written is mis-named. | One theorem (`cross-peer-trajectory-ordering-is-content-addressed`). |
| §2 federation-fuel-as-tensor-distributivity | "placeholder needs phantom object `lawvere-quantale-of-fuel`" | Corollary of `cost-composition-via-lawvere-quantale` + `federation-path-metrics-multiplicative` + standard quantale distributivity. | One theorem + one object (`cost-quantale-of-fuel`). |
| §3 witness-lifecycle 4-state vs 2-state | "primary theory silent on intermediate states" | Primary theory is regime-uniform; 4-state is the regime-determined trajectory under `closure-rule-system-realizes-closure-2-monad`. Load-bearing in tb/aperiodic only. | One theorem (`witness-lifecycle-trajectory-is-regime-conditional-federation-content`). |

Three theorems, one object — all substrate-side, all citing existing math-side primitives.
No edits required to [`predication-categories/`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/).
The corresponding placeholder-theorem audit entries are dischargeable by authoring these in [`predicated-computing/theorems/`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/) and [`predicated-computing/objects/`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/objects/).

The captain-side observations:

1. The cross-peer clock-meet question's framing should be revisited; the question the captain is actually being asked is the v0.4 federation-scope question (does v0.4 admit transfinite-bounded peers?), not the algebraic question.
2. The placeholder-theorem #1 citation `lawvere-quantale-of-fuel.md` should be repaired (either author the proposed `cost-quantale-of-fuel` object or rewrite the placeholder to cite [`cost-composition-via-lawvere-quantale`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md) directly).
3. The repair-lifecycle audit's "primary theory silent" framing should be re-examined under the regime-stratified reading; the substrate is conformant under existing theory in the regimes v0.2b targets.

## §5. Cross-references

- [`placeholder-theorems-2026-05-03.md`](placeholder-theorems-2026-05-03.md) — the placeholder audit; this note discharges entries #1 and #4.
- [`repair-lifecycle-grounding-2026-05-03.md`](repair-lifecycle-grounding-2026-05-03.md) — the repair-lifecycle audit; §3 above re-frames its central finding.
- [`../questions/v0.4-cross-peer-clock-meet.md`](../questions/v0.4-cross-peer-clock-meet.md) — the captain question §1 re-frames.
- [`../specs/network/network-algebraic-contract.md`](../specs/network/network-algebraic-contract.md) — the spec §1.3 and §2 cite.
- [`../specs/_patterns/witness-lifecycle.md`](../specs/_patterns/witness-lifecycle.md) — the spec pattern §3 grounds.
- Library entry-points cited throughout:
  - [`predicated-computing/theorems/federation-convergence.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md)
  - [`predicated-computing/theorems/monotonic-clock-discipline.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/monotonic-clock-discipline.md)
  - [`predicated-computing/theorems/cost-composition-via-lawvere-quantale.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-composition-via-lawvere-quantale.md)
  - [`predicated-computing/theorems/federation-path-metrics-multiplicative.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-path-metrics-multiplicative.md)
  - [`predicated-computing/theorems/regime-classification-for-substrate.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/regime-classification-for-substrate.md)
  - [`predicated-computing/theorems/closure-rule-system-realizes-closure-2-monad.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/closure-rule-system-realizes-closure-2-monad.md)
  - [`predicated-computing/theorems/hash-injectivity-under-canonical-form.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md)
  - [`predicated-computing/objects/witness.md`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/objects/witness.md)
  - [`predication-categories/theorems/closure-2-monad-lax-idempotence.md`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md)
  - [`predication-categories/theorems/closure-driven-settling-monotonicity.md`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-driven-settling-monotonicity.md)
