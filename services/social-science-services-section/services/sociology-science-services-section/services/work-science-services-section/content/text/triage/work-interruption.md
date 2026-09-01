---
type: question
status: open
explores: [task-cell-system, operations-settling, completion-as-quiescence, operations-loop, cadence]
---

# What is the substrate formal structure of task interruption?

Task interruption is the suspension of an executing task $T$ mid-execution, with intent to resume — distinct from [abandonment](./work-abandonment.md) (suspension without intent to resume), from blockage (inability to proceed due to unsettled dependency), and from completion (reaching the target valuation). Interruption preserves the partial settling state and resumes from it; the agent stops producing witness increments on $T$ and later resumes.

## Why interruption is not just paused blockage

A blocked task cannot proceed because a dependency cell $\langle T, \texttt{depends-on}, T'\rangle = \mathbf{t}$ is unresolved. When $T'$ completes, the block clears and $T$ can resume. Interruption is structurally different: the dependency cells are satisfied (or there are none), but the agent stops working on $T$ for an external reason. The substrate must distinguish "blocked because dependency unresolved" from "interrupted by an external demand on the agent."

If interruption leaves no explicit cell, it is substrate-invisible: $T$'s completion cell remains at $\bot$ and is indistinguishable from a task that has never been started. This may be the correct representation, or it may erase information.

## Sub-questions

### (a) Does interruption require an explicit cell?

Candidate representation: $\langle T, \texttt{interrupted}\rangle = \mathbf{t}$ installed when the interruption begins, $\langle T, \texttt{resumed}\rangle = \mathbf{t}$ when work restarts. This gives an audit trail but adds cells. Alternative: interruption is simply the absence of fresh witness increments on $T$ during the interruption interval — substrate-invisible, recoverable from the operations settling's history but not from any single cell.

### (b) What encodes partial completion?

A task 60% complete has had some, but not all, of its target valuation cells settled. The partial settling state is already encoded in $\mathcal{E}_{\mathrm{op}}$ — the cells that have reached $\mathbf{t}$ are at $\mathbf{t}$; the cells not yet settled are at $\bot$. No additional "progress" cell is needed. Interruption preserves this partial state by settling monotonicity: cells at $\mathbf{t}$ stay at $\mathbf{t}$; resumption continues from this point.

### (c) What closure rules govern the interrupting demand?

When an agent $A$ interrupts $T$ to attend to a higher-priority task $T'$, what triggers the interruption? Candidates: (i) a dispatch morphism for $T'$ fires, competing with $A$'s current assignment; (ii) a charter rule prioritizes certain task types — an authority-gate condition that blocks $A$ from continuing $T$ until $T'$ is resolved; (iii) no closure rule — $A$'s interruption is a local decision with no substrate record.

### (d) The ceremony question — does the substrate presuppose a work/non-work binary?

In many Indigenous work traditions, what a Western frame calls an "interruption" — a ceremony, a seasonal practice, a relational obligation — is not an interruption at all. It is a form of work (often higher-priority work) that the Western work/non-work boundary renders invisible.

The operations settling's architecture uses a task-cell-system: cells typed as tasks (operational work) and cells typed as normative (governance work). Does this typology have room for ceremonial and relational work — work that is not aimed at a deliverable target valuation but at the maintenance of right relationship?

If the substrate can only represent "work that aims at a target valuation," then ceremony, seasonal practice, and relational maintenance are not representable as tasks — they appear as interruptions. But from the perspective of the traditions that practice them, they are not interruptions of productive work; they are productive work of a different register.

This connects to the library's [indigenous-knowledge-transmission-as-enacted-capability](../../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/questions/indigenous-knowledge-transmission-as-enacted-capability.md) question: if ceremonial practice is a form of capability enactment, and the substrate cannot represent ceremony as work, it cannot represent capability maintenance through ceremony either.

### (e) Interruption and cadence

The [cadence](teaching/explanations/cadence.md) concept and [cadence-as-modal-frame](teaching/explanations/cadence-as-modal-frame.md) represent recurrent temporal structure. If interruptions are themselves recurrent — every Tuesday a team meeting interrupts the week's tasks — then they are not interruptions but cadence. The distinction between "recurrent structured pause" (cadence) and "interruption" (unscheduled demand) may be the relevant one. Scheduled interruptions are recurrent-practice instances; unscheduled interruptions are external demands. The substrate can represent the former; the latter's representation is what this question asks.
