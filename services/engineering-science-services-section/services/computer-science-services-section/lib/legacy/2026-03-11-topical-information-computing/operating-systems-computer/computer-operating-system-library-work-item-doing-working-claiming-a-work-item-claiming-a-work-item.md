---
name: claiming-a-work-item
description: Asserts (target, claimed-by, <actor>) and transitions open to in-progress. The actor commits to executing the work.
specializing: asserting-positing-morphism
---

A **claiming-a-work-item** call is the asserting positing that writes (target, claimed-by, <actor>) and, if the work-item is currently open, transitions it to in-progress via transitioning-a-work-items-state.
The claim is a public commitment; releasing-a-claim is its inverse.
