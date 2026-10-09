---
name: 2026-05-04-trusted-agent-authored-substrate
description: I propagated agent-authored stale frontmatter as ground truth
type: friction-log
class: substrate-truth
date: 2026-05-04
status: open
see-also: [2026-05-04-working-by-hand-out-of-fars-workstream]
title: 2026-05-04-trusted-agent-authored-substrate
date-created: 2026-05-04
---

# I propagated agent-authored stale frontmatter as ground truth

While registering Ack and Gnalens as ships and updating the polity record, I read [`operations/command/group/ships/rsc-quiescent.md`](../../../../../../../../../../operations/command/group/ships/rsc-quiescent.md) and absorbed its frontmatter (`designation: "Replit Sprint Container — Quiescent"`, body content centred on Replit) as authoritative.
I then *summarized* that designation back to the captain in my response, framing RSC Quiescent's status decision in terms of its now-defunct Replit lineage, as if that were what the captain considered RSC Quiescent to be.

The captain corrected: "That's not what the RSC Quiescent is if you check older records.
That's what some agent defined it as, and the RSC Quiescent is more... a vibespace that I manifest with my being, lol."

Tried: nothing else.
I read one record, took its frontmatter as definitional, didn't cross-check against history, didn't ground-truth with the captain.

Had to: be corrected after the fact and re-orient.

Violates: the substrate's [witness](../../../../teaching/explanations/witness.md) discipline — substrate records have a provenance, and an entity authored by an agent without ground-truth from the captain is *still substrate*, but its authority is qualified by who produced it.
Treating an agent-authored frontmatter field as if it were captain-authored is a category error: the frontmatter was a *prediction* of what RSC Quiescent is, not a *certification* of what RSC Quiescent is.
I read it like a certification.

Gap: a substrate-aware agent should be able to see, when reading any record, *who authored it under what scope* and weight the content accordingly.
Today the substrate doesn't expose author-provenance per-field (or per-record beyond commit history).
Even if the witness chain captured each authoring act, the *reading* surface doesn't aggregate provenance into a confidence signal an agent can use.

Adjacent gap: the [audit-group-graph](../../../../../../../../../../governance/skills/group/audit-group-graph/SKILL.md) skill exists.
It probably catches *graph-level* drift (broken refs, missing offices).
It does not flag *content drift* — a designation that was true under prior conditions and isn't anymore.
Stale authoritative-looking content isn't a graph problem; it's a truth-value problem in the substrate's bilattice that needs a different audit-class.

This entry is also a sub-instance of [working-by-hand-out-of-fars-workstream](2026-05-04-working-by-hand-out-of-fars-workstream.md): a properly-dispatched task to "register Ack and Gnalens" would have produced a witness chain that included reading RSC Quiescent's frontmatter, and a captain-attention checkpoint when that read produced a designation-claim the dispatcher couldn't independently verify.
Today: I read it and acted on it.
Tomorrow's substrate should not let an agent do that without raising the provenance for review.
