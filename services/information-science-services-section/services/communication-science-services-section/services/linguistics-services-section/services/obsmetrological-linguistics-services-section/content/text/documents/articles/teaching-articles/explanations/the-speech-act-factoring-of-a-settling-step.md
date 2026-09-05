---
title: "The speech-act factoring of a settling step"
description: "What locution, illocution, and perlocution are as house structure, the idealization that named factorization admits it makes, and why uptake — Austin's own fourth notion — is the factor that idealization erases and cannot be folded back into closure."
date-created: 2026-09-04
type: explanation
---

This explains, for a reader who is not a category theorist, what the
house's speech-act factoring of a settling step actually claims, where
it comes from, and where it currently runs out.

## The three factors, as the carriers state them

Every settling step the house's predication apparatus can realize — one
piece of evidence going in, its consequences coming out — factors into
three parts, and the factoring is not a metaphor borrowed from Austin
(1962); it is a proven categorical decomposition of the same
mathematical object the settling step already is. The factorization
theorem
([`predication-locution-illocution-perlocution-factorization.md`](../../../../../../../../../../../../../../lib/legacy/2026-07-31-lenticule-science-corpus/from-predicate-category/predication-locution-illocution-perlocution-factorization.md),
status sketch) states it as:

541350v_0 \xrightarrow{\text{locution: select cell }\phi} v_0 \xrightarrow{\text{illocution: posit }q\text{ at }\phi} v_0 \vee_k \delta_{\phi,q} \xrightarrow{\text{perlocution: closure}} v_1.541350

**Locution** is choosing which cell — which subject-predicate-object
address — the act is about. It changes nothing yet; it only points.
**Illocution** is the positing morphism itself: injecting one piece of
evidence, of one of four forces (asserting, denying, abstaining,
contesting — the Belnap partition), at the cell locution selected.
**Perlocution** is the closure step: running the settling's own rules
forward from the newly posited evidence to derive everything that
follows from it. See [locution](../../../../glossary/terms/locution.md),
[illocution](../../../../glossary/terms/illocution.md), and
[perlocution](../../../../glossary/terms/perlocution.md) for each factor's
full house reading, including its Klein-four symmetry regime and its
Barwise–Seligman channel-theoretic reading.

## The idealization the factorization carrier names

The factorization carrier does not present perlocution as a full
account of Austin's perlocutionary act. It names its own simplification
outright, under the name **perlocutionary determinism**: closure is
"rule-governed and predictable — no unintended effects," which the
carrier calls "a deliberate idealization of the speech-act model,
applicable to formal systems (databases, knowledge bases, institutional
rule systems) where the inference rules are fixed and mechanistic," and
which it explicitly contrasts with natural language, where "unintended
perlocutionary effects would require a more general (non-deterministic
or probabilistic) closure operator."

This is a real and stated limitation, not a silent one. But naming it
does not, by itself, say what got lost in the simplification — only
that Austin's account of perlocution is broader than the house's closure
operator. The next section names the specific piece.

## Uptake as the fourth factor, and why it cannot be folded into closure

Austin's own account of a speech act, read closely, is not really
three-part. In Lecture IX he adds a fourth requirement for an
illocutionary act to be complete: "the performance of an illocutionary
act involves the securing of uptake" — the hearer's understanding, "to a
certain extent," of the meaning and force of what was said. See
[uptake](../../../../glossary/terms/uptake.md) for Austin's and Cavell's full
treatment.

The house factorization has no place for this, and the reason is
structural, not an oversight to patch by adjusting the closure rules.
Closure, as the house defines it, is a deterministic operator: given a
settling and a rule system, it derives one unique set of consequences,
authored by no one and requiring no one's assent. Uptake is the opposite
kind of thing at the root: it is an *act*, performed by an agent
distinct from the utterer, at a time, with its own output — in the
relationality triage's own four-tuple sense
([`act.md`](../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/triage/act.md)),
$(A, \alpha, t, \varphi)$ with $A$ the hearer, not the speaker. No
adjustment to a deterministic, authorless closure rule can produce an
act that has an author. Perlocutionary determinism did not merely
simplify uptake away; it removed the one component of the apparatus —
an agent on the receiving side — that uptake requires to exist at all.

## Double-settlement precedents

The house does not lack machinery for a second, agentive settlement
alongside a deterministic one; it already has several instances of
exactly this shape, none of them yet named uptake:

- The act carrier's own shadow-class table
  ([`act.md`](../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/triage/act.md))
  separates $\mathrm{SatShadow}_t$ ("backward-acknowledged... the act
  has illocutionary uptake but the perlocutionary commitment is
  pending") from $\mathrm{TrShadow}_t$ (forward-committed but not yet
  recognized) — two independent conditions, not one.
- Incumbency
  ([`2026-07-11-note-on-metroplat-system-architecture-design.md`](../../../../../../../../../../../../../../../operations-services-section/content/text/documents/articles/notes/2026/07/11/2026-07-11-note-on-metroplat-system-architecture-design.md))
  is "a double settlement, not a single boolean grant": full incumbency
  requires both **recognition** ("the office's community acknowledges
  this candidate as its legitimate occupant; backward-looking,
  history-sensitive") and **induction** ("the candidate has taken on
  the office's forward obligation") to settle independently.
- The legacy inconsistency-repair spec's acknowledgement cell
  ([`predication-inconsistency-repair.md`](../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/lib/legacy/2026-06-30-infomaterial/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/_archive/predication-inconsistency-repair.md), §3.3)
  gives acknowledgement its own shortcut transition, `open \to
  resolved`, distinct from the `proposed`-confirmed path affirmation
  and retraction require, because "acknowledgement does not promise to
  clear the contradiction; it promises to record that it is recognised."

Each of these is a place where the house already keeps a backward,
agentive, recognition-shaped settlement apart from a forward,
rule-governed one. Uptake, read this way, is not a new mechanism to
invent; it is the name for a pattern the corpus already keeps
reproducing without one shared term.

## Open questions

- **Uptake's $K_4$ regime.** Locution, illocution, and perlocution
  each have a proven Klein-four invariance regime (trivial,
  non-trivial-equivariant, and conditionally-equivariant respectively —
  [`predication-klein-four-stratifies-locution-illocution-perlocution.md`](../../../../../../../../../../../../../../lib/legacy/2026-07-31-lenticule-science-corpus/from-predicate-category/predication-klein-four-stratifies-locution-illocution-perlocution.md)).
  Uptake has none stated, because the theorem stratifies a three-factor
  decomposition. Whether uptake is invariant, equivariant, or
  conditionally so under the bilattice symmetry is open.
- **Whether Barwise–Seligman's backward token map is the formal home of
  acknowledgement.** An infomorphism $f : A \rightleftarrows B$ in
  Barwise–Seligman channel theory carries two maps in opposite
  directions: forward on types ($f^\wedge$) and *backward* on tokens
  ($f_\vee$). The proven channel-theoretic reading of the house's own
  speech-act structure
  ([`from-predicate-category-channel-theoretic-speech-acts.md`](../../../../../../../../../../../../../../lib/legacy/2026-07-31-lenticule-science-corpus/animating/content/becoming/doing/working/governing/communicating/content/speech-acts/_archive/from-predicate-category-channel-theoretic-speech-acts.md))
  already reads illocution as a forward, type-level infomorphism
  extension. Whether acknowledgement — a backward-directed, hearer-side
  act — is properly the *token*-level, backward-directed half of that
  same infomorphism structure, rather than a separate construction
  entirely, is a conjecture to check against the proven theorem, not a
  claim this document makes.

## See also

- [Speech act](../../../../glossary/terms/speech-act.md)
- [Locution](../../../../glossary/terms/locution.md),
  [illocution](../../../../glossary/terms/illocution.md),
  [perlocution](../../../../glossary/terms/perlocution.md)
- [Uptake](../../../../glossary/terms/uptake.md)
