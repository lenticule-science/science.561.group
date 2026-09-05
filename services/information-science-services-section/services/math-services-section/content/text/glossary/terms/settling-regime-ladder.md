---
description: The four proved settling regimes — thermodynamic, causal, quantum, kinetic — read off a closure ordinal's shape, each admitting a different kind of proof (exhaustion, settlement, obstruction witness, witnessed execution); LAGOON reads it as the seam between deterministic and inferential software.
identity: settling-regime-ladder
name: Settling Regime Ladder
provenance:
  date-created: 2026-09-04
  authors:
    - emsenn
    - claude-fable-5-1
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/services/multi-agent-computer-system-engineering-services-section/content/text/documents/articles/specifications/2026-08-29-lagoon-architecture.md
    - /home/emsenn/info/lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Closure/Ordinal.lean
---
The settling regime ladder is the four proved settling regimes a closure ordinal κ can land in — thermodynamic, causal, quantum, and kinetic, corresponding in order to finite/strict, Scott, transfinite-bounded, and aperiodic — with each regime determining what kind of proof is possible for a component settled at it. Obsmetrologia's Closure/Ordinal.lean reads the regime off the actual shape of κ rather than off a free Boolean flag: thermodynamic settling admits proof by exhaustion, checking every state and transition; causal settling admits proof by settlement, a monotone closure to the ω fixed point verified by replay; quantum settling admits proof by obstruction witness, where the verdict is that a global section exists or provably does not; and kinetic settling admits proof by witnessed execution, because closure is proved unavailable — the aperiodic regime is structurally unwitnessable from constructible ordinals, so nothing settles it and it can only be walked and the walk witnessed.

This is the generic mathematical ladder, and it is distinct from four regimes of natural existence, which is the same ladder read as physics (plasma, gas, fluid, and cosmological process); the settling regime ladder instead grades software components by what proof they can carry.

The operating consequence, stated in the LAGOON architecture specification: LLM inference is kinetic-regime software by nature, so composition within or downward along the ladder is free while any dependency upward — settled software consuming kinetic-regime output — must cross a witnessed seam, and promotion between regimes is regime-restriction, never a claim of having tamed the lower proof kind.
