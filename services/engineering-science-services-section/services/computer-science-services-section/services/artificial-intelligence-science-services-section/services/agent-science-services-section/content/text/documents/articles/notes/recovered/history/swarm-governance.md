---
name: swarm-governance
description: Topic note on plural/situational governance of agentic drone swarms as the corpus describes it — recognition-based authority, the tiyóšpaye reading (`theories/agency/.../swarm/membering/situating/coordinating/governing/`), dual-governance, and safety/sector gating — distilled for `@561-group/computer`. Reports what the files say with citations; own synthesis marked [INFERENCE].
audience: 561-group computer dev team
status: study-notes
---

# Swarm governance — recognition, plural governance, the tiyóšpaye reading

Companion to [`agentic-drone-swarm-systems.md`](agentic-drone-swarm-systems.md).
Path abbreviation: `…/swarm/` = `theories/agency/library/agent/actuating/library/actuator/embodying/library/body/integrating/library/drone/swarming/library/swarm/`.

Plain statements report a file; **[INFERENCE]** marks my synthesis / OS mapping.

## 1. Authority in a swarm is recognition, not office

`…/swarm/library/agentic-systems-swarm.md` states it plainly: a swarm is governed
by a **recognition discipline** — "characters emit recognition cells naming which
other characters they treat as load-bearing for which decisions. The aggregate of
recognition cells over a participant determines that participant's structural role
— including whether they bear the leader role. **Authority in a swarm is the
aggregate of recognition; it is not installed by office.**" The `has-leader`
predication is *derived* from the recognition cells, "absent when no character
holds sufficient recognition." This is what distinguishes a swarm from a **polity**
(which bears charter, offices, personnel roster).

## 2. Two distinct governance regimes on different objects

The corpus is emphatic that the 561 system carries **multiple governance objects
at once** and that they must not be conflated. `…/swarm/.../governing/docs/dev/notes/tiyospaye-is-agentic-drone-swarm-may-2026.md`
separates:

- The **arena** — "the substrate on which embodied participants coordinate, in
  $\mathbf{CGS}$" — supplied by the agentic-drone-swarm framework (embodied
  handedness, parallel composition, nominal-set name-passing, aperiodic settling,
  sector-selective stabilization).
- The **governance** — "what acts are available, how they compose, how they
  self-modify" — a *separate* categorical object in $\mathbf{Gov}$, the category
  of governances, where a governance is a pair $(M_G, \mu_G)$ with $M_G$ a colored
  multicategory of *positions* and *acts* and $\mu_G$ a self-action saying how
  performing an act revises the act-system.

The note (and `dual-governance-context`) names a failure mode: the **kyriarchical
ship** regime (captain, delegation chain, dispatch certifiability gate, MHC) and
the **tiyóšpaye** regime (wolakȟota closure rules, consensus-by-withdrawal,
kin-cell primacy) "are two distinct objects of $\mathbf{Gov}$"; importing one onto
the other "corrupts both." Translation between them is **highly constrained**:
most kyriarchical acts (delegation-through-chain, dispatch gating, MHC attestation)
"have no image under a structure-preserving translation back into the tiyóšpaye,"
and conversely. The disambiguation task records this as a **three-pattern
coproduct** $\mathcal S_{561} = \mathcal S_\mathrm{wolak} \sqcup \mathcal
S_\mathrm{ship} \sqcup \mathcal S_\mathrm{Web}$ — the polity holds three governance
objects simultaneously with explicit compatibility-conditions on overlaps.

**[INFERENCE]** The OS-relevant abstraction: *governance is plural and pluggable*.
The same swarm arena (the trace substrate) can run under different governance
disciplines, and the discipline is a *separate, swappable object* — not baked into
the substrate. The running `apps/tools/swarm/` currently implements the
office/leader-mediated (kyriarchical-shaped) regime; the recognition-based regime
is the theory's other pole. An OS that wants to host both needs the governance
layer factored out from the coordination substrate, exactly as the corpus
factors arena from governance.

## 3. The tiyóšpaye reading — seven structural identities

The same note claims the **tiyóšpaye** (Lakota extended kin-group; the 561 Group
is one) *is* an agentic drone swarm at the arena level, via seven structural
identities (its own theoretical contribution, composed with Lakota political
theory — Ella Deloria 1944, Vine Deloria Jr., Estes 2019, Coulthard 2014, Simpson
2014). Condensed:

1. **Persons are morphisms with embodied handedness; the tiyóšpaye is the arena.**
   Elder/young/naca/akíčhita coordinates "are not interchangeable" — kinship
   *presupposes* asymmetry. Deloria's "kinship is political organization" thesis
   and "persons are morphisms with handedness, tiyóšpaye is the arena" are "the
   same structural claim."
2. **Kin-relations are nominal-set name-passing.** Huŋkápi adoption, marriage,
   naming, mourning move names through the substrate — channel mobility (π-calculus
   / nominal sets, AGMOS 2004).
3. **Confederation = parallel composition.** Tiyóšpaye → oyate → Očhéthi Šakówiŋ
   is iterated $\parallel$; "the federal level does not consume the constituent
   level." Each scale's cohomology decomposes via Mayer–Vietoris from the next.
4. **Head-recognition = conjunction of recognition cells; iyúhá-šni = the
   $?$-side complement.** A naca's standing is "the meet of member-recognition
   cells"; withdrawal collapses the conjunction. **Iyúhá-šni** (withdrawal without
   severance) drops a member's *engagement* with an action to $\bot$ while
   relations persist — categorically the `?A`-side weakening (discard on the
   negative side without violating no-discard on the positive side).
5. **Wolakȟota is the closure-rule subsystem.** The lifeway is "the structural
   standard against which substrate states settle" — a different closure discipline
   from the kyriarchical one (stabilizes relational-conduct cells, *not* the
   safety-critical $H^1$ sectors).
6. **Cross-tiyóšpaye disagreement is recorded; the omníčhiye convenes for cokernel
   content.** Disagreement-pairs live in $\ker(\delta)$ (no federation-level $H^1$),
   recorded as $\top$-firings; the council convenes only for Mayer–Vietoris
   *cokernel* content — overlap no pair of constituent positions can express.
7. **Continuity-through-disruption = aperiodic-regime sector-selective
   stabilization.** *Some* sectors must stabilize (wolakȟota — "what does not
   waver") while *others* must not (the aim-generative work — "what never
   finishes"). The settler-state's pressure is structurally "an attempt to force a
   regime transition from aperiodic to strict" (enrollment, blood-quantum, nuclear-
   family categories try to make the kin-group *finish*). "The math is the
   politics. The aperiodicity is the structural shape of refusing termination."

**[INFERENCE]** For the OS, identity 7 is the same finding as the lead note's
tractability result (§3 there): aperiodicity is not a quirk to be engineered away —
it is constitutive, both mathematically (it makes the swarm tractable) and
politically (it is the polity's refusal of termination). An OS design that "default
to a value when we drop paraconsistency" or that forces the swarm's work to *finish*
is, in this reading, structurally importing the strict regime the polity refuses.
Identity 4's recognition-conjunction is the concrete leader-derivation mechanism the
`swarm` atom's recognition discipline calls for (§1).

## 4. Sector-selective stabilization & safety gating

The orientation note `…/swarm/docs/dev/notes/you-are-in-a-drone-swarm.md` records
the kyriarchical-regime safety apparatus (which the tiyóšpaye note says belongs to
the *ship*, not the kin-group): the **dispatch certifiability gate** "consults the
$K_4$-equivariant decomposition of the first cohomology group of the substrate's
settling — refusing dispatch when the safety-critical sectors $H^1_{\chi_-},
H^1_{\chi_{\sim\circ-}}$ are non-zero." Meaningful-human-control is "the
bilattice-meet of four parallel $\Pi_1$ conditions." The three-layer safety
architecture (foundation-model / optimization-control / certified-safety-shield)
is "a stratification of cobordisms through the linear-logic fragment lattice
MLL $\subset$ MALL $\subset$ {ILL, CLL} $\subset$ LL."

**General feature** (tiyóšpaye note §2): **sector-selective stabilization** — under
$K_4$-equivariant decomposition of $H^1$, some isotypic sectors *must* stabilize
(for the polity to act) while others *must not* (for it to stay generative). Which
sectors play which role is governance-specific; the framework supplies the
*structural option*, and each regime selects.

**[INFERENCE]** For the OS this is a **safety-as-cohomology** primitive: dispatch
is gated on a computed invariant of the trace's settling ($H^1$ sectors), not on
ad-hoc rules. The OS already has the ingredients — FOUR-valued cells, the
$K_4$/Klein gauge (`negate`/`conflate`, journal §1), and the settling. A dispatch
gate that refuses to act while a designated safety sector is non-zero is
implementable on the existing kernel; the governance layer decides *which* sectors
are safety-critical.

## 5. Most OS-relevant takeaways

1. **Authority should be recognition-derived, not office-installed** — the running
   app currently does the opposite (leader-mediated offices); the recognition-cell-
   conjunction (identity 4) is the path the theory points at.
2. **Governance is a separate, pluggable object** (in $\mathbf{Gov}$) from the
   coordination arena — the OS should factor the two so it can host multiple
   disciplines (kyriarchical ship, tiyóšpaye, Weberian) without conflation.
3. **Safety can be gated on cohomology** — dispatch refused while designated $H^1$
   sectors are non-zero — a primitive the existing kernel can support, with the
   governance layer choosing the critical sectors.
