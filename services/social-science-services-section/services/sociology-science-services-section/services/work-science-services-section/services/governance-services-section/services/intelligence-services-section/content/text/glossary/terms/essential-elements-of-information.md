---
id: essential-elements-of-information
description: "The critical items of information required by the commander about the adversary and environment — the bridge between Priority Intelligence Requirements and the indicators that collection assets observe."
aliases: [essential elements of information, EEI, specific information requirements, SIR]
component-of: intelligence-cycle
produces: [indicator]
enables: [collection-management]
date-created: 2026-03-06
date-modified: 2026-03-29
---

Essential Elements of Information (EEIs) are the critical items of information regarding the adversary and the environment needed by the commander to relate to other available information and intelligence in order to make a decision. EEIs operationalize the commander's Priority Intelligence Requirements (PIRs) by breaking broad intelligence questions into specific, observable items that collection assets can be tasked to answer.

## The requirements hierarchy

The intelligence requirements hierarchy translates the commander's decision needs into collection tasks:

```
Commander's Critical Information Requirements (CCIRs)
  ├── Priority Intelligence Requirements (PIRs)
  │     ├── Essential Elements of Information (EEIs)
  │     │     ├── Specific Information Requirements (SIRs)
  │     │     │     └── Indicators
  │     │     │           └── Collection tasks
  │     │     └── Specific Information Requirements (SIRs)
  │     └── Essential Elements of Information (EEIs)
  └── Friendly Force Information Requirements (FFIRs)
```

**PIR** (Priority Intelligence Requirement): A broad question stated in terms the commander understands — "Will the adversary reinforce the defense at Objective Alpha?"

**EEI** (Essential Element of Information): A specific item of information needed to answer the PIR — "What is the location and strength of the adversary reserve?"

**SIR** (Specific Information Requirement): A more detailed information need derived from the EEI — "Are there vehicle movements along Route 4 between grid XY 1234 and XY 5678?"

**Indicator**: A specific observable activity that, if detected, will answer the SIR — "Vehicle convoys of 10+ vehicles moving northeast on Route 4."

## Indicator development

The intelligence staff develops indicators through [IPB/IPOE](../../documents/articles/notes/ipb-ipoe.md) — specifically the event template (Step 4), which identifies Named Areas of Interest (NAIs) where adversary activity will confirm or deny specific courses of action. Each NAI is associated with specific indicators: "If we observe [specific activity] at [specific location], this confirms [specific adversary course of action]."

Good indicators are:
- **Observable** — collection assets can detect them
- **Diagnostic** — they distinguish between adversary courses of action (not common to all COAs)
- **Timely** — they can be detected early enough for the commander to act
- **Reportable** — the collection asset can report what it observes in meaningful terms

## Collection management

The requirements hierarchy is the backbone of [collection management](./collection-management.md): EEIs and SIRs are matched to collection assets based on the assets' capabilities and the requirements' characteristics. A SIGINT requirement (intercept adversary communications at a specific location) is tasked to a SIGINT asset; a visual observation requirement (observe vehicle movement at a road junction) is tasked to a reconnaissance patrol or UAS.

The intelligence staff maintains a collection management matrix that tracks:
- Each PIR and its supporting EEIs/SIRs
- The collection asset(s) tasked against each requirement
- The time window for collection
- The NAI or target associated with the requirement
- The current status (tasked, collected, analyzed, answered)

## Related terms

- [Collection management](./collection-management.md) — the process that tasks assets against EEIs
- [Indicator](./indicator.md) — the observable activity that answers the SIR
- [Intelligence preparation of the battlefield](../../documents/articles/notes/ipb-ipoe.md) — the process that generates the indicators
- [Indications and warning](./indications-and-warning.md) — the warning function that depends on indicator development
