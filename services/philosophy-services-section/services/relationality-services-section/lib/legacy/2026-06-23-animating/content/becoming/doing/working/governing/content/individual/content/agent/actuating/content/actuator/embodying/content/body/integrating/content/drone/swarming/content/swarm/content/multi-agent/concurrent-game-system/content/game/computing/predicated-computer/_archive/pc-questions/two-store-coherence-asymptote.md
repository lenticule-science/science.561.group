---
type: question
status: open
explores: [two-store-coherence, event-log, predication-graph-store]
---

# When does the file-first to event-first transition complete?

The corpus's [two-store coherence](teaching/explanations/two-store-coherence.md) discipline admits two patterns: event-first (the event log is primary, the predication-graph store is a derived view) and file-first (the predication-graph store is primary, the event log is recorded by hooks). file-first with event recording, evolving toward event-first as the system matures.

The question is what the engineering trigger is for completing the transition. Specifically:

- **What does "the system has enough event coverage" mean concretely?** When every mutation observed by the file-first hooks is also producing an event, the event log is *complete* in the sense that re-derivation produces the predication graph. But humans and AI agents can still edit files outside the hooks (a manual file edit during a power outage; a tool that writes files without invoking the hooks). When are these escapes rare enough that the event-first transition is safe?
- **What replaces file-first edits when the transition completes?** The current ergonomic for human edits — open the .md file in an editor, save — must be preserved. Under event-first, the human's save would emit an event, the reducer would project the event into the file. The file edit is then an indirect operation. What is the user-facing experience that preserves "I edited a file" semantics?
- **How is divergence detected during the transition?** The discipline requires periodic re-derivation from the event log and canonical-hash comparison. What is the cadence (per-edit, hourly, daily)? What is the response to divergence (alert, auto-repair, halt)?

Open. The corpus characterizes the *structure* of the two-store coherence discipline; the *transition policy* between file-first and event-first is engineering policy, contingent on the specific platform's deployment.
