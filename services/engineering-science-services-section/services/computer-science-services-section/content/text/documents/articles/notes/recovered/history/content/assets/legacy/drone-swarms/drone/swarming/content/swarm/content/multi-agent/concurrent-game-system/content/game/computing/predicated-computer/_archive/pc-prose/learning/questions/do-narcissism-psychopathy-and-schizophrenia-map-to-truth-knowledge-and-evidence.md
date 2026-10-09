---
name: do narcissism psychopathy and schizophrenia map to truth knowledge and evidence
description: Open question whether three named clinical-psychiatric pathologies — narcissism, psychopathy, schizophrenia — correspond structurally to three distinct categorical structures on the four-bilattice — truth order, knowledge order, and the evidence-pair components of the twist product — such that each pathology is the disorder of one of the structures.
status: open
authority-note: substantive clinical-psychiatric content (diagnostic criteria, etiology, treatment) is the captain's domain and the relevant literature's; the structural framework question — whether such a three-by-three correspondence holds — can be developed alongside.
---

**Question.** Three clinical-psychiatric pathologies — *narcissism*, *psychopathy*, *schizophrenia* — and three operational structures on the predication corpus's four-bilattice — the *truth order* $\leq_t$, the *knowledge order* $\leq_k$, and the *evidence pair* $\langle e^+, e^- \rangle$ that constitutes the bilattice value under the twist product $\mathbf{FOUR} \cong \mathbf{2}^\bowtie$. Does there exist a structurally load-bearing correspondence that pairs each pathology with one structure, such that the pathology is the categorical disorder of that structure?

## What is established

The four-bilattice $\mathbf{FOUR}$ — the value algebra of every [predication cell](../../../code/structures/predication-cell.md) — carries three distinct structural pieces, all on the same carrier $\{\mathbf{t}, \mathbf{f}, \bot, \top\}$:

- **Truth order $\leq_t$.** The lattice $\mathbf{f} \leq_t \bot, \top \leq_t \mathbf{t}$. Ranks values by *how true* the predication is. The categorical structure of *assertion-ranking*.
- **Knowledge order $\leq_k$.** The lattice $\bot \leq_k \mathbf{f}, \mathbf{t} \leq_k \top$. Ranks values by *how much is known* about the predication, regardless of which way that knowledge cuts. The categorical structure of *information-ranking*.
- **Evidence pair $\langle e^+, e^- \rangle$.** Under the twist-product decomposition $\mathbf{FOUR} \cong \mathbf{2}^\bowtie$, each bilattice value resolves into a pair: $e^+$ is *evidence for* the predication, $e^-$ is *evidence against*. The cell's value tracks evidence for and against the assertion (per [`predication-cell`](../../../code/structures/predication-cell.md)). The categorical structure of *grounding*.

These three are not the same. Truth-order facts and knowledge-order facts are *independent dimensions* of the bilattice; the evidence pair is the *constructive content* whose orientation produces both orders. A cell at $\top$ has high knowledge and indeterminate truth and *both* positive and negative evidence; a cell at $\mathbf{t}$ has high truth and high knowledge and *only* positive evidence; a cell at $\bot$ has low knowledge and indeterminate truth and *no* evidence on either side.

On the clinical side, the three pathologies are recognized as distinct diagnostic patterns with distinct phenomenologies; nothing in the corpus has previously connected them to the bilattice apparatus. The question is genuinely upstream: whether the connection is structural or only suggestive.

## What remains open

The question has two layers.

**Layer 1 (existence).** Is there *any* mapping at all from $\{$narcissism, psychopathy, schizophrenia$\}$ to $\{\leq_t, \leq_k, \langle e^+, e^- \rangle\}$ that is structurally load-bearing — i.e., that picks out the same categorical features the clinical literature names as the pathology's signature?

**Layer 2 (which mapping).** If a mapping exists, *which* assignment realizes it? Three permutations are candidate. A sketch of one possible orientation, given as a starting target rather than a claim:

| Pathology | Candidate structure | Sketch of the disorder |
|---|---|---|
| **Narcissism** | Truth order $\leq_t$ | Collapses the truth order to a self-favorable axis. Cells about the self are forced toward $\mathbf{t}$ regardless of evidence balance; cells about others or about reality that disconfirm the self are forced toward $\mathbf{f}$. The truth-ranking is no longer a function of $\langle e^+, e^- \rangle$ but is shadowed by an exogenous variable (self-protection). |
| **Psychopathy** | Knowledge order $\leq_k$ | The knowledge dimension is intact for *self-serving* cells but truncated for cells about the moral or affective state of others. The pathology is not in the truth values but in the *refusal to climb the knowledge order* — keeping cells about the other at $\bot$ when evidence would lift them. Cf. the affective-empathy literature on the absence of automatic information uptake. |
| **Schizophrenia** | Evidence pair $\langle e^+, e^- \rangle$ | The constructive grounding itself is disordered: hallucinations and delusions are $e^+$ entries without external referent; thought disorder is the dissociation of $\langle e^+, e^- \rangle$ from cell-coherence; negative symptoms reduce both $e^+$ and $e^-$ toward zero. The pathology is upstream of both orders because it disorders the components from which both orders are computed. |

This is one mapping among $3! = 6$ permutations. Without derivation it is suggestion only. Other permutations might fit clinical patterns equally well or better. The mapping might also be many-to-many (each pathology touches multiple structures) rather than the clean bijection the question's framing presumes.

**Layer 1.5 (the meta-mapping question).** A separate possibility: the three pathologies might not map to the three bilattice structures but to *three different* categorical features — failures in cell-orientation (subject-predicate-object), or failures in [predication settling](../../../code/structures/predication-settling.md), or failures in the [predication hyperdoctrine](../../../code/structures/predication-hyperdoctrine.md)'s base/fiber distinction. The framing "truth, knowledge, evidence" is one tripartite slice; other tripartite slices are available.

## What an answer would look like

A worked-out answer would deliver four things:

1. **A formal characterization of the disorder.** For each pathology, a precise statement of the categorical defect: which morphism is non-functorial, which natural transformation fails, which projection collapses. Schizophrenia-as-evidence-disorder, for example, would specify the failure mode in the $\langle e^+, e^- \rangle$ → cell-value map.
2. **A clinical validation handle.** A way of testing the mapping against the clinical literature: which diagnostic criteria the categorical defect predicts, which it fails to predict, which it predicts but are not standard criteria (and whether those are clinical signs in the literature even if not formalized as criteria).
3. **A separation argument.** A demonstration that the three pathologies are categorically distinct in the way the three bilattice structures are categorically distinct — i.e., that no permutation other than the claimed one works as well. The strongest form of such an argument would show that comorbidities (narcissism + psychopathy, etc.) compose in the bilattice the way the corresponding structural defects compose.
4. **A scope statement.** Whether the claim is *every* case of pathology-X is the corresponding structural disorder, or *the structural form* of pathology-X is the corresponding structural disorder, or only *a subset* of cases. The answer's scope determines whether the claim is structural-essential or structural-typical.

The corpus's [aliases-resolve-pullback claim](../claims/aliases-are-resolve-pullbacks-of-classical-equality.md) and the four-bilattice's $K_4 = \langle \sim, - \rangle$ symmetry are natural toolset; the question is whether the pathology side admits formalization at all in those terms, or whether the clinical concepts resist the categorical apparatus because they live at a level the apparatus does not capture (e.g., the affective-relational level the bilattice's value-algebra abstracts away from).

## Why it matters

- **Predicated-sociology agenda.** The [predicated-sociologist](../../../work/governance/staff/agents/predicated-sociologist.md) agent works within the polity's commitment to derive social-scientific structures from the predication apparatus rather than imported. If clinical-psychiatric pathology has a categorical articulation in the bilattice apparatus, the agent's domain is enlarged from social-structural to clinical-structural; if not, the boundary is itself worth recording.
- **The agentic-drone-swarm theory.** The 561 polity is building a flatfile agentic-drone resource system. The drones-as-agents have $F_\chi$-fixed-point dispositions (per [character.md](../../../code/structures/character.md)); whether agents *can* exhibit categorically-articulable disorders analogous to clinical pathologies bears on the framework's account of agent failure modes and the safety case for the swarm.
- **Theory-quality vs. clinical-quality.** The polity's theory-quality office (per [office:theory-quality](../../../work/governance/staff/offices/theory-quality.md)) audits theoretical claims. If clinical pathologies admit categorical articulation, claims about them are subject to theory-quality audit; if not, the polity's substrate explicitly defers to clinical-domain authority. Either answer is load-bearing.
- **Bilattice-foundational structure.** If the three bilattice structures are independently realized by three distinct natural-language failure modes (clinical or otherwise), that is structural evidence the three pieces are independent in a strong sense — not merely independent in the formal carrier but independent in their *operational signature*. This bears on the [four-bilattice](../../../code/structures/four-bilattice.md)'s status as the right value algebra rather than a particular convenient one.

## Authorial domain

Substantive clinical-psychiatric content — diagnostic criteria, etiology, comorbidity patterns, the contested status of "psychopathy" as a clinical (vs. forensic/criminological) category, the heterogeneity of schizophrenia-spectrum diagnoses — is the captain's domain and the relevant clinical literature's. The *structural framework* question — whether a categorical mapping exists between the three pathologies and the three bilattice structures, and which permutation realizes it — can be developed alongside, drawing on the captain's clinical knowledge rather than authoring new clinical content. The risk to surface explicitly: importing imprecise clinical-folk vocabulary into the categorical apparatus, where the apparatus's precision would be falsely transferred to the imported terms.

## Position

Open question at the intersection of clinical psychiatry and the predication-categorical apparatus. Raised by emsenn 2026-05-18 in this session. The question is recorded here as the polity's open frontier; substantive development is deferred pending captain direction on which permutation (if any) and which clinical literature to compose against.
