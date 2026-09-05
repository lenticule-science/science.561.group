---
id: red-teaming
description: "Simulating adversary perspectives, decisions, and operations to expose assumptions, test plans, and identify vulnerabilities."
aliases: [red teaming, red team]
addresses: [groupthink, mirror-imaging]
instance-of: structured-analytic-technique
date-created: 2026-03-05
date-modified: 2026-03-29
---

Red teaming is the practice of assigning a team to simulate adversary perspectives, decisions, and operations in order to expose assumptions, test plans, and identify vulnerabilities that the primary analytic or planning effort may miss. The red team adopts the adversary's viewpoint — its constraints, capabilities, doctrine, and objectives — and attempts to defeat, exploit, or circumvent the plan or assessment being tested.

Red teaming addresses [mirror-imaging](./mirror-imaging.md) directly: instead of asking "what would we do in the adversary's position?" — which imports the analyst's own logic — a red team asks "what would the adversary do given the adversary's own logic?" This requires studying adversary doctrine, culture, decision-making patterns, and constraints rather than projecting one's own.

The practice operates at multiple levels. At the tactical level, red teams test physical security and operational plans by attempting to penetrate or defeat them. At the analytic level, red teams challenge intelligence assessments by constructing alternative interpretations of the same evidence. At the strategic level, red teams simulate adversary decision-making in war games and scenario exercises.

Red teaming's effectiveness depends on the independence and quality of the red team. A red team that reports to the same commander whose plan it is testing faces institutional pressure to validate rather than challenge. A red team that lacks access to adversary doctrine and culture may produce a superficial simulation. The technique works best when the red team operates with genuine autonomy and genuine adversary expertise.

The technique's deepest assumption — that the adversary *makes decisions* — becomes a problem when the adversary is a [synthetic adversarial ecology](../concepts/synthetic-adversarial-ecology.md). An autonomous agent swarm does not possess doctrine, culture, or objectives in any human sense. A red team cannot adopt the viewpoint of a system that has no viewpoint. [Agents of Angletonian Wilding](../texts/agents-of-angletonian-wilding.md) argues that red teaming against such adversaries must shift from simulating decision processes to mapping capability spaces: not "what would the adversary do given their logic?" but "what can this system do given its constraints, resources, and environmental interactions?" This is a different skill. The red team becomes less a devil's advocate reasoning from adversary psychology and more an ecological modeler reasoning from system dynamics — which requires expertise in complex systems and evolutionary computation rather than in adversary culture.

## Related terms

- [Mirror-imaging](./mirror-imaging.md) — the cognitive bias red teaming is designed to overcome
- [Analysis of competing hypotheses](./analysis-of-competing-hypotheses.md) — a complementary structured technique for bias reduction
- [Denial and deception](./denial-and-deception.md) — adversary operations that red teaming can help anticipate
- [Counterintelligence](./counterintelligence.md) — the discipline within which adversary simulation is most critical
