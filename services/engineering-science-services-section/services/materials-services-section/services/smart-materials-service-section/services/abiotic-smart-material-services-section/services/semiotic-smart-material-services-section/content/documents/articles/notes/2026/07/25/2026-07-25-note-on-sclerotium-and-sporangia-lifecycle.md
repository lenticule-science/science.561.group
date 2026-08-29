---
title: "Sclerotium and Sporangia: Two Sides of the Rigidity Threshold"
description: "The dormant sclerotium and the reproductive sporangia stage of Physarum zeosemiocenum stated as positions on one state variable — the degree of ossification, the composite's position relative to its rigidity percolation threshold. The zeolite phase is the ossified, over-constrained, record-bearing phase, not a transport scaffold; the flexible matrix is where activity lives. J26 is the space-filling geometry of the rigid domain. With the free-energy descent, the Landauer identity, and the software-deployment layer each stated at their actual strength, and the graphic-matroid/rigidity-matroid gap named as the frontier."
date-created: 2026-07-25
kind: research-note
keywords:
  - rigidity-percolation
  - constraint-counting
  - ossification
  - glass-ceramic
  - zeolite
  - gyrobifastigium
  - j26
  - free-energy
  - landauer
  - obsmetrologia
status: design
declared-by: claude-interactive-session-supplying-leader-movement-team
---
# Sclerotium and Sporangia: Two Sides of the Rigidity Threshold

## 1. The state variable

*Physarum zeosemiocenum* has two lifecycle stages of engineering interest: the dormant,
hardened **sclerotium** and the reproductive, dispersing **sporangia** event. Both are
positions on a single state variable, and naming that variable correctly is what makes the
rest of this note say anything.

The state variable is the **degree of ossification** — the composite's position relative to
its rigidity percolation threshold.

This follows from constraint counting. Phillips and Thorpe's theory gives the rigidity
transition of a network in terms of mean coordination $\langle r \rangle$; counting
bond-stretching and bond-bending constraints per atom against three degrees of freedom puts
the isostatic point — constraints exactly balancing freedoms, zero floppy modes and zero
redundant stress — at $\langle r \rangle_c = 2.4$ (Phillips 1979; Thorpe 1983; Phillips &
Thorpe 1985). Below it a network is *floppy*: it has
internal degrees of freedom that cost no energy, and it flows. Above it the network is
*stressed-rigid*: over-constrained, carrying internal stress, brittle rather than compliant.

Every term in that family — floppy, rigid, jammed, load-bearing, percolating, critical — is
matroid-relative, and a subscript carries the matroid. ₍₁₎ is the **graphic** matroid, whose
nullity is the cycle rank $b_1 = |E| - |V| + c$ and whose independence oracle is union–find;
₍₂₎ and ₍₃₎ are generic rigidity in the plane and in space, of rank $2|V| - 3$ and $3|V| - 6$,
whose oracle is the pebble game and whose independence condition is hereditary and therefore
nonlocal. In general floppy₍ₖ₎ is nullity zero at rank density $k$. Constraint counting is a
statement about a three-dimensional atomic network, so the phases below are floppy₍₃₎ and
rigid₍₃₎, while everything `Percolation.lean` computes is ₍₁₎ — which is §5, carried at each
use site rather than left in one frontier section. Where a family word is used of an argument
or a role rather than of a network it is the ordinary English word and carries no matroid.

| phase | coordination | Phillips–Thorpe regime | behaviour | lifecycle stage |
|---|---|---|---|---|
| flexible siloxane matrix, Si–O backbone | $\langle r \rangle = 2$ | far below 2.4, floppy₍₃₎ | flows, compliant, ion-permissive | plasmodium |
| zeolite framework, 4-connected aluminosilicate | $\langle r \rangle = 4$ | far above 2.4, stressed-rigid₍₃₎ | does not flow, brittle, over-constrained | sclerotium |

The zeolite is therefore **the ossification**, in the precise technical sense and not by
analogy. It is the maximally over-constrained end of the same axis whose floppy₍₃₎ end is the
matrix. It is not a host scaffold that an potential phase crawls through, and it is not a
transport medium: it is the crystallized, committed, record-bearing phase itself. Transport
and activity live in the flexible matrix, in the volume the rigid phase has not claimed.

The plasmodium/sclerotium distinction is the two sides of the rigidity₍₃₎ threshold. The
plasmodium is the floppy₍₃₎ side — it flows because it is under-constrained. The sclerotium is
the stressed-rigid₍₃₎ side — it does not flow because it is over-constrained.

This makes the vocabulary literal rather than figurative. The kinetic control parameter is the
**Deborah number**,

$$\mathrm{De} = \frac{\tau_{\text{relax}}}{\tau_{\text{observe}}},$$

the ratio of the substrate's characteristic relaxation time to the time over which it is
watched (Reiner 1964). It is dimensionless, it is the standard control parameter for exactly the class of
dynamic-covalent networks this composite is built from, and it promises no conjugate variable,
no energy scale, and no Boltzmann factor — none of which is available here, there being no
$\partial S/\partial E$ on this substrate for a temperature to be the reciprocal of.

A system driven to $\mathrm{De} \gg 1$ relaxes far slower than it is watched and arrives at a
fully crystallized, over-constrained, brittle state that cannot rearrange. That is **premature
ossification**, and it is a real materials pathology, not a metaphor for one. The sclerotium
*is* the ossified state, and it is the $\mathrm{De} \gg 1$ end of the axis; the plasmodium,
relaxing faster than it is watched, is the $\mathrm{De} \ll 1$ end; and a node in vegetative
operation is held near $\mathrm{De} \approx 1$, the viscoelastic regime — not a vague middle
but a well-characterized place to sit, with its own measurable signatures.

The material class is the **glass-ceramic**: controlled devitrification of a crystalline
phase out of an amorphous host, where the property of interest is set by crystalline volume
fraction, morphology, and connectivity rather than by chemistry alone.

The full development of this reading, including what it costs the upstream formulation
sheets, is in the companion notes:
`lib/emsenn/services/561-group/services/lenticule-science/content/documents/articles/notes/2026/07/25/ossification-as-the-state-variable.md`
and
`lib/emsenn/services/561-group/services/lenticule-science/content/documents/articles/notes/2026/07/25/coordination-obstruction-as-mirror-descent.md`.

---

## 2. The Sclerotium: hardened closure at $\mathrm{De} \gg 1$

The sclerotium is the node-hibernation and cold-storage state entered when a workspace node
meets an attention or energy drought — low transaction flux, zero gas or WIT balance.

### 2.1 The free-energy descent

Under vegetative conditions the potential phase descends a free-energy gradient. The
formalization is `Obsmetrologia/Dynamics/Flow/FreeEnergyLyapunov.lean`, which identifies the
corpus's closure settling with gradient flow of

$$F = E - T \cdot S$$

and proves an H-theorem for it. Three things about that module must be carried honestly.

**It is rendered over `Nat`, by design.** The module states this explicitly in its own
faithfulness section: $F = E - T\cdot S$ is the *integer* reading. The potential is
`deficit cells v w`, the knowledge-order height gap between a valuation and the settled
fixed point, summed over a finite cell support and computed with `Nat` subtraction. The
module does **not** fabricate a real-valued entropy $S$. Reals are available in the library
(`Obsmetrologia.Real.Internal`) and are not used here, because the value order is the
preference.

**The termination bound is $\Phi(0) + 1$ steps.** `converges_in_bounded_steps`,
`firing_steps_bounded`, and `kappa_bounded_by_initial_free_energy` give the orbit's settling
step $N \le \Phi(0)$ with total step count $\le \Phi(0) + 1$: the initial free energy bounds
the convergence time, and dominates the closure ordinal $\kappa$. The bound is not a
constant.

**The $T \to 0$ limit is `closureAtZeroTemp`.** At zero temperature the entropic term
vanishes and the potential is purely the energy $E$; `closureAtZeroTemp_is_hard` exhibits
the resulting operator as inflationary, monotone, and idempotent — deterministic Boolean
hard closure, no stochastic preference weighting. This is the quench.

**The module's $T$ and §1's $\mathrm{De}$ are two variables, and are kept apart.** The $T$
above is the coefficient on $S$ in $F = E - T\cdot S$ — a conjugate variable inside that
functional, with an $S$ for it to be conjugate to, and a statement about the settling
operator. $\mathrm{De}$ is a ratio of two times, has no entropy paired with it, and is a
statement about the substrate. Nothing below infers one from the other; where both appear,
$\mathrm{De} \gg 1$ is the material side and $T \to 0$ the settling side of one dormancy.

### 2.2 What the quench does

1. **Free-energy quench.** The module's $T$ is driven to zero, collapsing $F \to E$ (§2.1).
   Stochastic exploration of the mempool halts. The substrate-side move that accompanies it
   is driving $\mathrm{De}$ upward until the matrix no longer relaxes within the observation
   window.
2. **Loss of the un-relaxable rotational content.** The fivefold, non-crystallographic
   rotational structure cannot be accommodated in a crystallographic lattice. The
   crystallographic restriction — an $n$-fold rotation is compatible with lattice
   translational symmetry only for $n \in \{2,3,4,6\}$ — is a standard external result of
   crystallography, and it forces fivefold structure out of the crystallized core and into a
   localized boundary. What the library proves about this is narrower and stated in §4.
3. **Crystallization into the J26 domain geometry.** The ossified regions tile the volume
   they claim. The gyrobifastigium $J_{26}$ is the unique space-filling Johnson solid, which
   makes it the right shape of answer to a packing question about a rigid domain.
   `Obsmetrologia/AperiodicOrder/Tiling/J26.lean` builds it as an oriented combinatorial cell
   complex with a strict dimension-drop property — exactly the right kind of object for a
   space-filling rigid domain. This is a packing claim about the ossified phase and nothing
   else; no self-assembly, mesophase, or block-copolymer mechanism is invoked or needed.

### 2.3 The rigid phase is a recorder

Ossified regions do not rearrange. Where the rigid phase has grown, the configuration is
frozen; where it has not, the matrix can still flow. The composite's crystalline morphology
is therefore a written record of its own thermal and mechanical history, and the floppy₍₃₎
complement is the part still able to change.

Cold-storage compression is the same shape of fact in the epistemic register rather than a
consequence of the geometric one: the node's potential, multi-observer d-frame collapses to an
extensional static patch, because what has been seated is no longer re-derived. The geometric
fact — a frozen region has no remaining mechanical degrees of freedom — is its counterpart and
not its proof. No measurement of a crystallite attests anything about a d-frame.

### 2.4 Reactivation, and the reversibility question

Germination is re-dissolution or re-fluidization of the rigid phase: an incoming attention
solvent drives the local $\mathrm{De}$ back toward 1, the rigid phase partially re-dissolves,
and the volume it releases returns to the floppy₍₃₎, flowing, active state. This is a real and
checkable process — controlled devitrification runs in both directions in glass-ceramic
systems in general.

**Whether it runs in both directions *here* is open, and it is the question that decides
what this substrate is for.** If ossification is one-way, the substrate is write-once: its
computational use is limited to a *record*, not a reconfigurable state. The experiment is
direct — grow rigid domains, attempt re-dissolution, count cycles — and no result is claimed
here.

---

## 3. The Sporangia event: dispersal

In biological *Physarum*, starvation under light triggers sporulation: fruiting bodies form
and disperse spores. In this architecture the sporangia event is autonomous node
replication, capability-package publishing, and lateral delegation.

What results is neither a colony nor a second organism, and the difference from the borrowed
genus is informative. A *Physarum* plasmodium is one continuously connected coenocytic cell
with a definite boundary; what this architecture spreads across hosts is a **genet** — a
clonal lineage occupying a territory, genetically one, spatially extended, and not necessarily
continuously connected (Smith, Bruhn & Anderson 1992). Shared law is the shared genome. Distribution across hosts is spatial
extension. That it is genuinely hard to say which hosts are inside is the genet's
characteristic boundary ambiguity and an empirical question about the territory, not a defect
in the description — which is exactly what *colony*, with its separable countable individuals,
and *organism*, with its single continuous body, would each get wrong.

### 3.1 The germline–soma distinction (external biology, read as an architecture)

Weismann's barrier is the observation that in organisms with a sequestered germline,
somatic modifications are not heritable: information flows germline → soma and not back.
Eigen's error-catastrophe threshold gives the condition under which heritable information
survives replication at all — for genome length $L$, per-site error rate $u$, and selective
superiority $\sigma$, information is maintained only while

$$u < \frac{\ln \sigma}{L}.$$

Above the threshold, heritable information delocalizes into noise.

Both are correct external results of biology (Weismann 1893; Eigen 1971) and both are cited,
not derived, here.

The architectural reading is that a running node has a mutable soma — its active state space
— and a durable germline — the committed, content-addressed laws and templates in the
repository, which is the genet's genome and is shared by every host the lineage occupies
rather than copied into separable individuals — and that the soma is forbidden from writing
the germline directly, since unverified heritable mutations would propagate. When a node reaches capacity or solves a
contract-optimization problem, it compiles somatic experience into an immutable, heritable
capability package (the sporangium) which buds into independent spores.

It is a structural
analogy between an information-flow constraint in biology and an information-flow constraint
in a repository. Nothing in it is a thermodynamic guarantee, nothing in it is proved, and
the Eigen threshold in particular is a statement about replicating sequences under a
mutation rate — it is not applied here to anything else.

### 3.2 Spore anatomy — the software-deployment layer, stated separately

The material below is a software-deployment story. It is engineering that runs, and it is
**not** materials science; it is set apart here so that the two are not read as one argument.
Nothing in §1, §2, or §5 depends on it, and it does not corroborate them.

Each spore is a minimally viable, independently contract-addressable package dispersed over
the peer-to-peer network (ActivityPub, libp2p), designed to require no central coordination
or parent authority to germinate. It carries three components:

1. **The RMN law digest** — the exact, immutable, versioned and normalized contract theory
   defining the node's regulatory laws and capability schemas.
2. **A CREATE2 deterministic account factory** — a permissionless, non-EOA account factory
   committing a digest of the node's initial workspace identity, letting a landed spore
   deterministically deploy its own ERC-4337 smart account on any EVM-compatible chain.
3. **A signed A2A agent card** — a web-modeled cryptographic identity and x402 payment
   profile, letting the spore participate in border price discovery for its own services.

The node's historical sequence is packed into a signed Merkle-root manifest on its parent
EVM L2 chain before dormancy.

The realizing asset is `EnterpriseAccount.sol` (§4). Deployment determinism and account
abstraction are properties of that contract, not evidence about a physical substrate.

---

## 4. Verification status

Every row below names an asset that exists at the stated path and states only what that
asset actually contains. Existence and content were checked against the filesystem; **no
build and no axiom audit was run for this note.** The rows therefore rest on one channel —
reading the source — and re-reading it, by whatever party, would not add a second. What
would verify them is a pass through a channel this note did not use: compiling the Lean tree
and running an axiom audit over the cited declarations. Until that has run, treat every row
as unattested.

| Phase | Asset | What it actually states |
|---|---|---|
| Sclerotium quench | `Obsmetrologia/Dynamics/Flow/FreeEnergyLyapunov.lean` | `closureAtZeroTemp_is_hard`: the $T=0$ operator is inflationary, monotone, idempotent. `firing_steps_bounded` / `kappa_bounded_by_initial_free_energy`: settling in $\le \Phi(0) + 1$ steps. All over `Nat`, no real-valued $S$. |
| Rigid-domain geometry | `Obsmetrologia/AperiodicOrder/Tiling/J26.lean` | The gyrobifastigium boundary as an oriented combinatorial cell complex: `every_face_boundary_is_valid`, `combinatorial_counts` (8 vertices, 14 edges, 8 exterior faces), `face_dim_drop` (strict dimension drop). Space-filling is the external Johnson-solid fact, not a theorem here. |
| Fivefold algebra | `Obsmetrologia/AperiodicOrder/Tiling/StepN/GoldenFieldBridge.lean` | `phi_sq` ($\varphi^2 = \varphi + 1$) and `phi_add_gap5` ($\varphi + \lambda_5 = 2$): $\sqrt5$, $\varphi$, $2-\varphi$, $(3-\sqrt5)/2$ are one field element's normalizations. It does **not** prove anything about crystallographic limits. |
| Non-crystallographic gap | `Obsmetrologia/Dynamics/Flow/ChromaticTileGap.lean` | `tile5_first_noncrystallographic_quadratic_surd`: the pentagon gap needs $a = 3$ where the crystallographic family ($a = 2$, $N \in \{2,3,4,6\}$) requires $d \le 4$; $d = 5$ violates it. The module states its own scope: one algebraic-family fact, not a claim about Penrose tilings, matching rules, or continuum aperiodic order. |
| Erasure accounting | `Obsmetrologia/Cohomology/LandauerEntropy.lean`, `Obsmetrologia/AperiodicOrder/Tiling/KappaStratification.lean` | `landauerBits N := N.H1rank` is a **definition**; `landauer_cost_is_h1` is proved by `rfl`. See §4.1. |
| Load-bearing₍₁₎ threshold | `Obsmetrologia/AperiodicOrder/Tiling/Percolation.lean` | `loadBearing_iff_critical`, `floppy_iff_at_threshold`, `percolation_onset`, `h1rank_mono` — over the cycle rank of the contact network, hence ₍₁₎ throughout. See §5. |
| Spore provisioning | `.../red-cup-engineering/services/blockchain-services-section/services/ethereum-services-section/src/EnterpriseAccount.sol` | An ERC-4337 account (`validateUserOp`, `executeRmn`, EIP-712 policy signer) plus `EnterpriseAccountFactory`, a permissionless CREATE2 deployer with `deploymentSalt` / `accountAddress`. Software deployment, per §3.2. |
| Spore exchange | `.../executive-office/services/finance-and-market-services-section/src/witness-bit.mjs` | `verifyCommodityUtterance` checks the content-addressed `CommodityUtterance` token/claim ordered pair and its content id. Software, per §3.2. |

### 4.1 The Landauer identity

`landauerBits (N : CoverNerve) : Nat := N.H1rank`, and `landauer_cost_is_h1` is proved by
`rfl`. The Landauer cost *is* the cover-nerve cycle rank because it is defined to be it.

There is no $kT \ln 2$ anywhere in the library and no derivation from thermodynamics. What
Landauer's principle supplies is an external inequality — erasing one bit at temperature $T$
dissipates at least $k_B T \ln 2$ of heat (Landauer 1961) — and the identification of $b_1$ with a bit count
is a modelling choice, justified when each independent cycle carries exactly one bit of
irreducible disagreement and not otherwise. Presenting the identification as a discovered
physical law is a category error, and the fact that both quantities are counted in bits is
not evidence. `landauer_zero_iff_reversible` is a real theorem, but what it proves is that
the cycle rank vanishes iff the nerve is a forest.

---

## 5. The frontier: two matroids

The corpus's percolation vocabulary — floppy, jammed, load-bearing, the jamming click — is
**rigidity** vocabulary, and on the ossification reading that vocabulary is *correct* at ₍₃₎.
Mechanical rigidity is exactly the phenomenon: the sclerotium/plasmodium distinction is the
floppy₍₃₎/stressed-rigid₍₃₎ distinction, and the transition between them is the rigidity₍₃₎
percolation transition.

The implemented mathematics is not that transition. `Percolation.lean` computes

$$b_1 = |E| - |V| + c,$$

the cycle rank, which is the nullity of the **graphic** matroid, so every one of those words
is earned at ₍₁₎ only. Its transition is the appearance of the first cycle: continuous, sharp
at a single contact count, one redundant contact raising the rank by exactly one —
`percolation_onset` says precisely this.

Mechanical rigidity is governed by a different matroid. Generic rigidity in the plane is
Laman's condition and the **rigidity matroid**, of rank $2|V| - 3$ (Laman 1970). The generic rigidity
matroid exists in every dimension — it is the matroid of the rigidity matrix at a generic
configuration, well defined by genericity — but in three dimensions only the rank count
$3|V| - 6$ is available, not a combinatorial characterization: Laman's condition fails in 3D,
the double-banana graph being the standard counterexample. The correct independence test for
whether an added contact is redundant is the **pebble game**, not union–find (Jacobs &
Hendrickson 1997). And Laman's
condition is hereditary — every subgraph on $n'$ vertices carries at most $2n' - 3$ edges — so
redundancy is nonlocal, and no per-site or per-vertex count can detect it.

The order of the transition is not part of the gap. Rigidity percolation's order is
lattice-dependent and was contested: on the two-dimensional triangular lattice, generic
rigidity percolation is measured as **continuous** — second-order, in a universality class of
its own (Jacobs & Thorpe 1995, 1996). First-order behaviour is the Bethe-lattice and
mean-field result (the Moukarzel–Duxbury–Leath line; attribution not independently checked
here). What separates the two matroids here is the rank function and the independence oracle,
not the sharpness of the rise.

So the gap is precise, and it is a frontier rather than a defect: **the vocabulary and the
physical referent are rigidity — ₍₂₎ in the plane, ₍₃₎ in the bulk — and the implemented
matroid is connectivity, ₍₁₎.** Closing it means
replacing the graphic independence oracle with a rigidity one — a strictly harder object
whose independence test is nonlocal — and the payoff is that the ossification state
variable would then be computed by the mathematics that governs it.

A second, smaller gap sits in the placement measure. Constraint counting gives a threshold
in mean coordination; deriving a *critical fraction* from a per-site occupation rate
additionally requires a joint law over sites. `Percolation.lean` derives a gauge-invariant
single-site $\top$-rate of $1/4$ from the transitivity of $D_4$ on the four corners, which
settles the single-site measure and does not settle the joint law. Invariance of a
single-site distribution does not force independence across sites, and correlated placement
can cross a coordination threshold at a very different density than independent placement.
Any critical-fraction claim must state which joint law it assumes.

---

## References

Eigen, M. (1971). Selforganization of matter and the evolution of biological macromolecules.
*Naturwissenschaften* 58, 465–523.

Jacobs, D. J. & Hendrickson, B. (1997). An algorithm for two-dimensional rigidity
percolation: the pebble game. *Journal of Computational Physics* 137, 346.

Jacobs, D. J. & Thorpe, M. F. (1995). Generic rigidity percolation: the pebble game.
*Physical Review Letters* 75, 4051.

Jacobs, D. J. & Thorpe, M. F. (1996). Generic rigidity percolation in two dimensions.
*Physical Review E* 53, 3682.

Laman, G. (1970). On graphs and rigidity of plane skeletal structures. *Journal of
Engineering Mathematics* 4, 331.

Landauer, R. (1961). Irreversibility and heat generation in the computing process. *IBM
Journal of Research and Development* 5(3), 183–191.

Phillips, J. C. (1979). Topology of covalent non-crystalline solids I: short-range order in
chalcogenide alloys. *Journal of Non-Crystalline Solids* 34, 153.

Phillips, J. C. & Thorpe, M. F. (1985). Constraint theory, vector percolation and glass
formation. *Solid State Communications* 53, 699.

Reiner, M. (1964). The Deborah number. *Physics Today* 17(1), 62.

Smith, M. L., Bruhn, J. N. & Anderson, J. B. (1992). The fungus *Armillaria bulbosa* is among
the largest and oldest living organisms. *Nature* 356, 428–431.

Thorpe, M. F. (1983). Continuous deformations in random networks. *Journal of
Non-Crystalline Solids* 57, 355.

Weismann, A. (1893). *The Germ-Plasm: A Theory of Heredity.* Scribner.
