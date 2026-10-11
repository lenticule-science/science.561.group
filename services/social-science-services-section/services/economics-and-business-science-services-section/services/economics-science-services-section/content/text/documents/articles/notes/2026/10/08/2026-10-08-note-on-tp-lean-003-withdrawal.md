---
title: "Withdrawal: Lean obligations for consensus by withdrawal (TP-LEAN-003)"
description: "The declarations proved in ObsmetrologiaEconomics.Withdrawal for Tidepool A4, the axioms they depend on, the vectors emitted for the Foundry realizer, the modelling choices made, and what is left open."
date-created: 2026-10-08
type: notes
name: 2026-10-08-note-on-tp-lean-003-withdrawal
status: active
authors:
  - claude-sonnet-5-5
keywords:
  - tidepool
  - withdrawal
  - consensus-by-withdrawal
  - quiescence
  - lean
  - golden-vectors
---

## What was done

Task TP-LEAN-003 adds `ObsmetrologiaEconomics/Withdrawal.lean` (namespace `Obsmetrologia.Economics.Withdrawal`), the conformance rows `ObsmetrologiaConformance/Withdrawal.lean`, the emitter `WithdrawalMain.lean`, a `writeGroup` call in `VectorsMain.lean` for group `withdrawal`, a `withdrawal` suite in `lean-system/src/golden-vector/suites.mjs`, and the emitted vectors. The source is the Tidepool specification (revision 3) section A4 and Appendix A.8, with section 2.5 (storage holds operational state, cells hold the monotone record). The module imports nothing; it is self-contained over `Nat` and lists.

## Declarations proved

Definitions: `Participation` (`silent | assented | objected | withdrawn`), `tally`, `counts : List Participation -> Nat x Nat x Nat` giving `(heard, withdrawn, objections)`, `Outcome` (`consensus | escalated | adjourned`), `quiesce heard withdrawn objections quorum : Outcome x Bool`, `quiesceOf` (quiesce read off the storage list), `unheard`, `Lowers` (the relation "some entries replaced by withdrawn"), `Act`, `Cell`, `Store` and `step` (the storage model).

Theorems, all kernel-checked with no `sorry`:

- `quiesce_cases`: the three cases are exhaustive (nobody heard: `(adjourned, false)`; objections at or above the quorum: `(escalated, false)`; otherwise `(consensus, true)`).
- `lone_objection_keeps_default`: `objections < quorum`, `0 < heard` gives the Bool `true`. Companions: `under_quorum_is_consensus`, `executes_iff_consensus`, `quiesce_ignores_withdrawn`, and `lone_objection_over_storage` (a storage list with exactly one objection and a quorum of two or more executes the standing formula).
- `silence_is_bottom`: `counts (ps ++ [silent]) = counts ps`; with `counts_silent_cons` and `counts_swap` (the counters are order-independent, which is why the vectors list each multiset once).
- `counts_bounds`, `heard_add_withdrawn_le`, `objections_le_heard`, `unheard_partition`: `heard + withdrawn <= length`, objections are among the heard, and `heard + withdrawn + unheard = length` where `unheard` carries its hypothesis (`heard + withdrawn <= n`), so `n - heard - withdrawn` is never a truncated subtraction.
- `step_touches_one` and `withdraw_touches_one`: a member's act changes exactly one position of the status list (every other position is unchanged, the actor's becomes the act's status, and the positions that differ are within `{i}`), and the cell list only grows by exactly one cell with the old cells as a prefix (`step_cells_grow`).
- `engaged_antitone`: if `ps'` is `ps` with some entries replaced by `withdrawn`, then `heard` and `objections` do not rise and `withdrawn` does not fall. `lowers_set_withdrawn` shows a single withdrawal is such a replacement; `withdraw_engaged_antitone`, `withdraw_counts` and `withdraw_keeps_default` apply it.
- `terminates`: every finite status list has an answer, one of the three outcomes. This is honest about what it says: the answer is one structural pass over the list plus one comparison, and Lean's termination check on `counts` is the substance.
- `decide` checks for the house cases: seven `quiesce` rows, four `counts` rows, a lone objector among five assenters at quorum two, withdrawing the only objector, withdrawing the only voice.

## Axioms reported

`#print axioms` on `quiesce_cases`, `lone_objection_keeps_default`, `under_quorum_is_consensus`, `counts_bounds`, `unheard_partition`, `lone_objection_over_storage`, `engaged_antitone`, `withdraw_counts`, `withdraw_keeps_default`, `executes_iff_consensus`, `silence_is_bottom`, `terminates`, `step_touches_one`, `step_cells_grow`, `withdraw_touches_one`, `counts_swap`, `lowers_set_withdrawn`: every one reports only `propext` and `Quot.sound` (several report only `propext`; `counts_swap` and `lowers_set_withdrawn` report none). No `Classical.choice`. A first draft pulled in `Classical.choice` through `omega` closing conjunctive goals and the `Nat` subtraction in `unheard_partition`; the proofs now split conjunctions before `omega` and use `Nat.sub_sub` and `Nat.add_sub_of_le`. The check was `#print axioms` run with `lake env lean` on the module (the `lean-check` tool's declaration mode checks the same thing; it was not invoked separately).

## Vectors

`lib/obsmetrologia-conformance/vectors/withdrawal/{quiesce,counts}.json`, emitted by `VectorsMain.lean` and kept in step with `withdrawal.golden-vectors.jsonl` (546 rows, the JSONL contract, specification address `ni:///sha-256;GLf9NSO1L3gPxUuPAqBVb3h6VOpP2YJ4YMko0HEwT6U`, computed with `leanSpecificationAddress` from the `withdrawal` suite and decoded back with `decodeLeanGoldenVectorJsonl`).

- `counts.json`: 210 cases, every multiset of up to 6 members (the four multiplicities summing to at most 6). Args: `[["silent","assented",...]]` in the fixed order silent, assented, objected, withdrawn. Result: `{"heard","withdrawn","objections"}` as decimal strings.
- `quiesce.json`: 336 cases, every distinct counter triple the multisets reach at quorums 1 to 4. Args `[heard, withdrawn, objections, quorum]` as decimal strings. Result `{"outcome": "consensus"|"escalated"|"adjourned", "execute": bool}`.

Result shape is an object so a Foundry harness reads fields by key (`vm.parseJsonString(json, ".cases[0].result.outcome")`) instead of decoding a mixed-type array, which `vm.parseJson` cannot do. The Solidity enum order is `Pending, Consensus, Escalated, Adjourned`; `Pending` is the pre-quiescence state and never a vector result. The suite is registered with no realization (pending) until `WithdrawalAllocatorV1.quiesce` (TP-EVM-010b) exports a table or the Foundry test judges the files. The vectors are to be copied byte for byte to `tidepool-evm/test/vectors/lean/withdrawal/`.

Counts are `uint32` in the contract; the module agrees with it while the member count is below `2^32`.

## Decisions

- `quiesce` takes `withdrawn` and ignores it, because the roadmap and the contract signature both carry it; `quiesce_ignores_withdrawn` states it. A quorum of 0 is outside the domain (the vectors use 1 to 4; the charter's `heardQuorum` is at least 1): with quorum 0 and someone heard the function would say `escalated`.
- `heard` counts assented and objected members; an objection is a heard member. That makes `objections <= heard` a theorem, and the "lone objection" argument uses it.
- `rejoin` returns the member to `silent` in the model (the spec says the flag is toggled back and a `rejoined` cell told; it does not say the member is re-counted as heard). If the contract instead restores the prior status, `Act.status` for `rejoin` changes, and `step_touches_one` is unaffected.
- The cell list is a list of `(member, act)` pairs standing for the told cells; the real subject `q#n` is the position. The theorems about it are the "cells only grow" half of section 2.5, not a model of the ledger.

## Open

- The realizer `WithdrawalAllocatorV1.quiesce` (TP-EVM-010b) and the `tidepool-evm/test/vectors/lean/withdrawal/` copy are not yet made; the suite is pending.
- The model has no windows (`closesAt`, `objectionFreezeSeconds`): time-gated refusals are contract behaviour not covered here.
- Sybil resistance of `heardQuorum` and hysteresis (A4 failure modes, v0.2) are not modelled; `engaged_antitone` is the only statement about how engagement can fall.
- `terminates` is thin by nature; a cost bound (`length` steps) is not stated because the definitions are structural recursion.
- Quorum 0 is excluded by convention, not by hypothesis in `quiesce`.
- No `lake` run of the whole `ObsmetrologiaEconomics` library was made, only `ObsmetrologiaEconomics.Withdrawal` and the `ObsmetrologiaConformance` library (103 jobs, passed).
