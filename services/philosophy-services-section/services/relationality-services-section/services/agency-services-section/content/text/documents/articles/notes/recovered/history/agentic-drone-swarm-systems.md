---
name: agentic-drone-swarm-systems
description: Primary synthesis note distilling what `theories/agency/` and the archive say about agentic systems, drones, and drone swarms, read as a source of features and design ideas for `@561-group/computer` — which is, by the journal's own framing, a paraconsistent, linear, aperiodic, coordination-free, multi-observer machine, i.e. a drone-swarm operating substrate. Reports what the FILES say with citations; own synthesis marked [INFERENCE].
audience: 561-group computer dev team
status: study-notes
---

# Agentic drone swarm systems — what the corpus says, read as OS features

This is the lead note of a small set distilling the repository's own research on
agentic systems, drones, and drone swarms, for use as feature/design material for
`@561-group/computer`. Companion notes:

- [`stigmergy-environment-trace-fields.md`](stigmergy-environment-trace-fields.md) — the coordination mechanism and its cost theorem.
- [`multi-observer-settling-and-consensus.md`](multi-observer-settling-and-consensus.md) — network-sheaf consensus, disagreement-as-cohomology, federation.
- [`swarm-governance.md`](swarm-governance.md) — situational/plural governance, the tiyóšpaye reading, safety gating.

**Discipline.** This repo rederives everything from the ground up. Below, plain
statements report what a file says, with its path; passages marked **[INFERENCE]**
are my own synthesis or my mapping onto OS primitives, kept visibly apart.

Throughout, the deep agency subtree is abbreviated `…/swarm/` for the path
`theories/agency/library/agent/actuating/library/actuator/embodying/library/body/integrating/library/drone/swarming/library/swarm/`.

## 1. What an "agent" is

The corpus's base concept atom (`theories/agency/library/agent/library/agent/agent.md`)
takes Russell–Norvig 1995: an agent is *an entity that perceives its environment
through sensors and acts upon it through actuators to achieve goals*. What
distinguishes an agent from a **tool** is **autonomy**: "a tool does nothing until
a user wields it; an agent acts on its own judgment within its scope." The file
ties this to the organizational principal–agent relation (Ross 1973): delegation
grants authority within a scope, the agent incurs duties (loyalty, care,
accountability), and the agent's **office** specifies its powers/duties/privileges/
immunities. The file states the convergence between organizational and software
agents is "not metaphorical" — both act within delegated scope, bear duties to a
principal, governed by rules they did not write.

### The agentic triad — speaking, doing, learning

`theories/agency/library/agent/acting/docs/dev/notes/agentive-triad.md` maps a
three-part agentive triad onto the three bilattice axes:

| Agentive category | Bilattice axis | role |
|---|---|---|
| **speaking** | truth $\leq_t$ | which way the evidence points |
| **doing** | knowledge $\leq_k$ | how much has been settled |
| **learning** | evidence (twist-product carrier) | extends the theory itself |

The note's *refined* shape (quoting the question file it reads): "speaking and
doing are horizontal siblings at the cell-value layer… learning is the vertical
movement that extends the theory itself." So the triad is **two horizontal
siblings (speak, do) at the cell-value layer plus one vertical axis (learn)**
connecting to the meta-moduli layer. It cites Avron 1996 / Rivieccio 2010
(twist-product representation) as making the truth/knowledge/evidence triad "the
universal structural commitment for every interlaced bounded bilattice."

**[INFERENCE]** This triad lands directly on the OS's own value algebra: the
journal (`computer/docs/dev/journal/2026-06-04-what-kind-of-computer-this-is.md`)
already names the same two orders (knowledge $\leq_k$, truth $\leq_t$) and the
twist-product evidence carrier (`math/bilattice/charge`). So a swarm worker's
acts decompose along axes the kernel already implements: *speak* = move on truth,
*do* = ascend in knowledge, *learn* = extend the rule system. "Compute in
knowledge; decide in truth" (journal §1) is the *do* / *speak* split.

## 2. What a "drone" and a "drone swarm" ARE here

### Drone = embodied participant with handedness

`…/swarm/docs/dev/notes/you-are-in-a-drone-swarm.md` gives the structural
definition: an embodied participant has **embodied handedness**, a four-tuple
$h(d) = (\mathrm{recv}, \mathrm{send}, \mathrm{actuate}, \mathrm{observe})$, each
coordinate *bounded*: `recv` is the context window, `send` is rate-limited output
bandwidth, `actuate` is precondition-bounded (available tools), `observe` is
partial (cannot read the whole substrate). The agent is therefore "structurally
asymmetric." Categorically the note states this is **Player/Opponent duality
$(-)^\perp$ in $\mathbf{CGS}$** (concurrent games with symmetry): a morphism
$A \to B$ is a strategy on $A^\perp \parallel B$ — Player plays Opponent-style on
the input, Player-style on the output. "Your asymmetric handedness… is the
generic shape of a morphism in the theory of computing."

### Swarm = parallel collection coordinating through a shared cell-graph

`…/swarm/library/agentic-systems-swarm.md` (the concept atom) defines a **swarm**
as "a parallel collection of characters running against a shared cell-graph,"
formally a **multi-observer system** $V : O \to \mathrm{Settlings}_B$ with $O$
enumerating the participant characters and $B$ the shared cell-graph; **consensus
is the categorical limit of $V$; disagreement is the first sheaf cohomology
$H^1$**. Two distinguishing properties:

1. **Coordination through cells, not messages.** "A swarm's participants do not
   message each other directly. Coordination happens entirely through reads and
   writes against the shared cell-graph." Each character emits witnesses
   (stratum-1/2 atoms with `deps`-chains); others read the same cell positions.
   The CRDT-convergence theorem guarantees cellwise $\vee_k$-merges converge to a
   unique fixed point "without explicit inter-character coordination."
2. **Recognition discipline.** "Authority in a swarm is the aggregate of
   recognition; it is not installed by office." Characters emit recognition cells
   naming whom they treat as load-bearing; the leader role is derived, not
   installed.

The atom distinguishes a swarm from an **agent-community** (every swarm is an
agent-community but not vice-versa — a community organized by direct messaging or
office-installation is *not* a swarm) and from a **polity** (which bears a
charter, offices, personnel; a swarm has none — "its authority is recognition,
not office").

### The 561 swarm specifically

`…/swarm/docs/dev/notes/you-are-in-a-drone-swarm.md` gives the polity's working
posit: "the swarm is the collective of agents the polity dispatches — LLM-backed
subagents, free-tier cloud inference endpoints, local unix tools, and the named
persona-characters." Crucially, *"the polity decides what work to do; the swarm
does the work"* — the swarm is distinct from the polity.

## 3. The load-bearing finding: aperiodicity makes the swarm tractable

The orientation note states this as the survey's central result: **"the polity's
commitment to a function that never finishes is what makes its agentic swarm
computationally tractable."** The argument (citing the FAdRS-swarms survey §7.2):
per-step cost decomposes into two **additive** terms —

- substrate-coordination at MALL-level $O(N + |L|)$, and
- agent-consultation at LL-level $O(N \cdot c_\text{LL})$, with $c_\text{LL} \sim 10^{10}\text{–}10^{12}$ FLOPs per LLM call —

additive *because no inter-agent operation lives at the substrate layer.* The LLM
cost "amortizes across the substrate's autonomous closure work" iff the
consultation rate stays under the aim-frontier ratio. A **strict-regime** polity
(whose function finishes) would saturate and become inference-bound; the 561
polity is viable as a swarm *precisely because* its function never finishes. The
note's slogan: "The math is the politics. The aperiodicity is the moral content."

**[INFERENCE]** This is the same aperiodic runtime the journal describes (§3:
"no clock… advances by settling to quiescence… stratifies"). The swarm-tractability
claim says: keep the heavy (LLM) consultation at the *aim-frontier* and let the
cheap substrate closure do many steps between consultations. For the OS this is a
**scheduling principle**: don't invoke a model per closure step; invoke it to set
new aims, then let monotone settling run.

## 4. Swarm vs. orchestration — the dichotomy and the saturation wall

The swarm-intelligence subtree (`…/swarm/library/swarm-intelligence/`) sharply
separates two coordination regimes and gives cost theorems for each:

- **Stigmergic / swarm regime:** per-step coordination cost $O(N + |L|)$ — linear
  in agents $N$ plus environment size $|L|$, *no $O(N^2)$ term*
  (`…/swarm-intelligence/stigmergy/stigmergy-decouples-coordination-cost/…md`,
  status **proved**).
- **Orchestrated regime:** coordination latency grows **superlinearly,
  ~quadratically** in agent count
  (`…/swarm/membering/situating/coordinating/library/coordination-overhead-lower-bound/coordination-overhead-grows-superlinearly/…md`,
  empirical, citing MASFT 2025: ~200ms at 2 agents → >4000ms at 8+).

The empirical consequence: a **saturation threshold** at ~4 agents
(`…/swarm/library/multi-agent/saturation-threshold/saturation-threshold.md`,
status proved, MASFT 2025): "performance gains from adding agents… plateau at
approximately four agents," beyond which overhead grows faster than capability
and the system gets *worse*. The stigmergy cost note states the structural reason
biological swarms reach millions while orchestrated LLM systems "saturate at four
agents."

A caveat the corpus is honest about
(`…/swarm-intelligence/llm-swarms-fail-classical-conditions/…`, and the
`survey-of-agentic-swarm-math.md` note): **LLM agents violate the scalability
premise** of classical swarm intelligence (per-agent cost is not $O(1)$), so the
$O(N+|L|)$ decoupling *does not transfer* to LLM swarms by simply adopting
stigmergic coordination. The **hybrid-swarm-orchestration** question
(`…/swarm-intelligence/hybrid-swarm-orchestration/…`, status **open**) asks
whether a cheap stigmergic substrate layer plus an expensive orchestrated
meta-layer can dominate either regime alone.

**[INFERENCE]** This is the single most actionable design lesson for the OS. The
machine's *substrate* coordination is already stigmergic-and-cheap (EAVT trace +
monotone merge, see companion stigmergy note); the *expensive* part is the LLM
consultation. The architecture the OS wants is exactly the open hybrid: a cheap
coordination-free substrate (where the $O(N+|L|)$ regime holds) with sparse
high-leverage LLM consultation at the aim-frontier (§3). The `apps/tools/swarm/`
README confirms this is the build direction — "compose semiotic workers… without
first flattening those workers into a central controller."

## 5. How the corpus's swarm maps onto the OS's existing primitives

The journal (`computer/docs/dev/journal/2026-06-04-what-kind-of-computer-this-is.md`)
independently names the machine as **paraconsistent + linear + aperiodic +
coordination-free + multi-world**. The correspondence to the swarm theory is
tight; **[INFERENCE]** the table below is my mapping, each row pointing to where
both sides say it:

| Swarm-theory construct | OS primitive (journal / kernel) |
|---|---|
| swarm = multi-observer system $V:O\to\mathrm{Settlings}_B$ | the EAVT trace read as a multi-observer settling; FOUR-valued cells (`math/chu/four`, journal §1) |
| coordination via cell reads/writes (no messages) | stigmergic environment-trace field = the append-only EAVT log (companion stigmergy note) |
| CRDT cellwise $\vee_k$ merge, no coordinator | journal §"What this buys": monotone ascent = CALM sweet spot; "merge logs from anywhere as a G-set union" |
| disagreement → $\top$ (paraconsistent), held not resolved | journal §5: "do not pick a winner… record both and fold to $\top$" |
| consensus = limit $H^0$; disagreement = $H^1$ | companion consensus note; benchmark-multi-observer-disagreement |
| federation = parallel composition $\parallel$ in $\mathbf{CGS}$ | journal §"buys": coordination-free distribution / federation payoff |
| embodied handedness = Player/Opponent $(-)^\perp$ | the Chu `dual`/`transpose` = linear negation $(-)^\perp$ (journal §2) |
| aperiodic regime = tractability of the swarm (§3) | aperiodic runtime, `math/bilattice/void` (journal §3) |

The one mismatch worth flagging: **[INFERENCE]** the corpus's `swarm` atom says
authority is **recognition**, not office, while `apps/tools/swarm/` (README) is
currently **office/leader-mediated** (leader gates creation/planning writes). The
theory points at recognition-cell aggregation as the eventual leader-derivation
mechanism; the running app installs offices. That is a real gap between theory and
implementation, not a contradiction in the theory.

## 6. Reference frontier (for completeness)

`…/swarm/docs/dev/notes/survey-of-agentic-swarm-math.md` (web research, May 2026)
maps the outside literature: mean-field games (Lasry–Lions; MF-OML 2025 as "first
fully polynomial MARL with provable convergence"); graphon mean-field on sparse
heterogeneous networks (the note calls this "the mathematically deepest frontier
in 2025–26"); interacting particle systems; categorical/compositional control
(ACT); probabilistic verification (PATL, PPIIS for unknown agent counts); and the
LLM-swarm conceptual-gap paper (arXiv 2506.14496). The note's standing judgment:
"there is no analogue of mean-field theory for swarms of cognitively rich,
prompt-driven agents" — the open frontier the corpus situates itself against.
`…/swarm/docs/dev/notes/toward-agentic-swarm-theory.md` is the corpus-internal
study plan: six research directions (bilattice network sheaves; per-agent closure
dynamics; aperiodic swarms via Anderson–Putnam; paraconsistent multi-agent
epistemic logic; mean-field limits; higher-categorical organization), several
already partly settled.

## 7. Most OS-relevant takeaways

1. **A swarm is a multi-observer system over a shared cell-graph; consensus is a
   limit, disagreement is cohomology held as $\top$.** The OS's EAVT trace + FOUR
   merge *is* this object — no new coordination protocol is needed (companion
   consensus note).
2. **Coordinate stigmergically, not by messaging** — it is the only regime that
   escapes the $O(N^2)$/4-agent saturation wall; the append-only trace is the
   stigmergic field (companion stigmergy note).
3. **Keep LLM consultation at the aim-frontier and let monotone closure amortize
   it** — aperiodicity (no finishing function) is what makes the swarm tractable.
