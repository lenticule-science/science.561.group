---
title: "The Capability Operating System Lineage, and What CapTP-as-Ludics Should Steal From It"
description: "A survey of the capability-OS lineage the estate has never engaged — Dennis and Van Horn, Hydra, Cambridge CAP, KeyKOS, EROS, seL4, CHERI, exokernels, Capsicum — situating the estate's CapTP work against it. What each proved; what the estate's approach adds that none of them has (four-valued authority grading, and a witness discipline that forbids derivations from substituting for witnesses); and six specific things it should steal, of which KeyKOS's consistent-cut checkpoint and the factory's constructive confinement are the two that matter most. Includes the estate's own partial retraction of the CapTP-as-ludics claim, which any honest situating must carry."
date-created: 2026-08-29
date: 2026-08-29
type: research-note
in-service-of: lib/emsenn/services/561-group/services/science-services-section/services/engineering-science-services-section/services/computer-science-services-section
name: 2026-08-29-note-on-the-capability-operating-system-lineage
authors:
  - claude-opus-5
keywords:
  - object-capability
  - captp
  - keykos
  - eros
  - sel4
  - cheri
  - exokernel
  - confinement
  - persistence
  - ludics
tags:
  - draft
status: research-survey
---


## 0. What this note is, and the gap it confirms

The estate has a substantial object-capability practice. It has two independent
CapTP implementations — a 3,500-line one in `animating` and an 1,900-line one in
`metroplat` — a witness log over capability moves, vector clocks, causal
frontiers, consistent cuts, promise retirement, a vat table, and a design note
arguing that CapTP's promise pipelining *is* the ∗-autonomous composition of the
estate's ludics package. It cites Mark Miller's *Robust Composition* (2006).

It has, so far as an exhaustive search can establish, no engagement whatsoever
with the operating-system lineage that produced the discipline it is using.
The counts:

| Term | Real hits in the live corpus |
|---|---|
| KeyKOS | 1 — a single bibliography card, under `lib/legacy/` |
| EROS | 1 — the same card |
| CHERI | 0 (fifteen apparent hits are one syndicated news item about Peter Neumann) |
| exokernel | 0 |
| Hydra (the OS) | 0 |
| Coyotos | 0 |
| Capsicum (the OS facility) | 0 (83 apparent hits are the pepper genus) |
| seL4 | 2 — both passing name-drops in unrelated notes |
| Genode | 1 — a name-drop in a legacy OS-vision document |

The one card is
`.../relationality-services-section/lib/legacy/2026-06-23-animating/.../references/miller2006.md`,
which says, correctly:

> "5. **The capability machine architectures** (KeyKOS, EROS) as operational
> realisations: persistent capability machines whose entire state is a
> capability graph and whose system calls are capability invocations. These
> provide the existence proof that object-capability discipline scales to
> operating-system level."

That sentence names the gap and is itself in a decommissioned path. This note
fills it.

**Status.** Research survey. Not doctrine, not a build plan, and nothing here
has operational status. Per
`lib/emsenn/services/561-group/services/561-group-services-section/README.md`:
"Do not infer operational status from a Markdown file's existence or from its
non-legacy location." Citations are working references from assistant knowledge;
verify papers, editions, and technical claims before public use.

## 1. Where the estate actually stands, including a retraction

Any honest situating has to carry the estate's own internal correction, because
the two implementations disagree about the note's headline claim.

**`animating` asserts the strong version.** From
`.../agent-computer-system-engineering-services-section/apps/animating/src/writing/captp/index.mts`:

> "sturdyref = a LOCUS you may play, named unforgeably + its holder; delivery
> (invoke) = the CUT / interaction; a promise = a not-yet-settled answer locus;
> promise pipelining = the cut COMPOSED BEFORE RESOLUTION"

and its `composePipeline` is described as realizing "pipelining as the genuine
`@emsenn/playing` **`cut`** … Pipelining proven as a ∗-autonomous composition,
not asserted."

**`metroplat` walks it back.** From
`.../agentic-enterprise-computer-platform-engineering-services-section/apps/metroplat/src/lib/capability/captp/index.mts`:

> "Read a CapTP authority graph as a causal set … and check whether it admits a
> proper two-colouring. A graph that fails this is not merely deep or blocked —
> it contains an odd causal cycle: a promise pipelined back onto its own
> ancestry through an odd number of hops, which cannot converge no matter how
> delivery proceeds. **This is the real structural law the old "genuine cut"
> claim gestured at.**"

In metroplat, `composePipeline` returns a `JsonValue` and the ludics dependency
is gone. So "CapTP-as-ludics" is not a settled estate position; it is a claim
made in one implementation and softened in its successor into a causal-set
polarization law. This note treats the *softened* version as the estate's
current position and says so wherever the comparison depends on it.

What the estate does have, uncontroversially:

- **Authority as a graded read.** `canInvoke` is the gate, and the Lean-side
  `guard-verdict-is-bilattice-meet` theorem states it as the truth-order meet ∧ₜ
  over four-valued predicates.
- **A witness discipline.** From
  `.../predicated-work-services-section/content/glossary/terms/witness-as-increment.md`:
  "closure rules cannot synthesize witnesses. An agent's claim to have completed
  a task must be a witness — an increment cell at a specific stage, signed by the
  agent — not a derived value the closure rules conjured."
- **A log, not a store.** RWIL — an append-only EAVT log with derived state,
  record, and content tiers, of which "the log is the only irreducible tier."

## 2. The lineage

### 2.1 The origin, and the two machines

**Dennis and Van Horn**, "Programming Semantics for Multiprogrammed
Computations" (*CACM* 9:3, 1966), introduced capabilities: an unforgeable token
naming an object together with rights over it, held in a protected C-list.
Everything downstream is a variation.

**Hydra** (Carnegie Mellon; Wulf, Cohen, Corwin, Jones, Levin, Pierson, Pollack,
1974–81) proved two things. First, that a capability kernel could support
*type extension*: user-level subsystems could define their own object types and
have the kernel enforce them, via **rights amplification** — a template
mechanism by which a type manager, and only a type manager, could turn a
restricted capability for an object of its type into an unrestricted one.
Second, and this is the line most often quoted from it, that **policy and
mechanism should be separated** in the kernel. It also demonstrated the
difficulty of getting revocation and garbage collection right in a
capability graph, which stayed unsolved.

**Cambridge CAP** (Wilkes and Needham, *The Cambridge CAP Computer and Its
Operating System*, 1979) proved that capabilities could be enforced in hardware,
with a microcoded capability unit, and that a full timesharing system could run
on such a machine. It is the direct ancestor of CHERI.

### 2.2 KeyKOS: the one the estate most needs

**KeyKOS** (Norman Hardy and colleagues at Tymshare and Key Logic, early 1980s;
"KeyKOS Architecture," *ACM Operating Systems Review* 19:4, 1985) was a pure
capability system that ran commercial workloads. Three of its results matter
here, and none has an analogue in the estate.

**Orthogonal persistence by system-wide checkpoint.** KeyKOS took a consistent
checkpoint of the *entire machine state* — every domain, every page, every
capability — at intervals of a few minutes, to a checkpoint area, atomically. On
power failure the system resumed from the last checkpoint and applications
continued running: no save files, no serialization code, no recovery logic in any
application. The reported figure that made it famous is that the checkpoint was
cheap enough to take continuously and that recovery took seconds. Persistence was
not a feature applications used; it was a property of the machine.

**The factory, and constructive confinement.** Lampson's "A Note on the
Confinement Problem" (*CACM* 16:10, 1973) posed the question: can I run your
program on my data and be sure it cannot leak? KeyKOS's **factory** answered
constructively. A factory is a builder for instances of a program; it can be
*audited* — mechanically, by the system, not by inspection — to determine
whether the program it builds holds any capability that could reach outside a
declared set. A yield from an audited factory is *confined*: it can compute on
your data and hand back a result, and it provably cannot phone home. This is not
a policy; it is a construction, and it is the single most useful idea in the
whole lineage for an estate that runs other people's agents on its own data.

**The confused deputy.** Hardy's "The Confused Deputy" (*ACM OSR* 22:4, 1988) is
the canonical argument that ambient authority is the bug: a program invoked with
authority of its own, acting on a caller's request, cannot tell which authority
it is exercising, and the resulting vulnerability class is not fixable by
better ACLs. Capabilities fix it by construction, because the authority arrives
*with* the request.

### 2.3 EROS, seL4, CHERI

**EROS** (Shapiro, Smith, and Farber, "EROS: a fast capability system," SOSP
1999) rebuilt KeyKOS's architecture and answered the standing objection that
capability systems must be slow: its IPC path was competitive with the fastest
microkernels of the day. It kept the single-level store and the periodic
checkpoint. Shapiro and Weber, "Verifying the EROS Confinement Mechanism"
(IEEE S&P 2000), gave a formal proof of the confinement construction — the first
time the factory's guarantee was proved rather than argued. **Coyotos** was the
intended successor, with a verified kernel written in BitC; it was not finished,
and honesty requires saying so.

**seL4** (Klein et al., "seL4: Formal Verification of an OS Kernel," SOSP 2009)
is the lineage's high-water mark for assurance: a machine-checked functional
correctness proof, in Isabelle/HOL, that the kernel's C implementation refines an
abstract specification. Later work added integrity and confidentiality
(information-flow) proofs and, crucially, translation validation from C to the
compiled binary, closing the compiler assumption. The costs and the assumptions
are the part worth internalizing: on the order of 200,000 lines of proof for
around 10,000 lines of C, an effort measured in tens of person-years, and an
explicit assumption list — hardware behaves as modelled, DMA is not adversarial
outside the modelled cases, the boot code is trusted, the specification says what
you think it says. **The assumption list is the transferable artifact, not the
proof.**

**CHERI** (Cambridge Computer Laboratory and SRI; Watson, Neumann, Woodruff,
Roe, and many others, 2010–) puts capabilities in the instruction set:
architectural capabilities are fat pointers carrying base, bounds, permissions,
and an out-of-band tag bit that hardware maintains and software cannot forge.
Its governing rule is **monotonic non-increase**: a capability derived from
another can only have equal or fewer rights over an equal or smaller region.
Arm's **Morello** shipped real silicon; CheriBSD is a full OS on it. What CHERI
proved is that capability discipline can be retrofitted into a C/C++ world at
the ISA level, giving spatial memory safety and fine-grained compartmentalization
at measured, publishable overheads — with temporal safety (use-after-free) the
harder residue, addressed by later work on revocation sweeps.

### 2.4 Exokernels and the retrofits

**Exokernels** (Engler, Kaashoek, and O'Toole, "Exokernel: An Operating System
Architecture for Application-Level Resource Management," SOSP 1995) are a
different lineage with a convergent instinct: the kernel should *protect*
resources without *abstracting* them, exporting hardware directly and letting
library operating systems build the abstractions. Its three mechanisms — secure
bindings, visible revocation, and abort protocols — are directly relevant, and
**visible revocation** in particular is the idea that a resource holder is *told*
when a resource is being reclaimed and gets a chance to respond, rather than
having it vanish.

**Capsicum** (Watson, Anderson, Laurie, and Kennaway, USENIX Security 2010)
retrofitted capabilities into UNIX: a process enters capability mode, loses
access to global namespaces, and thereafter can only use file descriptors it
already holds, refined by `cap_rights_limit`. It is in FreeBSD and has been
partially ported elsewhere. **Fuchsia/Zircon** makes handles capabilities as a
matter of course. **Genode** is a capability-based component framework on several
kernels including seL4. These matter because they are the *deployment* answers —
proof that the discipline survives contact with existing software.

## 3. What the estate's approach adds

Two things, and I think both are real.

**Four-valued authority.** Every system in §2 is two-valued about authority: you
hold the capability or you do not; the guard admits or refuses. The estate's
`canInvoke` is a bilattice meet over graded predicates, which means it can
distinguish *refused* from *not yet evidenced* from *contested*. That distinction
is not decoration in a multi-agent setting: "I have no evidence you may do this"
and "I have evidence you may not" are different situations calling for different
responses (gather more, versus refuse), and the estate's
`meaningful-human-control.md` states exactly this three-way disposition:
"Insufficient evidence asks for more evidence; positive falsification refuses the
workitem; inconsistency requires repair." I am not aware of a capability OS that
does this, and the reason is probably that a kernel gate must answer in
nanoseconds and cannot afford to say "ask again." That is a real constraint and
it also means the estate is operating in a regime where the extra values are
affordable.

**A witness discipline with a prohibition.** Every system in §2 has audit logs.
None of them has the estate's rule that *derivations may not substitute for
witnesses* — that a closure rule cannot manufacture the evidence that an act
occurred. In capability terms this is a claim about the relation between
authority and record: holding the authority to do a thing does not create the
record that you did it. That is a genuinely distinct commitment and it is the
thing that makes the estate's log an evidentiary object rather than a debugging
aid.

## 4. Six things it should steal

**(a) KeyKOS's consistent-cut checkpoint — and the estate already has half of
it.** The `animating` CapTP module computes `causalCutQuiescence`, described in
its own source as "distributed snapshot logic read through object capabilities:
a consistent cut may be causally valid but not yet quiet." That is precisely the
predicate a KeyKOS checkpoint needs. What the estate lacks is the *other half* —
materializing the settled state at that cut so that restart is cheap.

> **Proposal.** A checkpoint is a materialized settled valuation at a quiet
> consistent cut, retained *beside* the log rather than replacing it. This is a
> cache, not a substitute: the log stays the irreducible tier (RWIL's own
> statement), so the witness discipline is untouched, and recovery stops being
> a replay. KeyKOS proved this is affordable at a few-minute cadence on 1980s
> hardware. The estate has the cut and does not have the materialization.

**(b) The factory, and confinement.** The estate runs agents on its own data and
has, so far as I can find, no construction that answers "can this agent leak?"
The KeyKOS factory answers it by mechanical audit of the capability closure of
what is built, and Shapiro and Weber proved the answer. The estate has a Lean
corpus and a capability graph. This is a target, and it is more valuable than
anything else on this list because it is a question the estate's actual
operations raise weekly.

**(c) The confused deputy, by name.** The qtOps architecture specification
(read-only here; per its own README "Proposed. Nothing in this section is
running yet") reaches Hardy's conclusion independently: "Inadmissible entries
are not grayed out; they are absent (no ambient advertisement of authority)."
That is the confused-deputy fix, arrived at without the citation. Citing it costs
nothing and connects the estate to forty years of argument about why the fix is
necessary.

**(d) seL4's assumption list, not its proof.** The transferable artifact from
seL4 is the discipline of stating exactly what a proof does not cover. The
estate's own glass-sponge note already models this well —
"**Presence of a file is not by itself a successful proof check**" — and the
CapTP conformance work has a comparable honesty problem it has documented:
the JS/Lean correspondence is checked by hand-traced golden vectors, with the
test file stating "not by running the JS and eyeballing the output, and not by
running a Lean toolchain." An seL4-style assumption list for that bridge would
be the right next artifact.

**(e) CHERI's monotonicity, as a question to answer.** CHERI's governing rule is
that derivation never increases rights. The estate's *knowledge* order is
monotone and proved so. Is its **authority** order monotone-decreasing under
delegation? Does `composePipeline` ever produce a composite whose authority
exceeds either input's? Nobody has stated the property, let alone checked it, and
it is exactly the kind of thing a `pipelineAuthorityGraph` should be able to
answer. **This is the cheapest high-value check on the list.**

**(f) Revocation, which the lineage found hardest.** The estate has
`dropPresence` and `op:drop`, which are garbage collection — reclaiming what
nobody wants — not revocation, which is taking away what someone still wants.
The lineage's answers are Redell's **caretaker** pattern (interpose a revocable
forwarder; revocation is dropping the forwarder's target), KeyKOS's approach,
the exokernel's **visible revocation** with abort protocols, and CHERI's
sweep-based temporal safety work (Cornucopia). The estate should pick one and
name it, because "we have GC" is not an answer to "the contractor's access ends
today."

**What not to steal.** The single-level store's coupling of persistence to the
kernel — the estate's log/state/record/content stratification is better suited
to an auditable, content-addressed world, and KeyKOS's model would flatten it.
And the lineage's two-valued authority, which §3 argues the estate has already
improved on.

## 5. What this note does not claim

- Nothing here is built or operational, and this note proposes no build.
- It does not claim the estate's CapTP is a ludics realization. §1 records that
  the estate itself softened that claim between implementations, and every
  comparison above uses the softened version.
- It does not claim the estate's four-valued authority gate is novel *research*.
  It is, so far as I can find, absent from the capability-OS lineage; that is a
  survey finding about that lineage, not a priority claim.
- It does not evaluate the estate's CapTP implementations for correctness. §4(e)
  raises a property that has not been checked; raising it is not the same as
  suspecting it fails.
- The technical characterizations in §2 are from the published record as I hold
  it. Performance figures, proof sizes, and effort estimates in particular should
  be verified against the papers before being repeated.

## 6. Directions

1. **Check authority monotonicity** in `pipelineAuthorityGraph`. Cheapest,
   highest value.
2. **Write the confinement question down properly**, in the estate's own terms:
   given the capability closure of an agent's grant set, what is the class of
   destinations it can reach? KeyKOS answered this mechanically; the estate has
   the graph.
3. **Materialize a checkpoint at `causalCutQuiescence`**, as a cache beside the
   log. Small, self-contained, and it turns an existing predicate into a
   capability the system does not currently have.
4. **Name a revocation mechanism.** Caretaker is the cheapest and is a pure
   library pattern.
5. **Write the assumption list for the JS/Lean CapTP correspondence.**
6. **Cite Hardy 1988 in the affordance material.** One line.

## 7. Sources

Working references from assistant knowledge; verify papers and technical claims
before public use.

- Dennis, Jack B., and Earl C. Van Horn. "Programming Semantics for
  Multiprogrammed Computations," *CACM* 9:3 (1966).
- Lampson, Butler W. "A Note on the Confinement Problem," *CACM* 16:10 (1973).
- Wulf, W., et al. "HYDRA: The Kernel of a Multiprocessor Operating System,"
  *CACM* 17:6 (1974); Wulf, Levin, and Harbison, *HYDRA/C.mmp: An Experimental
  Computer System* (1981).
- Wilkes, Maurice V., and Roger M. Needham. *The Cambridge CAP Computer and Its
  Operating System* (1979).
- Hardy, Norman. "KeyKOS Architecture," *ACM Operating Systems Review* 19:4
  (1985); "The Confused Deputy," *ACM OSR* 22:4 (1988).
- Bomberger, A., et al. "The KeyKOS Nanokernel Architecture," USENIX Workshop on
  Micro-Kernels (1992).
- Shapiro, Jonathan S., Jonathan M. Smith, and David J. Farber. "EROS: A Fast
  Capability System," SOSP (1999).
- Shapiro, Jonathan S., and Samuel Weber. "Verifying the EROS Confinement
  Mechanism," IEEE Symposium on Security and Privacy (2000).
- Klein, Gerwin, et al. "seL4: Formal Verification of an OS Kernel," SOSP
  (2009); Murray et al. on information-flow (2013); Sewell et al. on
  translation validation (2013).
- Watson, Robert N. M., Peter G. Neumann, Jonathan Woodruff, et al. "CHERI:
  A Hybrid Capability-System Architecture" (IEEE S&P 2015) and the CHERI ISA
  reference series; Arm Morello.
- Engler, Dawson R., M. Frans Kaashoek, and James O'Toole. "Exokernel: An
  Operating System Architecture for Application-Level Resource Management,"
  SOSP (1995).
- Watson, Robert N. M., Jonathan Anderson, Ben Laurie, and Kris Kennaway.
  "Capsicum: Practical Capabilities for UNIX," USENIX Security (2010).
- Redell, David D. *Naming and Protection in Extendible Operating Systems*
  (PhD, Berkeley, 1974) — the caretaker pattern.
- Miller, Mark S. *Robust Composition: Towards a Unified Approach to Access
  Control and Concurrency Control* (PhD, Johns Hopkins, 2006).

### In-corpus references

- `lib/emsenn/.../computer-science-services-section/content/text/documents/articles/notes/2026/06/25/2026-06-25-captp-as-playing.md`
- `lib/emsenn/.../agent-computer-system-engineering-services-section/apps/animating/src/writing/captp/index.mts`
- `lib/emsenn/.../agentic-enterprise-computer-platform-engineering-services-section/apps/metroplat/src/lib/capability/captp/index.mts` (the causal-set law that softens the ludics claim)
- `lib/emsenn/.../computer-science-services-section/content/text/documents/articles/notes/2026/06/25/2026-06-25-rwil-relation-witness-information-log.md`
- `lib/emsenn/.../predicated-work-services-section/content/glossary/terms/witness-as-increment.md`
- `lib/emsenn/.../engineering-services-section/content/text/documents/articles/notes/2026/08/01/2026-08-01-note-on-the-content-addressed-glass-sponge-semantic-compute-complex.md` (the five-status reading law)
- `lib/emsenn/.../military-science-services-section/content/text/glossary/terms/meaningful-human-control.md` (the three-way disposition)
- `lib/emsenn/.../relationality-services-section/lib/legacy/2026-06-23-animating/.../references/miller2006.md` (the one legacy card that names the gap)
- `lib/emsenn/services/561-group/services/561-group-services-section/README.md`
