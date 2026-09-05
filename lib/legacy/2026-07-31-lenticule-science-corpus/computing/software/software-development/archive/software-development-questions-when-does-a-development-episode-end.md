---
type: question
status: open
---

# When does a development episode end?

A development episode begins, in the everyday sense, when someone starts changing the codebase, and ends when they stop. But the theory needs criteria: ends with the commit? with the merge? with the deploy? with the user-visible outcome? with the absence of revert?

Each candidate boundary corresponds to a different equivalence class of "the same episode," and therefore a different criterion for what counts as a successful one. A commit-bounded episode succeeds if the commit lands; a deploy-bounded episode requires the deployment to hold; a witness-bounded episode requires whatever witnesses (tests, observers, users) the episode's purpose called into existence to settle in agreement.

The witness-bounded reading is the one that matches the predicated-substrate framing: an episode ends when the witnesses for its purpose-cells reach quiescence. Episodes can therefore fail to end (open bug, unresolved review, contested merge) — and the theory should be able to talk about an open episode without resolving it prematurely.

## Why this matters

The granularity of episodes determines what counts as a refactoring (an in-episode structure-preserving transformation), what counts as a feature work (an episode that adds capability), and how to compose them. A theory that picks the wrong episode-boundary will mis-classify ordinary work.
