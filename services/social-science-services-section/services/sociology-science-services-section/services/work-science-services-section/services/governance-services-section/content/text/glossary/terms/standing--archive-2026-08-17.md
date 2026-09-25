---

name: "Standing"
description: "Standing is a triple (G, F, Φ) — an agent G, a forum F (a scene, normative system, or institutional context), and an act-class Φ — such that G holds a Hohfeldian privilege plus correlative right to perform acts of type Φ within F, and F's saturation nucleus takes G's acts of type Φ as valid inputs. The defining structure: standing is recognition by the forum's nucleus that G's outputs count. Without standing, G's acts enter H_t but do not propagate toward H*_t within F — they are formally valid acts that the forum simply does not process. Beck-Chevalley reading: the σ-Beck-Chevalley condition holds for standing in the forum hierarchy — standing in a forum F implies standing in every sub-forum F' ⊆ F for the same act-class (backward-stability: past recognition propagates). But the Δ-Beck-Chevalley condition fails at frontier forums — a forum at the boundary of its institutional scope may not yet commit to carrying G's standing forward in all extensions. Both conditions hold in the full institutional colimit. Minimum standing — standing every person holds in every legitimate forum simply by being a person — corresponds to a global section of the standing presheaf: a section that is present at every history and every sub-forum, stable under all restriction maps."
date-created: 2026-03-20
---

## Formal definition

**Standing** is a triple $(G, F, \Phi)$:

$$(G : \mathrm{Person},\; F : \mathrm{Forum},\; \Phi : \mathrm{ActClass})$$

where $G$ holds standing in $F$ for $\Phi$ iff three conditions hold simultaneously:

1. **Hohfeldian privilege**: $G$ has a privilege within $F$ to perform acts of type $\Phi$ — $G$ is not under a duty-not-to within $F$ for $\Phi$
2. **Correlative right**: $F$ has no-claim that $G$ not perform $\Phi$ within $F$ — more precisely, $F$'s norm-system does not prohibit $G$'s performance of $\Phi$
3. **Nuclear recognition**: $G$'s acts of type $\Phi$ within $F$ are inputs to $F$'s saturation nucleus $\sigma^F_t$ — they propagate toward $H^{*F}_t$; the forum processes them

The third condition is what separates standing from mere permission. An agent may have a privilege to speak without the forum being required to recognize their speech. Standing in the formal sense requires that the forum's nucleus takes the agent's acts as genuine inputs — not merely that the acts are formally permitted.

**Standing predicate.** $\mathrm{St}(G, F, \Phi) = 1$ iff $G$ holds standing in $F$ for $\Phi$ at current history $t$. Standing is history-indexed: $\mathrm{St}_t(G, F, \Phi)$ may change as $G$'s Hohfeldian positions change.

## Three tiers of standing

**Tier 1 — Participatory standing**: the right to be present in a scene and have one's presence count. An agent without participatory standing in $F$ is a stranger to $F$ — their actions within $F$'s physical space do not constitute valid moves within $F$'s institutional structure. Example: a member of the public in a courtroom has participatory standing (they may sit and observe) but not assertive standing (they may not address the court without leave).

**Tier 2 — Assertive standing**: the right to make assertions within $F$ that $F$'s nucleus processes as candidate inputs for $H^{*F}_t$. This is the primary tier for epistemic purposes. An expert witness has assertive standing (their testimony is processed by the court's nucleus of evidentiary weight); a bystander does not.

**Tier 3 — Remedial standing**: the right to invoke $F$'s enforcement mechanisms — to trigger a [Sanction](../../../../legalism/terms/sanction.md) or request a [Remedy](../../../../../../../../../../content/text/glossary/terms/breach.md). In law, this is "standing to sue." Only parties with a cognizable interest in the outcome — defined by a duty owed to them or a right they hold — have remedial standing. The Hohfeldian structure: remedial standing requires holding a claim-right, not merely a privilege. Without a correlative duty from the breaching party toward the agent, no remedial standing exists.

## Standing vs. authority

[Authority](./authority.md) is the capacity to give others content-independent reasons for action — it is a second-quartet Hohfeldian Power. **Standing** is the right to participate in a forum's epistemic and normative processes — it is primarily a first-quartet structure (privilege + correlative no-claim), with remedial standing adding a first-quartet right.

The distinction: $G$ may have standing in $F$ without authority in $F$ — $G$ can speak, be heard, and invoke remedies, but cannot issue instructions that create duties. $G$ may have authority without standing — $G$ can issue instructions but cannot participate as a peer in the forum's deliberative processes. Judges have both authority (to issue orders) and standing (to receive and process submissions); witnesses have standing (to testify) but not authority; advocates have both within their scope.

## Standing and the nucleus

The nuclear significance of standing: $\sigma^F_t$ is not defined on all of $H_t$ — it is defined on the sub-fiber $H^F_t$ that the forum recognizes as valid input. An element $a \in H_t$ produced by an agent $G$ without standing in $F$ for the relevant act-class is simply outside $H^F_t$. The forum's nucleus does not apply to it. It may be a perfectly valid element in $H_t$; it just has no pathway to $H^{*F}_t$ through the forum.

This is the formal content of "courts don't hear cases brought by strangers to the controversy": the stranger's assertion is a valid fiber element, but it is outside the court's sub-fiber, and the court's nucleus will not process it toward settlement.

## Standing in a rule-based normative system

In a rule-based normative system:

| Agent type | Forum | Act-class | Standing tier |
|---|---|---|---|
| Any agent | Any locale | Read resources | Participatory |
| Locale officer | Locale's norm system | Submit reports | Assertive |
| Skill invoker | Skill | Execute skill protocol | Assertive + remedial |
| System designer | Governance documents | Issue normative constraints | All tiers |
| Domain specialist | Domain locale | Submit domain claims | Assertive (for domain nucleus) |

An agent that invokes a capability without holding the required role lacks standing for that invocation: the invocation is formally an act, but the system's nucleus does not process it as valid — it does not propagate toward the capability's $H^*_t$.

## Standing and constitution

Standing is constituted by the forum: the forum's constitutive rules ([Constitution](./constitution.md)) determine which agents count as having standing for which act-classes. "This agent counts as an expert witness in this court" is a StatusFunctionDeclaration that constitutes assertive standing. The standing is not an intrinsic property of the agent; it is the institutional fact created by the forum's constitutive recognition.

This is why standing can be granted, revoked, limited, and restored by institutional acts — it is a constituted status, not a natural property.

## Beck-Chevalley coherence in the forum hierarchy

**Source:** [Beck-Chevalley Tower](../../../humanities/domains/math/relational-universe-beck-chevalley-tower.md).

The open question — whether standing is a sheaf condition over the forum hierarchy — is answered by the Beck-Chevalley tower. There are two components, and they behave differently:

**σ-BC holds: standing is backward-stable.** The saturation Beck-Chevalley condition holds at every finite forum depth: for any inclusion of forums $f : F' \hookrightarrow F$ (forum $F'$ is a sub-forum of $F$), the base-change square for the saturation nucleus commutes:
$$f^* \circ \sigma^F \;\cong\; \sigma^{F'} \circ f^*.$$
Operationally: if agent $G$ has assertive standing in forum $F$ (meaning $F$'s saturation nucleus processes $G$'s acts as valid inputs), then $G$ has assertive standing in every sub-forum $F' \subseteq F$. The forum hierarchy is backward-coherent for standing. This answers "yes" to whether standing in $F_2$ implies standing in $F_1 \subseteq F_2$: σ-BC makes this a theorem.

**Δ-BC fails at frontier, holds in colimit.** The transfer Beck-Chevalley condition fails at the frontier of the forum hierarchy: a forum $F$ at the edge of the current institutional scope has forward extensions (larger forums that include $F$) not yet committed at the current depth. Standing in $F$ may not carry forward in those extensions — the deeper forums may impose stricter standing requirements, or may not yet have assessed whether $G$'s standing is valid under their broader transfer nucleus. But by defect mobility, every frontier forum becomes interior at the next level, and in the full institutional colimit both BC conditions hold. Standing in the full institution is fully coherent: it propagates both backward (σ-BC) and forward (Δ-BC in the limit).

**Minimum standing as global section.** If minimum standing exists — a standing that every person holds in every legitimate forum simply by virtue of personhood — it corresponds to a **global section** of the standing presheaf: a section $s : 1 \to \mathrm{St}$ that is present at every history and every sub-forum, stable under all restriction maps. The existence of such a global section is the formal content of the claim that legitimate institutions recognize the standing of persons as persons. Its absence would mean no institutional frame acknowledges basic personhood standing — a formal condition of illegitimacy.

**Proposition (Standing sheaf condition).** Standing $\mathrm{St}(G, F, \Phi)$ satisfies the sheaf gluing condition: if $G$ has standing in a family of sub-forums $\{F_i\}$ that cover $F$ (in the covering-sieve sense of $J$), and these standing conditions are pairwise compatible on overlaps, then $G$ has standing in $F$ for $\Phi$. The forum's nucleus is defined by the same sheaf condition that governs all of $H$; standing, as a condition on which elements are inputs to the nucleus, inherits the same gluing property.

*Source.* σ-BC from [Beck-Chevalley Tower](../../../humanities/domains/math/relational-universe-beck-chevalley-tower.md) §Summary (holds at every finite level). Δ-BC failure at frontier and colimit recovery from §Proposition — Defect Mobility and §Theorem — Δ-BC in the Colimit. $\square$

## Open questions

- Whether standing is monotone in the forum hierarchy: if $F_1 \subseteq F_2$ (F_1 is a sub-forum of F_2), does standing in $F_2$ for $\Phi$ imply standing in $F_1$ for $\Phi$? Or can a forum recognize agents that its sub-forum does not? This seems to require that standing is a sheaf condition over the forum hierarchy.
- Whether there is a "minimum standing" — a standing that all agents have in all forums by virtue of being persons — analogous to the natural law claim that all humans have basic standing before any legitimate legal order; and whether this corresponds to a global section of the standing presheaf.
- Whether standing transfers: if $G$ delegates authority to $G'$, does $G'$ thereby acquire $G$'s standing in $F$? Or is standing non-delegable (like accountability), requiring its own constitution act in $F$?
