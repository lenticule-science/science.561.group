---
title: "Obsmetrologia invariants for a pooling protocol"
description: "The invariants a Tidepool contract is judged by, each with the Obsmetrologia declaration that carries it (or the plain statement that it is absent), the golden vectors that judge a Solidity implementation, and the derivations still open."
date-created: 2026-10-08
type: notes
name: 2026-10-08-note-on-obsmetrologia-invariants-for-a-pooling-protocol
status: active
authors:
  - claude-sonnet-5-5
keywords:
  - tidepool
  - obsmetrologia
  - golden-vectors
  - conformance
  - four
  - pool-split
  - conservation
---

## What is judged

A Tidepool contract is judged against Lean declarations by vectors read off them. Everything below is in the conformance package `lean-system-services-section/lib/obsmetrologia-conformance`. Each vector row names its declaration (`a`) and the specification address (`t`).

| Suite | Rows | JSONL |
|---|---|---|
| four-bilattice | 773 | `four-bilattice.golden-vectors.jsonl` |
| four-mix | 80 | `four-mix.golden-vectors.jsonl` |
| pool-split | 569 | `pool-split.golden-vectors.jsonl` |
| allocation-solver | 1275 | `allocation-solver.golden-vectors.jsonl` |

All four are registered in `src/golden-vector/suites.mjs` with no realization, so they are pending until an implementation exports one. Regenerate with `node scripts/emit-golden-vectors.mjs --suite <name>`.

## Vector path and shape for Foundry

Plain JSON projection, written by `lake env lean --run VectorsMain.lean <dir>`, lives at `lib/obsmetrologia-conformance/vectors/` and is meant to be symlinked or copied to `signstuff-evm/test/vectors/lean/`:

- `four/` : Reading ops (`joinK meetK joinT meetT leK leT negate conflate negConf kBot kTop tTop tBot`) and the FourMix ops (`readingFuse readingPar readingMix requiresConsensus equalityLocus`).
- `record/` : the tally carrier (`add joinK meetK joinT meetT leK leT reading topMass`) over tallies 0..2.
- `valued/` : the lossless carrier with witnesses (`joinK meetK joinT meetT negate conflate presumeFree`).
- `pool/` : `split shares dust settleCycle transfer` and the knapsack `solveL solveR degeneracy`.

Each file is `{"suite","declaration","cases":[{"op","args","result"}]}`, one file per operation, so a file is arity-homogeneous. A reading is `[pos, neg]` as booleans (`pos` is told-for, `neg` told-against; `FourMix.Charge{positiveEvidence,negativeEvidence}`). A record is `[pos, neg]` as numbers. Pool amounts and weights are decimal strings. The order of points in the full tables is absurd=[0,0], potential=[1,0], active=[0,1], stable=[1,1].

Decoding in Foundry, verified with forge 1.7.1: `abi.decode(vm.parseJson(j, ".cases"), (Case[]))` with `struct Case { bool[][] args; string op; bool[] result; }` (struct fields in alphabetical order; relations have `bool result`, so use a second struct). Pool strings: `vm.parseJsonUint(j, ".cases[i].args[0]")` and `abi.decode(..., (string[]))`. Add `fs_permissions` read on the vectors directory.

Cross-check done: a JS transcription of `FourMix.tensor/par/requiresConsensus/equalityLocus` from `FourMixConsensusProfile.sol` agrees with every row of `readingFuse`, `readingPar`, `requiresConsensus`, `equalityLocus`, the four lattice operations, and the split rows. The Solidity itself has not been run against them.

## Invariants

**1. Principal conservation.** Moving value between accounts leaves the sum of balances unchanged, and a cycle settlement leaves principal untouched while the buckets sum to the yield. Carried by `Obsmetrologia.Economics.PoolSplit.transfer_conserves` and `cycle_conserves` (new, kernel-checked; axioms propext and Quot.sound). Judged by: `pool/transfer.json` row by row, then a fuzz test that the sum of balances is constant under random valid transfers and that every contract entry point keeps `sum(balances) == totalAssets - yieldOwed`. Absent: no declaration says anything about an ERC-4626 share price; that is not proved.

**2. Split exhaustiveness.** With floor shares and the dust to the first bucket, the buckets sum to the yield exactly, the dust is below the bucket count, every non-first bucket is within one unit of exact pro-rata, no bucket exceeds the total, and shares are monotone in weight. `split_sum`, `dust_lt_length`, `share_floor_spec`, `split_le`, `share_mono`. A zero total weight gives the whole yield to the first bucket (Lean `n/0 = 0`); a Solidity division must special-case it or revert, and `pool/split.json` carries the zero-weight rows. Judged by: `pool/split.json`, `shares.json`, `dust.json` (16 totals up to 2^256-1, 10 weight sets, including 20/30/50 as parts and basis points); use full-precision `mulDiv` so `T*w` cannot overflow. Property test: `sum(split(T,ws)) == T` for random T and ws.

**3. Evidence monotonicity (no witness dropped).** Every operation on a `Valued` unions the witnesses: `Valued.evidence_accumulates_joinK`, `_meetK`, and their `_right`, `_against` forms; `joinK_measured` keeps value equal to what the evidence shows. `Record.add` only increases tallies. Judged by: `valued/*.json` (the witness sets in the result contain both operands' witnesses; compare as sets), and a property test that no operation lowers `pos` or `neg` of a stored record. Absent: nothing proves a bounded witness set (a bitmap or capped counter) refines the list model; that refinement must be proved if the contract caps.

**4. Contradiction held, never discarded.** Meeting two opposed readings gives value absurd but keeps both witnesses (`Valued.meetK_not_measured`); the counting merge cannot lose contradiction mass (`Record.topMass_add`); the readout of the merge equals the readout of the join (`Record.reading_add_eq_reading_joinK`). Judged by: `valued/meetK.json` (the [potential, active] row has value [0,0] and both witnesses), `record/add.json`, `record/topMass.json`. Test: a stored `(pos>0, neg>0)` record never reads as consistent after any later operation.

**5. Mint and jump ledger registers.** For a step that is monotone in knowledge from a state with no held contradiction, the number of held contradictions equals mints plus jumps (`Valuation.topSupport_eq_mints_add_jumps`); the flux of a step is commits + mints + 2*jumps (`stepFlux_decomposition`); the registers are invariant under negation and exchange commits and mints under conflation (`ledger_noether`). Here a mint is a definite reading quenched to held contradiction, and a jump is nothing to held contradiction. These count contradiction events in a claim ledger, not token supply. Vectors: none emitted, since the declarations range over valuations of predication cells; a contract that keeps per-claim readings is judged by replaying a claim trace through the four-bilattice tables and checking the three counters. Absent: no declaration relates these registers to any token balance.

**6. Allocation-solver optimality.** `solveL_optimal` and `solveR_optimal`: the returned selection is feasible and has the maximum benefit among feasible sublists; `solvers_agree_value`; the two hands return the same selection exactly when the optimum is unique (`hands_agree_of_unique_optimum`); `choiceBits_zero_iff_effectively_unique`. Judged by: `pool/solveL.json`, `solveR.json`, `degeneracy.json` (universes of up to three obstructions, budgets 0 to 4). The tie rule matters: an implementation must choose the declared hand on ties. Fairness: absent. The solver maximizes benefit under a cost budget over reconciliation obstructions; it says nothing about equal treatment of members, and the solver is exponential in the universe, so it specifies small on-chain selections only.

**7. Free-energy descent for a cycle-settling flow.** For a closure on readings, the deficit to the settled valuation never rises along the orbit and falls by at least one at each firing (`freeEnergy_antitone`, `freeEnergy_strict_of_fires`, `free_energy_is_lyapunov`); the seed's energy equals the flux so far plus the residue (`ledger_total`, `ledger_closes`). Applied to Tidepool only after a cycle's settling is stated as a closure over claims (cycle closed, member paid, yield booked) whose readings climb; then the number of unsettled claim-heights bounds the number of settling steps. Judged by: a test that the sum of heights (absent 0, pole 1, contradiction 2) over claims never decreases and every state-changing call raises it. Absent: no module states Tidepool's cycle as such a closure; that statement is not written.

**8. Coordination-cohomology obstruction as cross-chain inconsistency.** The rank of the first cohomology of the source-stance nerve counts the cells in excess of a spanning forest; it is zero exactly when the nerve is a forest (`h1_vanishes_iff_forest`, `h1rank_is_coordination_cost`, `coordinationFree_iff_forest`). The prices bound each other: held-contradiction support is at most mass at most the cycle rank, and mints plus jumps equal the support (`PricedNerve.legs_order_into_rank`, `coordinationFree_collapses`). The value-level converse, that a cycle actually obstructs a monotone global section, is open in the library. Judged by: compute `E - V + C` over the graph of chains (vertices) and overlapping attestations (edges) and require zero before releasing a cross-chain cycle without coordination. No vectors.

**9. Consensus locus (FourMix).** Tensor never exceeds par in the truth order (`readingMix`); they differ exactly off the locus where one side is held contradiction or the sides are equal and not absurd (`readingPar_eq_readingFuse_iff`, with Boolean tests `FourMix.requiresConsensus_iff` and `equalityLocus_iff`). Judged by: `four/readingFuse.json`, `readingPar.json`, `readingMix.json`, `requiresConsensus.json`, `equalityLocus.json` (16 rows each) against `FourMix` and `FourMixConsensusProfile.assay`. Tensor of absurd with absurd is [0,1]: an unwitnessed pair is not neutral, so do not use tensor as a default merge.

**10. Settling is monotone and quiescent.** The closure orbit is monotone in the knowledge order and a valuation is settled exactly when it is a fixed point (`settling_quiescent_is_algebra`); the join of readings is order-independent (`Reading.joinK_comm`, `joinK_assoc`, `joinK_idem`, with absurd as identity). Judged by: `four/joinK.json` and a test that replaying a set of attestations in any order gives the same stored reading.

## Lean written for this note

`ObsmetrologiaEconomics/PoolSplit.lean` (economics package, listed in `ObsmetrologiaEconomics.lean`): `wsum`, `shares`, `dust`, `split`, `credit`, `debit`, `transfer`, `settleCycle`; `split_sum`, `dust_lt_length`, `share_floor_spec`, `share_mono`, `split_le`, `split_cons`, `transfer_conserves`, `cycle_conserves`, three `decide` checks (`house_split_1000`, `house_split_7`, `zero_weight_split`). Axioms: propext and Quot.sound only.

## Open derivations

- **ShareValueMonotone (conjecture, unproved).** In an ERC-4626-style pool, redeeming any share never lowers the value of the remaining shares. Not stated in Lean.
- **BoundedWitnessRefinement (conjecture).** A capped or bitmapped witness store refines `Valued` evidence union.
- **CycleAsClosure (statement missing).** Tidepool's cycle as a closure on readings, so invariant 7 applies.
- **LargestRemainder (not specified).** The dust-to-first rule is the only remainder rule proved; a largest-remainder rule needs its own function and theorem.
- **CohomologyValueConverse (open in the library).** A nonzero cycle rank obstructs a monotone global section.
- **Ledger-to-token link (absent).** Registers of invariant 5 are not tied to balances.
- **Pro-rata fairness across members** beyond the one-unit floor bound, and any fairness property of the solver, are absent.
