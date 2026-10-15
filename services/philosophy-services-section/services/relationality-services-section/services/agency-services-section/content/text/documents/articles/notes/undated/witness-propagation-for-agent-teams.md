---
title: "Source-scoped evidence transport for agent teams"
type: guide
status: draft
description: "A bounded sequence from source attestation to local Record update, independent counterparty ACK and optional second-order ATT; fibration/gluing claims require a specified cover."
---

# Source-scoped evidence transport for agent teams

Let \(\mathcal T\) be the agent communication topology. A
source attestation \`e=(source,cell,polarity,stage,provenance)\`
can be transmitted to a receiver \`j\). The receiver
may check its provenance and apply a local evidence
update \(\Delta_e \in \mathbb N^2\). A
[WIT](https://github.com/lenticule-science/science-services-section/blob/main/services/social-science-services-section/services/economics-and-business-science-services-section/services/monetary-economics-science-services-section/content/text/glossary/terms/wit.md)
is minted only for each actual new FOUR
knowledge-order cover, not automatically
for each message or log entry.

**Separated actions:**

1. \`Transmit(e, i, j)\`: carry one identified evidence
   source across an explicit channel. The event may fail,
   be repeated, or arrive without admission.
2. \`Admit(j,e)\`: receiver verifies and registers
   the source as a local candidate with provenance.
   A local Record increment is not necessarily a new
   FOUR WIT cover if the polarity already exists.
3. \`ACK(j,w,i)\`: receiver **independently**
   takes up the identified source WIT across the
   border and records the uptake. Mere delivery
   or replicated bytes do not qualify.
4. \`ATT(i,a)\`: originating face produces a
   WIT of the actual ACK \`a\`. The finite
   reconciliation budget for these operations
   is a different ATT sort; do not equate a
   budget balance to one act.

A message with conflicting evidence does not
itself prove a global obstruction.
To assert descent-clean transport, supply a
site/cover, local fibers, restriction maps
and overlap consistency checks. A
FOUR \`⊤\` locally does not entail
\(H^1\neq 0\).

The [Science descent research](https://github.com/lenticule-science/science-services-section/blob/main/services/social-science-services-section/services/social-theory-science-services-section/content/text/documents/articles/notes/undated/witness-network-propagation-as-fibration-comonad-descent.md)
is a **sketch** until a concrete
specialization and tests are supplied.
The work owner's message route,
receiver disposition, and successful
settlement are independently evidenced;
one cannot be substituted for another.
