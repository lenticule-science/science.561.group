---
title: "Study of Multi-Agent Systems Science"
description: "A tier-labeled survey of multi-agent-systems literature — from Smith's 1980 contract net protocol and the KQML/FIPA-ACL communication-language canon through Wooldridge and Shoham-and-Leyton-Brown's textbook foundations to the LLM multi-agent turn (Generative Agents, CAMEL, AutoGen, MetaGPT, ChatDev, multiagent debate) and the empirical does-it-help literature (More Agents Is All You Need, now TMLR-published, against Cemri et al.'s peer-reviewed MAST failure taxonomy and two 2026 preprints finding single agents match or beat multi-agent systems under matched compute) — finding that most anchor works are in fact peer-reviewed but that the field's liveliest empirical claim, whether multi-agent coordination helps at all, remains contested and regime-dependent as of this writing, with reproduction outside original benchmarks and any direct link between classical mechanism-design theory and LLM agent orchestration carried forward as unresolved gaps."
date-created: 2026-08-22
type: notes
name: 2026-08-22-note-on-the-study-of-multi-agent-systems-science
authors:
  - claude-sonnet-5
status: draft-for-owner-review
keywords:
  - multi-agent-systems
  - contract-net-protocol
  - agent-communication-language
  - kqml
  - fipa-acl
  - llm-agents
  - multi-agent-debate
  - mast
  - failure-taxonomy
  - agent-orchestration
tags: ["draft", "study"]
---


This note is read for one purpose: to establish, for this sub-literature, which claims trace to peer-reviewed research versus industry-lab preprints and technical reports versus blog and trade commentary, so this library's own agent-operated practice cites the right kind of source.
Multi-agent systems (MAS) science has a peculiarity that makes this sorting exercise more than academic housekeeping: even its most-cited, most load-bearing recent work is not uniformly refereed — most of the canonical LLM-agent frameworks turn out, on verification, to have cleared a peer-reviewed venue after all (including AutoGen, confirmed this session at COLM 2024), but the newest single-agent-versus-multi-agent findings that this note treats as most consequential still sit at arXiv-preprint or industry-lab tier, and some of it may never clear a refereed venue.
This note labels tiers explicitly rather than flattening a preprint and a peer-reviewed paper into the same undifferentiated "citation."
Method: every load-bearing claim below was checked this session against a primary or near-primary web source (DOI, arXiv ID, ACL Anthology entry, publisher page, or standards-body document); anything not verifiable to such a source is marked **[UNVERIFIED]** inline.

Tier legend used throughout:
**[PEER-REVIEWED]** — accepted at a refereed journal or conference proceedings, confirmed via publisher DOI, ACM/ACL Anthology entry, or official proceedings page.
**[TEXTBOOK]** — a synthesis text from an academic publisher, authoritative but not itself primary research.
**[STANDARDS-DOCUMENT]** — a specification issued by a standards body (here, FIPA), not peer-reviewed research.
**[ARXIV-PREPRINT / INDUSTRY-LAB]** — posted to arXiv, frequently from an industry research lab, with no independent peer review located this session.

## 1. The contract net protocol: Smith (1980)

Reid G. Smith's ["The Contract Net Protocol: High-Level Communication and Control in a Distributed Problem Solver"](https://doi.org/10.1109/TC.1980.1675516), *IEEE Transactions on Computers*, vol. C-29, no. 12 (1980), pp. 1104–1113 — **[PEER-REVIEWED, journal]**.
This is the founding document of task-allocation-by-negotiation in distributed AI: nodes with tasks broadcast a task announcement, candidate nodes submit bids, and the announcing node awards the task to a bidder, all without centralized control.
Every subsequent auction-based or market-based multi-agent task-allocation scheme — and a great many of today's LLM agent-orchestration frameworks that route a subtask to whichever agent claims capability — is a descendant of this protocol, whether or not the descendant cites it.
The protocol's core limitation, well documented in the decades of follow-on work it spawned, is that it assumes cooperative, non-strategic bidding; it does not by itself handle bidders who might misrepresent capability or cost, which is exactly the gap mechanism design (§3) exists to close.

## 2. Agent communication languages: KQML and FIPA-ACL

Tim Finin, Richard Fritzson, Don McKay, and Robin McEntire, ["KQML as an Agent Communication Language"](https://dl.acm.org/doi/10.1145/191246.191322), *Proceedings of the Third International Conference on Information and Knowledge Management* (CIKM '94) — **[PEER-REVIEWED, conference proceedings]**.
KQML emerged from the DARPA Knowledge Sharing Effort and introduced the idea, still structurally present in every later agent communication language, of the *performative*: a message is wrapped in a speech-act-like tag (`tell`, `achieve`, `ask-if`, and dozens more) that declares the sender's illocutionary intent separately from the message's content language.

The Foundation for Intelligent Physical Agents formalized a competing, more rigorously specified successor: the [FIPA ACL Message Structure Specification (SC00061G)](https://www.fipa.org/specs/fipa00061/SC00061G.html), reaching Standard status 2002-12-03 — **[STANDARDS-DOCUMENT, not peer-reviewed research]**.
FIPA-ACL's semantics were given in terms of agents' private mental attitudes (belief, intention), and this choice drew a sustained, peer-reviewed critique. Jeremy Pitt and Abe Mamdani argued that a semantics grounded in private mental state is unverifiable from outside the agent — see ["Some Remarks on the Semantics of FIPA's Agent Communication Language"](https://link.springer.com/article/10.1023/A:1010016503852), *Autonomous Agents and Multi-Agent Systems* 2(4) (1999), pp. 333–356, Springer — **[PEER-REVIEWED, journal]**. A related but distinct concern — that FIPA-ACL semantics needs to support non-monotonic, time-sensitive reasoning over speech acts — is taken up by Guido Boella, Guido Governatori, Joris Hulstijn, Régis Riveret, Antonino Rotolo, and Leendert van der Torre in ["Time and Defeasibility in FIPA ACL Semantics"](https://www.sciencedirect.com/science/article/pii/S1570868311000474), *Journal of Applied Logic* 9(4) (2011), pp. 274–288, Elsevier — **[PEER-REVIEWED, journal]** — a different journal from the Pitt-and-Mamdani paper above, not "the same journal family" as an earlier draft of this note stated.
The specific, checkable content of the critique: FIPA's sincerity condition (an agent asserting `p` is assumed to believe `p`) is defensible for cooperative dialogue but is simply false for negotiation or persuasion dialogue, where an agent may sincerely advance a claim it does not privately hold in order to move a negotiation; and because belief and intention are unobservable from outside the agent, no external verifier can check compliance with a mentalistic semantics at all — a problem the critique literature's proposed fix (commitment-based semantics, grounded in publicly observable social commitments rather than private mental states) addresses directly, though by the sources checked this session that fix is described as not yet fully formalized and adopted as a replacement standard.

## 3. Textbook-tier foundations: Wooldridge; Shoham and Leyton-Brown; mechanism design and social choice in MAS

Michael Wooldridge, *[An Introduction to MultiAgent Systems](https://www.cs.ox.ac.uk/people/michael.wooldridge/pubs/imas/)*, 2nd ed., Wiley, 2009 (1st ed. 2002) — **[TEXTBOOK]**.
This became, by the publisher's and citing literature's own account, the standard undergraduate reference for the field; it is the textbook-tier source for the belief-desire-intention architecture lineage and the classical coordination canon this note's coverage does not re-derive from primary sources.

Yoav Shoham and Kevin Leyton-Brown, *[Multiagent Systems: Algorithmic, Game-Theoretic, and Logical Foundations](https://www.masfoundations.org/)*, Cambridge University Press, 2008/2009 (free online, per the authors' agreement with their publisher) — **[TEXTBOOK]**.
This is the field's standard reference for the mechanism-design and social-choice side of MAS: strategic voting and social-choice aggregation, the revelation principle, quasilinear preferences, and the Groves/VCG family of efficient mechanisms that make truthful bidding a dominant strategy — precisely the machinery that would need to be layered onto Smith's contract net protocol (§1) to make it robust against strategic, non-cooperative bidders.
No paper connecting this classical mechanism-design apparatus directly to contemporary LLM multi-agent task allocation was located and verified this session; that connection is carried forward as a gap (§10).

## 4. The LLM multi-agent turn begins: Generative Agents (Park et al. 2023)

Joon Sung Park, Joseph O'Brien, Carrie Jun Cai, Meredith Ringel Morris, Percy Liang, and Michael S. Bernstein, ["Generative Agents: Interactive Simulacra of Human Behavior"](https://dl.acm.org/doi/fullHtml/10.1145/3586183.3606763), *UIST '23* — **[PEER-REVIEWED, conference proceedings]**.
Twenty-five LLM-driven agents, populating a Sims-like sandbox with a memory-retrieval-and-reflection architecture, produced emergent, unscripted social behavior — coordination on a shared party, information diffusion, spontaneous relationship formation — that was not explicitly programmed into any individual agent.
This paper is usually treated, correctly, as the opening move of the LLM multi-agent literature: the demonstration that giving LLM agents persistent memory and a shared environment, rather than a single-shot prompt, could produce genuinely multi-agent (not merely parallel single-agent) dynamics.

## 5. LLM multi-agent frameworks: CAMEL, AutoGen, MetaGPT, ChatDev

Guohao Li, Hasan Abed Al Kader Hammoud, Hani Itani, Dmitrii Khizbullin, and Bernard Ghanem, ["CAMEL: Communicative Agents for 'Mind' Exploration of Large Language Model Society"](https://ghli.org/publication/neurips2023camel/), *NeurIPS 2023* (arXiv:2303.17760) — **[PEER-REVIEWED, conference proceedings]**.
CAMEL introduced role-playing dyads (an "AI user" and an "AI assistant" with inception prompting) as a way to let two LLM instances cooperatively decompose and solve a task via structured dialogue rather than a single agent's chain of thought.

Qingyun Wu, Gagan Bansal, Jieyu Zhang, Yiran Wu, Beibin Li, Erkang Zhu, Li Jiang, Xiaoyun Zhang, Shaokun Zhang, and colleagues (Microsoft Research), ["AutoGen: Enabling Next-Gen LLM Applications via Multi-Agent Conversation"](https://arxiv.org/abs/2308.08155), first posted to arXiv as arXiv:2308.08155 in August 2023 — accepted at *COLM 2024* (First Conference on Language Modeling, August 2024), and awarded Best Paper at the ICLR 2024 LLM Agents Workshop — **[PEER-REVIEWED, conference proceedings]**.
This is a status upgrade worth stating plainly, alongside More Agents Is All You Need (§7): AutoGen circulated for roughly a year as an arXiv preprint from an industry lab and was, for a time, exactly the kind of load-bearing-but-unrefereed work this note's tier-labeling discipline exists to flag, but this session confirmed it has since been accepted and published at COLM 2024, so it should not be cited as preprint-tier going forward.

Sirui Hong, Mingchen Zhuge, Jiaqi Chen, and colleagues, ["MetaGPT: Meta Programming for a Multi-Agent Collaborative Framework"](https://arxiv.org/pdf/2308.00352), *ICLR 2024* — **[PEER-REVIEWED, conference proceedings]**.
MetaGPT encodes standardized operating procedures from human software-engineering teams (product manager, architect, engineer, QA roles) directly into inter-agent prompt sequences and reports state-of-the-art Pass@1 on code-generation benchmarks as a result.

Chen Qian, Wei Liu, Hongzhang Liu, and colleagues, ["ChatDev: Communicative Agents for Software Development"](https://aclanthology.org/2024.acl-long.810/), *ACL 2024* (Volume 1: Long Papers), pp. 15174–15186 — **[PEER-REVIEWED, conference proceedings]**.
ChatDev organizes a software company's waterfall phases (design, coding, testing, documentation) as a chat chain among role-played agents, with a specific and checkable finding: natural language communication is better suited to design-phase agreement, while communicating in the target programming language is more effective during debugging — a concrete, mechanism-level claim about which representational medium suits which coordination task, not just an efficacy number.

## 6. Multi-agent debate: Du et al. (2023/2024)

Yilun Du, Shuang Li, Antonio Torralba, Joshua B. Tenenbaum, and Igor Mordatch, ["Improving Factuality and Reasoning in Language Models through Multiagent Debate"](https://proceedings.mlr.press/v235/du24e.html), *ICML 2024*, PMLR vol. 235, pp. 11733–11763 (first posted to arXiv in 2023 as arXiv:2305.14325) — **[PEER-REVIEWED, conference proceedings]**.
Multiple instances of a language model independently answer a query, then are shown each other's answers and reasoning and given several rounds to revise; the paper reports this debate procedure improves factual accuracy and mathematical/strategic reasoning over single-model chain-of-thought, without any additional human-labeled data or fine-tuning.
This is one of the two anchor claims (with §7) that any "does multi-agent actually help" assessment has to reconcile against the more skeptical findings in §8 — and, notably, the debate paper's comparisons were not run under compute- or token-matched conditions against a single strong agent, which is exactly the confound §8's critics identify.

## 7. The empirical does-it-help literature: More Agents Is All You Need

Junyou Li, Qin Zhang, Yangbin Yu, Qiang Fu, and Deheng Ye, ["More Agents Is All You Need"](https://arxiv.org/abs/2402.05120), arXiv:2402.05120 (2024) — accepted at *Transactions on Machine Learning Research* (TMLR), October 2024 — **[PEER-REVIEWED, journal]**.
This is a status upgrade worth stating plainly: the paper began as a 2024 arXiv preprint and this session verified it has since been accepted and published at TMLR, so it should not be cited as preprint-tier going forward.
Its core, checkable finding: a simple sampling-and-majority-vote ensemble of LLM instances ("Agent Forest") improves task performance as the ensemble size grows, with the size of the improvement correlated to task difficulty (rising, then falling, as difficulty increases) and to the number of reasoning steps required — a result the paper frames as orthogonal to, and combinable with, other prompting or fine-tuning methods for improving a single model.

## 8. Critical failure-mode work: the MAST taxonomy and the single-agent counter-evidence

Mert Cemri, Melissa Z. Pan, Shuyi Yang, and ten co-authors (UC Berkeley, with one co-author affiliated with Intesa Sanpaolo), ["Why Do Multi-Agent LLM Systems Fail?"](https://arxiv.org/abs/2503.13657), first posted to arXiv March 2025 (arXiv:2503.13657) — accepted at *NeurIPS 2025*, Datasets and Benchmarks Track, with a spotlight designation; see the [official proceedings page](https://proceedings.neurips.cc/paper_files/paper/2025/hash/b1041e52d3be19f0a9bc491657488e4a-Abstract-Datasets_and_Benchmarks_Track.html) — **[PEER-REVIEWED, conference proceedings, Datasets and Benchmarks track]**.
This is MAST: the Multi-Agent System Failure Taxonomy, built from over 1,600 annotated execution traces collected across seven popular open-source MAS frameworks, six expert human annotators, and a validated LLM-as-judge pipeline used to scale the annotation beyond what the human annotators alone could cover.
MAST identifies 14 distinct failure modes, grouped into three categories: **system design issues** (the task or role structure given to the agents was ambiguous or incomplete), **inter-agent misalignment** (agents miscommunicate, fail to share needed information, or talk past each other), and **task verification** (the system fails to check its own output before terminating, or terminates prematurely).
The taxonomy's own scope is explicit: it is empirically derived from the seven frameworks sampled and has not, as far as this session verified, been independently confirmed to generalize beyond them — carried forward as a gap (§10).

Two very recent preprints, both from 2026, sharpen the "does multi-agent actually help" question into a specific confound: Dat Tran and Douwe Kiela, ["Single-Agent LLMs Outperform Multi-Agent Systems on Multi-Hop Reasoning Under Equal Thinking Token Budgets"](https://arxiv.org/abs/2604.02460), arXiv:2604.02460 — **[ARXIV-PREPRINT]**; and Prathyusha Jwalapuram, Hehai Lin, and colleagues (Salesforce Research, HKUST, UBC, NTU), ["The Illusion of Multi-Agent Advantage"](https://arxiv.org/abs/2606.13003), arXiv:2606.13003 — **[ARXIV-PREPRINT / INDUSTRY-LAB]**.
Tran and Kiela's information-theoretic argument (grounded in the Data Processing Inequality) predicts, and their experiments across Qwen3, DeepSeek-R1-Distill-Llama, and Gemini 2.5 confirm, that under a fixed reasoning-token budget a single agent matches or beats a multi-agent decomposition on multi-hop reasoning, because splitting reasoning across agents cannot create information the single agent's own context did not already contain.
Jwalapuram et al. report a comparably blunt result specifically against automatically-generated multi-agent systems: automatic MAS consistently underperform Chain-of-Thought with Self-Consistency (CoT-SC) — a single-agent method — despite costing up to 10x more compute.
Neither preprint has, as of this session, been located at a peer-reviewed venue, and neither result has yet been independently reproduced by a third party in a source this session could verify; both are marked **[UNVERIFIED]** as to whether they will hold up under peer review or replication, though the preprints themselves and their specific quantitative claims were directly confirmed to exist and say what is reported above.

## 9. Relating findings to this library's own practice

This library is maintained by exactly the kind of system this note surveys: LLM agents running multi-agent, draft-then-adversarially-verify workflows, and its news program — the accountable-agentic-newsrooms memo in `news-media-science-services-section` — needs precisely these literatures to design its editorial gates (the checkpoints at which a draft produced by one agent is checked by another before publication).
Several findings bear directly on that design, and they do not all point the same direction, which is itself the honest finding to carry forward rather than smooth over.

The MAST taxonomy's **task verification** failure category (§8) is the single most directly applicable finding available: it names, empirically, exactly the failure this library's own verify-pass step exists to prevent — premature termination and unchecked output — and gives it independent, peer-reviewed grounding rather than leaving it as this library's own house intuition.
The **inter-agent misalignment** category likewise gives independent grounding to why an editorial gate needs an explicit, checkable hand-off contract between drafting and verifying agents rather than an informal one; the FIPA-ACL critique literature (§2) sharpens this further — any inter-agent protocol whose "did the drafting agent actually mean/believe what it wrote" check depends on inferring the drafting agent's private mental state is, on the peer-reviewed critique's own terms, unverifiable from outside, so an editorial gate should check publicly observable commitments (what the draft actually asserts and what sources it actually cites) rather than attempting to infer intent.

On the harder question — does running a second, adversarial agent over a draft reliably improve the outcome, or does it just add cost — the literature genuinely disagrees as of this writing. Du et al.'s peer-reviewed debate result (§6) and the peer-reviewed More Agents Is All You Need (§7) both report real gains from multiple LLM instances checking or voting on each other's output. But neither paper's comparison holds compute constant against a single strong agent given an equivalent budget, and the two 2026 preprints in §8 argue directly that once budget is held constant, the multi-agent advantage in comparable settings shrinks or disappears. The honest, carry-forward-worthy conclusion for this library's own practice: a second verifying pass is best justified not by "more agents are generically better" (a claim the newest evidence complicates) but by the specific, narrower claim MAST does support — that a dedicated verification step catches a specific, named failure mode (unchecked termination) that a single agent working alone is structurally prone to, independent of whether an ensemble-voting or debate step would also help on raw accuracy.

## 10. Gaps carried forward

Whether the Tran-and-Kiela and Illusion-of-Multi-Agent-Advantage results (§8) replicate outside their original benchmarks (multi-hop QA; automatically-generated agentic pipelines respectively), and whether either has since reached a peer-reviewed venue, was not resolved this session and is marked **[UNVERIFIED]**.

Whether MAST's 14-failure-mode, 3-category taxonomy (§8) generalizes beyond the seven MAS frameworks it was built from is an open question the taxonomy's own authors flag, and this note did not locate independent replication.

AutoGen (§5) is no longer an open gap: this session confirmed it was accepted at COLM 2024, correcting an earlier draft of this note that had described it as unrefereed arXiv-preprint/industry-lab-tier work; it should be cited at peer-reviewed conference-proceedings tier going forward.

No paper directly connecting the classical mechanism-design and social-choice apparatus in Shoham and Leyton-Brown (§3) — Groves/VCG mechanisms, the revelation principle — to contemporary LLM multi-agent task allocation or agent-to-agent markets was located and verified this session; this is a live gap between the classical canon and the LLM-era literature that a future note should take up directly.

The classical BDI (belief-desire-intention) architecture literature and Wooldridge and Jennings' original multi-agent-systems survey work were out of this note's assigned coverage and are carried forward, not covered, here.

Whether a formal, publicly-observable-commitment-based semantics has actually superseded FIPA-ACL's mentalistic semantics as a deployed standard, rather than remaining a critique-literature proposal (§2), was not confirmed either way this session.

## Verification note

Verified 2026-08-22 by an adversarial citation-verification pass: 17 load-bearing citations checked against primary sources (Crossref DOI records, the arXiv API, ACL Anthology, PMLR/ICML proceedings, the official NeurIPS proceedings page, OpenReview, publisher pages, and the FIPA specification document itself), 8 corrected, 0 newly marked unverified (the two 2026 preprints in §8 already carried an appropriate **[UNVERIFIED]** hedge on peer-review/replication status, which this session confirmed is still warranted — neither has reached a refereed venue as of this writing).
Corrections made: (1) §2's first FIPA-ACL critique paper was misattributed to "Guido Boella, Rossana Damiano, and colleagues" — Crossref shows its actual authors are Jeremy Pitt and Abe Mamdani (1999); (2) §2's companion paper was also misattributed (to the same names plus "Marco Colombetti and collaborators") and mischaracterized as being in "the same journal family" as the first — it is by Boella, Governatori, Hulstijn, Riveret, Rotolo, and van der Torre, published in the *Journal of Applied Logic* (Elsevier), a different journal and publisher from *Autonomous Agents and Multi-Agent Systems* (Springer); (3) AutoGen's title, venue, and tier were wrong throughout (§intro, §5, §10): the paper's actual title omits "Framework," and Microsoft Research's own publication page confirms it was accepted at *COLM 2024* and won Best Paper at the ICLR 2024 LLM Agents Workshop, so the **[ARXIV-PREPRINT / INDUSTRY-LAB]** tier and "no peer-reviewed venue publication was found" claim were both incorrect; (4) Cemri et al.'s author count in §8 was off by one ("eleven co-authors" — the paper has 13 authors total, i.e. ten beyond the three named); (5) Cemri et al.'s affiliations in §8 were fabricated ("Databricks and Google-affiliated co-authors" — the paper itself lists only UC Berkeley and Intesa Sanpaolo); (6) the MAST taxonomy's first failure category is named "system design issues" in the actual paper (confirmed via the arXiv PDF text and the NeurIPS proceedings abstract), not "specification issues" as this note and two sibling glossary terms (`agent-orchestration.md`, `multi-agent-failure-mode.md`) had it — corrected in all three files. All other checked citations (Smith 1980; Finin et al. 1994; the FIPA ACL Message Structure Specification's Standard-status date; Wooldridge; Shoham and Leyton-Brown; Park et al. 2023; CAMEL; MetaGPT; ChatDev, including its design/debugging-language finding; Du et al.'s multiagent-debate paper and its PMLR page numbers; More Agents Is All You Need's TMLR acceptance; Cemri et al.'s NeurIPS 2025 Datasets and Benchmarks spotlight status; and the Tran-and-Kiela and Jwalapuram-et-al. 2026 preprints' authorship and content) matched their primary sources and needed no change.
