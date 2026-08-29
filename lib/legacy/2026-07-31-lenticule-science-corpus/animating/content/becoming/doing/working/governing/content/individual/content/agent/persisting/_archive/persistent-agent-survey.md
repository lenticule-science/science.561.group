# Persistent Autonomous AI Agents

## Abstract

The scientifically interesting object behind the current “AI agent” discourse is not a product category but a class of systems: artificial processes that unfold over time under partial observability, retain and transform state, invoke tools or networks, and preserve enough continuity that later behavior depends on earlier interactions.
Classical mathematics already gives pieces of this picture through partially observable Markov decision processes, stochastic control, temporally abstract reinforcement learning, online learning, stochastic games, and decentralized control.
Contemporary LLM-based systems add two difficult ingredients: natural-language policies whose internal computations are only weakly modeled, and externally stored mutable memory that changes the agent’s effective state across sessions.
The result is that modern persistent agents sit at the intersection of control theory, databases, distributed systems, computer security, formal methods, and mechanism design. citeturn1search0turn1search2turn2search2turn2search7turn27search0turn0search0turn0search3

The literature now supports several robust conclusions.
First, persistence changes the mathematical object: a session-bound assistant can often be modeled as an episodic policy over a prompt, while a persistent agent is better viewed as a continuing, stateful, partially observed dynamical system with durable memory, exogenous events, permissions, and recovery semantics.
Second, “memory” is not one thing: current systems mix working memory, episodic traces, semantic stores, procedural skills, summaries, and self-models, usually through heuristic write/read/compress pipelines rather than principled filtering or optimal control.
Third, current long-horizon agent behavior is driven more by prompt engineering, search heuristics, role decomposition, and runtime scaffolding than by mature theory.
Fourth, server, web, API, and blockchain deployment contexts differ mainly in their side-effect models, trust boundaries, and reversibility.
Finally, evaluation and safety science remain much weaker than performance demos: benchmarks measure short-run task completion far better than persistence, degradation, cumulative risk, or real-world reliability.
A serious theory of persistent autonomous AI agents would therefore need to explain not just cognition or planning, but durable identity, memory integrity, runtime semantics, adversarial environments, and governance over open-ended time. citeturn0search2turn4search3turn29search1turn7search0turn11search0turn14search3turn16search7turn20search12

## Conceptual framework

In contemporary research, the word *agent* is used in at least three partially incompatible ways.
In game theory and economics, an agent is any strategic decision-maker.
In distributed systems, an agent may simply be a long-running process or service.
In LLM research, an agent is usually a language model wrapped with prompting, memory, tools, and an execution loop.
The common mathematical core is narrower and more useful: an agent is a policy-bearing system that receives observations, updates internal state, and emits actions into an environment whose true state is only partially observed.
Classical POMDP and stochastic-game formalisms already capture partial information, time extension, and action-dependent state transitions; classical multi-agent theory and decentralized control explain why the problem becomes much harder when information and control are distributed. citeturn1search0turn2search2turn2search7turn2search15turn2search8

A useful synthesis is to model a persistent autonomous agent as a tuple \[ \mathcal A=(\mathcal S,\mathcal O,\mathcal T,\mathcal M,\mathcal D,\pi,U,R,\Sigma,\iota), \] where \(s_t\in\mathcal S\) is the latent environment state; \(o_t\in\mathcal O\) is the observation; \(a_t\in\mathcal A\) and optional tool call \(c_t\in\mathcal T\) are outward actions; \(m_t\in\mathcal M\) is volatile internal state; \(d_t\in\mathcal D\) is durable state; \(\pi\) is the action-selection policy; \(U\) is the write/update operator on memory; \(R\) is the recovery map that reconstructs running state after restarts; \(\Sigma\) denotes scheduler and runtime constraints; and \(\iota\) is the agent’s externally legible identity, such as a service principal, account, or key.
Then \[ o_t \sim \Omega(\cdot\mid s_t), \qquad (a_t,c_t)\sim \pi(\,\cdot\mid h_t,m_t,d_t,g_t\,), \qquad d_{t+1}=U(d_t,o_t,a_t,c_t,y_t,\tau_t), \] where \(h_t\) is interaction history, \(y_t\) tool output, \(g_t\) goals, and \(\tau_t\) wall-clock or event time.
This is not a standard textbook object, but it is the natural closure of POMDP control with external memory, tools, and durable execution. citeturn1search0turn26search2turn0search0turn11search0turn24search1

This framing clarifies what changes when an agent is persistent rather than session-bound.
A session-bound chatbot begins from a near-empty state on each interaction and is usually evaluated episode by episode.
A persistent agent instead faces a continuing task: it may wake on timers or external triggers, inherit durable memory, possess outstanding commitments, survive crashes, and act in environments whose relevant state evolves while the model is idle.
In reinforcement-learning language, the natural objective shifts from short episodic return to continuing performance measures such as discounted infinite-horizon value or average reward per step.
In distributed-systems language, the agent becomes a fault-tolerant workflow with state restoration, retries, idempotence problems, and external side effects. citeturn26search0turn26search8turn24search1turn24search2turn11search0

The connection to temporally abstract control is equally important.
Modern agents rarely act at the granularity of atomic environment actions alone; they also choose plans, subgoals, tool calls, browser macros, code snippets, or reusable skills.
This is much closer to the options and semi-MDP view of hierarchical reinforcement learning than to a flat action model.
Classical options and MAXQ gave mathematically explicit treatments of temporally extended actions and hierarchies; modern agent systems rediscover these ideas in the form of tool APIs, skill libraries, and planner-executor splits.
The novelty is that the decision interface is often natural language or code rather than a fixed symbolic action schema. citeturn1search2turn1search11turn10search3turn28search0turn9search2

When multiple persistent agents interact, the natural model is no longer a single POMDP but a decentralized POMDP, partially observable stochastic game, or repeated online-learning process.
Classical results already show a sharp computational jump: exact decentralized control is doubly exponential in the worst case, and strategic interaction introduces equilibrium and regret questions that are absent in single-agent episodic tasks.
This matters because many current “multi-agent” LLM systems effectively replace hard decentralized control with human-designed communication protocols, role prompts, or assembly-line decompositions.
Such systems can work empirically, but their coordination often comes from scaffolding rather than from learned or provably efficient decentralization. citeturn2search7turn26search14turn3search1turn9search0turn9search2turn9search3

A final conceptual point is that identity over time is not the same as model weights.
For a persistent agent, continuity is usually carried by a package: durable memories, credentials, policy/configuration, version history, and external identifiers.
A server restart with restored state may still count as “the same” agent; a silent policy update with the same name may not.
Existing literatures provide fragments of this idea — persistent processes in systems, decentralized identifiers in Web standards, and finite-memory controllers in POMDPs — but there is no accepted mathematical criterion for sameness of an autonomous AI agent across time, failure, migration, upgrade, or delegated authority.
That gap is one of the central scientific problems. citeturn1search0turn16search1turn18search7turn24search1turn25search0

## Memory, continuity, and identity

In agent research, *memory* is overloaded.
At minimum one must distinguish parametric memory in model weights, the context window passed to a single inference call, and nonparametric external memory that can be explicitly written, indexed, retrieved, summarized, or deleted.
Retrieval-augmented generation and RETRO showed that nonparametric memory can be coupled to language generation, but those systems were not yet full persistent agents: their memories were mostly passive corpora queried for one response.
In persistent agent architectures, by contrast, memory is endogenous.
The agent decides what to store from its own experience, what to retrieve later, and how that information should shape future action.
That is a different scientific object from ordinary long-context prompting. citeturn5search0turn5search1turn5search2turn0search3

A useful functional decomposition maps well onto both classical cognitive architectures and modern agent systems. *Working memory* is the currently attended prompt, scratchpad, or tool state. *Episodic memory* stores timestamped traces of interactions or events. *Semantic memory* stores distilled facts, preferences, and world knowledge independent of the original episode. *Procedural memory* stores reusable skills, code, or options. *Self-models* store higher-level summaries of the agent’s persona, goals, or constraints.
ACT-R and Soar already separated declarative and procedural memory, and Soar further distinguished episodic from semantic memory.
Modern agent papers reinstantiate these categories using vector stores, key-value databases, summaries, knowledge graphs, and skill libraries. citeturn4search1turn4search0turn4search8turn0search2turn28search0turn6search4

Representative LLM-agent memory systems differ mainly in write policy, indexing structure, and consolidation strategy.
Generative Agents stored a “memory stream” of natural-language observations and retrieved memories using a weighted combination of recency, relevance, and importance, then produced higher-level reflections that acted as compressed abstractions.
MemGPT introduced explicit management across memory tiers, treating the context window as scarce fast memory and external stores as slower durable memory.
MemoryBank used forgetting-curve-inspired update rules.
LongMem focused on architectural augmentation for extremely long nonparametric memory.
A-MEM and AriGraph moved toward structured memory networks and graph world models, arguing that flat text logs are weak substrates for reasoning and planning.
These systems show a convergent design pattern, but not yet a settled theory. citeturn0search2turn0search3turn4search2turn5search2turn6search2turn6search4

Mathematically, most current retrieval systems implement something like \[ \operatorname{Read}(q_t,d_t)=\operatorname{TopK}_{x\in d_t} k(q_t,x), \] where the score \(k\) is some heuristic mixture of semantic similarity, temporal recency, salience, and sometimes source type or trust level.
Compression is similarly heuristic: \[ d_{t+1}= \operatorname{Consolidate}(d_t \cup \text{new events}), \] often via summarization, clustering, reflection, or graph linking.
Very few systems optimize write/read decisions end-to-end under a control-theoretic objective; most are engineered pipelines with hand-chosen thresholds, chunk sizes, and update policies.
The empirical gains are real, but the mathematics is still closer to information-retrieval heuristics and systems design than to optimal filtering or principled belief-state compression. citeturn0search2turn0search3turn4search10turn6search2turn25search3

This is why context windows should not be confused with memory.
A large context window can delay forgetting, but it does not by itself solve selective retention, provenance, contradiction, or cross-session update.
Long-term memory benchmarks make this explicit.
LoCoMo was designed around conversations spanning many sessions and measures not just question answering but event summarization and multimodal generation.
LongMemEval decomposes long-term chat memory into information extraction, multi-session reasoning, temporal reasoning, knowledge updates, and abstention, and reports large drops for existing assistants and long-context models under sustained interactions.
Newer benchmarks such as LoCoMo-Plus and LongMemEval-V2 push toward beyond-factual constraints and much deeper histories, but they also underscore how early the field still is. citeturn29search0turn29search1turn4search15turn5search3turn5search7

Procedural memory deserves special emphasis because it is where memory and control meet.
Voyager’s editable skill library stores executable code snippets that can be retrieved and recomposed in future Minecraft tasks.
In classical terms, these skills behave like options: temporally extended policies that can be reused across contexts.
This is one of the clearest modern examples of persistent capability accumulation rather than mere contextual recall.
It also illustrates a core scientific challenge: if an agent is allowed to accumulate procedures from experience, then long-term competence depends on memory curation, versioning, and verification, not only on one-step reasoning quality. citeturn28search0turn1search2turn1search11

Consistency and identity are the hardest memory questions.
Event logs preserve provenance but scale poorly; summaries compress but can erase causal structure; vector stores retrieve semantically related passages but may surface stale or contradictory items; graph memories improve relational reasoning but add schema-maintenance burdens.
Personalized assistants and web agents also face the problem of *knowledge update*: which preference or fact should supersede which earlier one, and how should abstention work when the memory is uncertain?
LongMemEval explicitly treats updates and abstention as first-class evaluation targets, which is itself evidence that consistency is not solved by larger models alone. citeturn29search1turn29search4turn6search4turn29search11

Persistent memory also opens a new attack surface.
Prompt injection is transient; memory poisoning is durable.
PoisonedRAG showed that small numbers of malicious texts can corrupt retrieval-augmented outputs.
AgentPoison targeted long-term memory or knowledge bases used by LLM agents.
MINJA demonstrated query-only memory injection into agent memory banks.
Later work on MemoryGraft treats poisoned experiences themselves as behavioral templates that the agent may imitate across future tasks, and new 2026 results on unintended long-term state poisoning suggest that even routine interactions can gradually shift autonomy boundaries and default behaviors in personalized agents.
The evidence here is newer and less mature than on ordinary prompt injection, but it is strong enough to establish memory integrity as a first-order scientific problem. citeturn15search0turn15search2turn30search0turn30search1turn30search2turn30search14

## Action selection, planning, and control

Current LLM-based agents typically choose actions by combining a language-model policy with an external action interface.
ReAct is the canonical template: interleave natural-language reasoning with environment actions.
Toolformer learns when and how to call APIs during sequence generation.
Gorilla, API-Bank, and ToolLLM shift attention from generic reasoning to structured API use, tool retrieval, and argument generation.
WebGPT is an early example of a browse-act-observe loop trained with imitation and human feedback.
These systems show that a useful action policy can be induced from language modeling plus scaffolding, but they do not by themselves yield a theory of long-horizon optimal control. citeturn0search0turn0search1turn13search0turn8search3turn13search1turn27search0

The most principled way to view these systems is as approximate control over a partially observed process with typed external actions.
The policy may be written schematically as \[ \pi(a_t,c_t \mid b_t,m_t,g_t), \] where \(b_t\) is an implicit belief state, \(m_t\) durable/working memory, and \(g_t\) goals or instructions.
In classical POMDPs the optimal controller acts on a sufficient statistic such as a belief distribution; in modern LLM agents, this sufficient statistic is replaced by a lossy textual or latent surrogate made from prompts, retrieval results, scratchpads, and summaries.
This substitution is powerful but mathematically fragile: there are few guarantees that the prompt state is sufficient, calibrated, or stable under long histories. citeturn1search0turn26search2turn0search3turn29search1

Planning methods used by contemporary agents mostly fall into a few families.
Search-based methods include Tree of Thoughts, LATS, and later tree-search methods for web agents; these explicitly branch over candidate reasoning or action trajectories and use model-based or heuristic evaluation to continue promising branches.
Hierarchical methods include role decomposition and skill libraries.
Reflection methods include Reflexion, which stores linguistic feedback from prior failures as episodic guidance.
Grounded robotic methods such as SayCan combine language priors with learned affordance or value functions over executable skills.
In all cases there is an implicit compute-control tradeoff: the agent can spend more inference compute to improve its next action, but the field lacks a general theory for pricing or optimizing deliberation. citeturn10search1turn10search2turn10search6turn10search0turn10search3turn28search0

Where mathematics is strongest, modern agent methods usually line up with older theory.
SayCan is close to constrained policy selection with feasibility estimates.
Skill libraries resemble reusable options.
Search over thoughts resembles test-time planning or model predictive control, except the world model is partly the language model itself and partly tool-mediated feedback.
Where mathematics is weakest is also clear: most prompting-based planners do not come with admissible heuristics, convergence guarantees, error-compounding analyses, or robust credit assignment across dozens of heterogeneous tool calls.
It is better to describe most current systems as intelligent heuristic controllers than as solved long-horizon optimizers. citeturn10search3turn10search11turn1search2turn1search11turn10search2turn10search6

Recent work has started to bring reinforcement learning back into the picture, especially for web and software agents.
WebAgent-R1 trains web agents end-to-end from multi-turn interactions; DynaWeb uses a learned web world model to generate imagined rollouts; Agent Lightning proposes a training/execution disaggregation layer and hierarchical credit assignment for arbitrary agents.
These are scientifically important because they try to turn agent traces into RL transitions rather than leaving the entire control loop at inference time.
But the evidence is still early, heavily benchmark-dependent, and far from the maturity of RL in fixed action/state domains. citeturn23search10turn23search2turn23search0

Multi-agent LLM systems make the control problem even more delicate.
CAMEL, ChatDev, and MetaGPT show that role-conditioned communication can decompose tasks and sometimes improve performance, especially in software generation.
MultiAgentBench and BattleAgentBench indicate that collaboration and competition are measurable and still far from solved.
Yet from a control perspective, many of these systems are managed workflows rather than genuine decentralized learners: the architecture fixes roles, message channels, and decomposition rules in advance.
That can be useful engineering, but it should not be mistaken for a scientific solution to decentralized partially observed control. citeturn9search0turn9search1turn9search2turn9search3turn9search11turn2search7

A revealing piece of evidence comes from online learning and repeated games.
The question “do LLM agents have regret?” is not rhetorical: recent work explicitly evaluates LLM agents on canonical online learning and game-theoretic settings and finds that the no-regret and equilibrium behaviors central to repeated decision theory do not emerge reliably.
This matters because many real persistent agents operate in nonstationary environments against other adaptive entities — marketplaces, websites, users, attackers, or peer agents — where regret-style guarantees would be more informative than one-shot benchmark accuracy. citeturn3search1turn3search10turn2search2

## Persistence across servers, the web, and blockchains

Persistence is first a systems property, not a cognitive one.
A persistent agent needs a runtime that can schedule work, restore state after failure, checkpoint or log execution, manage credentials, enforce permissions, limit resources, and record what happened.
Distributed-systems theory has studied rollback recovery, checkpointing, and message logging for decades; more recent work on stateful serverless and workflow orchestration shows that durability and exactly-once semantics remain subtle once side effects leave the process boundary.
For agents this is not an implementation footnote.
The moment an agent can send an email, place an order, write to a database, or sign a transaction, crash recovery and retries become part of the scientific object because state continuity and action correctness are coupled. citeturn24search1turn24search6turn24search2turn24search4

### Server-resident agents

A server-resident agent is the cleanest case of persistence.
It can be modeled as a long-running process with durable storage and access to queues, timers, databases, and secrets.
What makes it scientifically interesting is that the “same” agent may span many operating-system processes, containers, or replicas, with its continuity carried by durable logs, stores, and identities rather than by one living process.
AIOS makes this explicit by proposing an agent operating system with scheduling, context management, memory management, storage management, and access control separated into a kernel-like layer.
Crab shows that checkpoint/restore for agent sandboxes is becoming an active research topic, while AgentTrace and AgentOps argue that structured telemetry and lifecycle observability are prerequisites for reliable deployment. citeturn11search0turn25search1turn25search7turn25search0turn25search19

This server setting highlights the distinction between persistence and mere serialization.
Saving a chat transcript is not enough.
A persistent autonomous service needs recovery semantics for tool invocations, versioning for policies and prompts, writeback rules for durable memory, and idempotence or compensation rules for side effects.
Classical recovery literature already emphasizes that the “outside world” is hard: local rollback cannot simply undo a message or financial action once observed externally.
This is why serious persistent-agent runtimes increasingly import ideas from durable workflows, sagas, and runtime monitoring rather than relying only on prompt templates. citeturn24search1turn24search18turn24search4turn25search0

### Web and API agents

Browser and web agents are harder because their interface is unstable, partially observable, and often human-designed rather than machine-designed.
WebGPT used a restricted text browser for question answering; Mind2Web moved toward generalization across many real sites; WebArena and VisualWebArena emphasized realistic, reproducible websites; WebVoyager attacked live sites; WorkArena targeted enterprise knowledge-work flows; OSWorld generalized from web pages to whole desktop environments; BrowserGym attempted to standardize observations and action spaces across these heterogeneous settings.
Taken together, this literature shows that “acting on the web” is best understood as sequential decision-making under severe observation aliasing, interface drift, hidden state, and action side effects. citeturn27search0turn7search9turn7search0turn13search3turn7search2turn11search2turn7search3turn11search1

Persistence on the web is not just longer context.
It includes authentication state, cookies and sessions, user history, cached pages, multi-step workflows, and side effects that can outlive the browsing session.
This is why personalization papers and new benchmarks matter.
PersonalWAB, Persona2Web, and PersonalHomeBench explicitly incorporate user history, ambiguous intent, or proactive behavior, moving evaluation closer to the real persistent-assistant problem.
Even so, current web benchmarks still simplify away much of what persistence would require in practice: long-term credential management, months-long drift in site structure, cumulative side effects, and user-specific governance over what the agent may remember or do. citeturn29search11turn29search2turn29search15

API agents sit somewhere between server and browser agents.
Their action space is more typed and machine-readable, which makes them easier to verify locally than browser clicks.
Toolformer, Gorilla, ToolLLM, and API-Bank collectively show that tool selection, schema use, and argument construction can be learned or scaffolded.
But persistence remains a systems problem here too: APIs change, documentation drifts, authentication expires, rate limits bind, and retries can duplicate side effects unless the tool interface itself is idempotent or transactional.
The relative cleanliness of APIs should not obscure that a persistent API agent is still a distributed transaction coordinator in a partially trusted environment. citeturn0search1turn13search0turn13search1turn8search3

### Blockchain agents

Blockchain changes the meaning of persistence because state is globally replicated, actions are economically settled, and many side effects are hard or impossible to reverse.
It is therefore crucial to distinguish three different objects that are often conflated.
A smart contract is a persistent autonomous *program* on a blockchain, but it is usually not an autonomous AI agent: computation is deterministic, expensive, and observationally narrow.
An off-chain AI agent that controls a key or smart wallet can be autonomous in a richer sense, but its cognition remains off-chain while the blockchain provides settlement, identity, and governance primitives.
DAOs are collective governance mechanisms over on-chain assets and contracts, not minds.
Serious technical analysis begins only after these distinctions are made. citeturn17search1turn17search2turn16search0turn16search7turn20search12

The most mature technical pieces of the blockchain-agent stack are not “AI agent” papers but adjacent infrastructures.
Nakamoto-style blockchains provide replicated ledger semantics for settlement.
Ethereum generalizes this to contract state transitions.
ERC-4337 provides account abstraction, allowing smart-contract accounts with arbitrary verification logic, which is directly relevant for policy-constrained agent wallets.
W3C DIDs and verifiable credentials provide decentralized identity and signed claims, which are more plausible foundations for agent continuity and delegated authority than ad hoc wallet labels.
Town Crier and related oracle work address the fact that on-chain contracts cannot observe external reality directly.
Formal methods such as KEVM and later smart-contract verification systems can verify on-chain program behavior against specifications.
What they do *not* verify is the off-chain agent’s open-ended planning policy. citeturn17search0turn17search2turn16search0turn16search1turn18search7turn17search3turn18search1turn18search0

From the viewpoint of autonomous economic action, the hard problems are custody, authorization, intent binding, and accountability.
Who holds the signing power — an externally owned key, MPC service, institutional custodian, or smart account?
How fine-grained are the authorization rules?
Can a payment be cryptographically bound to a service actually being delivered, or can the agent pay correctly while being behaviorally hijacked?
Recent SoKs on blockchain agent-to-agent payments and standards papers on blockchain agents are scientifically valuable mostly because they clarify these trust boundaries; they also show how early the field still is.
Emerging protocols such as A402 try to bind service execution and payment more tightly, but empirical validation remains limited. citeturn22search0turn21search6turn22search11

For on-chain inference or verifiable AI, the literature is also sobering.
Research on zero-knowledge and optimistic verification for machine learning — including opML and the broader ZKML literature — is real, but current systems are aimed at verifying specified computations, not the full open-ended behavior of a persistent agent; their proving costs remain substantial even for modest models.
In practice, the serious architecture today is usually off-chain inference plus on-chain commitments, settlement, and governance.
Claims that meaningful autonomous LLM agents “live on-chain” should therefore be treated skeptically unless they specify exactly which parts of memory, policy, verification, and execution are actually on-chain and at what cost. citeturn19search2turn19search4turn19search7

The governance evidence is similarly mixed.
DAO studies now provide substantial empirical evidence that voting power in practice is often concentrated, with design choices such as token registration, staking, and delegation reinforcing centralization.
Other work finds that proposals and documentation are frequently inconsistent and that large parts of on-chain governance remain monitor-intensive and opaque.
So blockchain persistence does not magically solve the governance problem for autonomous agents; it merely moves parts of the problem into visible, economically consequential mechanisms whose concentration and security can be measured. citeturn16search7turn20search12turn20search5turn16search11

## Evaluation and empirical science

The current benchmark ecosystem is large but fragmented.
For web and computer-use agents, the main families are MiniWoB++, WebShop, Mind2Web, WebArena, VisualWebArena, WebVoyager, WorkArena, OSWorld, BrowserGym, and BrowseComp.
They span synthetic web tasks, simulated e-commerce, static cross-site generalization, realistic self-hosted sites, live webpages, enterprise workflows, full desktop environments, and persistence-heavy information seeking.
For tool use, API-Bank, APIBench, and ToolBench-like setups measure tool retrieval and argument generation.
For software agents, SWE-bench and MLE-bench evaluate repository-level debugging or ML engineering.
For scientific assistance, LAB-Bench targets practical research tasks, while systems such as ChemCrow and Coscientist provide narrow but important end-to-end examples.
For general assistants and multi-agent systems, GAIA, AgentBench, MultiAgentBench, and BattleAgentBench all add pieces of the picture. citeturn27search9turn27search2turn7search9turn7search0turn13search3turn7search2turn11search2turn7search3turn11search1turn13search2turn8search3turn8search1turn12search2turn12search3turn12search0turn12search1turn8search2turn8search0turn9search3turn9search11

This benchmark diversity is scientifically useful because it shows that “agent ability” is not one scalar.
Browser interaction, API use, coding, scientific reasoning, and open-ended browsing stress different structures of state, observability, action granularity, and feedback latency.
WebArena, OSWorld, and WorkArena are especially important because they expose a large gap between human and model performance in realistic interactive settings.
WebShop and ALFWorld remain useful because they give controllable environments for grounding and RL.
BrowseComp is valuable precisely because it isolates persistent information-seeking as a core subcapability. citeturn7search0turn7search3turn11search2turn27search2turn27search15turn13search2

For memory, the most relevant empirical work is newer.
LoCoMo and LongMemEval demonstrated that long-term conversational memory cannot be reduced to just handling longer prompts: agents must track facts, events, temporal relations, updates, and abstention across many sessions, and present systems degrade substantially on these demands.
Newer memory benchmarks such as LoCoMo-Plus and LongMemEval-V2 trend toward more realistic cognitive and operational settings, but the literature is still concentrated on question answering or summarization over histories rather than on the control consequences of memory in open-ended persistent action.
That asymmetry matters: remembering a preference is easier to benchmark than acting safely on it six weeks later. citeturn29search0turn29search1turn4search15turn5search3turn5search7

Current benchmarks also miss several aspects of persistence badly.
Most measure success on isolated tasks, not months-long degradation, compounding side effects, or memory drift under continual updates.
They rarely tax state migration, crash recovery, credential expiry, or software version changes.
They seldom measure resource consumption as part of the objective, even though persistent agents can burn significant inference and tool budgets.
Many lack strong adversarial components or only attach them after the fact.
And they often score terminal success without systematically penalizing dangerous intermediate side effects.
Amazon-Bench and AgentDojo are important because they begin to score safety and security alongside utility, but these efforts are still the exception. citeturn27search6turn14search3turn14search9turn25search0

Benchmark contamination and construct validity are now important scientific concerns.
SWE-bench is influential, but follow-up work suggests that apparent gains on SWE-bench-Verified may partly reflect memorization or data contamination rather than genuine reasoning.
BrowseComp explicitly notes that it is an incomplete but useful benchmark rather than a realistic deployment distribution.
Tool-use benchmarks often overemphasize schema-correct calls relative to broader autonomy.
This does not make them useless; it means that any scientific claim about “agent capability” has to specify the horizon, action space, observability, side-effect model, and contamination risk of the benchmark in question. citeturn8search13turn13search2turn8search3turn8search1

A further limitation is that evaluation is still mostly *post hoc*.
ToolEmu, AgentDojo, and recent observability frameworks move toward risk-oriented evaluation by emulating tools, generating adversarial conditions, and tracing runtime behavior.
That is closer to what persistent autonomy requires: not just whether the agent can finish a task, but whether it stays within a behavioral contract while doing so.
The emerging formal-methods direction — runtime enforcement, probabilistic reachability, behavioral contracts, and plan verification — is therefore scientifically important even when its current domains are narrow.
It shifts evaluation from static benchmarks toward monitored behavior over time. citeturn15search3turn14search3turn31search0turn31search16turn31search17turn31search6

## Safety, security, and governance

The major safety problem is not simply “hallucination.” Persistent autonomous agents are exposed to a full-stack threat model: untrusted observations, mutable memory, external tools, long-horizon side effects, and often economically meaningful actions.
Prompt injection is the clearest example.
Both direct and indirect prompt injection exploit the fact that LLM systems blur the distinction between data and instructions; the same input channel carries content to be interpreted and commands that can steer behavior.
Several studies have found widespread vulnerabilities in real LLM-integrated applications, and recent work shows that web agents remain vulnerable when adversarial instructions are embedded in HTML or retrieved content. citeturn14search1turn14search0turn14search2

Persistent memory turns this into a durable control problem.
Once a malicious instruction, false fact, or strategically crafted “successful experience” is written into the memory substrate, later retrieval can reactivate the attack long after the original interaction is gone.
PoisonedRAG, AgentPoison, MINJA, MemoryGraft, and follow-up measurements in domain-specific agents together establish a progression from static corpus poisoning to persistent behavioral compromise.
The safety implication is severe: a memory-augmented agent can become less like a calculator with bad input and more like a long-lived process whose future policy has been partially rewritten. citeturn15search0turn15search2turn30search0turn30search1turn6search3

Tool use multiplies the blast radius.
ToolEmu explicitly frames data leakage and financial loss as long-tailed risks of tool-using agents.
AgentDojo operationalizes the attacker-versus-user-goal tradeoff in dynamic, tool-calling environments.
API agents can miscall functions; browser agents can click the wrong control; software agents can edit the wrong file; science agents can misuse protocols or databases.
In each case the danger is not just an incorrect sentence but an incorrect external act.
This is why recent safety work has shifted toward behavioral constraints, runtime guards, and observability rather than only model-level alignment prompts. citeturn15search3turn14search3turn31search0turn31search16turn25search0

Runtime enforcement is one of the most promising scientific directions precisely because open-ended agents operate in environments too rich for static verification alone.
AgentSpec proposes a rule language for constraining agent actions at runtime; Pro2Guard adds probabilistic reachability to anticipate unsafe states; related runtime-verification work argues that monitoring complements formal methods when complete environment models are unavailable.
These approaches do not solve the underlying robustness problem, but they turn safety from a vague prompt-design aspiration into something more like executable policy.
That is an important conceptual shift. citeturn31search0turn31search16turn31search13turn31search17

For blockchain-connected agents, the stakes rise because transactions may be irreversible, public, and instantly valuable.
Here the safety problem is joint: LLM-side prompt confusions interact with wallet authorization, smart-contract risk, oracle failures, and governance attacks.
Research specifically warning about giving AI agents access to cryptocurrency and smart contracts is still thin and often position-oriented, but the core technical issues are concrete: custody of signing authority, cryptographic binding between payment and service, verification of on-chain code, and incentive manipulation in governance.
The established blockchain security literature already shows that attacks occur at multiple layers, while DAO studies show that governance can be materially centralized even in ostensibly decentralized systems. citeturn21search14turn22search0turn18search0turn20search11turn20search12turn20search5

Governance for persistent agents is broader than blockchain.
Any serious deployment needs version control over policies and prompts, scoped permissions, human override or review on high-impact actions, memory writeback governance, trace retention, and post-incident forensics.
The current agent-observability literature treats structured telemetry as necessary for accountability, while distributed-systems work reminds us that durable processes need explicit recovery contracts.
But there is still no generally accepted governance model for persistent agents that combines autonomy, auditability, and bounded authority across long horizons. citeturn25search0turn25search19turn24search1turn11search0

## What a serious theory still needs to explain

A serious mathematical and scientific theory of persistent autonomous AI agents would need to explain at least seven things at once.
It would need a state-space model that includes not only hidden environment state and current observation, but also endogenous memory, exogenous event time, permissions, recovery state, and economic commitments.
It would need a theory of memory operations — write, retrieve, summarize, forget, reconcile, and attest — under bounded compute and adversarial pressure.
It would need a control theory for deliberation itself, treating reasoning steps, tool calls, and search as costly interventions rather than free introspection.
It would need semantics for continuity under failure, migration, and upgrade.
It would need game-theoretic tools for interaction among multiple adaptive agents and human institutions.
It would need monitoring and formal-specification machinery strong enough to reason about safety without assuming a closed world.
And it would need governance models for identity, authority, and redress over open-ended time.
Existing literature offers important fragments of each component, but no unified theory yet composes them. citeturn1search0turn24search1turn31search13turn2search2turn2search7turn16search1turn16search7

The strongest current scientific insight is that persistence is not a superficial engineering feature.
It changes the ontology of the agent.
Once memory becomes writable and durable, the agent’s state is no longer approximately “the prompt plus the model”; it is an evolving socio-technical object with data lineage, recovery paths, credentials, logs, and externally legible consequences.
In that sense, persistent agents are as much a distributed-systems and security problem as they are a machine-learning problem.
The research trajectory from MemGPT and Generative Agents to AIOS, AgentTrace, AgentSpec, and blockchain/payment studies makes this increasingly explicit. citeturn0search3turn0search2turn11search0turn25search0turn31search0turn22search0

The second major insight is that memory integrity is likely to become the central bottleneck.
Long-context models, better search, and more tools all improve local performance, but durable autonomy depends on whether the agent’s memory remains useful, current, causally organized, and resistant to poisoning.
The fact that so much recent work focuses on memory benchmarks, graph memory, and memory attacks is not accidental.
If persistence defines the object, then memory integrity defines its long-term reliability. citeturn29search0turn29search1turn6search4turn6search2turn30search0turn30search1

The third major insight is that benchmarking lags behind the phenomenon.
We can now measure many slices of agentic behavior — browsing, coding, tool use, memory QA, scientific assistance, collaboration — but not the thing users and institutions will actually care about: whether a persistent agent remains competent, aligned, auditable, secure, and governable after thousands of interactions, failures, updates, and attempts at manipulation.
Until evaluation catches up to that problem, claims about “autonomy” should remain provisional. citeturn7search0turn7search3turn8search1turn12search3turn29search1turn14search3

### Open questions and limitations

The literature is strongest on web interaction, tool use, memory architectures, and prompt-injection-style risks, and much weaker on truly long-term deployments in the wild.
Evidence about blockchain/Web3 agents is especially uneven: there is solid work on smart contracts, wallets, identity standards, DAOs, and verifiable computation, but far less rigorous empirical work on open-ended autonomous AI agents operating economically through those substrates.
Many relevant results are still arXiv preprints rather than settled conference or journal work.
Accordingly, the most defensible conclusion is not that persistent autonomous AI agents are theoretically understood, but that the field has finally identified the right hard problems. citeturn16search0turn16search1turn18search0turn20search12turn22search0turn21search6

### Selected bibliography

#### Foundations and formal models

Kaelbling, Littman, and Cassandra, *Planning and Acting in Partially Observable Stochastic Domains*; Sutton and Barto, *Reinforcement Learning: An Introduction*; Sutton, Precup, and Singh, *Between MDPs and Semi-MDPs*; Dietterich, *Hierarchical Reinforcement Learning with the MAXQ Value Function Decomposition*; Shapley, *Stochastic Games*; Bernstein, Givan, and Immerman, *The Complexity of Decentralized Control of Markov Decision Processes*; Amato and colleagues on Dec-POMDPs; Hazan, *Introduction to Online Convex Optimization*. citeturn1search0turn26search0turn1search2turn1search11turn2search6turn2search7turn2search15turn3search1

#### LLM agents, tool use, planning, and memory

Nakano et al., *WebGPT*; Yao et al., *ReAct* and *Tree of Thoughts*; Schick et al., *Toolformer*; Patil et al., *Gorilla*; Li et al., *API-Bank*; Qin et al., *ToolLLM*; Shinn et al., *Reflexion*; Ahn et al., *SayCan*; Park et al., *Generative Agents*; Packer et al., *MemGPT*; Zhong et al., *MemoryBank*; Wang et al., *LongMem*; Wang et al., *Voyager*; Anokhin et al., *AriGraph*; Xu et al., *A-MEM*. citeturn27search0turn0search0turn10search1turn0search1turn13search0turn8search3turn13search1turn10search0turn10search3turn0search2turn0search3turn4search2turn5search2turn28search0turn6search4turn6search2

#### Persistence, evaluation, and security

Zhou et al., *WebArena*; Deng et al., *Mind2Web*; He et al., *WebVoyager*; Koh et al., *VisualWebArena* and later tree-search work; Drouin et al., *WorkArena*; Xie et al., *OSWorld*; Le Sellier de Chezelles et al., *BrowserGym*; Wei et al., *BrowseComp*; Jimenez et al., *SWE-bench*; Chan et al., *MLE-bench*; Maharana et al., *LoCoMo*; Wu et al., *LongMemEval*; Liu et al., *Prompt Injection Attack against LLM-integrated Applications*; Greshake et al., *Not What You’ve Signed Up For*; Debenedetti et al., *AgentDojo*; Ruan et al., *ToolEmu*; Chen et al., *AgentPoison*; Dong et al., *MINJA*; Wang, Poskitt, and Sun, *AgentSpec*; Wang et al., *Pro2Guard*; AlSayyad et al., *AgentTrace*. citeturn7search0turn7search9turn7search2turn13search3turn10search6turn11search2turn7search3turn11search1turn13search2turn8search1turn12search2turn29search0turn29search1turn14search0turn14search1turn14search3turn15search3turn15search2turn30search0turn31search0turn31search16turn25search0

#### Blockchain, identity, verification, and governance

Nakamoto, *Bitcoin*; Szabo, *Smart Contracts*; Buterin, *Ethereum Whitepaper*; ERC-4337 account abstraction; W3C *DID Core* and *Verifiable Credentials Data Model*; Zhang et al., *Town Crier*; Hildenbrandt et al., *KEVM*; Tolmach et al., survey of smart-contract formal verification; empirical DAO governance studies by Feichtinger et al., Ma et al., and Pahari et al.; recent SoKs on blockchain agent-to-agent payments and trust boundaries for blockchain-based agents; opML and the ZKML survey for verifiable ML on chain or near chain. citeturn17search0turn17search1turn17search2turn16search0turn16search1turn18search7turn17search3turn18search1turn18search0turn20search12turn16search7turn20search5turn22search0turn21search6turn19search2turn19search4
