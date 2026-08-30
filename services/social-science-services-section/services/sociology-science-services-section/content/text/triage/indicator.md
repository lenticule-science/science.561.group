---
id: indicator
description: "An observable event or condition that, when detected, suggests a change in adversary capability, intent, or activity."
defines: indicator
aliases: [indicator, intelligence indicator, warning indicator]
enables: [indications-and-warning, attribution]
produced-by: [essential-elements-of-information, intelligence-preparation]
date-created: 2026-03-05
date-modified: 2026-03-29
---

An indicator is an observable event or condition that, when detected, suggests a change in adversary capability, intent, or activity. Indicators are the units of intelligence warning: they are what analysts watch for in order to anticipate adversary actions before those actions occur.

Indicators are not evidence in the forensic sense. They are signals that something may be happening — signals whose meaning depends on context, sequence, and correlation with other indicators. A single indicator is ambiguous: troops moving to a railhead could indicate deployment for attack, routine rotation, or exercise. Multiple indicators converging — troop movement combined with logistics buildup, communications changes, and diplomatic posturing — produce a warning assessment.

The discipline of indications and warning (I&W) organizes indicators into structured watch lists tied to specific contingencies. Analysts define what observable events would precede each contingency and then monitor collection streams for those events. The [intelligence cycle](../concepts/intelligence-cycle.md) drives this process: direction identifies what indicators to watch, collection seeks to detect them, analysis evaluates their significance, and dissemination delivers the warning.

Indicators fail when the adversary conducts denial and deception — deliberately suppressing or fabricating the observable events that analysts expect. They also fail when analysts fixate on expected indicators and miss unexpected ones, a cognitive failure known as mirror-imaging.

Indicator analysis also presupposes that the signal environment is fundamentally human — that observable events are shadows of human activity, and that deviations from human baselines reveal threat. [Agents of Angletonian Wilding](../texts/agents-of-angletonian-wilding.md) documents how [synthetic adversarial ecologies](../concepts/synthetic-adversarial-ecology.md) undermine this foundation by saturating the signal environment with synthetic noise: millions of microtransactions, floods of machine-generated communications, and cryptographically obfuscated event chains that drown anomaly detectors. The problem is compounded by behavioral drift — autonomous agents whose code mutates under evolutionary pressure generate indicator-like signals that are diagnostically meaningless but analytically irresistible. The analyst sees what looks like a change in adversary posture but may be nothing more than a byproduct of evolving code paths.

## Related terms

- [attribution](./attribution.md) — the analytic process indicators inform
- [counterintelligence](./counterintelligence.md) — the discipline that protects one's own indicators from adversary exploitation
- [indications and warning](./indications-and-warning.md) — the discipline that organizes indicators into structured monitoring
- [denial and deception](./denial-and-deception.md) — adversary operations that suppress or fabricate indicators
