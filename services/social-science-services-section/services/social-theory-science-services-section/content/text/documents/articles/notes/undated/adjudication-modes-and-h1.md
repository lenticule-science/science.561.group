---
type: hypothesis
status: research-frontier
depends-on: [adjudicate-witness-conflict, operations-settling, repair-resolution-poset, inconsistency-sheaf]
title: "Adjudication dispositions and H¹: unproved correspondence"
description: "The relation between source-evidence dispositions and cohomological classes requires a specified cover and a proved bridge. The earlier universal H¹ claims are withdrawn."
---

# Adjudication dispositions and H¹

**Withdrawn theorem claim.** The earlier version asserted that
\`affirm\` or \`retract\` automatically kills a
nonzero \`H¹\` class, while a third mode named
\`acknowledge\` necessarily preserves it. It also
treated each local \`⊤\` cell as producing a
nontrivial cohomology class. Neither result follows
from FOUR, monotone evidence accumulation or the
definitions of [WIT](https://github.com/lenticule-science/science-services-section/blob/main/services/social-science-services-section/services/economics-and-business-science-services-section/services/monetary-economics-science-services-section/content/text/glossary/terms/wit.md)
and [ACK](https://github.com/lenticule-science/science-services-section/blob/main/services/social-science-services-section/services/economics-and-business-science-services-section/services/monetary-economics-science-services-section/content/text/glossary/terms/ack.md).

## Minimum apparatus

Fix a cover \(\mathcal U=\{U_i\}\) of a
specified site \((X,J)\), coefficient presheaf or
sheaf \(\mathcal F\), and explicit restrictions
\(r_{ij}\) on overlaps. Define the cochain
complex \(C^\bullet(\mathcal U,\mathcal F)\) and
differentials \(\delta^k\) satisfying
\(\delta^{k+1}\circ\delta^k=0\). Then

\[
H^1(\mathcal U,\mathcal F)
=\ker(\delta^1)/\operatorname{im}(\delta^0).
\]

The cochains and differentials must represent
**the particular evidence/settlement problem**.
A FOUR charge \`⊤\` at one cell only
states \`Record.pos>0\` and \`Record.neg>0\`.
It does not supply \(\mathcal U,\mathcal F,\delta\);
its presence alone cannot establish a nonzero
class. For example, a singleton cover with no
nonempty distinct overlaps can have \(H^1=0\)
even with conflicting local evidence.

## Separate state transitions

An authority may issue one of the **disposition
kinds** \`affirm\`, \`retract\`, or
\`record-contest\` described in
[Adjudicate contested source evidence](adjudicate-witness-conflict.md).
Those are decisions over source *standing*.
They do not delete evidence tallies from the
append-only Record, and an internal
\`record-contest\` is not an independent
border ACK.

Let \(R_\tau(c)\) be the evidence
Record and \(D_\tau(c)\) the disposition
set. A distinct active-evidence projection, if
formally specified, can read \((R_\tau,D_\tau)\)
under a named authority and policy. Without
that projection, monotone additions keep
\(\operatorname{charge}(R_\tau(c))=\top\)
once both polarity tallies are positive.

Changes to \(H^1\) after adjudication
must be shown by an induced cochain map
or by calculating new restrictions/
coboundaries on the same specified site.
One cannot infer those changes from the
name \`affirm\` or \`record-contest\`.

## Checkable research hypotheses

**H1 (clearing).** In a specified
site with a valid active-evidence
projection, a particular authorized
disposition might change the overlap
compatibility conditions and make a
previously computed cocycle exact.
A proof requires displaying the
cocycle before and its coboundary
witness afterward; the disposition
name alone has no force.

**H2 (holding).** A case retained as
contested might preserve an existing
nonzero class if the same carrier,
cover and restriction maps are
unchanged. A valid new ACK could
record independent uptake of one WIT
without changing the underlying
contested Record. Neither event
alone proves cohomological persistence.

**H3 (aggregation).** Counts of
dispositions are \(\mathbb N\)-valued
observables. They cannot be equated
to dimensions or direct summands of
\(H^1\) without an explicitly
proved injective/independence map
from the counted cases into
cohomology generators.

## Falsifiers and receiving

A toy model with \(\top\)-charged
cells but \(H^1=0\) falsifies the
previous universal “contradiction
implies nonzero H¹” claim. A
retraction with unchanged
\(\delta\) and unchanged class
falsifies universal “retraction
kills H¹.” A case with documented
external ACK yet persistent \(\top\)
disproves any identification of
ACK with contradiction clearing.

Mathematical receiving requires
actual defined sites, sheaves,
differentials, before/after
cochains, and mechanically checked
claims in Obsmetrologia. A
literature analogy or source
repository merge is not such
receiving.
