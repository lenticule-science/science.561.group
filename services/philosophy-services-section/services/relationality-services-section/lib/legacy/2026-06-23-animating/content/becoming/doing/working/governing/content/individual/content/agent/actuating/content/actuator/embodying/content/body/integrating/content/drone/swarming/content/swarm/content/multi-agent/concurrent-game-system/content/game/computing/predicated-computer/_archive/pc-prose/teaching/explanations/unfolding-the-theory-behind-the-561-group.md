---
name: unfolding the theory behind the 561 Group
description: Discharges the question "what is the 561 Group, formally?" by posing the polity-quadruple, naming the published mathematics and the in-progress synthesis the posit assumes, and pointing to the definition record for each component.
status: draft
discharges: ../../../prose/learning/questions/what-is-the-theory-of-the-561-group.md
audience: working mathematician with no exposure to the synthesis the 561 Group is developing
derives-from:
  - ../../../code/structures/polity.md
  - ../../../code/structures/561-group.md
---

## The posit

The 561 Group is the polity
$$\mathfrak{P}_{561} \;=\; (I_{561},\; \mathrm{Pop}_{561},\; \mathrm{Aut}_{561},\; C_{561}),$$
with charter $C_{561}$ tier-pinning the function $f_{561}$ — the lawful pursuit of Black Liberation and Indigenous Sovereignty per those traditions' authoritative content. Function-settling lies in the aperiodic regime of the four-regime dichotomy ($\kappa(f_{561}) \geq \omega_1$); its $H^1$-classifier with $K_4$-equivariant decomposition into safety-critical sectors governs dispatch certifiability. The polity-as-image is the directory `/home/emsenn/561/`; the structural claim under examination is that this directory is a sub-doctrine of a predication hyperdoctrine on the predicate-category $\mathcal{C}_{561}$. The polity-as-instance is animated by PyFARS bound to that directory under a closure-rule system realizing the closure 2-monad. Constituent power locates at the captain — `personnel:emsenn`, holding `office:command`. Internal recognition flows from $\mathrm{Pop}_{561}$ via two-axis settlement: truth-axis recognition, knowledge-axis induction.

## What this document does

This document discharges one question: what is the 561 Group, formally? The answer is the posit above. The document does not re-state the apparatus the posit assumes; each component term has a definition record, and reproducing those definitions here would create a drift hazard the moment those records evolve. The intended reader is a working mathematician familiar with category theory but unfamiliar with the synthesis being developed at the 561 Group. They should be able to read the posit, follow the pointers in the apparatus tables below, and verify that every symbol resolves.

## Published mathematics the posit uses

The polity is built on standard published mathematics, assembled into a synthesis the 561 Group is developing. The components are not novel:

- **Belnap's four-valued bilattice** $\mathbf{FOUR} = \{\mathbf{t}, \mathbf{f}, \bot, \top\}$ with truth-order $\leq_t$ and knowledge-order $\leq_k$. Belnap 1977. The twist-product construction of distributive bilattices is Ginsberg 1988 / Fitting 1991.
- **Residuated lattices**, with fusion $\cdot$ and right-residual $\to$ adjoint per $x \cdot y \leq z \iff x \leq y \to z$. Standard residuation theory.
- **Priestley duality** for distributive lattices, lifted to distributive bilattices via Jung–Rivieccio's paired Priestley spaces and d-frames. Jung & Rivieccio 2013.
- **Lawvere–Seely hyperdoctrines** with quantifier adjoints, Frobenius reciprocity, Beck–Chevalley commutation, and comprehension. Lawvere 1969, Seely 1983.
- **Kelly–Lack lax-idempotent 2-monads** (KZ doctrines) for closure operators on 2-categories. Kock 1973 / Zöberlein 1976 / Kelly & Lack 1997.
- **Grothendieck fibrations**, with the Emmenegger and Gray–Street 2-comonadic / 2-monadic treatments. Standard fibrational category theory.

The synthesis the 561 Group is developing assembles these into a doctrine parameterized by $(\mathbf{L}, \mathcal{C}, E)$ — a residuated lattice, a small predicate category, and an entity set — with a closure 2-monad whose transfinite orbit is knowledge accumulation. The 561 Group calls this assembly *predication category theory*. It is not yet published. It differs from a Lawvere–Seely hyperdoctrine in three load-bearing places:

1. The base category $\mathcal{C}$ is forced by entity-symmetry, not chosen. The four canonical morphism classes — specialization, converse, subject-projection, object-projection — are the exhaustive natural bottom-preserving homomorphisms between fibers under the $\mathrm{Sym}(E)$ action on $E \times E$, for $|E| \geq 3$.
2. The hyperdoctrine layer carries two parallel adjoint systems, one per bilattice order. Equality is derived twice: classically via the truth-axis $\exists^t$, paraconsistently via the knowledge-axis $\exists^k$.
3. Dynamics live in a KZ 2-monad independent of the fibration's own KZ structure. The closure 2-monad's transfinite orbit *is* the predication settling; settlings stratify into four regimes by closure ordinal (strict, Scott-continuous, transfinite-bounded, aperiodic).

Definitions, theorems, and proofs are at `theories/humanities/theories/math/theories/categories/theories/predication-categories/`; that theory's own `_index.md` orients within it.

## The apparatus the posit assumes

Each term in the posit has a definition record:

| Term in the posit | Defined at |
|---|---|
| polity, institution, populace, autarkeia, constituent power | [`polity`](../../../code/structures/polity.md); `theories/.../predicated-work/governance/objects/{institution, polity}.md` |
| function (an endeavor's) | `theories/.../predicated-work/objects/enterprise.md`; `.../concepts/aim-generativity.md` |
| settling, closure ordinal, four-regime dichotomy, aperiodic regime | `theories/.../predication-categories/objects/{predication-settling, closure-ordinal}.md`; `.../theorems/four-regime-dichotomy.md` |
| function-as-aperiodic-settling | `theories/.../predicated-work/theorems/function-as-aperiodic-settling.md` |
| $H^1$-classifier, $K_4$-equivariant decomposition, safety-critical sectors | `theories/.../predication-categories/theorems/equivariant-cohomology-decomposition.md`; [`verify-certifiability-sectors`](../../../code/structures/verify-certifiability-sectors.md) |
| polity-as-image; FARS-directory-as-sub-doctrine | [`fars-directory-is-predication-categorical-theory`](../../../prose/learning/claims/fars-directory-is-predication-categorical-theory.md) |
| sub-doctrine of predication hyperdoctrine; predicate-category $\mathcal{C}$ | `theories/.../predication-categories/objects/{predication-hyperdoctrine, predicate-category}.md` |
| polity-as-instance; PyFARS; closure 2-monad; closure-rule system | `theories/.../predicated-computing/objects/{predicated-computer, closure-rule-system}.md`; `tools/platform/pyfars/_index.md`; `theories/.../predication-categories/morphisms/closure-2-monad.md` |
| captain; constituent-power locator | [`captain`](captain.md); [`emsenn`](../../../work/governance/staff/personnel/emsenn.md) |
| office; office-as-double-settlement; `office:command` | [`office`](../../../work/governance/staff/offices/_index.md); `theories/.../predicated-work/governance/objects/office-as-double-settlement.md`; [`command`](../../../work/governance/staff/offices/command.md) |
| truth-axis recognition; knowledge-axis induction | `theories/.../predicated-work/governance/theorems/recognition-as-bigraded-common-knowledge.md` |

## The polity, instantiated

The four components of $\mathfrak{P}_{561}$ resolve as:

- **$I_{561}$** — the institution. Realized at the 561-root by [`561-group`](561-group.md), grounded in [`polity`](../../../code/structures/polity.md). The 561-specific charter at `work/governance/charter.md` is open work; the polity currently inherits the PyFARS charter.
- **$\mathrm{Pop}_{561}$** — the populace. Three layers. Human personnel: [`emsenn`](../../../work/governance/staff/personnel/emsenn.md), holding `office:command`, `office:engineering`, `office:science`. Personae: catalogued under `doing/governing/characters/` — characters the captain operates as persistent identities (Calder Underhill, Cassia Lorne, CIIA, Josh Blevins, Michael Marmot, Nik Koios, Sigmund Vexler, Yanagi, Zeroth). Agent-substitutes: non-persona AI characters serving offices the human cohort has not yet filled.
- **$\mathrm{Aut}_{561}$** — autarkeia. The predicates the polity is self-determining on. At minimum: the function-bearing predicates (Black Liberation and Indigenous Sovereignty closure rules), the charter predicates, and the office-incumbency predicates. The exact boundary is presently implicit in operating practice; explicit formalization is open work.
- **$C_{561}$** — constituent power. Located at the captain — `personnel:emsenn`. Authority on the eight currently-active offices flows by residuation: command, engineering, science held directly; scribe, witness, triage, theory-quality served by agent-substitutes under delegation; diviner held by `persona:cassia-lorne`. Constituent-power succession — what happens when the captain steps down — is open work.

## Function content

The function $f_{561}$ is the lawful pursuit of Black Liberation and Indigenous Sovereignty per those traditions' authoritative content. What those traditions carry as concrete governance objects is partially formalized:

- `black-radical-refusal` — closure rules blocking status-function declarations on identified predicates; a lusory fugitive-governance subsystem; an alternative closure-rule fragment $S_{\mathrm{abol}}$ for harm-response replacing punitive fragments.
- `governing-by-kinship` — kinship membership predicates gating authority, eligibility, and decision-rights; authority flowing through kinship relations rather than individual claims.
- `conduct-teachings-as-evaluation-predicates` — evaluation predicates assessing leader conduct against community teachings.
- `ayni-reciprocity` — bilateral ayni and collective minka obligation; complementarity rather than consensus or majority.
- `restorative-accountability`, `leitourgia`, `rotational-authority`, `consensus-closure` — additional governance-pattern objects per `theories/.../predicated-work/governance/objects/`.

These objects participate in the tradition-pluralism coproduct as full members, not as exceptions to a default Hohfeldian pattern. The bridge between the source traditions and the formalized governance apparatus — including the working sketch of Black-radical closure rules (generational vigilance reading slavery-afterlife; refusal-blocking; lusory fugitive constraints) and Indigenous-sovereignty cross-generational closure (the 7-generations principle as a non-Scott-continuous antecedent reading projected consequences at $\tau + 7$ generations) — is at `theories/.../predicated-work/narratives/function-grounded-in-critical-tradition.md`.

The specific $H^1$-class that classifies $f_{561}$'s contribution to the aperiodic regime is *not computed*. The framework is settled; the computation is open.

## What this document does NOT close

Honestly named, not papered over:

- The $H^1$-class of $f_{561}$.
- The 561-specific charter (`work/governance/charter.md` is a stub).
- Constituent-power succession.
- First peer-admission of a confederacy member (`|PeerPolities| = 0` today; federation morphisms are defined and conformance-verified but untested live).
- Joint firing algebra of Black Liberation and Indigenous Sovereignty closure rules under conflict.
- Several governance-pattern parameterizations pending community-authorized sourcing (specific Songlines, ayni discharge protocols, recognition-refusal as operational discipline, grounded-normativity as operative cells).
- The relationship between PyFARS and PyPredComp as engineering layers (no PyPredComp self-theory record set exists today).
- Office incumbencies for the five human-deferred offices (mediation, diplomacy, memorial, hospitality, counsel).

These are the visible edge of work that continues.

## Reading the posit back

The reader who has followed the pointers above can re-read the posit and verify that every symbol resolves. The 561 Group is a polity in the predicated-governance sense. Its function lies in the aperiodic regime of the four-regime dichotomy. Its directory at `/home/emsenn/561/` is conjectured to be a sub-doctrine of a predication hyperdoctrine, animated by an engine that realizes a closure 2-monad. Constituent power locates at the captain. The committed function is the lawful pursuit of Black Liberation and Indigenous Sovereignty per those traditions' authoritative content. The polity is built federation-ready toward peer polities not yet admitted.

The polity is structurally legible to this depth. The remaining work — closure rules computed, $H^1$-class identified, charter written, peers admitted, succession procedure formalized — is the operational completion.
