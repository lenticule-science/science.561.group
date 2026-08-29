---
name: prioritize-research-targets
description: "Order the research queue across captain-targets, dev-support targets, and frontier-extension targets per the prioritization rule."
status: triage
owner-agent: mathematical-researcher
project: supporting-predcalc-research
blocked-by:
  - "operations/command/projects/supporting-predcalc-research/specs/methodology/prioritization-rule.md"
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

Order the queue. Three streams compete: captain-targets (captain-named), dev-support targets (filed by `theory-supporter` from the sibling project), frontier-extension targets (open questions captain has marked promising).

## Inputs

- The current contents of:
  - `operations/command/projects/supporting-predcalc-research/questions/research-targets/`
  - `operations/command/projects/supporting-predcalc-research/questions/` (the captain-named queue)
  - Any `questions/` under math theories carrying `frontier-extension: true`

## Outputs

Ordered list of items to work next, with rationale per item.

## Procedure

Apply the rule from `prioritization-rule.md` (gated on captain answer to [`questions/prioritization-rule.md`](../../../../../../../command/projects/supporting-predcalc-research/questions/prioritization-rule.md)).

## Graduation criteria

Once the prioritization rule has landed and the queue has been ordered for at least two rounds.
