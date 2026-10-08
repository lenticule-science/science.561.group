---
type: definition
class: closure-subsystem
status: draft
symbol: "\\mathcal{H}_e"
depends-on: [social-settling, social-base, social-position, structural-determination]
realizes: [social-position, structural-determination]
---

# Habitus closure

The closure-rule subsystem $\mathcal{H}_e \subseteq \mathcal{S}_{\mathrm{soc}}$ encoding the durable, transposable dispositions of a social agent $e$ — Bourdieu's *habitus* realized as a subset of the social settling's closure rules that are indexed to and activated by $e$.

Habitus, for Bourdieu, is the system of durable dispositions acquired through the agent's history of field position — dispositions that generate practices without conscious deliberation, that are transposable across fields, and that tend to reproduce the conditions of their production. Predicated sociology gives this a substrate-algebraic shape: habitus is not a mental state but a *closure-rule structure* that fires automatically when the agent encounters predicates matching its antecedent pattern.

## Data

The habitus closure $\mathcal{H}_e$ of agent $e$ is a triple

$$\mathcal{H}_e \;=\; (e,\; R_e,\; \mathrm{Hist}_e)$$

where:

- $e \in E_{\mathrm{soc}}$ — the agent whose habitus this is.
- $R_e \subseteq \mathcal{S}_{\mathrm{soc}}$ — the set of closure rules indexed to $e$: rules whose antecedent includes $e$ in the subject or object position and whose consequent fires action-predicate, affective-predicate, or relational-predicate cells on $e$. These are the *dispositional rules* — the specific pattern-response mappings that constitute $e$'s habitus.
- $\mathrm{Hist}_e$ — the evidential history: the ordered sequence of witnessing events that have fired on $e$'s predicate cells up to stage $\tau$. It is the sedimented positional history from which $R_e$ was generated: habitus is acquired, not innate.

## Habitus acquisition

$\mathcal{H}_e$ is not given at $v_0^{\mathrm{soc}}$. It is *acquired* through the social settling: as $e$ occupies positions in fields (as their positional cells settle), the social settling accumulates dispositional rules indexed to $e$. The acquisition mechanism is a meta-level closure rule:

$$v_\tau(\langle e, \texttt{occupies-field-position}, \pi\rangle) = \mathbf{t} \;\Longrightarrow\; \mathcal{H}_e \mathrel{+}= R_\pi$$

where $R_\pi$ is the set of dispositional rules associated with position $\pi$. Extended occupation of a position (high $\tau$-duration of the positional cell at $\mathbf{t}$) installs these rules more deeply — they become more strongly antecedented, requiring less evidence to fire.

This is the substrate-algebraic content of Bourdieu's claim that habitus is acquired through "prolonged sojourn in the field": the longer the occupancy, the more the field's rules become the agent's rules, the more deeply the dispositional rules are encoded.

## Transposability

Habitus is *transposable*: the dispositional rules acquired in one field fire in other fields when their antecedent pattern matches. Substrate-algebraically, a rule in $R_e$ acquired from the academic field fires when $e$ is in the artistic field, if the artistic field presents predicate patterns matching the rule's antecedent. Habitus does not require the agent to consciously reason about which field they are in — the rule fires when the pattern matches, wherever the pattern arises.

Transposability has a structural limit: some rules acquired in one field have antecedents that require that field's specific predicates. These rules do not transpose because their antecedents never match in other fields. The *degree of transposability* of $\mathcal{H}_e$ is the fraction of $R_e$ whose antecedent patterns recur across fields — the measure of how much of $e$'s habitus is field-general versus field-specific.

## Habitus and structural determination

The habitus closure is the mechanism of [structural determination](teaching/explanations/structural-determination.md) at the level of the individual agent. High structural determination at $e$ means $R_e$ is dense: most of $e$'s action-predicate cells have antecedents that are already settled by $e$'s positional profile, leaving little room for action cells to land anywhere other than where the rules direct. The agent's actions are determined not by external constraint but by the internal firing of their own acquired rules — this is Bourdieu's point that habitus makes social reproduction feel like freedom.

Low structural determination at $e$ — sparse $R_e$, or $R_e$ with many rules that fail to fire because $e$'s positional profile does not match their antecedents — produces an agent who is structurally *underdetermined*: their action cells have more degrees of freedom, more of their social trajectory is shaped by contingent witnessing events rather than by their accumulated dispositions.

## Hysteresis

Habitus closure exhibits *hysteresis*: the dispositional rules in $R_e$ were acquired in prior positional contexts and may misfire in the current context. Substrate-algebraically: $R_e$'s rules fire on the current settling's predicate patterns, but those patterns may differ from the patterns in which $R_e$ was acquired. The rules still fire — settlement-monotonicity guarantees that acquired rules remain acquired — but they fire on an environment they were not calibrated for. The result is $\top$ states on action-predicate cells: the habitus fires $\mathbf{t}$ on an action that the current field fires $\mathbf{f}$ on. Hysteresis is the substrate-algebraic structure of the *cleft habitus* — the agent out of place, whose dispositions misfire in the field they now occupy.
