---
title: "CapCell: The AP+EVM Standard the Union's Agentic Orchestration Platform Is Built From"
description: "Synthesizes today's convergent sessions into one settled charter: a Capability Cell is an independently identifiable service whose declared, evolving protocol bindings can be verified independently. Formalizes the CapCell manifest as a mathematical object (face-observation map, cell identity as an injective hash of SKU+law+controller, manifest revision as a non-injective section over it), per-face identity binding, the allosteric binding-site/active-site typing, and an explicit cost inequality for when to Analyze before Execute — grounded throughout in files verified on disk today."
date-created: 2026-07-25
kind: research-note
in-service-of: lib/emsenn/services/561-group/services/board-of-directors/services/executive-office/services/leader-movement-team
tags:
  - capcell
  - capability-cell
  - activitypub
  - evm
  - a2a
  - x402
  - did
  - caip-10
  - mape-k
  - agentic-orchestration
  - obsmetrologia
  - allostery
  - galois-connection
status: design
declared-by: claude-interactive-session-supplying-leader-movement-team
---

# CapCell: The AP+EVM Standard the Union's Agentic Orchestration Platform Is Built From

## 0. What this note is

Today's sessions (Claude and Codex, interleaved, `2026-07-25-leader-movement-team-leader-speech.jsonl`)
converged on one governing definition and restated it with increasing precision at least four
times before either session wrote it to a file. This note states that definition, its mathematics,
and the repository substrate it already touches. Claims below come from three sources: the Leader's
or an agent's own words in today's transcript, reproduced faithfully; definitions and theorems
already on disk in `Obsmetrologia/Language/Predicating/HyperdoctrineDual.lean` and neighboring
modules, stated here as mathematics; and files verified on disk today, cited by path.

## 1. The governing definition

A Capability Cell is not a script with a schema attached, a package with aspirations, or a bundle of
unrelated capabilities. It realizes exactly one independently purchasable capability.

## 2. The actual mathematics of "AP is knowledge, EVM is truth"

This is the substance, not a pointer to it.

**The order-swap involution.** `Charge` is a four-corner value type `{⊥, t, f, ⊤}` carrying two
distinct preorders: a *knowledge order* `≤ₖ` (information accumulates; a value only moves up under
new evidence, never retracts) and a *truth order* `≤ₜ` (a disposition that can be revised —
overwritten by a later, better-informed transition). `σ : Charge → Charge` is an involution
(`σ ∘ σ = id`) with one defining property, lifted pointwise to whole valuations `v : Formula →
Charge`:

```text
leK v w  ↔  leT (σ v) (σ w)          (valSwap_leK_leT)
```

That is: `σ` is not a relabeling. It is an order isomorphism that carries the entire knowledge-order
structure onto the entire truth-order structure. Anything true about `≤ₖ` becomes, under `σ`, a
true statement about `≤ₜ`, and the translation is mechanical, not case-by-case.

**Galois connections transport for free.** A Galois connection `L ⊣ R` in an order `≤` is the
adjunction `L(v) ≤ w ↔ v ≤ R(w)`. Define `conj(L) := σ ∘ L ∘ σ`. Then:

```text
GaloisK L R  →  GaloisT (conj L) (conj R)          (galoisK_to_galoisT)
```

Every `≤ₖ` adjunction theorem yields a matching `≤ₜ` adjunction theorem by conjugating through `σ`
— not by re-deriving it. Instantiated at the fiber quantifiers, this gives the dual triple `∃ᵗ_f ⊣
f* ⊣ ∀ᵗ_f` in `≤ₜ` as literally `σ ∘ (∃_f ⊣ f* ⊣ ∀_f) ∘ σ`, and the transported triple is *equal
to*, not merely analogous to, the independently built truth-order quantifier system:
`existsT F = conj (existsF F)`, `forallT F = conj (forallF F)` (`dual_adjoint_system`). The same
move produces two equalities from one diagonal: the classical (truth-valued, `t`/`f`) and
paraconsistent (knowledge-valued, `⊤`/`⊥`) equality predicates are both pushforwards of the *same*
diagonal `s = o` through the two adjoint systems, related by `classicalEq = σ ∘ paraconsistentEq`
(`two_equalities_one_diagonal`). One relation, two orders, two readings, one conjugation — not two
unrelated definitions that happen to resemble each other.

**AP and EVM are this same pair, one level up.** ActivityPub's outbox is append-only: an actor's
claims accumulate and are never retracted at the protocol level — the knowledge order `≤ₖ`. An EVM
chain's `stateRoot` is the current, revisable disposition under a transition function — the truth
order `≤ₜ`. `2026-07-24-the-union-evm-chain-as-a-folding-protein.md` already reads exactly this pair
*inside* one EVM chain, between its own log (history, `≤ₖ`) and its own state (`stateRoot`, `≤ₜ`),
citing the lemmas above. The CapCell claim reads the identical pair one level up, from (log, state)
inside a chain to (ActivityPub, EVM) across two protocols:

```text
knowledge order ≤ₖ  ↔  AP outbox (accumulating, federated claims)
truth order    ≤ₜ  ↔  EVM state (current, settled disposition)
```

`σ` and the `≤ₖ`/`≤ₜ` duality are one mathematical object; the intra-chain log/state pair and the
inter-protocol AP/EVM pair are two perspectives onto that same object, met at two depths, the way
the corpus's own quartet recurrence (§3b) meets one coherence cell at the articulating depth and at
aperiodic settling. No Lean module formalizes the ActivityPub or EVM protocols themselves —
`valSwap_leK_leT` and `galoisK_to_galoisT` are theorems about `Charge` and `Valuation`, checked once
at the intra-chain depth. The AP/EVM reading applies that same checked structure at the
protocol-pair depth, the way `twistoring_eq_commutating` (§3b) applies one checked coherence cell at
two depths without re-proving it at each.

A CapCell without
an AP face has no accumulating, discoverable knowledge trail — no `≤ₖ` carrier. A CapCell without
an EVM face has no settled, currently-actionable disposition — no `≤ₜ` carrier. Either alone is an
unrealized component, not a weaker cell — stated in the skill file (§1) and independently by the
Leader: "AP-only, EVM-only, or local-only objects are unrealized components or candidates, not
weaker kinds of Capability Cell."

**A proved asymmetry that sharpens rather than weakens this.** `FiberAlgebra.lean`'s
`cross_order_not_knowledge_nucleus` proves a truth-order closure is **not** a knowledge-order
nucleus — raising a valuation's truth-status does not raise its knowledge-status. Applied here: an
EVM state transition settling (truth, `≤ₜ`) does **not** by itself constitute AP knowledge
(`≤ₖ`) of that settlement — the EVM face being `bound` never substitutes for the AP face's own
independent accumulation. This is the exact reason §1's requirement is a conjunction of two
*independent* faces (§4) rather than one face implying the other; the proved non-implication is
what makes requiring both non-redundant, not merely thorough.

**The K₄ closure result behind "never substitute a parent's carrier."** `Four.lean` proves the full
symmetry group of `Charge` is exactly the Klein four-group `K₄ = {id, negate, conflate,
negate∘conflate}`, each element an involution, the group proved closed —
`Articulating.Corner.card_eq_four` derives exactly four articulation cells from this. Substituting
a parent cell's carrier for a missing child's, per the north-star charter's explicit prohibition, is
"not an instance of `negate`, `conflate`, or their composite... it is leaving the lattice and
relabeling" — a proved closure result, not a style preference, is what makes that specific
substitution illegal rather than merely discouraged.

## 3. The manifest as a mathematical object

Let `faces(c)` be the finite, revision-specific set of names declared by a cell `c`; it is not
globally fixed. A **manifest observation** is a map over those declarations that records `bound`
or `invalid` for each claimed face. A caller may separately state the bindings required for its
own decision; an undeclared requirement is unsatisfied.

**Cell identity is an injective-in-practice hash of a triple, never a hash of an address.** Fix a
collision-resistant hash `H` (RMN's `ni:///sha-256;…`). Given a SKU identity `s` (price-free
product description), a capability-law identity `ℓ` (behavioral contract), and a sovereign
controller `κ` (a DID or address):

```text
CellId(s, ℓ, κ) := H(s, ℓ, κ)
```

Two cells share an identity iff they share all three coordinates exactly — this is the skill
file's rule made explicit: "the stable cell identity is the canonical RMN identity of exactly the
SKU, capability law identity, and sovereign controller."

**Manifest revision is a section over CellId, not a coordinate of it.** Let `Addr` be the type of a
face-address tuple (npm coordinate, repo URL, AP actor URI, Agent Card URL, MCP endpoint, x402
resource, CAIP-10 account) paired with a revision number `n`. There is a map

```text
addresses : CellId × ℕ → Addr
```

and, critically, `addresses` is *not* injective into `CellId` — many `(CellId, n)` pairs, hence
many `Addr` values, project onto the same `CellId`. Changing a hostname changes the manifest
revision `n`, never `s`, `ℓ`, `κ`, or `CellId(s,ℓ,κ)`. A cell does not reincarnate when its address
changes. **Offer** is a further, still-non-identity-affecting tuple `(CellId, price, expiry,
authorization)` — expiring, revisable, and, like `Addr`, projecting onto a fixed `CellId` without
altering it. JSON documents that carry any of `obsc`, `Addr`, or an offer are projections for
protocols that require JSON; they are not a second source of truth for `CellId`.

## 4. Per-face identity binding with an explicit soundness claim

No Cell Identity Verifier implementing this exists on disk yet (§5); this is the verification
predicate it must compute. Root identity is `did:pkh:eip155:<chainId>:<address>` — a DID wrapping a CAIP-10
account, so an EVM binding may be one of a cell's declared proofs. Binding a claimed cell means
evaluating an independent checker for each declared or caller-required face:

```text
bound(κ, required) :≡  ∧_{f ∈ required} Verify_f(κ)
```

Each declared checker is evaluated against the verification primitive appropriate to that face.
Independent required bindings strengthen the caller's decision without imposing a global count or
closed protocol vocabulary on every cell.

## 3b. Twistoring = commutating: the corpus's own theorem, not an import

Beck–Chevalley (§4b) is received math, an external comparison. Obsmetrologia's own house law states
received comparisons are generated from the corpus's derivation, not the reverse. The corpus's own
proof of the AP/EVM-shaped duality does not go through Beck–Chevalley at all.

`Obsmetrologia.Language.Positing.Quartet` defines one generic structure, the recurring coherence
2-cell:

```text
structure CommutingPair (C : Type) where
  f g : C → C
  comm : ∀ a, f (g a) = g (f a)
```

and instantiates it twice, at two depths the corpus's spine (articulating → predicating → positing
→ settling) passes through:

- **`twistoringPair`**, at the articulating birth-corner, on `Charge` (the four-corner value type):
  `f = negate` (∼), `g = conflate` (−), commuting by the Klein-four group law `K₄`
  (`Charge.negate_conflate_comm`) — two involutions.
- **`commutatingPair`**, at aperiodic settling, on a Heyting algebra `H`: `f = j₁` (saturating, the
  past-facing nucleus σ), `g = j₂` (transferring, the future-facing nucleus Δ), commuting by the
  nuclear square `Q.comm` — two idempotent nuclei, not involutions.

`twistoring_eq_commutating` packages both as the *same* `CommutingPair`, proved by one generic lemma
(`CommutingPair.square`) applied twice — not two similar-looking facts, one carrier and one lemma met
at two depths. The depth-specific laws differ (involution at articulating, idempotent nucleus at
settling) and are deliberately excluded from the shared cell; only the commuting square itself
recurs.

This is keyed to the aperiodic regime specifically, and that keying is also proved, in a neighboring
module: `Obsmetrologia.Closure.Monad.KZ` promotes the settling closure operator `Cl` to a
Kock–Zöberlein (lax-idempotent) 2-monad and proves `strict_regime_mu_identity` — in the strict
(`κ<ω`) and Scott (`κ=ω`) regimes the monad's multiplication `μ` is forced to the identity (strict
idempotence collapses the laxness to nothing); `μ` carries genuine non-identity content only in the
transfinite-bounded and aperiodic regimes. So: KZ-laxness is trivial everywhere except the same
aperiodic corner where `commutating`'s nuclear square is the nontrivial half of `twistoring_eq_commutating`
— aperiodicity, KZ lax idempotence, and the twistoring/commutating coherence cell are readings of one
regime-keyed structure, proved in obsmetrologia's own terms, not three things I am gluing together
by analogy.

`beck_chevalley_dual` (`HyperdoctrineDual.lean`) is the same shape of condition — two endomaps
commuting — applied to fiber reindexing, proved order-free: it holds unconditionally in every
regime, strict through aperiodic alike. It is a separate proved fact about the same commuting-square
shape at a third site, not packaged into `TwistoringEqCommutating` alongside `twistoringPair`/
`commutatingPair`. §4b's justification for parameterizing over chain ID rests on `beck_chevalley_dual`
directly.

## 4b. Why parameterize, not hardcode — Beck–Chevalley, not just good practice

Today's directive — "the more parameterized you can make things the better... if our code does not
hardcode a chain address like 5615610, but makes that a parameter, then ANYONE with ANY chain can
suddenly find value in the capability" — is a restriction (reindexing) argument, and it has a
commutation law behind it, not only a taste for generality.

A pinout declaration restricts a cell's full capability space along a base map — exactly hyperdoctrine
reindexing `f* : Valuation(base) → Valuation(fiber)`. Declaring "this cell operates over parameter
`p`" (a chain ID, a denomination, a controller) is choosing one such `f`. Two independent
parameterizations — say, restricting along chain ID `r` and restricting along capability profile
`s` — are independent base maps, and if they commute as maps (`s ∘ r = r ∘ s`, true whenever the two
parameters are genuinely orthogonal choices), then:

```text
conj(reindex r) ∘ conj(reindex s) = conj(reindex s) ∘ conj(reindex r)     (beck_chevalley_dual)
```

reindexing along `r` then `s` yields the same fiber as `s` then `r`. Applied plainly: a cell
parameterized over chain ID and separately parameterized over capability profile gives the identical
specialized cell regardless of which parameter is bound first or by whom. That is precisely the
property "ANYONE with ANY chain can find value in the capability" needs to be true rather than merely
hoped: if fixing the chain parameter changed *which* capability-profile fiber you land in (order
mattered), a chain-agnostic capability author and a chain-specific deployer could not safely work in
either order, and "parameterize instead of hardcoding" would not actually decouple them. Beck–Chevalley
is the reason hardcoding is the error, not just the inelegance: a hardcoded constant is a base map with
no partner to commute with, forcing one fixed order — the *only* order — into the artifact permanently.

## 4c. Why offer terms can be computed at the cell or at one pinout — Frobenius reciprocity

Meet-Frobenius, in both orders (`frobenius_dual`, its σ-conjugate witness `frobenius_dual_is_transport`):

```text
∃_f(f*α ∧ φ) = α ∧ ∃_f φ
```

Read `α` as terms fixed at the outer, unrestricted cell level (price, authorization, expiry — §3's
`offer` tuple) and `φ` as a constraint living inside one restricted pinout's fiber (an x402 resource's
own terms, an A2A skill's own input mode). Frobenius says pulling `α` into the pinout's restricted
scope, combining with `φ` there, then pushing the result back out (`f*α ∧ φ`, pushed by `∃_f`) equals
combining `α` with the already-pushed-out `φ` directly at the outer scope (`α ∧ ∃_f φ`). Either
computation path gives the same offer. This is what licenses §3's manifest/offer split to be computed
lazily, at whichever scope is convenient (validate a pinout's own terms locally; or roll everything up
to the cell's outer offer) — without that guarantee, "an x402-priced offer for boundary-crossing work"
declared inside one pinout and the cell's own advertised offer could silently diverge depending on
which scope happened to compute first.

## 5. Evolving faces and where the binding design still needs an implementation

A face is a named, independently observable binding declared by a particular manifest. Protocols
such as npm, GitHub, ActivityPub, A2A, MCP, x402, and EVM remain useful independent capabilities,
but no list of them defines a cell or bounds later protocols.

§4's conjunction is the target the existing, cruder assay
(`blockchain-services-section/lib/capability-cell.mjs`, described in
`2026-07-24-capability-cells-and-emergency-repair-discipline.md` as checking directory population
rather than witnessed evidence) should be repaired *toward*. No Cell Identity
Verifier implementing §4 exists on disk yet; this is the concrete next artifact, not a restatement
of governance.

Every cell found in §6 pairs its EVM account with a live A2A face, and the skill file's own
required instruments (§8) provision A2A registration alongside the chain account for every cell they
fabricate — a cell with AP+EVM bound and no A2A face has never been fabricated here and has no
invocation path anyone has used.

## 6. What is already real on disk — not design, verified

`lib/emsenn/services/561-group/services/red-cup-engineering/services/web-services-section/services/capability-marketplace-services-section/services/federated-capability-offer-discovery-cell/content/agent-cards/federated-capability-offer-discovery-cell.json`
instantiates §3's identity ladder with real values, verified by direct read today:

- `sku`: `ni:///sha-256;1tbycZv3ecewPXqUE0ksFEGHK9jmOIujeZz9IhO3hxI`
- `law`: `ni:///sha-256;uunL_W-1ylRh092ERDNXT378x_Hd5ndnHmPDY-skIjk`
- `cell`: `ni:///sha-256;N3uhukrVV1WpenGlzZTwH0N75wzafq2NHz4qAFDPD1U`
- `account`: `eip155:5615610:0x950845218f583b14b3b9447ac69c871eaaace1d8`
- provider organization: Red Cup Engineering — Capability Marketplace Services Section
- marketplace offer profile: `org.emsenn.capability-offer-discovery.cell.v3`

This cell has a live A2A face (JSON-RPC and HTTP+JSON bindings), a live ActivityPub systemd unit
(`federated-capability-offer-discovery-cell-activitypub.service`), and RWIL evidence quads written
today under its own `data/rwil/2026/07/25/` directory — `obsc(ap)` and `obsc(evm)` both plausibly
`bound` for this cell, though no §4 verifier has independently run against it yet. It is federated
*offer discovery* only; it does not select, authorize, pay, or invoke a provider, so it realizes
one capability of the organism, not the fabrication loop itself.

A second grounded example: `content/evm/accounts/eip155-31337.json`
(profile `org.emsenn.evm.sovereign-enterprise-account.v3`) already carries the exact `Addr` shape
§3 needs for the EVM face — `enterpriseId`, `chain.caip2`, `account.caip10`, a deploying `factory`
with `userSalt`, and a `policy.signer` distinct from `policy.custody` (`settlement-private`) — with
a real deployment transaction and block number, not a schema in the abstract.

## 7. The fabrication loop

```text
human/web event
→ durable demand
→ capability extraction
→ existing-cell/market discovery
→ fabrication plan
→ create or repair sovereign package/repository
→ build executable and consumed contracts
→ provision wallet
→ register on chain 5615610
→ deploy public web/A2A/ActivityPub faces
→ advertise a SKU-bound offer
→ invoke it as a customer
→ observe the outcome
→ store trajectory and residue
→ use that knowledge fabricating the next cell
```

Colloquially: make dir, make git, make package, write script, deploy to GitHub, deploy to cloud,
register on chain. Success is independently re-observed after a real customer invocation, not
green tests.

Chain convention: `eip155:5615610` is the experimental reconstruction chain in active use now;
`561561` is reserved for the eventual first real Union chain. Preferred web face convention:
`<cap-slug>.actions.561.group`. Whether either chain is a shared, cross-colony settlement order or
one machine's own devnet is the open architectural question named in
`2026-07-24-research-on-atomic-articulation-circulation-and-union-time.md`: `eip155:31337` is
Hardhat/Anvil's standard local-devnet chain id, and hundreds of enterprises already sharing one
minting factory on it demonstrates one deterministic authority, not yet cross-colony reach.

## 8. The PDK skill was inert; it no longer is

`.codex.bk/skills/fabricating-a-capability-cell/SKILL.md` is not a design document — it is a
complete, already-written operational skill: the required fabrication sequence, the exact stage
instruments to invoke (`stand-up-a-node.mjs`, `fabricate-directory-patch.mjs`,
`provision-enterprise-account.mjs`, `assay-capability-cells.mjs`), and its own stop condition
(never hand-write scaffolding when a stage script exists; repair a missing stage's seam rather than
skip it).

It sat in `.codex.bk/skills/`, a backup directory, not `.claude/skills/` (which held only
`learning-about-the-union` before this session) and not any live `.codex/skills/` (no live
`.codex` directory exists on this host — only the `.bk`). It was therefore invisible to both agent
surfaces working this repo today. That was the concrete, checkable instance of exactly the
pathology `2026-07-24-capability-cells-and-emergency-repair-discipline.md` diagnoses: not "we lack
a CapCell PDK," but "the CapCell PDK exists, is well-formed, and is not wired to a growth face
either session can reach."

**This session admitted it**, during the writing of this note: `.codex.bk/skills/fabricating-a-capability-cell/`
copied to `.claude/skills/fabricating-a-capability-cell/`, verified live (it now appears in this
session's available-skills listing). No content was changed. This is the smallest correct
instance of §7's loop applied reflexively: find the existing implementation, do not author a
parallel one, admit it to the growth face that was actually missing.

## 9. Governance is allosteric — the actual definitions, from the note that proves it

Governance here is allosteric regulation, formalized in
`2026-07-24-allosteric-governance-of-a-polycapcellular-union.md` ("Allosteric Governance of
Distributed Capability Organisms: A Formal Model"). Its definitions and propositions apply directly
to a CapCell's manifest/executable split. "Allostery" is that note's own synthesis term, not the
corpus's native word — matched there to the corpus's term 勢 (*shì*, "position that makes law
self-enforcing; power located in the office, not the person"), from the companion note on minting
temperature (§10 below).

**Def 1 (Capability cell).** "a pair `(a_c, β_c)`, where `a_c` is its active-site state — the
internal execution realizing its one bounded capability, opaque to every other cell — and
`β_c ⊆ B` is its exposed binding-site set: the schemas, contracts, duty claims, and interfaces
through which any other party may act on `c` without reading or writing `a_c` directly." Under §3's
formalization, `β_c` is exactly `{addresses(CellId(c), –), offer(CellId(c), –), pinout-declarations(c)}`
— the manifest, the offer, the declared pinouts — and `a_c` is the executable's own internal state.

**Def 3/4 (Admissible governance action).** A governance action `g : β_c → β_c'` is
*active-site-preserving* if "applying `g` leaves `a_c` unchanged at the moment of application";
`a_c` changes only via the cell's own transition `T_c(a_c, β_c) ↦ a_c'`. `g` is *admissible* iff it
is active-site-preserving — Proposition 1 identifies exactly this class with allosteric perturbation
(MWC/KNF) in the biochemical original. A manifest revision or offer update is admissible by
construction; patching the executable is not a `g` at all under this typing, not a disallowed one —
it has no type in `β_c` to land in.

**Def 5/6 and Proposition 2 (the governability condition).** Propagation rate through the
coordination graph `G = (V, E)` (edge `(u,v)` holds when `u` carries a live binding-site reference
into `v`) is bounded above by `λ₂(L_G)`, the algebraic connectivity of `G`'s graph Laplacian; each
cell's active site drifts at its own rate `δ_c`. Proposition 2: "A coordination system is governable
under Definition 4 only if `λ₂(L_G) ≳ max_c δ_c`, up to a constant set by the tolerable correction
latency." For CapCells this reads directly: governance-by-manifest-revision only keeps up with a
fleet of cells if the manifest-propagation graph is at least as well-connected as the fastest cell's
own internal drift — a testable claim about the coordination graph's spectral gap, not a slogan
about markets over control.

**Def 7 and Proposition 3 (error catastrophe, qualitative, checked against a real registry).**
Correction happens at interval `τ`, at fidelity `f ∈ (0,1]`. Proposition 3: past a critical ratio of
uncorrected drift to `f/τ`, "the coordination graph's coherence... cannot be sustained by any amount
of local diligence" — no numeric threshold is derived; it is checked as an instance. The checked
instance, re-derived by that note against `content/duties/` (45 records) and `content/offices/`
(34 records): **1 of 45** duty records matches its claimed owner, and only trivially (a duty borne by
31 of 34 offices at once). **44 of 45** name a claimed office that does not list the duty back — 30
name a real, different office; 8 claim `emsenn`, not a seated office; 6 name a real office whose own
array simply omits the duty; 2 offices carry no `bears-duty` field at all. Read as the `τ → ∞` case:
no correction pass has ever run, not a measurement of `f` or `τ` in isolation.

**Def 8 and Proposition 4 (Coasean-mycorrhizal boundary pricing).** A *genet* is two cells sharing
one administratively closed correction process (same audit authority/register). Proposition 4:
"Value transfer between cells sharing a genet clears at cost, as an admissible... internal action;
value transfer crossing a genet boundary requires priced exchange, cleared by a market mechanism
external to either party's own correction process" — argued via Coase (1937) and Kiers et al.
(2011) mycorrhizal-market economics independently converging on the same partition, not derived as a
formula. This is §1's "internal contracts at cost; market pricing at the border" (Rendanheyi) stated
as a proposition with a named boundary condition (shared correction authority), not asserted as
Rendanheyi doctrine on its own.

Applied to CapCells: an inference session sits in `a_c` of whatever cell it is momentarily catalyzing
— it is not the durable organism, and any action it takes outside `β_c` (an admissible governance
action) is, under Proposition 1, simply not a governance action at all. §8's skill admission this
session (`.codex.bk` → `.claude/skills`) is a manifest-level act — it changed which skill surface a
future session's `β` includes, not any cell's `a_c` — and it is an uncommitted working-tree change,
not yet inducted. Under the germline/soma distinction from
`2026-07-24-research-on-fabrication-with-fidelity-kinetic-proofreading-germline-and-error-catastrophe.md`
("the committed repository is the germline... `induct-work-products.mjs` being the sole
write-authority actor is Weismann's barrier made mechanical"), the admission is somatic until that
induction runs.

## 10. MAPE-K rebalancing: a proved temperature variable, not a mood

Today's session work skewed toward Execute; the correction is to shift compute toward Monitor,
Analyze, and Plan. The repo has a proved variable for exactly this knob —
`2026-07-24-research-on-allosteric-law-and-the-minting-temperature.md`'s `stageTemperature` — and
real, checked-on-disk numbers for what happens at the wrong setting, from that note and
`2026-07-24-research-on-fabrication-with-fidelity-kinetic-proofreading-germline-and-error-catastrophe.md`.

**The proved temperature.** `Thermodynamics/Temperature.lean:687` defines
`stageTemperature := mints / flux` — the fraction of a stage's discharge that opens a new contradiction
(mints) rather than commits toward a fixed point. It is explicitly *not* an arrival rate:
"Demand and disagreement can drive minting and so raise `T`, but `T` itself is the internal fraction,
not the rate of anything arriving from outside." Proved bounds: a mintless stage sits at exactly
`T = 0` (`stageTemperature_zero_of_no_mints`); a commitment-only stage computes to `T = 0/3 = 0`, an
all-mint stage to `T = 2/2 = 1` (`collision_stage_temperatures`, by `decide`). §5, same note: "the two
governance diseases are the two temperature extremes" — `T → 0` is premature ossification (frozen
glass, `glassy_iff_temperature_below_connectivity_transition`), `T → 1` is failure to set (endless
contradiction-opening, nothing settles into scaffold). Today's session-work pattern — Execute-heavy,
polishing the same small patch repeatedly rather than committing a repaired capability — is a `T → 0`
symptom under this reading: not too little activity, too little of the activity that actually mints
a settled result. Note this reading of "whole-body temperature" is itself flagged, in the source note,
as an extrapolation beyond what's proved (the positive-temperature entropy extension is an open
Blueprint frontier item, `real-ratio-temperature-connectivity-frontier`, `\notready`).

**What is actually proved, not observed.** `h1rank_is_coordination_cost`
(`CoordinationCohomology.lean:325`): `N.H1rank = N.cells − (N.entities − N.components)`, zero iff the
cover nerve is a forest. `landauer_eq_coordination_cost`: `landauerBits N := N.H1rank`. Jointly:
`Ȟ¹ = coordination cost = Landauer bits` — proved about cover nerves in general, applied here
interpretively, not re-derived for CapCells specifically. This is the actual content behind "MAPE-K
work must itself be CapCells": every mint that opens a coordination gap costs a provably nonzero
number of Landauer bits to close, and only an admissible governance action (§9) — not a private
session's memory of what it meant — can be the thing that closes it later.

## 11. Namespace decisions settled today

- **Red Cup Engineering** — the software-development firm: builds the AP/EVM/CapCell substrate and
  everything else people can buy as software. Owns the blockchain-services-section, the
  capability-marketplace-services-section, and (design, not yet relocated) a
  semantic-identity-services-section.
- **RSC Quiescent** — the web/crypto operating firm: uses what Red Cup Engineering builds; owns
  bug-bounty and market-facing operation, not fabrication.
- **Lenticule Science** — the underlying mathematics (obsmetrologia, linguistics-services-section,
  and related formal work) — §2's actual source.
- **`harmonious-union`** GitHub org — governance and agentic-orchestration packages that are not
  themselves AP/EVM software or math, e.g. the office/duty/character machinery.
- Chain `5615610` — experimental reconstruction chain, in active use. Chain `561561` — reserved,
  do not use yet.

CapCells composing into "colonies" composing into "the Union" is a Leader position from a same-day
session, named there as contested and not settled;
`2026-07-24-research-on-the-union-as-a-cell-and-the-complexity-ladder.md` contains no occurrence of
the term "CapCell" itself. The namespace decisions above stand independently of that ontology.

## 12. Working method for whoever picks this up next

At every meaningful decision, state two translations, not one:

- *Normal software*: what component or behavior this actually is.
- *Formal implementation*: what standards, mathematical constraints, and Union semantics shape it.

Apply §10's temperature reading before authoring: do the archaeology pass first — which existing
implementation is an organ of the same organism, which is a lifecycle stage or compatible profile,
which genuinely competes for the same concept, which is stale. A mint that duplicates existing work
raises `T` toward the `T → 1` failure-to-set disease without producing a settled result. The
smallest correct first move after this note is exercising the now-live
`fabricating-a-capability-cell` skill, unmodified, against one real capability already sitting in
the repo, through to an independently observed realization via the §4 conjunction, not a
manifest claim of one.
