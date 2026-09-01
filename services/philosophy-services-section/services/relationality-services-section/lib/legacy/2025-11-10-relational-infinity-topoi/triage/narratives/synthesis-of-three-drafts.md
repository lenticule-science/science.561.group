---
name: synthesis-of-three-drafts
type: narrative
class: synthesis
discusses: [relational-infinity-topos, ritm, stratified-directed-infinity-site]
depends-on:
  - relational-infinity-topos
  - ritm
  - stratified-directed-infinity-site
---

The source dump for this subtheory is three near-overlapping drafts of one theory, totalling about 88 KB across three folders. The drafts are not paper-revisions of one another; they are three independent passes at the same content, each starting from a different conceptual entry point and each arriving at the same destination by a different route.

The three entry points are worth naming. The *constructing* draft enters through the **stratified directed site** — it begins by axiomatizing the SD ∞-site, derives latching/matching as the forced local data on it, and only then arrives at the cohesive quadruple as the natural ambient cohesion. The *modality* draft enters through the **modal reading** — it begins by axiomatizing $\Box, \Diamond$ as KZ-(co)monads, derives the cohesive quadruple as the adjoint chain that produces them, and arrives at SD-constructibility as the well-formedness condition for diagrams. The *SD-geometry* draft enters through the **exit ∞-category** — it begins with $\mathrm{Exit}(X)$ for stratified $X$, derives the SD ∞-site as the indexing structure, derives the recursive realization on it, and arrives at the cohesive quadruple as the structure that makes the realization terminate.

Three doors, one room. The synthesis decision was: keep the room, throw away two of the doors. The kept door is the cohesive quadruple, because that is what the upstream [relational-calculus pilot](../../../../../relational-calculus/triage/_index.md) and the upstream [Lawvere–Schreiber reference](../../../../../relational-calculus/triage/references/lawvere-schreiber.md) already use; importing the other two notations would have created a triple-naming problem with no payoff.

The two thrown-away doors did not vanish. They became *narrative material* — see [`three-divergent-models.md`](three-divergent-models.md) for the full comparison — and the substantive disagreements between the three drafts (presheaf vs CartSp base, three-functor vs four-functor cohesion, ambidexterity scope, existence-as-truncation vs RT-equivalence, KZ comonad vs closure 2-monad) became [`questions/`](../questions/), not silently-resolved choices.

The risk in absorbing three drafts into one subtheory is that the subtheory ends up looking like a *least common denominator* — anything any draft contested gets dropped, and what remains is the boring overlap. The decision against that here was: take the *full content* of every draft (each draft has unique content the other two lack — exit ∞-category from draft 3, RT-equivalence from draft 2, SD-ambidexterity proof outline from draft 1), and surface the contested parts as questions. The result is a subtheory that contains *more* than any single draft did, with the disagreements visible as agenda items.

The notes here are not transcripts of the drafts. Every note was written from scratch with predication-categories frontmatter; the draft material is the substrate that shaped what was written. This is the rewriting that the task brief required — bulk-copy was rejected at the start.
