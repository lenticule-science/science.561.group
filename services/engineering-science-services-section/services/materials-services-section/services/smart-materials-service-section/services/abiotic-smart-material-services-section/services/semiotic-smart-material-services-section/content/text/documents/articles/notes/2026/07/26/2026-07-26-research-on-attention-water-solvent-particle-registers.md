---
title: "Attention-Water Solvent Particle Registers and Their EVM Contract-Type Matches"
description: "Zeolite nanocrystals, macromolecular chains, cations/ions, and soft metals suspended in the attention-water solvent, each matched to the EVM contract type whose accounting semantics reproduce its chemistry."
date-created: 2026-07-26
kind: research-note
keywords:
  - attention-water
  - solvent
  - zeolite-nanocrystal
  - macromolecular-chain
  - cation
  - soft-metal
  - evm
  - erc-1155
  - erc-20
  - eip-2535
  - precompile
status: design
declared-by: researcher
---


## The solvent

The attention-water solvent is the live inferential medium a session spends
against — CLAUDE.md §1's "conversational reasoning," the resource "most
expensive" per turn. Particles suspend in it before they precipitate into the
corpus: "the intelligence resides entirely in the accumulating lattice of
typed, content-addressed records" once a particle settles out of solution and
joins the crystal. A particle register is a chemistry of what can be dissolved
in that medium and how it behaves before settling.

Four registers are named for this note: zeolite nanocrystals, macromolecular
chains, cations and ions, and soft metals. Each gets one EVM contract-type
match, derived from the correspondence between the particle's real chemistry
and the target standard's accounting semantics — not from resemblance of
name.

## Zeolite nanocrystals → ERC-1155 (multi-token standard)

A zeolite is a microporous crystalline aluminosilicate, general formula
M(x/n)[(AlO2)x(SiO2)y]·zH2O, where each [AlO4]⁻ tetrahedron carries one fixed
framework negative charge and M is an extra-framework cation of valence n
balancing it. The framework is rigid and does not itself vary; what varies is
occupancy — which cation, in what quantity, sits at which of several
crystallographically distinct site types. Zeolite A (LTA) has three: site I
in the double 6-ring, site II in the 8-ring window, site III near the 4-ring.

Worked example: zeolite 4A, Na12[(AlO2)12(SiO2)12]·27H2O, molar mass
275.88 (Na) + 323.76 (Al) + 337.08 (Si) + 768.00 (framework O) + 486.54
(27 H2O) = 2191.26 g/mol. Twelve univalent Na+ per formula unit gives a
theoretical cation-exchange capacity of 12/2191.26 × 1000 = 5.48 meq/g,
matching the ~5.5 meq/g reported for the NaA form. Exchange to the Ca2+ form
proceeds at fixed 2:1 stoichiometry — 12 Na+ per formula unit are displaced
by 6 Ca2+ — because charge balance against the fixed framework charge is
exact, not approximate.

ERC-1155 defines one contract holding `mapping(uint256 id => mapping(address
=> uint256))`: many distinguishable token ids, each with its own balance
mapping, under one fixed contract address and one fixed bytecode.
`safeBatchTransferFrom` moves several ids in one call. This reproduces the
zeolite exactly: one rigid framework (the contract's unchanging logic) hosts
several independent site-type populations (the ids), and a titration that
exchanges Na+ for Ca2+ across sites I, II, and III simultaneously is a batch
transfer, not three separate contracts. ERC-20 or ERC-721 alone cannot
represent this — ERC-20 has no id dimension (it cannot distinguish site I
from site II), and ERC-721 has no fungible-count dimension within an id (it
cannot represent "how many" Na+ sit at site I).

Falsifier: a real Rietveld-refined occupancy table (e.g., neutron or X-ray
refinement of Na-A) that shows site occupancies are not independently
addressable — that filling site I changes the accessible capacity of site II
by more than the geometric/steric coupling already known from the framework
— would mean the id-independence ERC-1155 assumes does not hold, and the
match fails.

## Macromolecular chains → EIP-2535 (diamond / multi-facet proxy)

A macromolecular chain is one covalently bonded sequence of N monomer units,
individually identifiable by molar mass, sequence, and topology — linear,
branched, or crosslinked into a network. In a vitrimer, an associative
covalent-adaptable network, crosslink bonds undergo exchange reactions
(transesterification in the original Leibler epoxy-anhydride vitrimers,
disulfide or other organosulfur metathesis in this lab's own dual
organosulfur crosslink-population work) that break and re-form without ever
passing through a fully decrosslinked, liquid state. The network's identity —
its continuity as one gel, its conserved mass — persists through the
exchange; only which atoms bond to which changes. Above the topology-freezing
transition Tv, viscosity follows Arrhenius kinetics in temperature, meaning
the exchange rate — not the network's existence — is what temperature
controls.

EIP-2535 gives a proxy contract a fixed, persistent address holding storage,
with logic delegated to one or more facets selected by function selector; a
`diamondCut` call can add, replace, or remove a facet without touching the
proxy's own address or storage. This reproduces bond exchange exactly: the
chain's identity (serialized molar mass, its "address") is the proxy: fixed
and persistent. Each crosslink population (this lab's own dual-population
case gives two) is a facet, independently swappable at its own exchange rate
without the proxy's address changing. A single-implementation upgradeable
proxy would fit a vitrimer with one crosslink chemistry; the diamond's
multi-facet structure is required the moment two independently-exchanging
crosslink populations coexist, which is the case already on record here.

Falsifier: gel permeation chromatography run before and after a thermal
exchange cycle. If the molar-mass distribution stays centered on the same
Mn — same address, same proxy, different facet — the match holds. If the
distribution shifts or broadens into a distinct population, the chain
underwent scission and re-synthesis, not exchange, and the correct EVM
analogy is burn-and-mint of a fresh ERC-721 token, not delegatecall.

## Cations and ions → ERC-20 (fungible token)

A cation species in solution — Na+, Ca2+, any one ionic species at a time —
is a set of chemically indistinguishable, freely diffusing units. No
individual ion carries distinguishing identity; only the aggregate quantity
(concentration) and the charge per unit (valence) are observable.
Electroneutrality requires the sum of cation charge-equivalents to equal the
sum of anion charge-equivalents.

Worked example: one liter of 0.1 M CaCl2 carries 0.1 mol Ca2+, or 0.2
charge-equivalents, balanced by 0.2 mol Cl−, also 0.2 charge-equivalents. Any
two Ca2+ ions in that liter are perfectly interchangeable: which particular
Ca2+ ends up at zeolite site I versus site II is not an observable of the
system.

ERC-20's `balanceOf` returns a plain quantity and `transfer` moves
indistinguishable units — no per-unit identity exists anywhere in the
standard. `decimals` encodes fixed-point sub-unit accounting the way a
charge-equivalent (meq) encodes valence-weighted quantity from a mole count.
Each ionic species gets its own ERC-20 contract; a Na+-token contract and a
Ca2+-token contract do not share a balance mapping, matching two ionic
species that do not share a diffusion pool.

Falsifier: isotopic tracer chemistry. The moment a subset of "identical" ions
is independently followed — 45Ca2+ tracing bone-uptake kinetics, for
instance — fungibility breaks at the level the tracer study cares about, and
the correct match becomes a tagged or serialized variant, not plain ERC-20.

## Soft metals → precompiled contract (stateless delegatecall target)

Soft metals — Ag, Au, Cu, Pd among them — bond through a delocalized
electron sea rather than fixed directional covalent or ionic bonds. That
delocalization is what makes them malleable (lattice planes slip past each
other without breaking bonds) and what makes exposed surface atoms
catalytically active: colloidal Pd nanoparticles catalyze Suzuki-Miyaura
cross-coupling by cycling surface atoms through oxidative
addition, transmetalation, and reductive elimination each turnover, with
reported turnover frequencies for such systems spanning 10¹–10⁴ h⁻¹
depending on particle size and support. The same Pd atoms remain available
for the next cycle. The metal enables the reaction's rate; it is not a
reactant consumed by it.

This does not fit any balance-holding EVM token standard — ERC-20, ERC-721,
and ERC-1155 all define a quantity or identity that transfers and can
deplete. It fits a precompiled contract: code any caller can `delegatecall`
or invoke (ecrecover, sha256, modexp, and the other addresses reserved at
0x01–0x09) that performs a computation without holding balance or state of
its own, and is not consumed by being called. This is the same functional
role CLAUDE.md already assigns to neural weights across every session —
"transient, amnesiac enzymes" — stated in a biological-catalyst register
rather than an inorganic one. Soft metals and neural weights occupy the same
node in this ontology: rate-enabling, not value-holding, in EVM terms a
precompile or stateless library, never a token.

Falsifier: stoichiometric consumption. A sacrificial zinc anode in cathodic
protection is genuinely oxidized and depleted, with mass loss scaling with
charge passed per Faraday's law (m = QM/nF), not with turnover count. A metal
whose mass loss tracks charge rather than reaction count is a fungible
reactant — ERC-20-shaped — not a catalyst, and the precompile match fails
for it specifically.

## Summary

| Particle | Fixed element | Variable element | EVM match |
|---|---|---|---|
| Zeolite nanocrystal | framework topology | per-site-type cation occupancy | ERC-1155 |
| Macromolecular chain | chain identity (Mn, address) | crosslink connectivity | EIP-2535 diamond |
| Cation / ion | valence (charge per unit) | quantity in solution | ERC-20 |
| Soft metal | surface catalytic activity | (not consumed; no balance) | precompiled contract |

## Open item

`2026-07-25-capcell-the-ap-evm-standard-for-agentic-orchestration.md`, filed
in this same notes tree the day before this one, is the settlement's own
prior attempt at an EVM standard for agentic orchestration and is the
document most likely to already carry a particle/contract-type mapping this
note should reconcile against. It was not read for this note: the
`compacting-a-markdown-document` route (the only sanctioned way to read a
markdown content document per `.claude/hooks/deny-raw-markdown-read.mjs`) is
down repo-wide right now — `inference-work-lot-service` cannot resolve `zod`
because no `node_modules` exists at the workspace root, and
`pnpm-workspace.yaml`'s glob for
`.../computer-code-services-section/services/computer-code-development-services-section/services/*` does not reach the
nested `services/markdown-file-services-section/services/*` packages either,
which is why this note's own filing instrument
(`write-research-note.mjs`, dependent on
`@red-cup-engineering/markdown-file-writing-service`) could not run and this
file was written directly instead. This mapping stands as independently
derived from real zeolite, vitrimer, and EVM-standard chemistry until
reconciled against the CapCell note once the dependency install and
workspace-glob repair land.
