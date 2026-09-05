---
name: "Authority"
description: "Authority is the capacity to create, alter, or extinguish normative relations — to make things count as obligatory, permitted, or prohibited within a scope."
enables: [office, duty, delegation, charter, institution, normative-system]
contrasts-with: [influence, competence, power, coercion]
date-created: 2026-04-03
references:
  weber1922:
    authors: ["Max Weber"]
    title: "Economy and Society"
    publication: "Wirtschaft und Gesellschaft"
    year: 1922
  raz1986:
    authors: ["Joseph Raz"]
    title: "The Morality of Freedom"
    publication: "Oxford University Press"
    year: 1986
  hohfeld1913:
    authors: ["Wesley Newcomb Hohfeld"]
    title: "Some Fundamental Legal Conceptions as Applied in Judicial Reasoning"
    publication: "Yale Law Journal"
    year: 1913
  searle2010:
    authors: ["John Searle"]
    title: "Making the Social World: The Structure of Human Civilization"
    publication: "Oxford University Press"
    year: 2010
  arendt1961:
    authors: ["Hannah Arendt"]
    title: "Between Past and Future: Six Exercises in Political Thought"
    publication: "Viking Press"
    year: 1961
---

## Formal definition

**Authority** is the normative capacity $\mathbf{A}(a, R \to R', s) : \text{Scope}$ possessed by an agent $a$ to perform a deontic act $(R \to R')$ within scope $s$, such that the act generates new normative relations binding on other agents $b$ within $s$ independently of their consent or agreement.

More precisely: agent $a$ holds **authority over scope $s$** iff there exists a set of acts $\Phi_a$ such that:

1. For any act $\varphi \in \Phi_a$ performed by $a$,
2. The performance $\varphi(a)$ generates or modifies a [Norm](./norm.md) $\mathcal{N} = (\varphi', O, N)$,
3. And every agent $b$ in $s$ is bound by $\mathcal{N}$ regardless of whether they endorse $\varphi(a)$.

This is the Hohfeldian **power** — the second-quartet position that stands in correlative opposition to **liability**. Authority is not a right to act without constraint (that is a [privilege](../domains/hohfeldian/terms/hohfeldian-position.md)). It is the capacity to alter the normative position of others: to impose duties, confer powers, or prohibit actions such that violation generates deficiency or sanction.

## Three traditions

### Weber: Legitimate authority and the three types

Max Weber (*Economy and Society*, 1922) identifies authority as the capacity to impose orders on a population such that those orders are obeyed **not merely from fear or self-interest but from the belief that obedience is obligatory**.

This is the central claim: **authority requires legitimacy**. A person with a gun can compel obedience; an authority commands obedience. The difference is not in the mechanisms of enforcement but in the normative standing of the command. Weber distinguishes three types:

**Traditional authority**: the order is obeyed because "it has always been done this way." Authority derives from custom, heredity, or sanctified tradition. Succession is by inheritance or recognized precedent. The scope of authority is defined by what the tradition permits. A traditional authority cannot simply invent new commands; they must act within the tradition or lose their claim to legitimacy.

**Charismatic authority**: the order is obeyed because the authority figure is believed to embody exceptional qualities — wisdom, holiness, heroic vision. Succession is by designation (the charismatic figure names a successor) or by the emergence of a new charismatic figure. Charismatic authority is inherently unstable: when the charismatic figure dies or fails to live up to the extraordinary claims, legitimacy collapses. The institutionalization of charisma into routinized forms (converting it to traditional or rational-legal authority) is the mechanism by which charismatic movements become stable.

**Rational-legal authority**: the order is obeyed because it is issued by an officeholder acting within codified rules and procedures. Authority is vested not in a person but in the [office](../../../terms/office.md). The scope and limits of the authority are written down; succession is procedural. A rational-legal authority cannot act outside the rules because doing so is a violation of the very form of authority they claim to hold — it is an act of usurpation, not a lawful command.

Weber's insight: these three types exhaust the ways legitimacy can be sustained. Authority without legitimacy (pure force) is not authority but coercion.

### Raz: Authority as justified surrogacy

Joseph Raz (*The Morality of Freedom*, 1986) reframes authority in terms of the "normal justification thesis" and the "service conception."

**The service conception**: authority is justified when following the authority's directives better serves the reasons that already apply to the subject than the subject acting on their own judgment.

A doctor has authority over medical questions not because medicine is a mysterious realm open only to the initiated, but because (1) there are reasons to be healthy, (2) following medical advice is an effective way to be healthy, and (3) most people lack the time, training, or reliable judgment to diagnose and treat themselves. The doctor is a **surrogate** for the practical reasoning the patient would do if they were adequately informed and rational.

**The normal justification thesis**: Authority is not justified whenever subjects would obey (as in Weber's legitimacy condition), but only when the authority's directives actually serve the subject's own reasons better than the subject's independent judgment would.

This has a radical consequence: if a subject has strong relevant knowledge or moral conviction, the authority has no justification over them on that specific matter. A master chess player has no reason to follow a beginner's instructions on chess. A whistleblower with decisive evidence that the authority is acting corruptly has reason to expose the corruption, not follow the authority blindly.

Authority is thus always *conditional* on the authority actually serving the relevant subject. It is not an unconditional relationship.

### Hohfeld: Authority as the power position

Wesley Newcomb Hohfeld (*Some Fundamental Legal Conceptions as Applied in Judicial Reasoning*, 1913) identifies authority as occupying the **power** position in his schema of jural relations:

| Hohfeldian position | Holder's jural situation | Correlative | Opposite | Correlative opposite |
|---|---|---|---|---|
| Duty | Must φ | Claim (correlative) | Privilege | No-claim (opposite of correlative) |
| **Power** | **Can alter R** | **Liability** | Disability | Immunity |

A person with **authority** holds a **power** — the normative capacity to alter the jural position of another. The correlative of power is **liability**: the subject has their jural relations altered by the authority's act, regardless of consent.

If $a$ has authority over $b$ and $a$ declares "$b$ has a duty to φ," then:
- $a$ holds the power (the capacity to generate duties)
- $b$ holds the liability (the capacity to have a duty imposed)
- A third party $c$ who lacks this authority over $b$ holds a disability relative to $b$ — they cannot impose duties on $b$ in the same way
- If $a$ is *immune* from $b$'s power to alter $a$'s position, then $b$ has a disability relative to $a$

Authority is thus always a *relational* concept in Hohfeld's system. $a$ has authority *over* $b$ *on* $\varphi$ means $a$ can alter $b$'s normative relation to $\varphi$ and $b$ is liable to have that relation altered.

This connects directly to the [duty](./duty.md) spec: a duty $D(a, p, N, \varphi, r)$ is an instantiation of a norm that exists because some authority has the power to impose or maintain norms in the system $N$. The authority is not named in the duty; it is presupposed in the existence of the normative system itself.

### Searle: Authority as the capacity to create status functions

John Searle (*Making the Social World*, 2010) identifies authority as the ability to perform **status-function declarations** — speech acts of the form "X counts as Y in context C" that bring institutional facts into existence.

A judge declares "the defendant is guilty as charged" — not a statement of fact about the defendant's internal state, but a performative act that changes the defendant's institutional status and the obligations binding on the state. This is a **constitutive power**: the act does not describe the new status; it creates it.

Authority is the standing to perform such acts. Not everyone can declare someone guilty; only a judge (or authorized official) can. The [charter](./charter.md) of a court specifies who holds the authority to issue guilty verdicts, what procedures they must follow, and what scope their declarations cover.

This connects to the [institution](./institution.md) spec: the constitutive rule set $\text{CR}$ — the rules of the form "X counts as Y in context C" — exists because some authority or authorities hold the power to declare institutional facts. The [status-function-declaration](./status-function-declaration.md) is the formal mechanism; authority is the standing to perform it.

### Arendt: Authority distinguished from persuasion and coercion

Hannah Arendt (*Between Past and Future*, 1961) makes a phenomenological distinction that often goes unnoticed:

Authority is **neither persuasion nor coercion**. 

**Persuasion** treats the other as an equal — you offer reasons and the other may accept or reject them on the strength of those reasons. Persuasion requires the other's judgment; it is always tentative.

**Coercion** uses force or the threat of force. The other's volition is overcome; they obey because they have no choice.

**Authority** requires obedience *without argument* and *without force*. You follow the authority's directive because you recognize their standing to issue it. This recognition is *prior* to any rational assessment of whether the command is wise — if you must evaluate the command rationally before obeying, you have already denied their authority and moved into the realm of persuasion or coercion.

**The crisis of authority:** When an authority must *explain itself* (turning to persuasion) or *enforce itself* (turning to coercion), it has already failed. The very need for justification or enforcement signals the loss of authority. This explains why authoritarian systems simultaneously claim absolute authority and must be constantly vigilant about enforcement — they lack genuine authority and must substitute coercion.

## The scope of authority

Authority is always **scope-bound**. No authority is unlimited; every authority has a domain within which its directives are binding and a boundary beyond which it has no force.

**Formal scopes:**
- **Positional scope**: the office determines who is bound. A teacher has authority over students in the classroom; a doctor has authority over patients. The scope is defined by the relational standing.
- **Substantive scope**: the authority is limited to certain kinds of acts or decisions. A judge has authority over questions of law and sentencing; a doctor has authority over medical questions. A general has authority over military operations; this authority does not extend to declaring new laws.
- **Territorial or jurisdictional scope**: the authority is limited by geography, organization, or institution. A city council has authority within city limits; a corporation's board has authority within the corporation.
- **Temporal scope**: authority may be temporary. A charter may grant provisional authority pending demonstration of capacity.

These scopes are not natural facts; they are normative creations. Authority *exists* as bounded because the [normative system](./normative-system.md) that grants the authority specifies its bounds.

## Authority and adjacent concepts

**Authority vs. Power (in the Weberian sense).** Power is the ability to achieve an outcome against resistance. Authority is a specific kind of power — the normative capacity to alter relations such that obedience is seen as obligatory. A dictator with an army may have vast power but lack authority if subjects obey only from fear. A constitutional judge may have narrow power (the ability to enforce a judgment) but significant authority (the standing to issue binding interpretations of law).

**Authority vs. Influence.** Influence is the ability to shape another's choices without eliminating their autonomy. You influence someone by presenting information, appealing to values, or modeling behavior. Influence works through the subject's judgment; they remain free to reject it. Authority operates *over* judgment — obedience is expected regardless of private disagreement.

**Authority vs. Competence or Expertise.** A subject may defer to someone's competence — following their advice because they are knowledgeable — without acknowledging authority. The distinction: competence must persuade; authority commands. A master programmer can decline the program manager's request on technical grounds and the manager cannot override that judgment. But if the manager issues an order "rewrite the program in Rust," the programmer may object but ultimately must obey or face employment consequences. The order is backed by authority; the technical advice rests on competence.

**Authority vs. Coercion.** Coercion uses force or the threat of force to compel obedience. Authority does not require coercion; it operates through the subject's recognition of the authority's standing. If an authority must constantly threaten force to maintain compliance, the authority has eroded.

## Authority as constitutive

Authority is what makes a [normative system](./normative-system.md) binding on those within its scope. Without authority, a set of norms is merely a recommendation or a prediction of what will happen. With authority, the norms become binding — their violation counts as deficiency, wrongdoing, or insubordination.

A [norm](./norm.md) $\mathcal{N} = (\varphi, O, N)$ is operative in the system $N$ because there is an authority that holds the power to declare and maintain norms in $N$. The authority need not be named in every instance; it is presupposed in the existence of $N$.

An [office](../../../terms/office.md) exists because an authority — typically the founding authority that issues the [charter](./charter.md) — has declared the position. An [institution](./institution.md) operates because agents collectively recognize the authority of the constitutive rules, and this recognition is sustained by the institutional authorities designated in the founding [charter](./charter.md).

A [duty](./duty.md) binds an agent because the authority that grounds the [normative system](./normative-system.md) has the power to impose duties. The duty does not exist as a brute fact; it is a relational fact created by authority.

## Authority, legitimacy, and the hard problem

The hardest question in political theory is: *Why does anyone ever obey?*

Weber's answer is that authority requires legitimacy — agents must believe that obedience is obligatory, not merely strategically rational. But this is a sociological fact about belief, not a justification for authority.

Raz's answer is that authority is justified when it serves the subject's own reasons — when the subject has grounds to believe that following the authority is more reliable than acting on their own judgment. But this means authority is conditional on its actually being beneficial, and subjects could in principle verify this claim before obeying.

Arendt's answer is that authority is sui generis — a form of power distinct from both force and persuasion — and that its loss in the modern age is a genuine crisis requiring reconstruction, not rational justification.

The repository's approach is to treat authority as *constitutive*: authority is what makes normative relations possible. Once authority is in place, all derivative relations (duty, office, position, privilege) become possible. But the grounding of authority itself — why anyone recognizes any authority — is a fact about the stability conditions of social systems, not a deduction from first principles.

The practical answer is empirical: a community recognizes authority when (1) the authority acts within a tradition the community honors, or (2) the authority is believed to possess special qualities or wisdom, or (3) the authority operates through explicit rules the community has accepted, or (4) the authority structures material life such that non-compliance is costly. Most stable systems use all four.

## Open questions

- Whether authority can be *delegated* — whether an authority can grant part of their power to another agent and lose it themselves, or whether authority is inalienable and delegation is always conditional on the original authority's ratification.
- Whether the Hohfeldian power-liability correlate fully captures authority or whether authority requires an additional component — standing, which is a property of the authority-holder independent of the act of exercising power.
- Whether Weber's three legitimacy types are exhaustive or whether post-modern organizations operate on a fourth type — *procedural* legitimacy, where agents obey because the process for making decisions is fair, regardless of the substantive outcomes.
- Whether Arendt's claim that authority requires recognition without argument is compatible with the modern proliferation of written rules and explicit codification — whether rational-legal authority in Weber's sense truly operates without argument, or whether the written rules constitute an ongoing argument about what authority should do.
- Whether the scope-boundedness of authority is a logical feature (authority is necessarily bounded) or merely a practical constraint (authority can be bounded but need not be).

## See also

- [Authority (anarchist critique)](./authority.md) — the opposing principle; anarchism's rejection of the claim to command and be obeyed
- [Office](../../../terms/office.md) — the position that carries authority
- [Duty](./duty.md) — the normative relation that authority creates
- [Norm](./norm.md) — the prescriptive content that authority makes binding
- [Charter](./charter.md) — the founding act that establishes an authority's scope
- [Institution](./institution.md) — the system that constitutes and recognizes authority
- [Hohfeldian Position](../domains/hohfeldian/terms/hohfeldian-position.md) — the jural structure of which authority is the power position
