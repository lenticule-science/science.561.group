---
title: "Beyond the ‘Diff’: Addressing Agentic Entropy in Agentic Software Development"
description: "[!Uncaptioned image(../../research/2026/07/31/lenticule-import/computing/software/software-development/agentic-entropy/bibliography/beyond-the-diff-addressing-agentic-entropy-in-agentic-software-development/2604.16323v2/x1.png) Matteo…"
---

[![[Uncaptioned image]](../../research/2026/07/31/lenticule-import/computing/software/software-development/agentic-entropy/bibliography/beyond-the-diff-addressing-agentic-entropy-in-agentic-software-development/2604.16323v2/x1.png) Matteo Casserini](https://orcid.org/0009-0002-2930-6655)
Corresponding author, matteo.casserini@supsi.ch
Dipartimento Tecnologie Innovative, SUPSI, Switzerland

[![[Uncaptioned image]](../../research/2026/07/31/lenticule-import/computing/software/software-development/agentic-entropy/bibliography/beyond-the-diff-addressing-agentic-entropy-in-agentic-software-development/2604.16323v2/x2.png) Alessandro Facchini](https://orcid.org/0000-0001-7507-116X)

Dalle Molle Institute for Artificial Intelligence (IDSIA), SUPSI, Switzerland

Management in Networked and Digital Societies (MINDS) Department, Kozminski University, Poland

[![[Uncaptioned image]](../../research/2026/07/31/lenticule-import/computing/software/software-development/agentic-entropy/bibliography/beyond-the-diff-addressing-agentic-entropy-in-agentic-software-development/2604.16323v2/x3.png) Andrea Ferrario](https://orcid.org/0000-0001-9968-9474)

Dalle Molle Institute for Artificial Intelligence (IDSIA), SUPSI, Switzerland

Institute of Biomedical Ethics and History of Medicine, University of Zurich, Switzerland

ETH Zurich, Switzerland

###### Abstract

As autonomous coding agents become deeply embedded in software development workflows, their high operational velocity introduces a critical oversight challenge in the form of accumulating divergence between agentic actions and architectural intent. We term this process *agentic entropy*, a systemic drift that traditional code diff-based and HCXAI methods fail to capture, as they address local outputs rather than global agentic behaviour. To close this gap, we propose a *process-oriented explainability* framework that exposes how agentic decisions unfold across time, tool calls, and architectural boundaries. Built around three pillars (conformity seeding, reasoning monitoring, and a causal graph interface) our approach provides intent-level telemetry that complements, rather than replaces, existing review practices. We demonstrate its relevance across two user profiles: lay users engaged in vibe coding, who gain structural visibility otherwise masked by functional success; and professional developers, who gain richer contextual grounding for code review without increased overhead. By treating cognitive drift as a first-class concern alongside code quality, our framework supports the minimum level of human comprehension required for agentic oversight to remain substantive.

\keywords

Agentic Entropy, Process‑Oriented Explainability, Human‑Centered XAI, Agentic Software Development, Cognitive Debt, Reasoning Traces, Vibe Coding

1 Introduction

The software development lifecycle is currently undergoing an artificial intelligence (AI) agentic revolution [[14](#bib.bib5)]. The transition from large-language-model-based autocomplete features, which provide localized code suggestions, to AI agents represents a fundamental change in the human–AI interaction model. Modern agentic workflows, exemplified by platforms such as Claude Code, can navigate file systems, execute commands, interpret compiler errors, and perform multi‑file refactoring with high autonomy [[9](#bib.bib4)]. While traditional code diff-based review remains indispensable for inspecting local modifications, it reveals only the outcome of agentic activity. The planning steps, tool-call sequences, cross-file decisions, and contextual inferences that guide an agent’s actions remain largely hidden from human supervisors. We refer to this opacity as agentic entropy, a process-level drift whereby autonomous updates optimize for local correctness while eroding global design intent. Agentic entropy unfolds across runs and environments as agents repeatedly operate with limited systemic awareness. A visible manifestation of this drift is agentic technical debt, the accumulated structural misalignments, duplicated logic, and fragile refactoring that emerge when entropy goes unchecked.

Entropy accumulation has many causes, including prompt sprawl and stochastic effects. Particularly relevant is the democratization of software development through what is commonly referred to as “vibe coding”, a paradigm where users steer systems with loosely specified prompts and short iterative trial-fix loops, rather than formal code verification and review111Industry reports show that nearly 45% of AI-generated code fails basic security checks when users rely on prompt-driven workflows without guardrails: [https://www.veracode.com/blog/genai-code-security-report/](https://www.veracode.com/blog/genai-code-security-report/). Functional checks (e.g., confirming that the code runs) can thus mask deeper architectural violations and security gaps, producing an illusion of rapid progress while drift accumulates beneath the surface [[3](#bib.bib14)]. Beyond agent behaviour, developers who rely on agentic tools can lose the system-level mental models needed to notice violations, accumulating *cognitive debt* that resides in people rather than code [[12](#bib.bib18)]. This co-evolution of agentic entropy and cognitive debt narrows the capability-comprehension gap for oversight, leaving humans procedurally in the loop yet progressively less able to govern the system [[15](#bib.bib17)].

To address this gap, we introduce process-oriented explainability, a transparency-by-design framework that augments (rather than replaces) existing HCXAI and code-diff practices, helping mitigate agentic entropy. Our framework anchors agent behaviour to machine-readable architectural seeds, monitors intermediate reasoning and tool use, and summarizes activity in a causal reasoning graph for lightweight, global oversight. Its benefits apply to (1) lay users engaged in vibe coding who gain high epistemic safety, as process-level monitoring surfaces structural drift otherwise hidden behind functional success; and (2) professional coder-agent-reviewer workflows who obtain a medium epistemic gain by contextualizing local code diffs within agent-level plans, improving control over agentic execution without increasing review burden.

Our work is structured as follows. Section [2](#S2) reviews relevant literature. Section [3](#S3) characterizes how agentic entropy manifests in autonomous software development workflows. Section [4](#S4) presents our framework and a technical implementation. Finally, Section [5](#S5) offers concluding remarks and outlines directions for future research.

2 Related Work

The supervision of autonomous coding agents intersects several established research areas. A foundational pillar is the concept of *software entropy*, first formalized by Lehman in his laws of software evolution, which posits that software systems naturally drift toward increased complexity unless effort is invested in maintaining their structure [[13](#bib.bib1)].
Research on human–AI collaboration in software development further highlights how AI-generated code reshapes verification practices. Empirical studies show that reviewers frequently experience cognitive overload or ‘verification fatigue’ when faced with high volumes of agent-produced changes [[5](#bib.bib12), [2](#bib.bib15)].
Within the broader literature on explainable and agentic AI, several frameworks emphasize the need for transparency that captures temporal and sequential structure rather than isolated outputs. [[1](#bib.bib2)] argues that explanations for sequential decision-making systems must be trajectory-aware, while the *LEx* framework of [[17](#bib.bib3)] emphasizes that explanations should be tailored to stakeholder roles, such as software architects who require higher-level design justifications. Recent advances reinforce this need, as *Chain-of-Thought* (CoT) prompting surfaces intermediate reasoning [[18](#bib.bib16)], and DeepSeek-R1 shows that such traces can be explicitly incentivized during training [[7](#bib.bib11)].
Parallel work on agentic AI governance and risk management stresses the need for mechanisms that keep autonomous systems aligned with organizational and architectural constraints [[16](#bib.bib6), [11](#bib.bib7)]. Complementing this, emerging research on agentic software development calls for new forms of transparency and oversight to address non-deterministic tool-use patterns and the high velocity of autonomous coding workflows [[8](#bib.bib10)].

3 From Agentic Entropy to Agentic Technical Debt

The emergence of autonomous coding agents requires a reconsideration of how software systems degrade over time. Classical software evolution theory, particularly Lehman’s notion of software entropy, observes that systems naturally drift toward increased complexity unless active effort is invested in maintaining their structure. We extend this perspective to the agentic era by distinguishing agentic entropy, which is the ongoing process by which autonomous updates diverge from architectural intent, from agentic technical debt, which refers to the accumulated structural misalignments that entropy leaves behind. While Lehman’s entropy arises primarily from human‑driven system evolution, agentic entropy emerges from high‑velocity, context‑limited agent actions that compound across runs and environments. These concepts, while distinct in nature, interact in a reinforcing cycle. Agentic entropy, a *process*, produces agentic technical debt, an *outcome* that manifests in the codebase. The growing opacity of that debt in turn deepens a third, *human-side effect*, namely cognitive debt [[12](#bib.bib18)], the progressive erosion of the developer’s or reviewer’s system-level mental model as autonomous actions outpace comprehension. As cognitive debt accumulates, the human supervisor’s capacity to detect subsequent entropy diminishes, closing a feedback loop in which undetected drift begets further structural misalignment. In the remainder of this section, we show how this cycle initiates at the process level through three characteristic failure modes in agentic workflows.

The first manifestation of agentic entropy arises from agents optimizing for *local correctness* while drifting from *global architectural intent*. Because agentic workflows, such as those implemented in Claude Code, frequently operate within a constrained context window, they are prone to achieving functional correctness at the module level while inadvertently violating systemic design patterns. As shown by [[10](#bib.bib8)], agents often propose ‘textbook’ solutions that appear locally elegant but overlook system-specific architectural and security constraints. Such mismatches accelerate agentic entropy, introducing redundant or misaligned logic that gradually fragments the codebase’s intended architectural structure [[6](#bib.bib13)].

A second manifestation of agentic entropy is the erosion of *semantic stability*, particularly when agents refactor legacy logic without understanding its historical or operational rationale. Autonomous agents excel at identifying and cleaning complex legacy code that appears aesthetically deficient, yet legacy systems often contain ‘ugly’ logic (such as delay loops or seemingly redundant checks) that accounts for undocumented quirks or rare race conditions. When an agent refactors these segments without a deep semantic understanding of their historical necessity, it introduces a structural fragility. The resulting code may pass standardized unit tests but fail in production under specific edge cases that the agent, and subsequently the overwhelmed human reviewer, failed to anticipate. This risk is empirically supported by the work of [[2](#bib.bib15)], which characterizes the loss of global context in AI-augmented programming, and [[4](#bib.bib9)], which demonstrates that while AI models often achieve high functional accuracy, they frequently fail to satisfy structural and architectural constraints. Consequently, the resulting codebase suffers from a ‘stability gap’, where locally functional code lacks the systemic robustness required for long-term evolution.

A third entropy‑accelerating factor is the *reviewer’s paradox*, where rising agentic output overwhelms human verification capacity. As autonomous tools accelerate the ‘inner loop’ of code production, the human capacity for rigorous oversight remains a fixed constraint. This imbalance leads to a breakdown in the traditional code review process, where human auditors move from strategic supervision to passive rubber-stamping. Empirical data suggests that this acceleration does not currently correlate with a commensurate increase in review quality; rather, it often leads to a higher rate of code churn and duplicated logic, further accelerating the system’s entropy [[6](#bib.bib13)].

Taken together, these lenses show how agentic entropy converts autonomous decisions into long‑term architectural liabilities. Each lens describes a pathway through which entropy accumulates as technical debt unless a supervisory mechanism intervenes. This motivates our shift in the next section from inspecting code outputs to monitoring the entropy‑producing processes themselves.

4 Our Approach: Controlling Agentic Entropy with Process-Oriented Explainability

To address the structural risks identified in the preceding sections, we introduce Process-oriented Explainability (PoE), a transparency-by-design extension to existing practices. Rather than replacing traditional code diff-based validation, PoE adds a complementary layer that aims to make the agent’s global, process-level behaviour accessible to human supervisors.
While classical diffs remain effective for experienced developers to inspect localized changes, agentic workflows increasingly involve planning steps, multi-file operations, and tool-mediated actions that fall outside the scope of line-by-line review. By foregrounding the process through which agents arrive at their modifications, this additional transparency layer supports coder-agent-reviewer interactions and provides meaningful epistemic benefits, especially for laypeople who rely on ‘vibe coding’ and lack the expertise to assess systemic impact.
As software systems transition from static code toward autonomous agentic workflows, the primary diagnostic artifact necessarily shifts from traditional *stack traces*, which capture execution-level telemetry, to *reasoning traces*, which provide intent-level telemetry. The PoE framework leverages this shift by augmenting existing review practices with a global overview of agentic behaviour. For professional developers and reviewers, this provides a medium epistemic gain through improved oversight of agentic decision patterns; for lay users, it enables visibility into structural effects that would otherwise remain hidden behind functional correctness. Our framework is structured around three conceptual cornerstones.

*I. Conformity structure.* First, PoE requires architectural seeding to ground agentic behaviour in system-level constraints. Here, the human supervisor provides a machine-readable specification of global design patterns, invariants, or security requirements. Consistent with the perspective advanced by [[17](#bib.bib3)], this layer supports stakeholders (particularly software architects) who require explanations at a strategic rather than purely functional level. Rather than displacing code diffs, architectural seeds enrich them, as the agent must relate its proposed actions to these constraints, enabling reviewers to interpret local changes within a global architectural rationale. This reduces entropy-induced drift by ensuring that agentic plans remain aligned with design intent.

*II. Reasoning monitoring.* We extend transparency from code outputs to the reasoning processes that generate them. An instrumented environment captures the agent’s tool calls, intermediate planning steps, and contextual cues that motivate each action. This monitoring layer within PoE complements traditional review, where developers retain line-by-line inspection but also gain access to a global perspective on the agent’s decision trajectory [[8](#bib.bib10)]. For lay users, this layer exposes otherwise opaque behavioural patterns, reducing the risk that rapid prototyping or surface-level functionality masks accumulating architectural divergence.

*III. Human interpretability layer.* To render high-dimensional reasoning logs accessible, we summarize monitoring traces within PoE into a causal reasoning graph that depicts agentic behaviour as a sequence of reasoning nodes and tool-mediated edges. By parsing the agent’s intermediate reasoning steps (including CoT-style segments in reasoning-centric models) into a directed acyclic graph (DAG), we can represent the agentic process as a series of connected nodes where each node signifies a possible agentic execution and each edge denotes a corresponding environmental action [[7](#bib.bib11)]. Reviewers can examine this graph alongside code diffs to identify deviations from architectural seeds or unexpected execution paths. By shifting cognitive effort from exhaustive local inspection to selective process-level oversight, this layer enhances a reviewer’s capacity to detect entropy-producing behaviours without replacing established practices. We add an *understanding requirement*, whereby the reviewer should be able to independently reconstruct the principal steps in the causal graph and recognize when an action falls outside permitted boundaries, with failure to do so signaling growing cognitive debt that warrants intervention [[15](#bib.bib17)].

*Illustrative scenario.* To ground the three pillars in a concrete setting, consider a web application whose architectural specification mandates that all database access be routed through a dedicated data-access layer. A user prompts an agentic coding tool to “add a caching layer to speed up the product catalog”. The agent, operating within a constrained context window, identifies the relevant API endpoint and introduces an in-memory cache. To populate the cache efficiently, it embeds a direct database query inside the API controller, bypassing the prescribed data-access layer entirely. The resulting code compiles, passes existing unit tests, and demonstrably improves response times, representing a functional success that would satisfy a vibe-coding user and appear benign in a standard code diff, which shows only the addition of a new import and a query call. Under PoE, this divergence surfaces at each pillar. The conformity structure (Pillar I) includes an architectural seed specifying that database interactions must pass through the data-access module; the agent’s proposed modification can therefore be evaluated against this constraint before it is committed. Reasoning monitoring (Pillar II) captures the agent’s intermediate plan, including the rationale “query the database directly from the controller for lower latency”, exposing the deliberate intent to circumvent the prescribed layer. This rationale, invisible in the final diff, becomes an explicit and auditable record of the agent’s decision trajectory. The causal reasoning graph (Pillar III) renders this sequence as a node whose stated intent (“direct DB access in controller”) conflicts with the architectural seed, flagging the deviation as a candidate for reviewer attention. A traditional diff-based review would present a syntactically reasonable, test-passing change; the PoE layer reveals that the agent’s reasoning trajectory departed from the system’s architectural invariant, precisely the kind of entropy-producing behaviour that, as discussed in Section 3, compounds silently across iterations and materializes as agentic technical debt.

*Technical Implementation: The Reasoning-Action Loop.* To operationalize PoE, we implement a reasoning–action loop within an instrumented execution environment. This environment acts as a transparent proxy around all tool-mediated interactions, such as file system operations, shell commands, or compiler invocations, allowing each step of agentic activity to be captured in relation to the agent’s intermediate reasoning. Each reasoning segment, tool call, and resulting environmental observation is recorded as a *reasoning trace node*. By linking these nodes into a DAG, the system provides a process-level representation of the agent’s behaviour that complements traditional code diffs. A ‘deviation detector’ compares each node’s stated intent against PoE’s architectural seeds defined in Pillar I, enabling early identification of entropy-inducing divergences in the agent’s plan [[8](#bib.bib10)]. To account for the human side of oversight, the same instrumentation should support a lightweight *cognitive debt index* that estimates how consistently reviewers engage with, and can reconstruct, the agent’s causal chain, helping to signal when human understanding begins to drift [[15](#bib.bib17)]. This implementation supplements existing review workflows by providing a global view of how autonomous actions unfold.

![Refer to caption](../../research/2026/07/31/lenticule-import/computing/software/software-development/agentic-entropy/bibliography/beyond-the-diff-addressing-agentic-entropy-in-agentic-software-development/2604.16323v2/x4.png)
Figure 1: The Process-oriented Explainability (PoE) framework applied to a data‑access caching scenario. The figure illustrates the three pillars: Architectural Seeding, Reasoning Monitoring, and the Causal Reasoning Graph. It highlights how a deviation is detected when a reasoning step directly queries the database, violating the architectural rule. A cognitive debt index monitors reviewer engagement with the causal chain, signalling when human comprehension risks falling below the level required for substantive oversight.

5 Conclusion and Future Work

The HCXAI community must expand beyond localized transparency to address the broader challenge of agentic accountability. This work shows that without effective mitigation, the productivity gains of autonomous agents can be outweighed by the long-term costs of agentic entropy. By shifting attention from execution-level stack traces to intent-level reasoning traces, we offer a way to preserve architectural integrity as software systems evolve.
Critically, the risks we identify are not limited to the codebase itself. As warned by [[12](#bib.bib18), [15](#bib.bib17)], sustained AI delegation erodes the user’s ability to explain, verify, or intervene. In the context of agentic software development, this gap manifests as cognitive debt. Our PoE framework directly targets this dynamic. By making the agent’s causal reasoning chain legible and auditable, it supports what [[15](#bib.bib17)] define as the ‘Cognitive Integrity Threshold’ (CIT), i.e., the minimum level of comprehension required for oversight to remain substantive rather than performative. The cognitive debt index proposed in our implementation operationalizes this threshold in practice, flagging when reviewer engagement with the causal graph drops below a level sufficient to detect architectural drift. Future research should therefore treat cognitive drift as a first-class metric alongside code quality indicators, developing empirical benchmarks for CIT in agentic development contexts and studying how process-level interfaces can actively counteract comprehension decay over time.

Future research should prioritize the development of *Standardized Agentic Traces*, representing a universal, schema-agnostic log format. Such a standard would facilitate interoperability across agents and human-centric audit tools, ensuring that reasoning remains transparent across diverse development environments. In addition, empirical studies are needed to quantify the reduction in cognitive load provided by process-level ‘cognitive debugging’ interfaces compared to traditional code review practices [[5](#bib.bib12)]. Ultimately, the goal of agentic XAI is to shift the human–agent relationship from one of blind trust in velocity to one of shared, verifiable understanding of architectural intent, an understanding that must be actively maintained in both the codebase and the minds of the people who oversee it.

## Acknowledgements

This work was partly conducted within the framework of the EUonAIR Centre of Excellence in Responsible AI and Education. The authors have been supported by a grant from Movetia, which is funded by the Swiss Confederation.

## References

- [1]
O. Amir (2021)

Conveying Agent Behavior to People.

External Links: [Link](https://hcxai.jimdosite.com)

Cited by: [§2](#S2.p1.1).

- [2]
S. Barke, M. B. James, and N. Polikarpova (2023-04)

Grounded Copilot: How Programmers Interact with Code-Generating Models.

Proc. ACM Program. Lang. 7 (OOPSLA1).

External Links: [Document](https://dx.doi.org/10.1145/3586030)

Cited by: [§2](#S2.p1.1),
[§3](#S3.p3.1).

- [3]
DORA Team at Google Cloud (2024-10)

2024 Accelerate State of DevOps.

Annual Research Report

Google Cloud,  Sunnyvale, CA, USA.

External Links: [Link](https://dora.dev/research/2024/dora-report/2024-dora-accelerate-state-of-devops-report.pdf)

Cited by: [§1](#S1.p2.1).

- [4]
X. Du, M. Liu, K. Wang, H. Wang, J. Liu, Y. Chen, J. Feng, C. Sha, X. Peng, and Y. Lou (2024)

Evaluating Large Language Models in Class-Level Code Generation.

In Proceedings of the IEEE/ACM 46th International Conference on Software Engineering,

ICSE ’24, New York, NY, USA.

External Links: [Document](https://dx.doi.org/10.1145/3597503.3639219)

Cited by: [§3](#S3.p3.1).

- [5]
S. Fakhoury, A. Naik, G. Sakkas, S. Chakraborty, M. Musuvathi, and S. Lahiri (2024)

Exploring the Effectiveness of LLM based Test-driven Interactive Code Generation: User Study and Empirical Evaluation.

In Proceedings of the 2024 IEEE/ACM 46th International Conference on Software Engineering: Companion Proceedings,

ICSE-Companion ’24, New York, NY, USA,  pp. 390–391.

External Links: [Document](https://dx.doi.org/10.1145/3639478.3643525)

Cited by: [§2](#S2.p1.1),
[§5](#S5.p2.1).

- [6]
GitClear Research (2025-01)

AI Copilot Code Quality: 2025 Look Back at 12 Months of Data.

GitClear Engineering Insights.

External Links: [Link](https://www.gitclear.com/ai_assistant_code_quality_2025_research)

Cited by: [§3](#S3.p2.1),
[§3](#S3.p4.1).

- [7]
D. Guo, D. Yang, H. Zhang, J. Song, P. Wang, Q. Zhu, R. Xu, R. Zhang, S. Ma, X. Bi, et al. (2025)

DeepSeek-R1 Incentivizes Reasoning in LLMs Through Reinforcement Learning.

Nature 645 (8081),  pp. 633–638.

External Links: [Document](https://dx.doi.org/10.1038/s41586-025-09422-z)

Cited by: [§2](#S2.p1.1),
[§4](#S4.p4.1).

- [8]
A. E. Hassan, H. Li, D. Lin, B. Adams, T. Chen, Y. Kashiwa, and D. Qiu (2025)

Agentic Software Engineering: Foundational Pillars and a Research Roadmap.

External Links: 2509.06216

Cited by: [§2](#S2.p1.1),
[§4](#S4.p3.1),
[§4](#S4.p6.1).

- [9]
S. Huang, B. Seethor, E. Durmus, K. Handa, M. McCain, M. Stern, and D. Ganguli (2025-12-02)

How AI Is Transforming Work at Anthropic.

External Links: [Link](https://anthropic.com/research/how-ai-is-transforming-work-at-anthropic)

Cited by: [§1](#S1.p1.1).

- [10]
S. Kabir, D. N. Udo-Imeh, B. Kou, and T. Zhang (2024)

Is Stack Overflow Obsolete? An Empirical Study of the Characteristics of ChatGPT Answers to Stack Overflow Questions.

In Proceedings of the 2024 CHI Conference on Human Factors in Computing Systems,

CHI ’24, New York, NY, USA.

External Links: [Document](https://dx.doi.org/10.1145/3613904.3642596)

Cited by: [§3](#S3.p2.1).

- [11]
S. Khoo, J. Foo, and R. K. Lee (2025)

With Great Capabilities Come Great Responsibilities: Introducing the Agentic Risk & Capability Framework for Governing Agentic AI Systems.

External Links: 2512.22211

Cited by: [§2](#S2.p1.1).

- [12]
N. Kosmyna, E. Hauptmann, Y. T. Yuan, J. Situ, X. Liao, A. V. Beresnitzky, I. Braunstein, and P. Maes (2025)

Your Brain on ChatGPT: Accumulation of Cognitive Debt when Using an AI Assistant for Essay Writing Task.

External Links: 2506.08872

Cited by: [§1](#S1.p2.1),
[§3](#S3.p1.1),
[§5](#S5.p1.1).

- [13]
M. M. Lehman (1980)

Programs, Life Cycles, and Laws of Software Evolution.

Proceedings of the IEEE 68 (9),  pp. 1060–1076.

External Links: [Document](https://dx.doi.org/10.1109/PROC.1980.11805)

Cited by: [§2](#S2.p1.1).

- [14]
H. Li, H. Zhang, and A. E. Hassan (2025)

The Rise of AI Teammates in Software Engineering (SE) 3.0: How Autonomous Coding Agents Are Reshaping Software Engineering.

External Links: 2507.15003

Cited by: [§1](#S1.p1.1).

- [15]
F. Lin, Q. Ge, L. Xu, P. Li, X. Gao, S. Xing, K. Yamada, Z. Zhang, H. Zhang, and Z. Tu (2026)

Position: Human-Centric AI Requires a Minimum Viable Level of Human Understanding.

External Links: 2602.00854

Cited by: [§1](#S1.p2.1),
[§4](#S4.p4.1),
[§4](#S4.p6.1),
[§5](#S5.p1.1).

- [16]
S. Raza, R. Sapkota, M. Karkee, and C. Emmanouilidis (2025)

TRiSM for Agentic AI: A Review of Trust, Risk, and Security Management in LLM-based Agentic Multi-Agent Systems.

External Links: 2506.04133

Cited by: [§2](#S2.p1.1).

- [17]
R. Singh, U. Ehsan, M. Cheong, M. O. Riedl, and T. Miller (2021)

LEx: A Framework for Operationalising Layers of AI Explanations.

External Links: [Link](https://hcxai.jimdosite.com)

Cited by: [§2](#S2.p1.1),
[§4](#S4.p2.1).

- [18]
J. Wei, X. Wang, D. Schuurmans, M. Bosma, B. Ichter, F. Xia, E. H. Chi, Q. V. Le, and D. Zhou (2022)

Chain-of-Thought Prompting Elicits Reasoning in Large Language Models.

In Proceedings of the 36th International Conference on Neural Information Processing Systems,

NIPS ’22, Red Hook, NY, USA.

External Links: [Document](https://dx.doi.org/10.5555/3600270.3602070)

Cited by: [§2](#S2.p1.1).
