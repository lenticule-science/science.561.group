---
name: "Witness Propagation"
keywords: ["agent-teams", "descent-cohomology", "witness-propagation"]
status: "draft"
description: "Candidate transport of an identified evidence-cell increment over team communication channels; source WIT count, receiver uptake, and descent compatibility remain separate."
---

# Witness propagation

**Carrier:** a particular cell `c`, source/local position `i`,
evidence value `v_i(c)`, source identifier and propagation map
`ρ_{ij}` to receiver `j`. Transport produces a proposed receiver
reading `ρ_{ij}(v_i(c))`. The receiver's existing evidence tally and
FOUR knowledge charge determine whether incorporating it produces
**a new local WIT cover**. A retransmission of the same source
evidence is not, by itself, another source WIT.

An independent receiver may issue [ACK](https://github.com/lenticule-science/science-services-section/blob/main/services/social-science-services-section/services/economics-and-business-science-services-section/services/monetary-economics-science-services-section/content/text/glossary/terms/ack.md)
for that particular WIT at the crossing. **Transport ≠ ACK**:
delivery, incorporation and counterparty uptake are different events.
An [ATT](https://github.com/lenticule-science/science-services-section/blob/main/services/social-science-services-section/services/economics-and-business-science-services-section/services/monetary-economics-science-services-section/content/text/glossary/terms/att.md)
of that ACK requires the second-order WIT, not just a broadcast log.

The [fibration/comonad descent paper](../../../../services/social-theory-science-services-section/content/text/documents/articles/notes/undated/witness-network-propagation-as-fibration-comonad-descent.md)
is marked `status: sketch`; its `descent-clean` condition is a
proposed compatibility test, **not** a Lean-verified theorem or a
measured `H¹` value of a real team. Specify the cover, restrictions
and overlaps before claiming a cocycle or obstruction.

This entry concerns transporting source-bound evidence. It does not
introduce a second definition of WIT. Use the
[canonical WIT](https://github.com/lenticule-science/science-services-section/blob/main/services/social-science-services-section/services/economics-and-business-science-services-section/services/monetary-economics-science-services-section/content/text/glossary/terms/wit.md)
knowledge-cover condition for each new receiving cell.
