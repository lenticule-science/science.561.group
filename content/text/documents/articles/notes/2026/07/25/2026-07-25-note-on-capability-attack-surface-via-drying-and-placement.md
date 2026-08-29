---
title: "Capability Attack Surface via Drying and Placement"
description: "Applies game foam's drying/incarnation operator and the rigidity matroid's hereditary-redundancy caveat to define agentic-software capability attack surface."
date-created: 2026-07-25
kind: research-note
keywords:
  - game-foam
  - ludics
  - capability-security
  - rigidity-percolation
status: design
declared-by: claude-interactive-session-supplying-lenticule-science
---
# Capability Attack Surface via Drying and Placement

*A ludics reading of least-privilege for agentic proof software, reconciled
against the substrate's own bilattice-accessibility account of the same name*

---

## Abstract

We define the attack surface of an agentic proof system — an untrusted
tactic/subgoal generator holding a bundle of capabilities — as the
**incarnation of its capability-holding design, dried against the orthogonal
class of legitimate verifiers** [1]. Placement gives the decision procedure:
a capability is in the surface iff a causal path reaches the exterior without
crossing a gate locus [2]. Drying gives the completeness argument: a
capability that is reachable but never exercised by any legal counter-design
is provably inert, not merely unused, which converts least-privilege from
practice to theorem [1]. Born-isostatic closure gives the narrowing dynamics:
attenuation proceeds by a monotone process that only adds refused moves,
squeezing out floppy (unattenuated, unconstrained) capabilities [1]. Sizing
the result reuses the corpus's own cycle-rank/blind-index invariant rather
than inventing a metric, subject to the same hereditary caveat that already
governs it elsewhere [3]. We then find that a decommissioned, independently
authored account of "attack surface" already exists in this corpus in a
different register — bilattice accessibility cells graded on Belnap FOUR [4]
— and flag, without claiming to resolve, that both registers land on the
same value domain.

---

## 1. Target: attack surface as dried incarnation

Read a capability system in the vocabulary already established for
CapTP/UCAN-style systems: sturdy-ref = locus, delivery = cut, attenuation =
dualize, `canInvoke` = admissibility judgment [5]. An agentic prover's held
capabilities are then a design over those loci.

**Definition 1.1.** For an agent design $D$ and an orthogonal class of
verifiers $V \subseteq D^\perp$, the *attack surface* is
$$\mathrm{Surf}(D, V) = |D|_V$$
— the incarnation (drying) of $D$ relative to $V$ [1]. Everything outside
$\mathrm{Surf}(D,V)$ is ballast by construction, not by policy.

This is a stipulative definition, not a theorem; §§2–4 justify it as
computable and sound.

## 2. Decision procedure: placement

`hole_no_future_to_exterior` and `effect_source_in_shroud` [2] give the
admissibility judgment directly: capability $c$ is *in* the surface iff there
is a causal path from the agent's locus to the exterior that does not cross a
gate locus. This is what makes `canInvoke` structurally computable rather
than a discretionary check — permission is placement, not an ACL [2].

## 3. Completeness: drying

Placement alone overcounts: a capability can be reachable and never once
exercised by any legal member of $V$. Drying's faithfulness result — two
designs with identical dry film are indistinguishable to every counter-design
in the orthogonal [1] — is what licenses stripping those. A locus visited by
no verifier in $V$ is *provably* unobservable relative to $V$, not merely
unused so far. Least privilege, read this way, is Cor 4.4 applied to a
specific $V$, not a heuristic bolted on afterward.

Note the dependence on $V$: shrinking the verifier class can only shrink the
proved-inert set, never grow it. The attack surface is a surface *relative to
a stated adversary class*, and Definition 1.1 should be read as such — this
note does not claim a $V$-independent notion exists.

## 4. Dynamics: monotone narrowing

Thm 6.8's born-isostatic result [1] is the mechanism, not decoration: an
innocent play-set closes to well-formed by a monotone process that adds only
refused-Opponent moves. Applied here: capability attenuation only narrows
across a session, never re-widens, and Thm 6.4's blind index [1] identifies
an *unattenuated* capability with a floppy mode — a self-stress-free degree
of freedom the proof obligation does not actually constrain. Minimizing
attack surface is driving the capability graph toward isostatic.

## 5. Sizing: reuse the invariant, respect the heredity

The size of $\mathrm{Surf}(D,V)$ should be measured with the same invariant
that already appears under other names in this corpus — cycle rank,
Landauer entropy, blind index, contradiction charge — evaluated on the
capability-admissibility graph rather than a context-cover nerve. One
constraint transfers and is load-bearing, not cosmetic: the rigidity count
that invariant generalizes is *hereditary* — every subgraph, not local
vertex counts [3]. A capability set that looks locally sparse (few grants
per locus) can still be globally over-permissioned; a local audit cannot see
this, and a pebble-game-style rank check across every subgraph is what the
corpus's own matroid material already requires elsewhere [3]. Any attack-surface
sizing instrument for the agentic prover inherits this requirement rather
than being free to count edges.

## 6. Reconciliation with the substrate's bilattice account

A decommissioned design source in this corpus already names "attack surface"
directly, independently of ludics, as
$$\mathrm{AttackSurface} = \{R(w_\mathrm{ex}, w_\mathrm{in}) : R(w_\mathrm{ex}, w_\mathrm{in}) \neq \mathbf{f}\}$$
over a bilattice accessibility relation $R$ graded on Belnap FOUR
($\mathbf t/\mathbf f/\bot/\top$), with crossing mediated by a modal
necessity operator $\Box_R$ and enumerability given as a free read [4].

Checked against the live code, not just the prose, this splits into a
confirmed half and a still-open half.

**Confirmed.** `attack-surface.md`/`trust-boundary.md` are fizzos's *own*
archived design notes (they sit under
`red-cup-engineering/src/apps/fizzos/dev/content/notes/.../pc-concepts/`),
and fizzos's live `lib/rmn.mts` — re-exporting the single canonical `FOUR`
from `@emsenn/rmn-semantic-conformance` — is the *one* FOUR carrier the
whole package imports everywhere, including `Design.charge: FourStateName`
in `lib/playing/ludics.mts` [7]. So the shared value domain in §6 is not two
documents coincidentally landing on Belnap FOUR; it is the same package
specifying one accessibility relation in prose and, independently, building
one ludics implementation, both against the one FOUR type the package
actually ships. That much is settled by inspection, not conjecture.

**Still open.** The other half of §6 — that $\Box_R$-admission *is* the
placement judgment of §2 — is not checkable yet, because $R$ and $\Box_R$
were never implemented. A repo-wide search of `lib/` (not just the archive)
turns up no accessibility-relation or modal-necessity carrier anywhere in
live fizzos code; the bilattice account remains exactly what the
orchestration map already calls that whole tree, a decommissioned design
source, not a runnable dependency. So the FOUR-bridge conjecture is
half-verified (shared substrate, single package, single FOUR type) and half
still prose (the accessibility relation it would need to bridge into was
designed once and never built).

**A homonym worth flagging so it isn't imported by accident.** Fizzos also
has a module literally named `capability-surface`
(`lib/capability-surface/capabilities.mts`) [8]. It is not a security
capability system — it is a unbound *package-feature* report
("does the `playing` faculty have a working carrier", checked by
`pathExists` against the real filesystem). It shares a word with §1's
CapTP/UCAN reading of "capability" and nothing else; the two should not be
conflated just because both live under the same package.

---

## Scope of this note

Sections 1 through 5 rely on results proved elsewhere and cited rather than
re-derived: drying faithfulness (Thm 4.3/Cor 4.4), the no-readout placement
theorems, born-isostatic closure (Thm 6.8), the blind-index identification
(Thm 6.4), and the Laman heredity result [1][2][3]. What is new here, and
not proved, is that §§1–5 compose into a sound and complete attack-surface
account for capability systems, and the entire content of §6 including the
FOUR-bridge conjecture.

This note is authored by the same interactive session that derived it in
conversation with the Leader. Per this settlement's author-exclusion law, it
is not unbound and awaits an independent check before anything above
is treated as settled.

Futarchy was considered and is not used: no prior-art connection to this
material exists in the corpus, so its inclusion would be invention, not
extension.

## Open next steps

- Formalize the capability-graph-as-encounter mapping concretely against the
  live TypeScript realization, not just the prose theorems — [1] already
  identifies a design as a Chu space over the corpus's live `chu.mts` [5],
  which is where the FOUR-bridge conjecture in §6 could actually be checked
  in running code rather than argued in prose.
- Run the pebble-game rank check (§5) against a real capability grant set
  before trusting any edge-count attack-surface metric.

---

## References

1. *the-structure-of-game-foam.md* (this directory) — drying/incarnation
   (Def 4.2, Thm 4.3, Cor 4.4), blind index (Thm 6.4), born-isostatic closure
   (Thm 6.8), coarsening conjecture (§11.3), status-of-claims convention (§12).
2. *2026-07-09-encounter-spec.md*
   (board-of-directors/lib/agency/characters/emsenn/.../notes/2026/07/09/) —
   placement-as-permission (§2.6), `hole_no_future_to_exterior`,
   `effect_source_in_shroud`, Red nodes R1–R3.
3. *direct_fabrication_system_blueprint.md* (this directory) — rigidity
   matroid vs. connectivity matroid, Laman's theorem, pebble-game algorithm,
   heredity of the rank condition (§2).
4. *attack-surface.md* and *trust-boundary.md*
   (red-cup-engineering/src/apps/fizzos/dev/content/notes/content/assets/legacy/.../predicated-computer/_archive/pc-concepts/)
   — decommissioned predicated-computer design source; bilattice accessibility
   relation $R$, Belnap FOUR grading, modal necessity operator $\Box_R$,
   enumerability of the attack surface as a free read.
5. *2026-07-08-census-of-concurrent-game-system-prior-art.md* and
   *2026-07-05-research-on-ludics-as-the-playing-and-gaming-faculties.md*
   (board-of-directors/lib/agency/characters/emsenn/.../notes/) —
   CapTP/UCAN/macaroons as playing-face objects (sturdy-ref = locus,
   delivery = cut, attenuation = dualize, `canInvoke` = admissibility);
   design as Chu space over `chu.mts`; charge valued on Belnap FOUR.
