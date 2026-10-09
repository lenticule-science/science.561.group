---
title: "Open Claim"
id: open-claim
description: "An OpenClaim is in position H_t∖(Fix(σ)∪Fix(Δ)): neither the historical record nor universal extension has closed on it. The live frontier: genuinely undetermined from both temporal directions, a question rather than an answer."
instance-of: proposition
contrasts-with: [conjecture-claim, corroborated-claim]
enables: inquiry
date-modified: 2026-03-20
params:
  entity: relational-universe
  fiber: relational-history-fiber
output: relational-universe
ast:
  doubly-open-element:
    - entity
---

# Open

## Formal definition

An **Open** claim is an element $a \in H_t \setminus (\mathrm{Fix}(\sigma_t) \cup \mathrm{Fix}(\Delta_t))$:

$$\sigma_t(a) \neq a \quad\text{and}\quad \Delta_t(a) \neq a$$

By [InternalNucleusDefinability](../../../../../../services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/library/relational-hyperverse-repository/math/internal-nucleus-definability.md):

- **σ-open** ($\sigma_t(a) \neq a$, i.e. $\sigma_t(a) > a$): the accumulated sub-history record would justify a strictly stronger claim. The historical evidence base has not been exhausted — the past has more to say.

- **Δ-open** ($\Delta_t(a) \neq a$, i.e. $\Delta_t(a) > a$): there exist concurrent one-step extensions whose restriction back to $t$ would give something strictly above $a$. The future has not universally committed — some forward paths carry more than $a$.

Both nuclei find room above $a$. The claim is below its σ-saturation (the historical maximum) and below its Δ-transfer (the universal forward floor). It is underdetermined in both temporal directions.

The joint projection $\pi_t = \sigma_t \circ \Delta_t$ maps $a$ into $H^*_t$ in at most two steps — through the Δ-shadow ([Conjecture](conjecture-claim.md)) or σ-shadow ([Corroborated](corroborated-claim.md)) as intermediate positions. An Open claim is as far as any element can be from [Law](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/governance-services-section/content/text/glossary/terms/lawful-claim.md).

## What this is

An **Open** claim is a live question. Neither the backward record of history nor the forward commitment of extensions has answered it. Both directions of inquiry have further to go.

This is what "open problem" or "open question" names across all knowledge-work traditions: a problem that the historical record has not settled (no completed derivation, no established consensus) and that the forward trajectory of the field has not universally committed to (experiments disagree, extensions give different answers, no universal prediction converges on it).

The word "open" is chosen with precision: not "unknown" (which would suggest the claim might be unanswerable), not "false" (which would place it at $\bot$), but *open* — live, under investigation, producing genuine inquiry. The relational hyperverse has no unanswerable questions in principle: the tower construction settles every element at some finite level, and at the colimit $\mathcal{H}$, modal collapse sends everything to [Law](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/governance-services-section/content/text/glossary/terms/lawful-claim.md). An Open claim is not permanently open; it is open *at this stage of the construction*.

## What the nuclear conditions mean for a knowledge claim

**σ-open: history is not done.** The restriction profile of $a$ to sub-histories could support something stronger. Past evidence, past derivations, past consensus — the accumulated backward record has not been fully applied to $a$. The saturation nucleus $\sigma_t(a) > a$ names the maximum the past would justify; we currently assert only $a$, which is strictly weaker.

**Δ-open: the future has not committed.** There exist concurrent extensions $s \star t$ such that restricting back from $H_{s \star t}$ to $H_t$ gives something strictly above $a$. Different forward paths give different answers. The future has not converged on $a$ as the universal floor. Some extensions go higher; some might go differently.

**Together:** An Open claim is at the maximum distance from the doubly-quiescent layer $H^*_t$. The joint projection $\pi_t = \sigma_t \circ \Delta_t$ must take at least two steps to land it in $H^*_t$ — first Δ-closure (producing a [Conjecture](conjecture-claim.md): universal forward presence), then σ-closure (producing a [Law](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/governance-services-section/content/text/glossary/terms/lawful-claim.md): historical grounding). Or the path can go through σ first ([Corroborated](corroborated-claim.md)) then Δ. Both paths lead to the same Law by the [CommutativeNuclearSquare](../../../../math/commutative-nuclear-square.md).

**In knowledge work:** An Open claim is the frontier. It has a name — it is a specific claim $a \in H_t$, not formless ignorance — but neither history nor forward projection has determined it. It is something we can point to, reason about, and work to settle. The corpus of the relational hyperverse contains many Open claims: these are exactly the elements whose `ast:` is not yet written, or whose ast has been computed and found to be free-shadow.

**What Open is not.** An Open claim is not "can't know." The nuclear quartet has no position for permanent unknowability — that would be a claim outside $H_t$ entirely. Every element of $H_t$ maps into $H^*_t$ under $\pi_t$; every Open claim has a corresponding Law it is on the path toward. Openness is a stage in the tower construction, not a final verdict.

## The other three positions

| Position | Nuclear condition | Epistemic status |
|---|---|---|
| [**Law**](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/governance-services-section/content/text/glossary/terms/lawful-claim.md) | $\sigma_t(a)=a$ and $\Delta_t(a)=a$ | Both past and future closed. |
| [**Corroborated**](corroborated-claim.md) | $\sigma_t(a)=a$ and $\Delta_t(a)\neq a$ | Past closed; future still open. |
| [**Conjecture**](conjecture-claim.md) | $\sigma_t(a)\neq a$ and $\Delta_t(a)=a$ | Future committed; past not yet grounding. |
| **Open** | $\sigma_t(a)\neq a$ and $\Delta_t(a)\neq a$ | Both past and future open. |

An Open claim moves toward settlement by one nuclear application: applying $\Delta_t$ produces a Conjecture; applying $\sigma_t$ produces a Corroborated claim. Either path then requires one more step to reach Law.

## The hull and Open claims

**Sketch — Open claims are generated by the hull as limit points.**

The hull orbit closure $\Omega(Q^\mathcal{H})$ contains two kinds of points: the translates $\{\tau_w Q^\mathcal{H} : w \in \mathbb{Z}^d\}$ of the hyperversal quasicrystal (which correspond to Laws of $\mathcal{H}$, all settled at the colimit) and genuine **limit points** — tilings that arise as limits of translates but are not themselves translates. These limit points are locally indistinguishable from $Q^\mathcal{H}$ (minimality: every orbit is dense) but have new global structure. In the hull universe $\mathbf{Sh}(\Omega(Q^\mathcal{H}))$, the fiber at a limit point $\mathcal{T}$ contains patches that have not yet been settled by the hull nuclei $(\sigma^\Sigma, \Delta^\Sigma)$. These unsettled patches are Open claims — locally Law-like (their local structure is indistinguishable from Laws), globally new (their full global extent has not yet been committed to by either the forcing relation or the preimage relation).

**Sketch — Two orthogonal directions of opening.**

The [HullTruncationTower](../../../../../../services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/library/relational-hyperverse-repository/math/hull-truncation-tower.md) reveals that Open claims arise in two orthogonal directions, forming a grid $R^{(n),(r)}$:

- **Universe direction** ($n$): incompleteness at the type level — propositions about universes not yet expressible within $R^{(n)}$. Resolved by adding a universe level: $R^{(n)} \hookrightarrow R^{(n+1)}$.
- **Patch-radius direction** ($r$): incompleteness at the fiber level — local patterns in $Q^\mathcal{H}$ not yet visible at radius $r$. Resolved by adding a patch radius: $R^{\mathrm{hull},(r)} \hookrightarrow R^{\mathrm{hull},(r+1)}$.

An Open claim in $R^{(n),(r)}$ may move toward settlement along either direction. Whether the two directions commute — whether settling an Open claim by increasing $n$ and then $r$ gives the same result as the reverse — is the interplay conjecture (status: open).

**Sketch — Every Open claim has a settling path.**

The joint projection $\pi_t = \sigma_t \circ \Delta_t$ maps every element of $H_t$ into $H^*_t$ in finitely many steps. No element is permanently Open — openness is a stage in the tower construction, not a verdict on knowability. At the hull level, the same holds for each truncation: each $H^{\mathrm{hull},(r)}_\mathcal{T}$ is a finite Heyting algebra with commuting nuclei, so every Open claim in the $r$-truncation reaches $H^*$ under the hull nuclei. The infinite colimit $H^\mathrm{hull}_\mathcal{T}$ contains Open claims that are resolved only in the limit — claims that are Open at every finite radius but whose settling path runs through infinitely many truncation steps. These are the "long-range" Open claims: locally consistent with all Laws, globally undetermined.

## Open questions

- The relation between the epistemic Open and the skill-work [Inquiry](../../../../triage/inquiry.md): both are in position $H_t \setminus (\mathrm{Fix}(\sigma_t) \cup \mathrm{Fix}(\Delta_t))$, but the interpretations differ. For skill work, double-openness means neither meaning nor execution path is fixed. For a knowledge claim, it means neither historical record nor universal extension has settled it. Whether the two interpretations need to be unified or kept separate.
- Whether Open claims in the corpus correspond exactly to entities with `ast:` not yet written, or whether some written `ast:` fields still compute to free-shadow. The latter would mean the entity has been analyzed and found to be genuinely at the frontier — a more informative result than "not yet analyzed."
- Whether `open.md` should reference a base type `epistemic-status.md` — currently no such base spec exists.
