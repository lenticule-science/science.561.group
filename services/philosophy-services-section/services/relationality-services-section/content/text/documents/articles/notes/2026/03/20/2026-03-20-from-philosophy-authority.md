---
title: "Authority"
id: authority
description: "Authority is a three-tuple (Q, S, R) — a source Q holding the authority, a scope S specifying the domain of actions and relations it governs, and a recognition predicate R by which the relevant community acknowledges Q's authority within S as legitimate. The defining structure: authority is not raw power (capacity to impose regardless of legitimacy) and not mere permission (others allow you); it is the capacity to give others content-independent reasons for action within S by virtue of Q's position — recognized normative standing, not force."
requires: [source, scope, recognition]
enables: [delegation, duty]
governed-by: institution
contrasts-with: power
acts-on: area
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  source: person
  scope: area
  recognition: relational-universe-morphism
output: relational-universe
ast:
  second-quartet-normative-position:
    - source:
        - scope
    - recognition:
        - source
        - scope
---


## Formal definition

**Authority** is a three-tuple $\mathcal{A} = (Q, S, R)$:

$$\mathcal{A} = (Q : \mathrm{Person},\; S \subseteq \mathrm{Domain},\; R : \mathrm{LegitimacyPredicate})$$

where:
- $Q$ is the **source** — the party who holds the authority; $Q$ may be a natural person, a juridical person, an office, or an institution; the source need not exercise the authority actively — the authority persists in $Q$'s position regardless of whether Q issues directives
- $S$ is the **scope** — the domain of acts, relations, and parties within which $Q$'s authority operates; $S$ specifies what $Q$ has authority *over* and *for*; authority outside $S$ is *ultra vires* — not just wrong but unauthorized in a constitutive sense
- $R$ is the **recognition predicate** — the condition under which the relevant community (subjects, institutions, courts) acknowledges $Q$'s directives as generating content-independent reasons for action; without $R$, $Q$ has power but not authority; with $R$, $Q$'s directives bind even if subjects disagree with their content

**Four invariants.** $\mathcal{A}$ is an instance of authority if and only if:

1. **Content-independence**: $Q$'s directives within $S$ give subjects reasons to act regardless of whether subjects judge the content to be correct, beneficial, or wise (Raz).
The subject need not agree with the order to be obligated to follow it; the authority relation is what generates the reason, not the content's merit.
This distinguishes authority from advice (which works by its content), manipulation (which bypasses reason), and force (which eliminates choice).
A court order binds because it is a court order, not because the defendant agrees with the judgment.

2. **Scope boundedness**: $\mathcal{A}$ governs only within $S$.
Outside $S$, $Q$'s directive is either irrelevant (an act $Q$ simply has no opinion on) or *ultra vires* (an act $Q$ purports to govern but lacks the authority to).
The distinction matters: a general may order troops to advance but may not order them to commit crimes; the second directive is not merely a bad order but a non-authority-act — no authority backs it.

3. **Recognition is non-trivial**: $R$ is not merely $Q$'s belief in their own authority.
It must be acknowledged by the relevant parties — subjects, institutions, or courts that constitute the normative context.
Self-declared authority without recognition is not authority but pretension.
Contested authority (where $R$ is disputed) is real authority whose legitimacy is in question, not the absence of authority.

4. **Authority generates obligations**: when $Q$ issues a directive within $S$ and $R$ holds, subjects acquire a duty to comply ([Duty](../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/governance-services-section/content/text/glossary/terms/duty.md)).
This duty is Hohfeldian: it is a three-place relation $\mathbf{D}(\text{subject}, \varphi_{\text{directive}}, Q)$.
The correlative is $Q$'s claim-right that subjects comply.
Authority is the second-quartet position (power) that constitutes these first-quartet relations when exercised.

## Authority vs. power

The core distinction is between **authority** and **brute power** (capacity to compel):

| | Authority | Power |
|---|---|---|
| Source of compliance | Content-independent reasons | Incentive / coercion |
| Legitimacy required? | Yes — $R$ must hold | No |
| Generates obligations? | Yes | No — only prudential reasons |
| Ultra vires possible? | Yes — scope limits exist | No — power knows no scope limits |
| Transfers by | Delegation, succession, investiture | Conquest, violence, threat |

A dictator may have vast power — capacity to compel compliance by force — without having authority: no recognition predicate $R$ holds; no content-independent reasons are generated; subjects comply because of fear, not obligation.
A legitimate government may have authority without having the power to enforce it: a court order in an ungoverned zone binds legally (authority) but cannot be enforced (no power).
Authority and power are distinct properties that often (in stable institutional settings) coincide.

**Might does not make right**: this principle is the philosophical rejection of reducing authority to power.
Thrasymachus (in Plato's *Republic*) identifies justice with the interest of the stronger — the strong have power; the strong define law; law defines justice; therefore power is justice.
Socrates rejects this: the strong have power; they may also have authority; but power *and* authority are two different things, and conflating them produces the conclusion that any conquest is thereby legitimate, which is absurd.

## Weber's three types of legitimate authority

Max Weber (*Economy and Society*, 1922) identified three **pure types** of legitimate authority (*Herrschaft*) — three kinds of recognition predicate $R$ that different historical and social structures instantiate.


### Rational-legal authority

$R$ holds because the authority derives from formally enacted rules recognized as legitimate. The authority is impersonal: it is the *office*, not the person, that holds authority. Weber: "The authority of the law rests on a belief in the legality of enacted rules and the right of those elevated to authority under such rules to issue commands."

Features: explicit scope ($S$ defined by statute or charter); formal procedures for issuing directives; written record; equal treatment of like cases; separation of the person from the office.
The bureaucratic organization is the purest form.

Instances: constitutional law (legislative authority derives from formal democratic process); corporate governance (the board's authority derives from the articles of incorporation); military command (the officer's authority derives from commission and chain of command).
The [Principal](../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/governance-services-section/content/text/glossary/terms/principal.md) in the relational system holds rational-legal authority: its source is formal recognition within the institutional framework, its scope is chartered, and its legitimacy derives from the charter.

### Traditional authority

$R$ holds because the authority derives from long-established custom and the sanctity of tradition.
The authority is personal in a different way: it is *this person* (or *this line of persons*) that holds authority by virtue of heredity, custom, or immemorial practice.
The king rules because kings have always ruled; the elder decides because elders have always decided.

Features: the authority is not impersonal (replacing the person changes the authority); the scope is defined by custom, not by written rules; subjects owe personal allegiance, not institutional compliance.
The *King's Two Bodies* doctrine is the hybrid: the body politic (rational-legal, impersonal) combined with the body natural (traditional, personal succession).
Kantorowicz's analysis shows the transition in legal thought from pure traditional to rational-legal.

Instances: hereditary monarchy, traditional chieftainship, familial authority (parental authority in Roman law is *patria potestas* — customary, personal, broad), mastership-apprenticeship.
The traditional authority structure is also present in professional communities: a doctor has authority in medical matters not because of any formal charter but because medicine has traditionally been the domain of doctors and that tradition is socially recognized.

### Charismatic authority

$R$ holds because the authority derives from recognition of the holder's exceptional personal qualities — spiritual gifts, heroic virtue, prophetic vision, extraordinary achievement.
The recognition is direct and personal: followers recognize *this person* as possessing gifts that justify obedience.

Features: wholly personal (the authority cannot be transferred by appointment; it must be recognized de novo in each case); structurally unstable (it lasts as long as followers recognize the gifts; it collapses when they stop); tends toward either routinization (the charismatic authority is institutionalized, becoming rational-legal) or traditionalization (the charismatic founder's practice becomes custom).
Charismatic authority produces no formal scope ($S$ is defined by whatever the charismatic person declares).

Instances: prophetic religious authority (Moses, Muhammad, the Buddha — each recognized by followers as possessing exceptional spiritual gifts that generate content-independent reasons); revolutionary political authority (Cromwell, Lenin, Mao — the leader whose directives are followed not because of formal position but because of revolutionary recognition); scientific authority in its personal form (the paper of a recognized genius commands attention that the same ideas from an unknown do not — the authority derives from the person's recognized capacity).

**Routinization of charismatic authority**: when a charismatic leader dies or the charismatic movement must be sustained, the authority must be transferred.
Weber identifies two routes: (1) the charismatic quality is transferred to the office (*charisma of office*) — the new pope has papal charisma by virtue of succession, not personal qualities; (2) hereditary charisma — the quality is inherited by the leader's descendants.
Both routinizations convert charismatic authority into traditional authority.

## Raz's service conception of authority

Joseph Raz (*The Morality of Freedom*, 1986; *The Authority of Law*, 1979) provides the most philosophically rigorous account of why authority generates content-independent reasons.

**The Normal Justification Thesis (NJT)**: an authority $Q$ is legitimate with respect to subject $X$ and domain $S$ if and only if $X$ is more likely to act in accordance with correct reasons by following $Q$'s directives than by acting on $X$'s own assessment of the relevant reasons.
The authority is *justified* when it serves $X$ better than $X$'s own deliberation.

Why content-independence follows: if $Q$'s directives are to serve $X$ better than $X$'s own deliberation, $X$ must not second-guess each directive on its merits.
If $X$ deliberates about whether $Q$'s directive in this case is correct, $X$ has replaced $Q$'s authority with $X$'s own judgment — which was supposed to be less reliable than $Q$'s.
Authority works by pre-empting the subject's deliberation: the directive replaces the reasons it tracks.

The **Pre-emption Thesis**: $Q$'s directives should be treated as reasons for action that pre-empt other reasons in their scope.
The directive is not added to the balance of reasons; it replaces the deliberation that would otherwise occur.
The authority is categorical: the subject does not weigh "follow the directive" against "do what I judge best" — within the authority relation, following the directive is what doing what is best (in terms of the reasons the authority tracks) comes out to.

**Expertise as the core case**: the clearest case for authority is expertise.
You follow your doctor's advice not because you understand the pharmacology but because the doctor has access to reasons (medical training, diagnostic tools, clinical experience) that you do not.
The doctor's authority in medical matters is legitimate because following the doctor's directives tracks the underlying medical reasons better than your own assessment would.
The service conception generalizes: any time an authority can track and act on reasons better than the subject, the authority is legitimate and the subject should follow.

## Authority in the relational system

In the FARS locale structure, authority appears at two levels.

**Institutional authority**: the FARS spec itself (the `spec/` locale's SOUL.md, AGENTS.md, and constitutive rules) holds institutional authority over all agents operating within the system.
The spec defines what it means for an agent to operate properly; agents operating within the system are subject to the spec's authority.

**Agent authority**: specific agents hold authority over their domains by virtue of their position within the locale.
The principal agent (the locale's governing agent) holds original authority; staff officers and duty officers hold derived authority within delegated scopes.
These are instances of rational-legal authority: the authority derives from formal position within the FARS charter, not from personal qualities.

**Authority and the INBOX protocol**: when one locale sends a message to another locale's INBOX, it is exercising soft authority — not a command, but a proposal that the receiving locale is expected to consider.
The authority of the message derives from the sending locale's recognized standing (its position in the locale network) and the content's grounding (ungrounded messages have no authority).
Grounded messages from well-positioned locales have high authority; ungrounded messages from poorly-positioned locales have low authority.
This is authority modulated by epistemic quality — a hybrid of rational-legal (position) and expertise-based (Raz's NJT).

## Nuclear reading

**Definitions.** The authority source $Q$ holds authority at $t$ when $Q \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$: $Q$ is doubly stable — settled by the accumulated past restriction profile ($\sigma_t$-fixed) and present in every one-step forward extension ($\Delta_t$-fixed). A directive $d \in H_t$ is *operative* when $d \in \mathrm{Fix}(\sigma_t)$: the restriction profile from all predecessor histories leaves nothing further to add. The recognition predicate $R$ corresponds to the covering condition in the Grothendieck topology $J$ specifying which acts of $Q$ open new covering sieves.

**Proposition 1 (Immutability of the nuclear structure):** No directive $d \in H_t$ issued by any agent at $t$ alters $\sigma_t$ or $\Delta_t$.

*Proof.* $\sigma_t$ is entirely determined by the restriction maps $H(i_{t_0,t}) : H_{t_0} \to H_t$ of the presheaf $H$ over $T$. These maps are morphisms in the site $(T, J)$, not in the write-scope of any element of $H_t$. Agent acts are elements of $H_t$; the presheaf morphisms are not. The same argument applies to $\Delta_t$, whose fixed-point set is the intersection of images of restriction maps from one-step independent extensions. □

*Consequence.* "Q applies $\sigma_t$ through $Q$'s position to advance $d$ into $\mathrm{Fix}(\sigma_t)$" is formally incorrect. No agent wields the nuclei. $\mathrm{Fix}(\sigma_t)$ is determined by the presheaf structure, not by any agent's act.

**Proposition 2 (Authority source = backward recognition):** $Q \in \mathrm{Fix}(\sigma_t)$ iff $Q$ is already at the maximum of its profile class: no strictly larger element of $H_t$ shares $Q$'s restriction profile to all $t_0 < t$.

*Proof.* By the profile-class characterization of $\sigma_t$: $\sigma_t(a) = \max\{b \in H_t \mid \rho_{t_0}(b) \leq \rho_{t_0}(a) \text{ for all } t_0 < t\}$ (relational-history-fiber-saturating-nucleus). So $\sigma_t(Q) = Q$ iff no $b > Q$ in $H_t$ has a restriction profile dominated by $Q$'s — $Q$ is the unique maximum of its profile class. □

**Proposition 3 (Contested authority is a strict saturation gap):** If $Q \notin \mathrm{Fix}(\sigma_t)$, then $\sigma_t(Q) > Q$ strictly. The saturation gap $[Q, \sigma_t(Q)]$ is non-trivial: the restriction profile demands a strictly larger position than $Q$ occupies.

*Proof.* By extensiveness of $\sigma_t$: $\sigma_t(Q) \geq Q$ always. By assumption $Q \neq \sigma_t(Q)$, so $\sigma_t(Q) > Q$ in the partial order of $H_t$. □

*Consequence.* The recognition predicate $R$ failing — contested authority — is witnessed directly by the fiber: the saturation gap $[Q, \sigma_t(Q)]$ is the evidence. An authority whose $\sigma_t$-gap is non-trivial is not yet normatively settled.

**Proposition 4 (Authority forward-commitment):** If $Q \in \mathrm{Fix}(\Delta_t)$ then for every step $s$ with $s \perp t$, there exists an element of $H_{s \star t}$ that restricts back to $Q$ under $H(i_{s,t})$.

*Proof.* $\mathrm{Fix}(\Delta_t) = \bigcap_{s \perp t} \mathrm{image}(H(i_{s,t}))$ by definition of the transferring nucleus (relational-history-fiber-transferring-nucleus). So $Q \in \mathrm{Fix}(\Delta_t)$ iff $Q$ lies in the image of every such restriction. □

*Consequence.* An authority in $H^*_t$ cannot be eroded by the passage of time alone: every possible extension of $t$ already contains $Q$. Authority not in $\mathrm{Fix}(\Delta_t)$ is not yet forward-committed — the transfer gap $[Q, \Delta_t(Q)]$ measures the remaining distance.

**Proposition 5 (Ultra vires is a topological condition, not a nuclear one):** A directive $d$ is ultra vires with respect to $(Q, S, R)$ when $d$ lies outside the domain of the covering families licensed by $R$ for $Q$ in the topology $J$. Applying $\sigma_t$ to an ultra vires directive does not legitimate it.

*Proof.* $\sigma_t$ is defined on all of $H_t$ and maps every element into $\mathrm{Fix}(\sigma_t)$ by extensiveness and idempotence. It is scope-blind: $\sigma_t(d) \in \mathrm{Fix}(\sigma_t)$ for any $d$, whether or not $d$ is within $S$. The determination of ultra vires is a topological condition ($d$ outside the domain governed by $J$ under $R$), not derivable by the nuclei alone. □

**On the authority/power distinction.** $Q \in H^*_t$ is the condition under which $Q$ holds a Hohfeldian Power in the second-quartet sense: the capacity to generate new normative relations by voluntary acts within $S$. The $H^*_t$-membership condition does not give $Q$ the ability to modify $\sigma_t$; it gives $Q$ the structural position such that $Q$'s acts within $S$ open new covering sieves in $J$, which in turn determine new elements of $\mathrm{Fix}(\sigma_{t'})$ at successor histories $t'$. Power without recognition ($Q \notin \mathrm{Fix}(\sigma_t)$) produces at most prudential pressure; no new covering sieve is constituted.

## Open questions

- Whether the three Weberian types (rational-legal, traditional, charismatic) have a formal characterization in terms of the recognition predicate $R$ — whether rational-legal corresponds to $R$ being derived from the constitutive rules of an institution, traditional from $R$ being derived from the history fiber's accumulated precedent, and charismatic from $R$ being a direct recognition that bypasses both.
- Whether Raz's Normal Justification Thesis has a fiber interpretation — whether "$X$ tracks reasons better by following $Q$" corresponds to some condition relating $Q$'s position in $H^*_t$ to $X$'s position, and whether the pre-emption thesis corresponds to the property that $Q$'s directives override $X$'s own saturation closure.
- Whether there is a formal difference between the authority of an *office* (rational-legal: the authority is in the office, not the person) and the authority of a *person* (traditional or charismatic: the authority is in the person, not the position) in the fiber structure — and whether this corresponds to the distinction between the office-elements in $H^*_t$ (global, persistent across succession) and person-elements (local, tied to the specific element).
- Whether **authority failure** (a legitimate authority that fails to serve its function — a corrupt court, a captured regulator) has a formal analog in the fiber — whether the authority source $Q$ can remain in a formal position of authority (in $H^*_t$ by position) while failing to track the underlying reasons that justified the authority (Raz's NJT no longer satisfied).
