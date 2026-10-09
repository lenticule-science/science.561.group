---
title: "Tidepool Glossary Terms (TP-SCI-002)"
description: "The ten Tidepool glossary terms added to economics-science on 2026-10-08, what each names in the master specification, why tally-credit is a cross-reference and not an eleventh file, and what was left open."
date-created: 2026-10-08
type: notes
name: 2026-10-08-note-on-tp-sci-002-glossary
status: active
authors:
  - claude-sonnet-5-5
keywords:
  - tidepool
  - glossary
  - cooperation-premium
  - decorrelation-dividend
  - site-sheaf
  - pay-the-meet
  - reseed-mutual
  - energy-commons
---

## What was done

Task TP-SCI-002 asked for eleven terms. Ten were written as files in `content/text/glossary/terms/`, each with `description`, `identity`, `name`, `date-created`, `relations`, and a closing line that links the specification section it names and the Lean declarations the specification gives it. The model for the frontmatter was `ergodicity.md`; relation keys are those the neighbours use (`requires`, `uses`, `contrasts-with`). The specification is the 2026-10-08 specification of the Tidepool protocol; the founding theory is [pooling as a manufactured ensemble](./2026-10-08-note-on-pooling-as-a-manufactured-ensemble.md).

| Term | Specification section |
|---|---|
| cooperation-premium | §1 Thesis |
| decorrelation-dividend | §3 B10 |
| consensus-by-withdrawal-allocation | §3 A4 |
| site-sheaf | §2 and §3 A7 |
| pay-the-meet | §2 |
| settlement-bounty | §3 B5 |
| attention-worklist | §3 B9 |
| algedonic-cell | §3 B9 and §7 |
| reseed-mutual | §3 B4 |
| energy-commons | §3 B11 |

## Decision: tally-credit is not duplicated

`tally-credit` already exists in the monetary-economics section's glossary (`tally-credit.md`, with `tally.md` and `wit.md`), and the task's own acceptance says no term may duplicate one already held in the economics-science, monetary-economics or finance-science glossaries. The two requirements conflict for the eleventh file, so the acceptance rule won: no `tally-credit.md` was created in economics-science. The cross-reference the task wanted is carried by links: `consensus-by-withdrawal-allocation`, `attention-worklist`, and `energy-commons` link the monetary section's term in their bodies, and `reseed-mutual`, `energy-commons`, `attention-worklist` and `consensus-by-withdrawal-allocation` list `tally-credit` under `relations.uses`. If the founder wants a physical eleventh file, it should be an alias entry added to the monetary term and not a second definition.

Before writing, the three `glossary/terms/` directories were listed (economics-science, monetary-economics, finance-science) and none of the ten slugs, nor any near synonym (a sheaf, a bounty, a worklist, a mutual), was present. Near neighbours linked rather than restated: `ergodicity`, `volatility-drag`, `absorbing-barrier`, `energy-return-on-investment`, `common-pool-resource`, `conviction-voting`.

## What is in the terms and what is not

The terms state what the specification says, and where the specification quotes an outside source the term cites only the Peters and Adamou preprint row already in the ergodicity-and-pooling record (in `cooperation-premium`). The Beer reference in `algedonic-cell` and the actuarial throttle in `reseed-mutual` are stated as the specification states them and carry no `references:` block, because those sources were not read in this task; the cybernetic-planning record is the place TP-SCI-004 will read Beer from.

## Left open

- The Lean declarations named in the terms (`Decorrelation`, `Withdrawal`, `SiteCover`, `MeetPay`, `Bounty`, `Algedonic`, `Reseed`, `EnergyCommons`) are the specification's obligations; only `PoolSplit`, `AllocationSolver` and `AttentionAllocation` exist as files in `lib/obsmetrologia-economics` at this date. The terms say "declared in the roadmap, not yet written" only for `Decorrelation`; the rest should be re-checked when TP-LEAN lands.
- `site-sheaf` leans on cellular-sheaf cohomology held in signstuff-evm; a term for that cohomology belongs in the owning math section and was not written here.
- `energy-commons` defers EROEI boundaries to the solar-economics section; its glossary terms (`energy-cannibalism`, `net-metering`) were not linked because they were not checked in this task.
