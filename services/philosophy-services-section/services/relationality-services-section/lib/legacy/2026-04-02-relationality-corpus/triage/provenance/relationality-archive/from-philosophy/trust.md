---
name: trust
description: "Trust is a triple (T, E, D) — a truster, an entrusted party, and a domain of acts — where the truster accepts vulnerability to the entrusted party's choices within the domain. Distinct from mere reliance: trust requires the trusted party be capable of betrayal."
requires: [person, vulnerability, commitment]
enables: [delegation, authority]
produced-by: [assertion, promise]
contrasts-with: reliance
date-created: 2026-03-20
date-modified: 2026-03-20
---


## Formal definition

**Trust** is a triple $\mathcal{T} = (T, E, D)$:

$$\mathcal{T} = (T : \mathrm{Truster},\; E : \mathrm{Entrusted},\; D \subseteq \mathrm{ActDomain})$$

where:
- $T$ is the **truster** — the party who extends trust; $T$ accepts exposure to $E$'s choices within $D$, acting as if $E$'s commitments within $D$ were settled, despite having no guarantee
- $E$ is the **entrusted party** — the party who is trusted; $E$ must be capable of betrayal: capable of exploiting $T$'s vulnerability by choosing self-interest over $T$'s; an entity incapable of betrayal (a machine, a natural process) cannot be trusted — only relied upon
- $D$ is the **trust domain** — the domain of acts, commitments, or propositions over which trust is extended; trust is always bounded; "I trust you to do X" is different from "I trust you generally"; the domain specifies the scope

**Four invariants.** $\mathcal{T}$ is an instance of trust iff:

1. **Vulnerability accepted**: $T$ is exposed to harm that $E$ could cause by acting within $D$ in ways contrary to $T$'s interests. Trust without vulnerability is not trust — if $T$ cannot be harmed by $E$'s choices, $T$ is not trusting $E$ but merely expecting $E$'s behavior.

2. **Dependence on goodwill, not watchfulness**: $T$'s acceptance of exposure depends on $T$'s belief that $E$ is moved by genuine care for $T$'s interests (Baier's "goodwill"), not merely by $T$'s monitoring. If $T$'s security depends entirely on surveillance and enforcement, $T$ has not trusted $E$ — $T$ has controlled $E$. Trust exists in the gap between what can be controlled and what is nonetheless relied upon.

3. **Betrayal is possible**: $E$ must be capable of choosing to exploit $T$'s vulnerability. This requires that $E$ be the kind of entity that has reasons and makes choices. A broken promises by a rational agent is betrayal; a vending machine that fails to deliver is malfunction. The difference is the presence of intentional agency in $E$.

4. **Third-order structure**: trust is not merely a belief about $E$'s reliability (first-order: "E will do X"). It involves a belief about $E$'s motivations (second-order: "E is moved by the right reasons within D"). And it involves T's willingness to act on this belief despite uncertainty (third-order: T's acceptance of vulnerability). Baier's formulation: "A trusts B with valued thing C" iff A has the *correct attitude* toward B — an attitude that involves reliance but is more: caring about B's reasons.

## Trust vs. reliance

The canonical distinction (Annette Baier, "Trust and Antitrust," 1986):

| | Reliance | Trust |
|---|---|---|
| Object | System, mechanism, physical regularity | Agent with reasons, person |
| Basis | Causal regularity | Goodwill, motivation |
| Betrayal possible? | No — only malfunction | Yes — deliberate choice |
| Vulnerability? | To mechanical failure | To the trusted party's will |
| Reactive attitude on failure | Disappointment, frustration | Betrayal, indignation (a moral emotion) |

**The vending machine case**: you rely on the vending machine to deliver your snack when you insert coins. If it fails, you're frustrated and you want your money back. You do not feel *betrayed* by the vending machine because betrayal requires intentional agency. The vending machine is not capable of choosing to exploit your vulnerability.

**The contractor case**: you rely on a contractor to complete your renovation. If the work is poor, you can seek damages for breach of contract. But have you *trusted* the contractor? Possibly not — if the contract specified every deliverable with enforcement mechanisms, you controlled rather than trusted. Trust begins where control ends.

**The employee case**: a manager who micromanages every decision does not trust their team — they control it. Trust involves delegating without requiring continuous evidence of good faith. The manager who sends emails asking "did you do this?" every hour has not trusted their reports; they have outsourced their anxiety. The manager who assigns work and allows the team to proceed has extended trust.

## Baier's analysis: the entrusting of a valued thing

Baier's formal structure of trust: "A trusts B with valued thing C." The valued thing $C$ may be:
- Material goods (money, property in a custodian's care)
- Personal welfare (health in a doctor's care)
- Information (confidences, secrets)
- One's reputation (in the hands of someone who can influence it)
- One's children (in the hands of a teacher, guardian, or authority)

The three-place structure: trust is not binary (A trusts B) but triadic (A trusts B with C). You can trust someone with your money and not with your children; you can trust someone with your children and not with your money. The domain $D$ specifies what is entrusted.

**The asymmetry of trust**: it is easier to destroy trust than to build it. A single betrayal can dissolve years of trust-building; trust requires consistent trustworthy behavior over time but can be destroyed by a single violation. This asymmetry follows from the vulnerability structure: trust is built by evidence that $E$ is moved by the right reasons; trust is destroyed by evidence that $E$ is not — and a single act of betrayal is conclusive evidence that $E$'s motivation was not what $T$ believed.

## The trust game: game-theoretic foundations

The **trust game** (Berg, Dickhaut, McCabe, 1995) is the canonical experimental paradigm for studying trust:

1. Player 1 (the Investor, $T$) receives endowment $$10$
2. Player 1 sends amount $x \in [0, 10]$ to Player 2
3. $x$ is tripled: Player 2 receives $3x$
4. Player 2 (the Trustee, $E$) returns amount $y \in [0, 3x]$ to Player 1
5. Player 1 keeps $(10 - x) + y$; Player 2 keeps $3x - y$

In the standard backward induction analysis: Player 2 will return $y = 0$ (no incentive to return anything); therefore Player 1 will send $x = 0$. Both end with $$10$.

Empirically: investors send substantial amounts (average ~$5); trustees return ~50% on average. The game produces Pareto-superior outcomes when both parties cooperate — but cooperation requires trust (Player 1 accepting vulnerability) and trustworthiness (Player 2 choosing to return despite no enforcement).

The trust game reveals: **trust is the willingness to accept exposure for potential mutual gain**. The investor who sends $x > 0$ is betting that the trustee's goodwill (or reputation concerns) will lead to $y \geq x$ — a return that makes the investment worthwhile. The bet may fail (the trustee keeps everything), but without the bet, the mutual gain is impossible.

**Reputation and repeated games**: in one-shot trust games, trust is harder to sustain. In repeated interactions, reputation is the mechanism that sustains trust: a trustee who betrays loses the ability to attract investors in future rounds. Reputation is the shadow of the future — the mechanism that makes trustworthiness rational even without monitoring.

## Cognitive foundations: Lewis and predictive trust

In Lewis's convention-theoretic framework (*Convention*, 1969), trust is grounded in **predictive expectations**: A trusts B to do X iff A has a rational expectation that B will do X because B knows that A expects it, and B has sufficient reason to fulfill the expectation. This is **predictive trust** — trust grounded in the reliability of expectations under mutual knowledge.

Predictive trust is weaker than Baier's goodwill trust: it does not require that B be moved by care for A's interests, only that B be reliably predictable in the relevant domain. Convention-based cooperation works through predictive trust: drivers trust other drivers to stay in their lane not because of goodwill but because it is predictable, mutually known, and rational for each driver given others' expected behavior.

The Lewis framework is insufficient for the strongest cases of trust (fiduciary relationships, intimate relationships) where predictive reliability is not enough — you want the trustee to be moved by the right reasons, not merely to behave correctly when monitored or when it happens to be convenient.

## Fiduciary trust and the legal superstructure

When trust is institutionally recognized and formalized, it generates Fiduciary obligations. The fiduciary relation is the strongest legal form of the trust triple:

- $T$ (the principal or beneficiary) entrusts $E$ (the fiduciary) with a critical resource
- The trust domain $D$ = the scope of the fiduciary's discretion over the resource
- $E$'s vulnerability exposure = the asymmetry between fiduciary's knowledge/power and beneficiary's ability to monitor

The law intervenes because the trust structure is inherently asymmetric: the fiduciary has information and power that the beneficiary cannot fully check. The law's response is to impose the highest duty of loyalty — no conflict of interest, no undisclosed profit — because the legal standard substitutes for the goodwill that trust requires. The legal fiduciary duty is the institutional enforcement of the trust condition: $E$ must act as if moved by $T$'s interests because the law prohibits acting otherwise.

**The fiduciary trust chain**: every institutional hierarchy generates a chain of trust relations:
- Citizens trust the state to exercise powers in their interests (the social contract reading)
- Shareholders trust directors to run the corporation for their benefit (corporate law fiduciary duty)
- Clients trust lawyers to act in their interests and maintain confidences (professional fiduciary duty)
- Crew trusts the captain to exercise command for their safety and the voyage's success (maritime duty of care)

Each link in the chain is a trust triple where the law imposes formal obligations when the informal goodwill condition cannot be verified.

## Nuclear reading

**Sources:** Saturation Nucleus, Transfer Nucleus, Meet Preservation, Idempotence, Commutation.

**Definition (Trust gap).** Let $P$ be the truster and $Q$ be the entrusted party with associated fiber sub-algebras $H^P_t$ and $H^Q_t$ at history $t$. The *trust gap for $Q$ at $t$* is the set $\mathrm{Fix}(\sigma_t) \setminus \mathrm{Fix}(\Delta_t)$ within $Q$'s proposition space: the meaning-settled but execution-unsettled zone. Trust is $P$'s willingness to act on propositions in this zone — $Q$'s acknowledged commitments — as if they were already in $H^{Q*}_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$.

**Definition (Accountability proposition).** The truster $P$'s *accountability proposition* at $t$ is a proposition $\alpha \in H^{P*}_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$: $P$'s exposure to $Q$'s choices is both meaning-settled (the normative system recognizes $P$'s vulnerability) and forward-active ($\alpha$ persists in every extension until the trust is discharged or betrayed).

**Proposition (Truster's vulnerability is not delegated away by restriction maps).** Let $\alpha \in H^{P*}_t$ be the accountability proposition. Let $s \perp t$ be a concurrent history and let $H(i_{s,t}) : H_{s \star t} \to H_t$ be the restriction map. It is not the case in general that $H(i_{s,t})(\alpha) \in H^{P*}_s$; that is, $\alpha \in \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ does not imply $H(i_{s,t})(\alpha) \in \mathrm{Fix}(\sigma_s) \cap \mathrm{Fix}(\Delta_s)$.

*Proof.* The restriction map $H(i_{s,t})$ is a Heyting algebra morphism from $H_{s \star t}$ to $H_t$. Fixed-fiber membership in $H_t$ means $\sigma_t(\alpha) = \alpha$ and $\Delta_t(\alpha) = \alpha$. However, $\sigma_s$ and $\Delta_s$ are the nuclei of $H_s$, determined by the restriction profiles and extension data of $H_s$, which are in general different from those of $H_t$. There is no axiom that states restriction maps preserve nucleus-fixed-point membership across different fibers. Hence $\alpha \in H^{P*}_t$ does not imply $H(i_{s,t})(\alpha) \in H^{P*}_s$. $\square$

**Corollary (Vulnerability cannot be transferred out of the truster's fiber).** Because the restriction map does not in general preserve fixed-fiber membership, delegation — $P$ delegating a task to $Q$ over domain $D$ — does not remove $\alpha$ from $H^{P*}_t$. The truster's accountability proposition remains doubly settled in $P$'s fiber at $t$ even after delegation. This is the formal content of "trust is irreducibly the truster's exposure": $P$ cannot offload $\alpha$ to $Q$'s fiber by a sheaf-theoretic restriction operation.

**Proposition (Conjunction of trust domains is a trust domain).** If $e_1, e_2 \in \mathrm{Fix}(\sigma_t) \setminus \mathrm{Fix}(\Delta_t)$ are two trusted propositions (meaning-settled commitments by $Q$, not yet execution-settled), then $e_1 \wedge e_2 \in \mathrm{Fix}(\sigma_t)$.

*Proof.* By meet-preservation of $\sigma_t$ (Meet Preservation): $\sigma_t(e_1 \wedge e_2) = \sigma_t(e_1) \wedge \sigma_t(e_2) = e_1 \wedge e_2$. $\square$

**Remark.** The meet $e_1 \wedge e_2$ is $\sigma_t$-fixed but not necessarily $\Delta_t$-fixed (since $e_1, e_2 \notin \mathrm{Fix}(\Delta_t)$). Meet-preservation of $\Delta_t$ would give $\Delta_t(e_1 \wedge e_2) = \Delta_t(e_1) \wedge \Delta_t(e_2)$, but since $\Delta_t(e_i) \neq e_i$, this does not simplify to $e_1 \wedge e_2$. So the conjunction of two trusted-but-unexecuted commitments is itself meaning-settled but not yet execution-settled — still in the trust gap. This is correct: the conjunction "$Q$ will do $A$ and $Q$ will do $B$" is a normatively acknowledged joint commitment that has not yet been carried forward.

**Non-derivability note.** Whether a specific $Q$ will bring $e \in \mathrm{Fix}(\sigma_t) \setminus \mathrm{Fix}(\Delta_t)$ to $\mathrm{Fix}(\Delta_t)$ — i.e., whether $Q$ is trustworthy — is not derivable from the nuclear axioms. The axioms characterize the structure of the nuclei; they make no assertion about which agents produce which future-fiber inclusions. Trustworthiness requires facts about $Q$'s behavior across histories that go beyond the axiomatic structure.

## Quasicrystal hull reading: regularization, pattern-equivariance, and ergodic consistency

**Source:** Hyperversal Quasicrystal Hull Nucleus Pair.

At tower levels $R^{(n)}$, the two nuclei act on finite fiber Heyting algebras. At the hyperversal quasicrystal hull $\mathbf{Sh}(\Omega(Q^\mathcal{H}))$, the fiber stalks are infinite coherent Heyting algebras of germs, and both nuclei acquire a topological–dynamical reading:

| Level | Saturation nucleus | Transfer nucleus | Source |
|---|---|---|---|
| $R^{(n)}$ | Sub-history restriction closure | Extension-witness meet | Independence relation |
| $\mathcal{H}$ | Identity | Identity | Modal collapse |
| $\mathbf{Sh}(\Omega(Q^\mathcal{H}))$ | Regularization (interior of closure) | Pattern-equivariant projection | Topology of orbit closure |

**Proposition (Saturation at the hull = regularization of trust commitments).** At the hyperversal quasicrystal hull level, the RelationalHistoryFiberSaturatingNucleus acts on each coherent stalk as the regularization operator: a trust commitment $a$ satisfies RelationalHistoryFiberSaturatingNucleus($a$) $= a$ iff $a$ equals the interior of its closure as an open germ. Commitments that do not survive regularization — thin commitments that vanish when their boundary is removed — are not meaning-settled at this level. A trust relationship grounded only in such thin commitments is structurally precarious: there is no regular open region of behavioral evidence backing it.

*Source.* By Hyperversal Quasicrystal Hull Nucleus Pair §Construction: $\sigma^\Omega_P(a) = \mathrm{int}(\mathrm{cl}(a))$ and $\mathrm{Fix}(\sigma^\Omega_P)$ = regular open germs. The metrizability of $\Omega(Q^\mathcal{H})$ ensures the regularization argument holds. $\square$

**Proposition (Transfer at the hull = pattern-class trust).** At the hyperversal quasicrystal hull level, the RelationalHistoryFiberTransferringNucleus acts as the pattern-equivariant projection: a commitment $a$ is transfer-stable iff it depends only on the local behavioral pattern of the entrusted party at the current patch, not on the specific position of that patch within the full quasicrystal history. Operationally: *pattern-class trust* — trusting every party who instantiates behavioral type $P$ — is transfer-stable; *specific-party trust* — trusting this particular party at this particular history — may fail to be transfer-active if the party's behavior varies across pattern-equivalent histories. The aperiodicity of the quasicrystal hull is what makes this distinction non-trivial: unlike periodic settings, there is no guarantee that a germ well-defined at one occurrence of a local pattern is present at every other occurrence.

*Source.* $\mathrm{Fix}(\Delta^\Omega_P) = \bigcap_{x \notin P} \mathrm{image}(H^\Omega_{P \cup \{x\}} \to H^\Omega_P)$ by Hyperversal Quasicrystal Hull Nucleus Pair §Construction. Aperiodicity of $Q^\mathcal{H}$ makes $\Delta^\Omega \neq \mathrm{id}$ non-trivially. $\square$

**Proposition (Nuclear commutativity = unique ergodicity of the trustee).** The RelationalHistoryFiberSaturatingNucleus and RelationalHistoryFiberTransferringNucleus commute on the coherent stalk — meaning-recognition commutes with behavioral-pattern stabilization — iff the trusted party is uniquely ergodic: their behavior has a unique invariant measure across all contexts in which the same local pattern appears. A trustee who behaves differently in structurally equivalent contexts (high-stakes vs. low-stakes, monitored vs. unmonitored, in-group vs. out-group) breaks unique ergodicity, breaks nuclear commutativity, and makes the path-order of the two nuclear operations matter: applying regularization before pattern-equivariant projection gives a different result than applying them in reverse.

*Operationally*: whether we first ask "is this commitment meaning-settled?" and then "does it depend only on behavioral pattern?" gives a different trust assessment than asking those questions in the other order — unless the trustee is uniquely ergodic. The unique-ergodicity condition is thus the formal content of consistent trustworthiness across contexts: not merely that the trustee behaves well in any one context, but that the topology of their behavioral commitments admits a unique invariant description.

*Source.* Nuclear commutativity conditional on unique ergodicity of $(\Omega(Q^\mathcal{H}), \Phi)$ by Hyperversal Quasicrystal Hull Nucleus Pair §Commutativity Status. $\square$

## Open questions

- Whether Baier's goodwill condition has a formal fiber representation — whether "E is moved by T's interests" corresponds to some constraint on the path from $t$ to $t'$ that E's actions must satisfy; and whether the absence of goodwill corresponds to E's action selecting a path that benefits E at T's expense (choosing $\mathrm{Fix}(\Delta_{t'})$ for E's own commitments while leaving T's entrusted propositions outside $\mathrm{Fix}(\Delta_{t'})$).
- Whether trust can be graded (partial trust) in the fiber structure — whether "T trusts E to degree $r$" corresponds to T treating $E$'s propositions as having a weight $r \in [0,1]$ in the saturation closure, rather than full fixed-point status.
- Whether the reputation mechanism in repeated trust games corresponds to history accumulation: a trustee's reputation is the accumulated fiber evidence across histories that the trustee's commitments reach $H^*_{t'}$; a long history of followed-through commitments is the justification for credit extension in future dealings.
- Whether the structural difference between predictive trust (Lewis) and goodwill trust (Baier) maps onto the distinction between $\mathrm{Fix}(\Delta_t)$-based expectations (empirical, predictive) and $\mathrm{Fix}(\sigma_t)$-based obligations (normative, goodwill) — connecting to the Bicchieri two-tier social norm analysis.
