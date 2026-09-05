---
id: citation
description: "A Citation is a four-tuple (C, W, L, ρ) — a citing claim C ∈ H_t, a cited work W ∈ H*_{τ_W} (a settled record committed at τ_W < t), a locus L specifying the specific element within W, and a grounding relation type ρ ∈ {quotation, paraphrase, reference, see-also} specifying how L supports C. The defining structure: C is grounded in W at L via ρ. A citation is a speech act that simultaneously asserts (C is supported by W), acknowledges (priority to W's author), locates (C within the network containing W), and makes transparent (the reader can verify). The citation graph must be a DAG — the grounding relation is acyclic. Citogenesis introduces a directed cycle: C is grounded in W which derived from C, satisfying the syntactic form of grounding while providing zero epistemic support."
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  citing-claim: relational-universe
  cited-work: relational-history-fiber-fixed-layer
  locus: relational-universe
  grounding-relation: relational-universe-morphism
output: relational-universe-morphism
ast:
  grounding-relation:
    - citing-claim:
        - locus
    - cited-work:
        - locus
---

# Citation

## Formal definition

A **Citation** is a four-tuple $\mathcal{C} = (C, W, L, \rho)$:

$$\mathcal{C} = (C \in H_t,\; W \in H^*_{\tau_W},\; L \subseteq W,\; \rho \in \{\mathrm{quot}, \mathrm{par}, \mathrm{ref}, \mathrm{see}\})$$

where:
- $C$ is the **citing claim** — the proposition in the current fiber that the citation is designed to ground; $C \in H_t$ is present in the fiber but may not be in $H^*_t$ (may not yet be meaning-settled); the citation is the act that moves $C$ toward $H^*_t$ by connecting it to the settled record $W$
- $W$ is the **cited work** — a committed, persistent record: $W \in H^*_{\tau_W}$, meaning $W$ is fully settled at the time of its publication $\tau_W$; $W$ is a [Record](./record.md) triple $(K_W, V_W, \tau_W)$ — key (author, title, venue, year), value (content), and history marker (publication date); the requirement $W \in H^*_{\tau_W}$ captures the commitment of scholarly publication: the work is meaning-settled and execution-settled at its publication point
- $L$ is the **locus** — the specific element within $W$ at which the supporting content resides; $L \subseteq V_W$ (a sub-element of the cited work's content); $L$ is what narrows the citation from "W supports C" to "this specific part of W supports C"; without $L$, the citation is too vague to be verified
- $\rho$ is the **grounding relation type** — how $L$ supports $C$:
  - **Quotation** ($\rho = \mathrm{quot}$): $L$ is reproduced verbatim in $C$; strongest support; $L$ appears as a sub-element of $C$'s content
  - **Paraphrase** ($\rho = \mathrm{par}$): $C$ reproduces the ideas of $L$ in different words; strong support; the propositional content is preserved
  - **Reference** ($\rho = \mathrm{ref}$): $W$ establishes the claim $C$ makes; $C$ attributes the claim to $W$ without reproducing content; medium support
  - **See-also** ($\rho = \mathrm{see}$): $W$ is related but does not directly establish $C$; weak support; associative rather than evidentiary

**The grounding claim**: $C$ is grounded in $W$ at $L$ via $\rho$. The citation is **valid** iff $L$ actually supports $C$ via the stated $\rho$ — the cited locus genuinely provides the stated kind of support for the citing claim.

## Citation as four speech acts simultaneously

Using Austin's performative speech act analysis:

1. **Assertive**: "this claim $C$ is supported by evidence at $W$:$L$" — the citation constitutes an assertion of the grounding relation between $C$ and $W$; it claims that $C$ is epistemically connected to $W$

2. **Expressive/Acknowledging**: crediting $W$'s author with priority — "this idea/finding originates with the author of $W$, not with me"; the citation performs the act of intellectual acknowledgment; without citation, one appropriates the credited idea without acknowledgment (plagiarism)

3. **Locating**: placing $C$ within the discourse network that contains $W$ — "this paper is in conversation with $W$ and its intellectual neighbors"; citation creates the network structure of scholarship

4. **Transparency-providing**: enabling verification — "the reader can check $W$:$L$ to confirm that $C$ is supported"; citation makes knowledge claims intersubjectively accessible; it is the mechanism by which private knowledge becomes public, verifiable knowledge

The fourth function is the epistemically fundamental one: without citation, knowledge claims are opaque. With citation, they are in principle verifiable by anyone with access to $W$.

## The citation graph must be a DAG

A valid citation network is a **directed acyclic graph** (DAG): $C_1 \to W_1, C_2 \to W_2, \ldots$ where $\to$ denotes "is grounded in" and there are no directed cycles. The acyclicity condition formalizes the requirement that grounding must be non-circular:

**Temporal acyclicity**: $\tau_W < t$ — the cited work must have been committed ($W \in H^*_{\tau_W}$) before the citing claim was made ($C \in H_t$ at $t > \tau_W$). An author cannot cite a work published after their own; the time ordering of the history monoid enforces partial acyclicity.

**Logical acyclicity**: even among works published at different times, there must be no cycle in the grounding relation. A grounding cycle $C \to W \to C$ (or through intermediaries) is **citogenesis**.

## Citogenesis: cycles in the grounding DAG

**Citogenesis** (Munroe, xkcd 978, 2011): the pathological cycle in which:
1. An unsourced claim $C$ is introduced into a secondary source $W$ (e.g., added to a reference document)
2. A new paper cites $W$ as the source of $C$
3. $W$ is updated to cite the new paper as the source of $C$
4. Now $C$ appears to have a citation chain, but the chain is a cycle: $C \to W \to C$ (possibly through additional nodes)

Formally: $C \in H_t$ is grounded via $\rho$ in $W$, but $W$ derived $C$ from $C$ (or from claims transitively grounded in $C$). The grounding graph has a directed cycle. The citation satisfies the syntactic form of grounding while providing no independent epistemic support — the cycle traces back to the original unsourced $C$.

This is the analog of circular definition ($X$ defined by $Y$, $Y$ defined by $X$): it satisfies the form of definition while failing to provide content. In fiber terms: citogenesis creates the appearance of a grounding chain toward $H^*$ while actually running in a loop that never exits $H_t \setminus H^*_t$.

The valid citation network is acyclic precisely because valid grounding is non-circular: the chain must eventually terminate in observations, experiments, or derivations that are independently settled (in $H^*$) without reference back to the citing claim.

## Citation and the Record structure

The cited work $W \in H^*_{\tau_W}$ is a [Record](./record.md) triple $(K_W, V_W, \tau_W)$ where:
- $K_W$ is the key: author(s), title, venue (journal/conference/book), year — enough to uniquely identify the work
- $V_W$ is the value: the content of the work — the text, figures, proofs, data
- $\tau_W$ is the history marker: the commitment event (publication date)

The citation's locus $L \subseteq V_W$ specifies which part of the record's value provides the support — page, section, equation, figure. The combination $(K_W, L)$ gives a complete, locatable pointer.

The temporal persistence of records ($W \in H^*_{\tau_W}$ persists forward: $W \in H^*_t$ for all $t > \tau_W$) is what makes citation reliable: the cited work does not change between the time of citing and the time of verification. This is why publication — commitment to a persistent, immutable record — is a prerequisite for valid citation.

## Academic vs. legal citation

The structural contrast matters for reasoning in this system:

| | Academic Citation | Legal Citation |
|---|---|---|
| **Register** | Epistemic: reasons for belief | Normative: reasons for decision |
| **Force** | Persuasive: the reader may evaluate and disagree | Binding (within jurisdiction): the court must follow |
| **Settlement** | $C$ moves toward $H^*_t$ (meaning-settled belief) | $\alpha$ moves toward $H^*_t$ (execution-settled action) |
| **Cycle consequence** | Citogenesis: false authority, no epistemic support | Circular precedent: legally void (no independent ground) |

The academic citation settles meaning: $\sigma_t(C) \to C$ (the saturation nucleus processes the grounding and raises $C$ toward $\mathrm{Fix}(\sigma_t)$). The legal citation settles execution: $\Delta_t(J) \to J$ where $J$ is the judgment; the precedent carries the judgment forward through the transfer nucleus into obligatory future decisions.

## Open questions

- Whether the four grounding relation types (quotation, paraphrase, reference, see-also) form a total order by evidentiary strength, and whether the lattice structure of $H_t$ gives a formal strength ordering: $\rho_\mathrm{quot} > \rho_\mathrm{par} > \rho_\mathrm{ref} > \rho_\mathrm{see}$ in terms of how much the citation advances $C$ toward $H^*_t$.
- Whether the citation DAG has a natural fiber structure: each node $C$ has a "citation depth" measuring its distance from claims grounded only in first-person observations or axiomatic commitments, and whether this depth corresponds to the depth filtration of the relational history fiber.
- Whether the valid-grounding condition (locus $L$ actually supports $C$ via $\rho$) can be formalized as a morphism condition in the fiber: a citation is valid iff there exists a morphism $f_\rho: L \to C$ in the fiber's category that witnesses the grounding type $\rho$.
- Whether peer review — the institutional process by which citation-worthy claims are evaluated before publication — corresponds to the transition from $H_t \setminus H^*_t$ (submitted, under review: present but not settled) to $H^*_t$ (published: settled); and whether the nucleus that governs this transition is the saturation nucleus (meaning closure: "the field has recognized this as established") or the transfer nucleus (execution closure: "this can be relied upon for future work").
