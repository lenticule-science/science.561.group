---
name: FOUR — bilateral evidence readings
type: structure
status: active
description: "Belnap–Dunn FOUR: independent presence/absence of support for and against one specified typed claim, under a declared witness scope."
date-updated: 2026-10-15
references:
  - "Belnap, 1977"
see-also: [logic-terms-proposition, logic-terms-possibility, logic-terms-necessity]
---

# FOUR — bilateral evidence reading, not an inquiry stage

**FOUR** is a four-element evidence carrier over two *independently collected witness-presence bits*. For **the same admitted, exactly typed claim** \`φ\` in one declared reading scope, let \`W⁺(φ)\` and \`W⁻(φ)\` be its qualified affirmative and negative witness sets. Its **knowledge reading** is

\[
v(\varphi)=(\mathbf 1[W^+(\varphi)\ne\varnothing],
             \mathbf 1[W^-(\varphi)\ne\varnothing])\in\{0,1\}^2.
\]

| Bilateral reading | Evidence bits | Meaning in the named witness scope |
| --- | --- | --- |
| Neither (\`⊥ₖ\`) | \`(0,0)\` | Neither kind of admissible witness has been told/observed |
| For only (\`t\`) | \`(1,0)\` | Affirmative evidence is present; no negative evidence is present in this scope |
| Against only (\`f\`) | \`(0,1)\` | Negative evidence is present; no affirmative evidence is present in this scope |
| Both (\`⊤ₖ\`) | \`(1,1)\` | Affirmative **and** negative evidence coexist; the claim is contested under this reading |

**Neither is not undecidable** in the sense of computability or a proved independence result. It is only a measured *lack of admitted evidence in the inspected source scope*. **Both is not logically impossible**: contested source claims are ordinary admissible inputs under a paraconsistent evidential semantics, without license to derive every proposition.

The **knowledge order** orders the *availability of testimony*: \`⊥ₖ ≤ₖ t ≤ₖ ⊤ₖ\`, \`⊥ₖ ≤ₖ f ≤ₖ ⊤ₖ\`, while \`t\` and \`f\` are incomparable in this order. The **truth order** is different: \`f ≤ₜ ⊥ₖ ≤ₜ t\` and \`f ≤ₜ ⊤ₖ ≤ₜ t\`, with \`⊥ₖ\` and \`⊤ₖ\` incomparable there. In the full bilattice both orders have their own joins/meets. Evidence **sets** should remain sourced separately: collapsing them to two presence bits loses actor identity, independence, provenance, exact claim reference and time.

## Necessary semantic boundaries

- A FOUR reading is **not proof of external truth** or of falsity, nor an automatically valid theorem about a corpus. Its meaning is only as strong as witness admission, claim identity and source completeness.
- One claim's \`(1,0)\` and another claim's \`(0,1)\` are **not contradictory evidence** unless both target exactly the *same* typed predication under a qualified interpretation and scope.
- Adding or changing observations does not by itself authorize the act of asserting/denying a claim; speech-act force, principal authority, and the independently received real-world effect are distinct.
- Positive-only **FCA** incidence \`I⁺\` need not reconstruct \`W⁻\` and thus cannot represent all four evidence readings without a separately justified negative incidence/Chu mapping.
- A graph, YAML frontmatter or a message quoting \`done\` is an authored **presentation**. It must not be projected as a bare verified domain fact or institutional permission.

## Separate March 28 roles

**Absurd → Possible → Necessary → Determined** in the March 28, 2026 authored relationality inquiry describes proposed *context-dependent epistemic/articulation roles*. It is **not FOUR**. In particular:
- **Absurd ≠ \`⊥ₖ\`**. A taken-as-given premise may have witnesses; an unwitnessed claim may not be such a premise.
- **Determined ≠ \`⊤ₖ\`**. A locally determined reading may have no empirical evidence; a contested evidential record may be fully unresolved.
- **Possible ≠ \`◇\`**, and **Necessary ≠ \`□\`** without a specified modal model and separately warranted translation.

This distinction is qualified in the [Relationality inquiry glossary](https://github.com/lenticule-science/science-services-section/tree/main/services/philosophy-services-section/services/relationality-services-section/content/text/glossary/terms) and the [Language Science original-source synthesis](https://github.com/lenticule-science/science-services-section/blob/main/services/information-science-services-section/services/language-science-services-section/content/text/documents/articles/notes/2026/10/10/2026-10-10-note-about-l-space.md). They are different semantic carriers, not loose synonyms.

## Formalization and custody

[Obsmetrologia's Positing/Morphism](https://github.com/lenticule-science/obsmetrologia/blob/main/Obsmetrologia/Language/Positing/Morphism.lean) proves scoped evidence injection properties under its particular FOUR valuation law. [LinearLogicChu](https://github.com/lenticule-science/obsmetrologia/blob/main/Obsmetrologia/Calculus/Logic/LinearLogicChu.lean) treats positive/negative incidence as distinct data. Engineering's [SignCell semantic claims](https://github.com/red-cup-engineering/computer-data-engineering-services-section/blob/main/apps/signcell/src/semantic-claim.mjs) preserve source tellings in separate for/against sets. These bounded source implementations do **not** assert that all organizational claims are valid, that all computations terminate, or that every task has been received.

**Former source defects retired:** this glossary had asserted that FOUR's both-corner is “logically impossible,” derived FOUR universally from Eff's double-negation image, and invoked Rice's theorem to guarantee a four-valued computational truth structure. None follows from the stated evidence semantics or the cited proof interface. The original text remains available through immutable Git history; its unverified Eff-specific conjectures belong to their own qualified research, not the definition of bilateral evidence.
