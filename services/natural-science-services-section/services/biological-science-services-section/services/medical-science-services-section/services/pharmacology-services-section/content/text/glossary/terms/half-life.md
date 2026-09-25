---
name: "Half-Life"
description: "The time required for the plasma concentration of a drug to decrease by half, governing dosing frequency, steady-state timing, and elimination duration"
date-created: 2026-03-06
authors:
  - claude-opus-4-6
aliases:
  - "half-life"
  - "elimination half-life"
keywords:
  - Pharmacology
component-of: pharmacokinetics
determines: [dosing-frequency, time-to-steady-state, withdrawal-timing]
requires: [drug-metabolism, renal-clearance]
governs: drug-accumulation
measured-by: plasma-concentration
type: term
---

**Half-life** (t½) is the time required for the plasma concentration of a drug to decrease by half. It is the fundamental parameter governing how long a drug's effects last, how frequently it must be dosed, and how long it takes to reach steady state or to be fully eliminated from the body.

## What half-life determines

**Dosing frequency.** A drug with a short half-life must be given more frequently to maintain therapeutic concentrations. A drug with a long half-life can be given less often. This is why some antibiotics are dosed every 4 hours (short half-life) while others are dosed once daily (long half-life).

**Time to steady state.** When a drug is given repeatedly at fixed intervals, plasma concentrations rise with each dose until the amount eliminated between doses equals the amount administered — steady state. This takes approximately 4-5 half-lives. A drug with a 6-hour half-life reaches steady state in about 24-30 hours. A drug with a 24-hour half-life reaches steady state in 4-5 days. Until steady state is reached, the full therapeutic effect may not be apparent.

**Time to elimination.** After a drug is discontinued, it takes approximately 4-5 half-lives for the drug to be effectively eliminated from the body (>96% cleared). A drug with a 4-hour half-life is gone within a day. A drug with a 3-day half-life persists for over two weeks. This matters for [drug interactions](./drug-interaction.md), for side effect duration after discontinuation, and for drug testing.

## Clinical significance

Half-life interacts with clinical context in ways that pharmacokinetic numbers alone do not capture:

**Withdrawal timing.** The half-life of a substance determines how quickly withdrawal symptoms begin after the last dose. Short-acting opioids (heroin, t½ ~30 minutes; oxycodone, t½ ~3-4 hours) produce withdrawal within hours. Long-acting opioids (methadone, t½ ~24-36 hours) produce withdrawal over days. This pharmacokinetic difference is why methadone and buprenorphine (t½ ~24-60 hours) are used in opioid agonist therapy: their long half-lives provide stable receptor occupancy without the peaks and troughs that drive compulsive dosing of short-acting opioids.

**Accumulation risk.** In patients with impaired elimination (renal failure, hepatic failure, elderly patients with reduced clearance), the effective half-life lengthens. Drugs that would normally be cleared between doses begin to accumulate, potentially reaching toxic concentrations at standard doses. This is why dose adjustment in organ impairment is not optional — it is a pharmacokinetic necessity.

**Context-sensitive half-time.** For drugs administered by continuous infusion (particularly in [airway management](../../airway/index.md) and critical care), the time for plasma concentration to decrease by half after stopping the infusion depends on how long the infusion ran. Lipophilic drugs redistribute into fat compartments during prolonged infusion, creating a reservoir that extends the effective duration. This is why a patient who received propofol for a brief intubation wakes quickly, but a patient who received propofol for days in the ICU may remain sedated for hours after the infusion stops.

## Related terms

- [Pharmacokinetics](./pharmacokinetics.md) — the broader framework governing drug disposition
- [Bioavailability](./bioavailability.md) — how much drug reaches circulation to begin with
- [Therapeutic Index](./therapeutic-index.md) — the margin of safety that accumulation can narrow
