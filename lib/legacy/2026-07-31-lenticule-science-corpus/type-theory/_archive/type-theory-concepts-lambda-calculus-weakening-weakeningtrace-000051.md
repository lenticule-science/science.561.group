---
id: WeakeningTrace
name: Weakening Trace
stratum: object
phase: free
head: ContextTrace
tail: WeakeningStep
---
*Weakening Step*, being *Typing Application* witnessing *Weakening Seed*, determines that each step preserves judgements but cannot determine how an entire trace of judgements remains stable under successive extensions. The unresolved stability forces *Context Trace* to witness *Weakening Step*, inducing ***Weakening Trace***:
