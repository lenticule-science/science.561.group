---
name: Necessity (modal-logic sense)
description: "The modal operator □ relative to an explicit Kripke accessibility relation, not the Necessary structural requirement of March 28 or an institutional obligation."
date-created: 2025-12-26
date-updated: 2026-10-15
see-also: [logic-terms-possibility, logic-terms-possible-world, logic-terms-kripke-frame]
---

# Necessity — modal-logic world

A **modal necessity** \`□φ\` is assessed in a specified modal model at a nominated world. In classical **Kripke semantics**, with \`M = (W,R,V)\`:

\[
M,w \models \Box \varphi \quad\Longleftrightarrow\quad
\forall v\in W\;(wRv\ \Rightarrow\ M,v\models\varphi).
\]

That is, \`φ\` holds at **every accessible world** of \`w\` in the selected model. The formula and accessibility relation are indispensable coordinates. If there are no accessible worlds, the universal condition is vacuously true in basic Kripke semantics; that is *not* independent proof of a proposition or a warrant to act.

Classical duality \`□φ ↔ ¬◇¬φ\` depends on the selected negation and modal semantics. For arbitrary \`R\`, \`□φ → φ\` (the T axiom) requires at least reflexivity, and \`□φ → □□φ\` (the 4 axiom) requires transitivity. Calling all modal necessities \`j(a)=a\` for an **extensive** Heyting closure \`j\`, or treating \`j\` as the same operator as arbitrary Kripke \`□\`, confounds different presentations. A chosen algebraic modality requires its own explicit axioms, order and correspondence.

## Three different uses of “necessary”

1. **\`□φ\` in a formal modal model** is the subject of this glossary entry. The indexed worlds and accessibility rule determine its scope.
2. The [March 28 relational Necessary](https://github.com/lenticule-science/science-services-section/blob/main/services/philosophy-services-section/services/relationality-services-section/content/text/glossary/terms/necessary.md) is a **condition required for a proposed continuation within an inquiry's givens and relations**; it is not an instance of \`□\` without a separately supplied mapping and proof.
3. A **legal, deontic or contractual obligation** is a normative relation among specific actors or offices under an admitted authority. It is not established by either kind of necessity. The same English word must never silently transfer a modal fact into someone's duty.

A result derived from premises in a proof calculus is also not equivalent to truth at every accessible world without the calculus' soundness hypothesis and a specified semantics. Keep those commitments separately cited. See the actual [Obsmetrologia](https://github.com/lenticule-science/obsmetrologia) formalization for bounded proved mathematical claims; this lexical entry does not certify a universal modal system.
