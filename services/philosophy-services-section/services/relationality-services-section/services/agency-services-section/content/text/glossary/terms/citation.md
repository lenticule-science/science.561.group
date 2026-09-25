---
title: "Citation"
type: "page"
date-created: 2026-03-20
description: A Citation is a four-tuple (C, W, L, ρ) — a citing claim C ∈ Ht, a cited work W ∈ H{τW} (a settled record committed at τW < t), a locus L specifying the specific element within W, and a grounding relation type ρ ∈ {quotation, paraphrase,…
---

A Citation is a four-tuple (C, W, L, ρ) — a citing claim C ∈ H_t, a cited work W ∈ H*_{τ_W} (a settled record committed at τ_W < t), a locus L specifying the specific element within W, and a grounding relation type ρ ∈ {quotation, paraphrase, reference, see-also} specifying how L supports C. The defining structure: C is grounded in W at L via ρ. A citation is a speech act that simultaneously asserts (C is supported by W), acknowledges (priority to W's author), locates (C within the network containing W), and makes transparent (the reader can verify). The citation graph must be a DAG — the grounding relation is acyclic. Citogenesis introduces a directed cycle: C is grounded in W which derived from C, satisfying the syntactic form of grounding while providing zero epistemic support.

Table of contents

- [Formal definition](#formal-definition)

- [Citation as four speech acts simultaneously](#citation-as-four-speech-acts-simultaneously)

- [The citation graph must be a DAG](#the-citation-graph-must-be-a-dag)

- [Citogenesis: cycles in the grounding DAG](#citogenesis-cycles-in-the-grounding-dag)

- [Citation and the Record structure](#citation-and-the-record-structure)

- [Academic vs. legal citation](#academic-vs-legal-citation)

- [Open questions](#open-questions)

# Citation

## Formal definition

A **Citation** is a four-tuple $\mathcal{C} = (C, W, L, \rho)$:

C=(C∈Ht,  W∈HτW∗,  L⊆W,  ρ∈{quot,par,ref,see})\mathcal{C} = (C \in H_t,\; W \in H^*_{\tau_W},\; L \subseteq W,\; \rho \in \{\mathrm{quot}, \mathrm{par}, \mathrm{ref}, \mathrm{see}\})

where:

- $C$ is the **citing claim** — the proposition in the current fiber that the citation is designed to ground; $C \in H_t$ is present in the fiber but may not be in Ht∗H^*_t (may not yet be meaning-settled); the citation is the act that moves $C$ toward Ht∗H^*_t by connecting it to the settled record $W$

- $W$ is the **cited work** — a committed, persistent record: W∈HτW∗W \in H^*_{\tau_W}, meaning $W$ is fully settled at the time of its publication $\tau_W$; $W$ is a [Record](../../documents/articles/notes/undated/record.md) triple $(K_W, V_W, \tau_W)$ — key (author, title, venue, year), value (content), and history marker (publication date); the requirement W∈HτW∗W \in H^*_{\tau_W} captures the commitment of scholarly publication: the work is meaning-settled and execution-settled at its publication point

- $L$ is the **locus** — the specific element within $W$ at which the supporting content resides; $L \subseteq V_W$ (a sub-element of the cited work&rsquo;s content); $L$ is what narrows the citation from &ldquo;W supports C&rdquo; to &ldquo;this specific part of W supports C&rdquo;; without $L$, the citation is too vague to be verified

- $\rho$ is the **grounding relation type** — how $L$ supports $C$:

**Quotation** ($\rho = \mathrm{quot}$): $L$ is reproduced verbatim in $C$; strongest support; $L$ appears as a sub-element of CC&rsquo;s content

- **Paraphrase** ($\rho = \mathrm{par}$): $C$ reproduces the ideas of $L$ in different words; strong support; the propositional content is preserved

- **Reference** ($\rho = \mathrm{ref}$): $W$ establishes the claim $C$ makes; $C$ attributes the claim to $W$ without reproducing content; medium support

- **See-also** ($\rho = \mathrm{see}$): $W$ is related but does not directly establish $C$; weak support; associative rather than evidentiary

**The grounding claim**: $C$ is grounded in $W$ at $L$ via $\rho$. The citation is **valid** iff $L$ actually supports $C$ via the stated $\rho$ — the cited locus genuinely provides the stated kind of support for the citing claim.

## Citation as four speech acts simultaneously

Using Austin&rsquo;s performative speech act analysis:

- **Assertive**: &ldquo;this claim $C$ is supported by evidence at $W$:LL&rdquo; — the citation constitutes an assertion of the grounding relation between $C$ and $W$; it claims that $C$ is epistemically connected to $W$

- **Expressive/Acknowledging**: crediting WW&rsquo;s author with priority — &ldquo;this idea/finding originates with the author of $W$, not with me&rdquo;; the citation performs the act of intellectual acknowledgment; without citation, one appropriates the credited idea without acknowledgment (plagiarism)

- **Locating**: placing $C$ within the discourse network that contains $W$ — &ldquo;this paper is in conversation with $W$ and its intellectual neighbors&rdquo;; citation creates the network structure of scholarship

- **Transparency-providing**: enabling verification — &ldquo;the reader can check $W$:LL to confirm that $C$ is supported&rdquo;; citation makes knowledge claims intersubjectively accessible; it is the mechanism by which private knowledge becomes public, verifiable knowledge

The fourth function is the epistemically fundamental one: without citation, knowledge claims are opaque. With citation, they are in principle verifiable by anyone with access to $W$.

## The citation graph must be a DAG

A valid citation network is a **directed acyclic graph** (DAG): $C_1 \to W_1, C_2 \to W_2, \ldots$ where $\to$ denotes &ldquo;is grounded in&rdquo; and there are no directed cycles. The acyclicity condition formalizes the requirement that grounding must be non-circular:

**Temporal acyclicity**: $\tau_W < t$ — the cited work must have been committed (W∈HτW∗W \in H^*_{\tau_W}) before the citing claim was made ($C \in H_t$ at $t > \tau_W$). An author cannot cite a work published after their own; the time ordering of the history monoid enforces partial acyclicity.

**Logical acyclicity**: even among works published at different times, there must be no cycle in the grounding relation. A grounding cycle $C \to W \to C$ (or through intermediaries) is **citogenesis**.

## Citogenesis: cycles in the grounding DAG

**Citogenesis** (Munroe, xkcd 978, 2011): the pathological cycle in which:

- An unsourced claim $C$ is introduced into a secondary source $W$ (e.g., added to a reference document)

- A new paper cites $W$ as the source of $C$

- $W$ is updated to cite the new paper as the source of $C$

- Now $C$ appears to have a citation chain, but the chain is a cycle: $C \to W \to C$ (possibly through additional nodes)

Formally: $C \in H_t$ is grounded via $\rho$ in $W$, but $W$ derived $C$ from $C$ (or from claims transitively grounded in $C$). The grounding graph has a directed cycle. The citation satisfies the syntactic form of grounding while providing no independent epistemic support — the cycle traces back to the original unsourced $C$.

This is the analog of circular definition ($X$ defined by $Y$, $Y$ defined by $X$): it satisfies the form of definition while failing to provide content. In fiber terms: citogenesis creates the appearance of a grounding chain toward H∗H^* while actually running in a loop that never exits Ht∖Ht∗H_t \setminus H^*_t.

The valid citation network is acyclic precisely because valid grounding is non-circular: the chain must eventually terminate in observations, experiments, or derivations that are independently settled (in H∗H^*) without reference back to the citing claim.

## Citation and the Record structure

The cited work W∈HτW∗W \in H^*_{\tau_W} is a [Record](../../documents/articles/notes/undated/record.md) triple $(K_W, V_W, \tau_W)$ where:

- KWK_W is the key: author(s), title, venue (journal/conference/book), year — enough to uniquely identify the work

- VWV_W is the value: the content of the work — the text, figures, proofs, data

- $\tau_W$ is the history marker: the commitment event (publication date)

The citation&rsquo;s locus $L \subseteq V_W$ specifies which part of the record&rsquo;s value provides the support — page, section, equation, figure. The combination (KW,L)(K_W, L) gives a complete, locatable pointer.

The temporal persistence of records (W∈HτW∗W \in H^*_{\tau_W} persists forward: W∈Ht∗W \in H^*_t for all $t > \tau_W$) is what makes citation reliable: the cited work does not change between the time of citing and the time of verification. This is why publication — commitment to a persistent, immutable record — is a prerequisite for valid citation.

## Academic vs. legal citation

The structural contrast matters for reasoning in this system:

Academic Citation
Legal Citation

**Register**
Epistemic: reasons for belief
Normative: reasons for decision

**Force**
Persuasive: the reader may evaluate and disagree
Binding (within jurisdiction): the court must follow

**Settlement**
$C$ moves toward Ht∗H^*_t (meaning-settled belief)
$\alpha$ moves toward Ht∗H^*_t (execution-settled action)

**Cycle consequence**
Citogenesis: false authority, no epistemic support
Circular precedent: legally void (no independent ground)

The academic citation settles meaning: $\sigma_t(C) \to C$ (the saturation nucleus processes the grounding and raises $C$ toward $\mathrm{Fix}(\sigma_t)$). The legal citation settles execution: $\Delta_t(J) \to J$ where $J$ is the judgment; the precedent carries the judgment forward through the transfer nucleus into obligatory future decisions.

## Open questions

- Whether the four grounding relation types (quotation, paraphrase, reference, see-also) form a total order by evidentiary strength, and whether the lattice structure of HtH_t gives a formal strength ordering: $\rho_\mathrm{quot} > \rho_\mathrm{par} > \rho_\mathrm{ref} > \rho_\mathrm{see}$ in terms of how much the citation advances $C$ toward Ht∗H^*_t.

- Whether the citation DAG has a natural fiber structure: each node $C$ has a &ldquo;citation depth&rdquo; measuring its distance from claims grounded only in first-person observations or axiomatic commitments, and whether this depth corresponds to the depth filtration of the relational history fiber.

- Whether the valid-grounding condition (locus $L$ actually supports $C$ via $\rho$) can be formalized as a morphism condition in the fiber: a citation is valid iff there exists a morphism $f_\rho: L \to C$ in the fiber&rsquo;s category that witnesses the grounding type $\rho$.

- Whether peer review — the institutional process by which citation-worthy claims are evaluated before publication — corresponds to the transition from Ht∖Ht∗H_t \setminus H^*_t (submitted, under review: present but not settled) to Ht∗H^*_t (published: settled); and whether the nucleus that governs this transition is the saturation nucleus (meaning closure: &ldquo;the field has recognized this as established&rdquo;) or the transfer nucleus (execution closure: &ldquo;this can be relied upon for future work&rdquo;).
