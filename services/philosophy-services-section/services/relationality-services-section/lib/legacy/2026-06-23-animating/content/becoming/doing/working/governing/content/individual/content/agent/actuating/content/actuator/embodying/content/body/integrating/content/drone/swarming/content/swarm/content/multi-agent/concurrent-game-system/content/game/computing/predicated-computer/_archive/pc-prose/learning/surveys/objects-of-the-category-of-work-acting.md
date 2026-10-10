---
description: Survey of what the philosophical, sociological, organizational, planning-theoretic, and categorical-process-semantic literatures on work take to be the objects of the category whose morphisms are work-acts, drawing from the repo's surveys of those literatures and from direct engagement with the cited primary sources.
status: draft
session-date: 2026-05-17
topic: work
---

# Objects of the Category of Work-Acts

## Scope

The question, mathematically: if a *work-act* is a morphism, what are its source and target? Equivalently: what are the objects of the category $\mathbf{Work}$ in which work-acts live?

This is a real question that has been engaged across at least a dozen literatures on work — analytic philosophy of action; process philosophy and pragmatism; Marxian labor process theory; cultural-historical activity theory; computer-supported cooperative work and the articulation-work tradition; classical organization theory; the feminist/invisible-labor and reproductive-labor tradition; affective and immaterial labor; practice theory; safety science and the failure-mode tradition; AI planning theory; Petri-net and workflow process semantics; and categorical process semantics. Each literature poses the question in its own vocabulary at its own level of formalization; most of them, when read against the question, converge on a common structural answer that varies only in what kind of thing fills the substrate slot.

This survey is **not** about any specific polity's instance of work-organization. It is a survey of work-as-such, drawn from the body of evidence humanity has produced about how work is actually done across history, traditions, and disciplines.

## What the question is asking

A category $\mathbf{C}$ specifies objects, hom-sets, composition, identity, and laws. Posing "the category of work-acts" commits at minimum to: a class of objects; a class of morphisms (the work-acts); for each pair of objects a hom-set; an associative composition with identity. The question then is what *kind of thing* an object is and what *kind of thing* a single work-act is, in a way that makes their pairing into a category coherent.

The simplest categorical proposal is older than category theory itself: **objects are states (of something); morphisms are acts (that transition states); composition is sequential ordering**. The substantive disagreement across the literature is not whether to take this proposal but what to put in the state-slot — and, secondarily, whether the resulting category needs richer structure (symmetric monoidal for parallel work; fibration for multi-agent; 2-category for articulation work; failure-typing for the failure modes) to capture the structure of real work.

## The basic categorical proposal

Several literatures arrive independently at *states-as-objects, acts-as-morphisms*.

### Philosophy of action

Georg Henrik von Wright's *Norm and Action* (1963) and *Explanation and Understanding* (1971) develop acts as transformations between states of affairs. An act is the bringing-about of a state of affairs that would not have come about by itself. Productive acts bring about new states; preventive acts keep states from coming about; sustentive and destructive acts maintain or end existing states. The categorical reading: objects are *states of affairs* (proposition-conjunctions about how the world is); morphisms are *acts*.

Alvin Goldman's *A Theory of Human Action* (1970) refines the picture with act-trees: a single act-token is described by many act-types, related by *level-generation* (causal, conventional, simple, augmentation). Composition in Goldman is vertical (the derived act is performed-*by-way-of* the basic act), not sequential. This is more like a fibration over basic acts than a 1-category, but the basic acts themselves form a category of state-transitions.

Donald Davidson's *Essays on Actions and Events* (1980) takes events as concrete particulars and acts as events under descriptions; this leaves the categorical structure on the other end open. Elizabeth Anscombe's *Intention* (1957) reorients: *intentional* acts are those for which a "why?" question admits an answer in terms of the agent's reasons. Categorically, this gives the inclusion of $\mathbf{IntentAct} \hookrightarrow \mathbf{Act}$.

Roderick Chisholm (1976), Jennifer Hornsby (1980), and Brian O'Shaughnessy (1980) converge on *endeavoring* as more fundamental than doing. An endeavor is the *inner side* — the trying, distinct from the achievement. Categorically: morphisms of $\mathbf{Work}$ might be endeavorings (tryings), not achievements; the achievement is the morphism's image under a functor that can fail (the paralyzed agent's arm doesn't move; the endeavor is complete).

### AI planning theory

Fikes and Nilsson's STRIPS (1971) defines a state as a set of ground atomic predicates that hold. An operator has a precondition (literals that must hold) and an effect (literals added and deleted). A plan is a sequence of operators that transforms the initial state into a goal state. STRIPS uses goal regression — working backward from the goal, finding operators whose add-lists include goal literals, then recursing on the operators' preconditions — and operates under the closed world assumption. The algorithm is correct but incomplete for interacting subgoals: the *Sussman anomaly* (a three-block stacking problem) is the canonical case where STRIPS-style regression fails because subgoals interact in ways that require interleaved action.

Sacerdoti's NOAH (1975) and Tate's NONLIN (1977) anticipated partial-order planning. McAllester-Rosenblitt's "Systematic Nonlinear Planning" (1991) formalized it: a partial-order plan is a tuple $(S, O, \prec, L)$ with steps $S$, open precondition goals $O$, temporal ordering constraints $\prec$, and *causal links* $o_1 \xrightarrow{p} o_2$ asserting that $o_1$ achieves precondition $p$ of $o_2$. *Threats* — steps that might delete a protected precondition between its supplier and consumer — are resolved by demotion or promotion. The resulting plans carry the minimum necessary ordering constraints. Pednault's ADL (1989) adds conditional and quantified effects; PDDL (Ghallab, Howe, Knoblock et al, 1998) standardizes the language used in the International Planning Competition; PDDL extensions support numerical fluents, durative actions, probabilistic effects, and preferences.

HTN (hierarchical task network) planning, formalized by Erol, Hendler, and Nau (1994), introduces *methods* that decompose abstract tasks into ordered subtasks. The planner's structure becomes a tree of decompositions rather than a flat sequence of operators; the categorical content shifts from a 1-category of states-and-operators to a richer structure with explicit decomposition morphisms — closer to Goldman's act-trees than to plain state-transitions.

Categorical reading: the category has objects = *world-states represented as predicate-conjunctions*; morphisms = *operators with preconditions and effects*; composition = operator-sequencing; identity = no-op. Plans are paths. The HTN extension adds vertical decomposition morphisms; the partial-order extension makes the morphism class a partially-ordered set under refinement rather than a strict sequence.

Michael Bratman's *Intention, Plans, and Practical Reason* (1987) supplies the normative side: a plan is an intention — a mental state that disposes the agent toward actions, shapes future practical reasoning, and coordinates the agent's activity over time. Plans are typically *partial*; the partial plan leaves room for further specification as execution proceeds.

### Petri nets and workflow management

Carl Adam Petri (1962) introduces Petri nets — bipartite graphs of *places* and *transitions* with arcs giving the input and output places of each transition. A *marking* assigns a multiset of tokens to places. A transition is enabled when each input place has enough tokens; firing consumes the input tokens and produces output tokens, yielding a new marking.

José Meseguer and Ugo Montanari's "Petri Nets Are Monoids" (1990) makes the categorical structure precise: the category of computations over a Petri net is a strict symmetric monoidal category whose objects are markings (in the free commutative monoid on places) and whose morphisms are computations modulo the obvious commutations. Monoidal product is concurrent composition; the unit is the empty marking.

Wil van der Aalst's workflow-net theory specializes Petri nets to workflow management; cases flow through tasks; soundness properties (proper completion, no dead transitions) are categorical statements.

### Categorical process semantics

The most general formal frame: Joyal-Street's "Geometry of Tensor Calculus" (1991), Selinger's "Survey of Graphical Languages for Monoidal Categories" (2010), Coecke-Kissinger's *Picturing Quantum Processes* (2017), Baez-Stay's "Physics, Topology, Logic and Computation: A Rosetta Stone" (2010). In a process theory, objects are types of systems/resources; morphisms are processes; sequential composition is wiring; tensor product is parallel composition. The apparatus is mature; what each application supplies is *what the objects are*.

A specific lineage within categorical process semantics treats *cobordisms* — manifolds whose boundary is a disjoint union of an in-boundary and an out-boundary — as the morphisms of a process category. Michael Atiyah's "Topological Quantum Field Theories" (1988) defines a TQFT as a symmetric monoidal functor from a cobordism category to vector spaces; objects are $(n-1)$-manifolds, morphisms are $n$-dimensional cobordisms, composition is gluing along the shared boundary, monoidal product is disjoint union. John Baez and James Dolan's "Higher-Dimensional Algebra and Topological Quantum Field Theory" (1995) and Jacob Lurie's "On the Classification of Topological Field Theories" (2009) develop the *cobordism hypothesis* and its $(\infty, n)$-categorical extensions. The cobordism framing generalizes wherever processes can be glued along shared interfaces: it is one available formal home for the category of work-acts in which a work-act is a bulk-process whose boundaries are the in-state and out-state.

Bob Coecke, Tobias Fritz, and Robert Spekkens's "A Mathematical Theory of Resources" (2014) develops *resource theories* as a unifying formalism. A resource theory is a symmetric monoidal category whose morphisms are *free operations* (compositions the theory allows for free — natural drift, ambient transformations) and whose objects are resource-states classified by what free operations cannot achieve. Many work-domains admit natural resource-theoretic readings: labor power as resource, time as resource, attention as resource, capability as resource, infrastructure as resource. Each gives a category of work-acts whose objects are resource-configurations and whose morphisms are the operations consuming and producing them.

### State machines

Mealy (1955) and Moore (1956) finite state machines, generalized by Harel's statecharts (1987) to hierarchical and orthogonal states. Objects = states; morphisms = transitions. Direct categorical reading available.

The convergence across these formal traditions: **the category of work-acts has states as objects, acts as morphisms, and at minimum a symmetric monoidal structure** (with the tensor encoding parallel/disjoint composition). What varies across the substantive literatures below is *what fills the state-slot*.

## Substrate variations

The substantive literatures fill the state-slot with different content. Each is a serious answer to the question.

### Material substrate (Marxian labor process theory)

Marx's *Capital* Vol. I Ch. 7 distinguishes the labor process in general from the valorization process specific to capitalism. The labor process has three simple elements:

> (1) the personal activity of man, *i.e.*, work itself, (2) the subject of that work, and (3) its instruments.

The *Gegenstand der Arbeit* — translated as "subject of work" or "object of work" — is the material substrate on which work operates. Iron in the smithy. Wool at the spinning wheel. Standing trees, for the woodcutter. Work transforms the Gegenstand using the instruments and labor power. The result is the Produkt.

Marx is direct: objects of work-acts are the *materials being worked on*, in their stages of transformation. Raw materials → semi-finished products → finished products as different objects; the labor process is a sequence of morphisms taking the Gegenstand through these states. Instruments are part of the morphism (they mediate); labor power is part of the morphism (it powers the act).

Marx's *Resultate des unmittelbaren Produktionsprozesses* (1864, published 1933) distinguishes *formal subsumption* (capital organizes existing labor processes under wage relations) from *real subsumption* (capital reorganizes the labor process itself through division of labor, machinery, factory discipline). The transition is the historical core of industrial capitalism.

Harry Braverman's *Labor and Monopoly Capital* (1974) identifies the *separation of conception from execution* as the structural mechanism that widens the surplus-gap. Following Taylorism, management appropriates the design of work; workers receive fragmented, pre-specified tasks. Categorically, this is a factorization: $w = e \circ c$ — but $c$ and $e$ operate on different state-types (conception transforms a plan-document state; execution transforms the material). The category of work-acts under industrial capitalism includes *informational/conceptual* objects in parallel with material ones.

Michael Burawoy's *Manufacturing Consent* (1979) reads the labor process as a game played at the point of production; the objects in Burawoy's category include *game-states* (bonuses earned, quotas met, informal norms upheld) alongside material-states. The shopfloor's games — making out, the rate, the relative rewards of harder versus easier jobs — absorb workers' creative energies into the productive process while obscuring exploitation. Burawoy's later *Politics of Production* (1985) generalized this into *factory regimes*: the joint configuration of labor process, state intervention, and labor market institutions, comparatively analyzed across capitalist and state-socialist settings.

Richard Edwards's *Contested Terrain* (1979) periodizes twentieth-century U.S. control regimes — *simple control* (foreman's personal authority), *technical control* (the assembly line's pacing), *bureaucratic control* (the rule-bound personnel system) — each a response to the previous regime's contradictions and to worker resistance. Andrew Friedman's *Industry and Labour* (1977) distinguishes *direct control* (close supervision, deskilled tasks) from *responsible autonomy* (workers granted latitude within a frame that aligns their judgment with managerial objectives); the choice depends on labor-market conditions, technical character of the work, and the strength of worker resistance. The control regime determines which morphisms are admitted into the work-category.

Paul Thompson's "core theory" (1983; Thompson-Smith 2010) consolidates the second-wave commitments: structured antagonism, no necessary form of control, relative autonomy of the labor process, worker agency. David Knights and Hugh Willmott's *Labour Process Theory* (1990) provided the postmodernist/Foucauldian intervention against the core theory's productivism and economism, arguing for the constitutive role of subjectivity and power-knowledge in the workplace. The resulting *core theory wars* defined the field through the 1990s and continue to organize labor-process debate; one of the operative questions is whether worker subjectivity is itself a substrate the work-acts operate on (Knights-Willmott) or a derivative of the structural conditions the core theory analyzes (P. Thompson).

E. P. Thompson's "Time, Work-Discipline, and Industrial Capitalism" (1967) supplies the ethnographic-historical complement: the worker had to be remade through a centuries-long disciplinary process into the time-disciplined factory laborer that real subsumption presupposes. Categorically, the worker's own *temporal-discipline state* is part of the substrate that capitalist work-acts depend on.

For our question: Marxian labor process theory gives objects = states of the material being worked on (Marx), augmented by informational/conceptual states (Braverman), game-states (Burawoy), and worker temporal-discipline states (E.P. Thompson). The category of work-acts is broader than the category of material transformations alone.

### Mediated-activity substrate (cultural-historical activity theory)

Vygotsky's *Mind in Society* (1978) introduces the mediation triangle: subject → mediating artifact → object. Action on the world is never unmediated; it always traverses a tool, sign, or symbolic system that carries the cultural-historical accumulation of prior collective practice.

A. N. Leont'ev's *Activity, Consciousness, and Personality* (1978) generalizes to *collective activity* with a three-level hierarchy:

| Level | Driven by | Time-scale | Example |
|---|---|---|---|
| Activity | Motive / object | Long-term, collective | Hunting (subsistence) |
| Action | Goal | Short-term, conscious | Driving game toward a trap |
| Operation | Conditions | Automatic, embodied | Adjusting grip on the spear |

The crucial claim: actions make sense only within an activity oriented toward an *object/motive* that exceeds any single actor's individual goal. The beater's action of frightening prey is unintelligible without the activity-level frame of feeding the band. Activity is intrinsically multi-actor and intrinsically distributed across roles.

Engeström's *Learning by Expanding* (1987) extends to the *activity system triangle* with three additional nodes: community, rules, division of labor. The seven nodes (subject, object, artifact, community, rules, division-of-labor, outcome) and their pairwise interactions yield a structural model in which *contradictions* — historically accumulated tensions within or between activity systems — drive *expansive learning*. Third-generation activity theory analyzes *interacting activity systems* with overlapping objects, boundary-crossing artifacts, knotworking practices.

For our question: activity theory's *object of activity* is the *state of the motivating goal-object that the activity is transforming toward an outcome*. The morphism is the *mediated, community-located, rule-governed activity*. Where the Marxian tradition foregrounds the material-and-instruments, activity theory foregrounds the subject-and-mediation; the object-being-transformed is the shared content. The category is multi-actor by construction; the unit of analysis is the activity system, not the individual act.

### Situated-configuration substrate (CSCW articulation work)

Anselm Strauss's "Work and the Division of Labor" (1985) and "Articulation of Project Work" (1988) introduce *articulation work*: the work of coordinating, scheduling, and re-aligning the multiple lines of action that compose any complex project. Surgical operations require dozens of distinct trajectories (drug delivery, instrument sterilization, patient preparation, post-operative care, family communication, billing); the substantive surgical work is impossible without the articulation that schedules these trajectories so they meet at the right moments.

Strauss distinguishes four articulation moves: aligning trajectories, negotiating trade-offs, repairing breakdowns, reflexively monitoring the alignment. Articulation is first-order work, not meta-work — it requires skill, time, attention, accountability — but it is structurally invisible because it appears as the absence of breakdowns rather than as a visible product.

Susan Leigh Star and Strauss's "Layers of Silence, Arenas of Voice" (1999) generalizes to a framework for the visibility politics of work. Background work, the use of summary indicators that compress detailed work into reportable numbers, and the disembedding of work from situated workers all produce invisibility as a structural feature of how work is recognized.

Star and Griesemer's "Institutional Ecology" (1989) introduces *boundary objects* — artifacts that travel between communities of practice while retaining different meanings in each. Boundary objects allow distributed work to coordinate without requiring shared meaning across all participants.

Kjeld Schmidt and Liam Bannon's "Taking CSCW Seriously" (1992) brings articulation work to the center of cooperative work research: cooperative work systems fail when they automate the substantive work but ignore the articulation work that the substantive work requires.

Lucy Suchman's *Plans and Situated Actions* (1987) makes a parallel-but-distinct point: plans are *resources* for situated action, not specifications of it. Actual conduct emerges from the situation, with the plan as one of many inputs. Categorically, this complicates the proposal that work-acts are scripted state-transitions — Suchman's situated action looks more like a free monoidal structure with feedback, each act an improvisation against a situation that the plan constrains but does not determine. Her "Making Work Visible" (1995) makes visibility itself a political act with consequences for recognition, valuation, and compensation.

For our question: CSCW's answer is that objects include *situated configurations* (the local circumstances under which work happens) and *coordination states* (who-is-doing-what, when, with which dependencies and alignments). The category of work-acts is *layered*: first-order substantive work-acts plus second-order articulation acts that transform coordination state. A complete category contains both layers, and articulation work is a 2-categorical structure of morphisms-on-morphisms (a scheduling-act $\alpha$ has source and target both first-order work-acts).

### Organizational substrate (classical organization theory)

Frederick Taylor's *Principles of Scientific Management* (1911) supplies four principles centered on the separation of conception from execution. Henri Fayol's *Administration Industrielle et Générale* (1916) defines the administrative function with five elements — planning, organizing, commanding, coordinating, controlling — later codified as Gulick's POSDCORB.

The Hawthorne studies and the human relations school (Mayo 1933; Roethlisberger and Dickson 1939) establish that informal group structure and supervisory style are major determinants of productivity — the formal chart is not the organization.

Chester Barnard's *The Functions of the Executive* (1938) reframes organization as a *cooperative system* of consciously coordinated activities. The acceptance theory of authority: authority depends on the willingness of subordinates to accept commands as legitimate.

Herbert Simon's *Administrative Behavior* (1947) turns the focus to *decision-making* as the unit of organizational analysis. Bounded rationality and satisficing become the foundation of behavioral organizational theory; March-Simon's *Organizations* (1958) and Cyert-March's *A Behavioral Theory of the Firm* (1963) develop programmed vs. non-programmed decisions, organizational slack, dominant coalition, sequential attention to goals, problemistic search.

James D. Thompson's *Organizations in Action* (1967) supplies the *interdependence typology*:

- **Pooled** — units contribute to a common pool independently; coordination by standardization (rules).
- **Sequential** — one unit's output is another's input, in fixed order; coordination by planning.
- **Reciprocal** — units pass work back and forth; coordination by mutual adjustment.

Coordination cost rises across these three; organizations group their most reciprocally interdependent activities most tightly.

Jay Galbraith (1973) develops an *information-processing* view of organization design: structure must be matched to the uncertainty of the work (more uncertainty requires more information-processing capacity).

Jay Galbraith's *Designing Complex Organizations* (1973) develops an *information-processing* view: structure must be matched to the uncertainty of the work (more uncertainty requires more information-processing capacity). His *STAR model* — Strategy, Structure, Processes, Rewards, People — became one of the standard practitioner frameworks for organization design.

Henry Mintzberg's *The Structuring of Organizations* (1979, 1983) supplies the most comprehensive synthesis. Five basic parts (strategic apex, middle line, operating core, technostructure, support staff); six coordination mechanisms (mutual adjustment, direct supervision, standardization of work processes, of outputs, of skills, of norms); five organizational configurations (simple structure, machine bureaucracy, professional bureaucracy, divisionalized form, adhocracy). Each configuration is characterized by a dominant part, a dominant coordination mechanism, and a characteristic environmental fit.

Mintzberg's coordination mechanisms map into categorical structure: *standardization of work processes* corresponds to a terminal procedural object in the agent's work-category that every work-act factors through; *standardization of skills* corresponds to a capability-precondition on the work-category shared across agents; *standardization of outputs* corresponds to a typed output-interface that work-acts must produce; *mutual adjustment* corresponds to a 2-morphism structure between coordinating workers' work-acts. The choice of dominant coordination mechanism is the choice of which structural feature is operative.

Philip Selznick's *TVA and the Grass Roots* (1949) inaugurates the institutional tradition: formal organizations develop institutional features — value-commitments, identity, distinctive competence — beyond their rational instrumental design. Selznick's later *Leadership in Administration* (1957) argued the executive's task is *institutionalization*: transforming an expendable instrument into a vehicle for distinctive values. The institutional tradition was reanimated in the 1970s and 1980s by Meyer-Rowan and DiMaggio-Powell.

Paul DiMaggio and Walter Powell's "The Iron Cage Revisited" (1983) asks: if multiple institutional logics exist, why do organizations in a field become increasingly similar? Three mechanisms of *institutional isomorphism*: *coercive isomorphism* (external pressure from legal mandates, regulatory requirements, resource dependencies); *mimetic isomorphism* (organizations copy successful peers under uncertainty); *normative isomorphism* (professionalization through shared education, networks, certification standards creates convergence).

Roger Friedland and Robert Alford's "Bringing Society Back In" (1991) and Patricia Thornton, William Ocasio, and Michael Lounsbury's *The Institutional Logics Perspective* (2012) develop *institutional logics theory*. An institutional logic is a set of material practices and symbolic constructions — shared assumptions, values, beliefs, rules — that constitute the organizing principles of a particular institutional sphere. Modern society is constituted by multiple incommensurate logics: capitalism (accumulation, profit, efficient allocation), the state (regulation, rule of law, public order), democracy (representation, participation, accountability), the family (intimacy, generational reproduction, emotional sustenance), religion (transcendence, moral authority, community of faith), profession (expertise, autonomy, ethics). An organization or field is subject to multiple, often contradictory logics simultaneously. Logics shape what gets attended to: market logic makes share price salient; professional logic makes craft excellence salient; the same firm sees different facts depending on which logic dominates.

For our question on the organizational substrate: institutional-logics theory means the *substrate is multiply-coded*. The same organizational state can be read under market logic, professional logic, state logic, family logic — each reading directs different work-acts as appropriate. Work-acts in this substrate often *traverse logics*: a hospital's clinical decision simultaneously is read as medical-professional work-act, market work-act (insurance billing), state work-act (regulatory compliance), and care work-act (patient relationship). The compositions admitted depend on which logics are operative and how their contradictions are managed (Greenwood et al's "Institutional Complexity and Organizational Responses," 2011, catalogs the strategies: separating, blending, switching, etc.).

### Gendered organizational substrate (feminist organizational theory)

Joan Acker's "Hierarchies, Jobs, Bodies: A Theory of Gendered Organizations" (1990) inaugurates feminist organizational theory. Organizational structures are not gender-neutral containers; they are built on an image of "the worker" that is implicitly male — a being with no body, no sexuality, no obligations to reproduction or care, available for unlimited hours, with a wife at home managing his biological needs. The organizational structure (schedules, career paths, advancement criteria) is designed for this body and this life. Acker identifies five processes that reproduce gender in organizations: (1) the division of labor (gender-segregated occupations); (2) cultural symbols and images (masculine metaphors of warfare, conquest, competition); (3) workplace interactions (men interrupting, taking space; women's emotional labor and deferential listening); (4) individual identities (people internalize gendered identities through organizational life); (5) organizational logic (the separation of public paid work from private home, the definition of commitment as unlimited availability).

Marta Calás and Linda Smircich's "From the Woman's Point of View" (1996) shows that the key concepts of organizational thinking are gendered at the semantic level. Motivation is defined as individual drive toward organizational goals (assumes no competing claims on time); leadership is defined through masculine imagery (assertiveness, individual vision, emotional distance); culture is the culture of those in power. The feminist organization that operates non-hierarchically, prioritizes emotional awareness, and measures success by caring is systematically defined as lacking organizational culture — pathologized as disorganized precisely because it refuses to reproduce masculine competitive logic.

Patricia Yancey Martin's "*Said and Done* Versus *Saying and Doing*" (2003) shifts the question from "does this organization have gender inequality?" to "how is gender being actively *practiced* in everyday organizational practice?" Gender is something people *do*, repeatedly, often without conscious awareness; the practices are reciprocal and interdependent — women's deference and emotional labor are not separable from men's authority-claiming and emotional distance. They constitute each other.

Silvia Federici (*Caliban and the Witch* 2004; *Revolution at Point Zero* 2012) grounds the analysis in political economy: capitalist governance depends fundamentally on the appropriation of uncompensated reproductive labor, primarily women's labor. Formal organizational hierarchies, accountability structures, and decision procedures all presuppose that someone is doing the reproductive work that sustains the organization's members.

bell hooks's *Feminist Theory: From Margin to Center* (1984) insists that governance theory must center those most marginalized by organizational power. A governance reform increasing women's access to management may improve the situation for white professional women while leaving poor women and women of color more exposed. A childcare policy may subsidize some women's care while requiring other women to leave their own children to perform care work for wages. Power structures are organized through *intersecting* oppressions: race, class, sexuality, nationality, disability; access and inclusion are not sufficient.

For our question: the organizational substrate is *gendered (and racialized, classed) at its foundations*. The category of work-acts on a gendered organizational substrate includes the gendering-practices themselves as morphisms (Martin's "doing gender") — these morphisms operate on subjectivity-states and relational-states simultaneously with the substantive work-acts they accompany. Formal neutrality is itself a substrate property that masks structural dependence on gendered unpaid labor; interrupting gender reproduction requires *visible, reflexive* changes to governance structures.

For our question: classical organization theory's objects-of-work-acts are *organizational states* — configurations of authority structure, division of labor, coordination mechanism, decision-premises, formal-and-informal structure. Morphisms include both substantive work-acts and the administrative work-acts (planning, organizing, deciding, coordinating, controlling) that maintain and modify the organizational substrate. Thompson's interdependence types and Mintzberg's coordination mechanisms determine which composition structures the category supports. Marx's *technical division of labor* (specialization within a workshop) and *social division of labor* (specialization across society, *Capital* I Ch. 12-14) correspond to the choice of agent-category $\mathbf{Agt}$: a small $\mathbf{Agt}$ with shared work-base is technical (within-firm); a large $\mathbf{Agt}$ with mediating exchange-functors is social (across-market).

### Authority and legitimation substrate (Weber)

Max Weber's *Wirtschaft und Gesellschaft* (1922) and *Politik als Beruf* (1919) supplied the foundational analysis of *legitimate domination* (*Herrschaft*). Weber's distinction: *Macht* (power — the probability of carrying out one's will despite resistance) vs. *Herrschaft* (domination — the probability that a command of definite content will be obeyed; power *recognized as legitimate*).

Weber's three pure types of legitimate domination:

| Type | Basis of legitimacy | Carrier | Administrative apparatus |
|---|---|---|---|
| **Traditional** | "It has always been so" — sanctity of immemorial traditions | The lord/patriarch | Personal household, retainers, vassals |
| **Charismatic** | The exceptional gift (*charisma*) — heroism, sanctity, exemplary character | The charismatic leader | Personal disciples, comrades-in-arms |
| **Rational-legal** | Belief in the legality of enacted rules and the right of those elevated under them to issue commands | The office (*Amt*) | Bureaucracy |

These are *ideal types* — analytical constructs that abstract and accentuate features for comparison. No historical regime is purely any of them; real political orders combine them in characteristic mixtures, and the types undergo historical transformations into one another (the *routinization of charisma* — *Veralltäglichung des Charisma* — describes how charismatic movements, in succession crises, transform into traditional or rational-legal forms).

The **bureaucratic ideal-type** is the characteristic carrier of rational-legal authority. Its structural features:

1. Jurisdictional areas fixed and ordered by rules.
2. Office hierarchy organizing super- and subordination.
3. Written documents (the files) as the basis of administration; office separated from person.
4. Office-management requires expert training; officials appointed (not elected) on demonstrated technical qualifications.
5. The office is a full-time vocation demanding the official's whole working capacity.
6. Office management follows general rules — stable, exhaustive, learnable — applied impersonally (*sine ira et studio*).
7. Officials personally free; subject to authority only with respect to impersonal official obligations; fixed salary, career advancement, pension rights; they hold the office, do not own it.

Weber's claim is technical: bureaucracy is technically superior — faster, more precise, more predictable, more impersonal, more economical — and its progress is largely irreversible because the modern mass state, firm, party, and army all require its capacities.

Weber's concern: the *stahlhartes Gehäuse* — Parsons's "iron cage," more recently "shell as hard as steel" — the rationalization process that produced modern capitalism and bureaucracy creates an order that imprisons even those it serves, populated by "specialists without spirit, sensualists without heart." The diagnosis is melancholic: modernity is characterized by expanding *Zweckrationalität* (instrumental rationality) at the expense of *Wertrationalität* (value rationality).

*Politics as a Vocation* defines the modern state as "a human community that (successfully) claims the monopoly of the legitimate use of physical force within a given territory." Two qualifications: the monopoly is *claimed* (empirical success contingent); the monopoly is over *legitimate* use. The lecture distinguishes the *ethic of conviction* (*Gesinnungsethik*) from the *ethic of responsibility* (*Verantwortungsethik*); political action requires the latter.

For our question: Weber's substrate adds *legitimation states* — the position of an authority-claim on the traditional/charismatic/rational-legal triangle, and the trajectory along which a particular authority-claim's basis is shifting (routinization moving charismatic claims toward traditional or rational-legal positions). Morphisms include installation, succession, the production of legitimacy through ritual or election or rule-application; the work-category structurally depends on which type of legitimation its substrate-states carry, because different legitimation types admit different morphisms (the rational-legal accepts impersonal rule-application; the traditional does not; the charismatic accepts the leader's interpretation as authoritative).

### Plural-justification substrate (Boltanski-Thévenot orders of worth)

Luc Boltanski and Laurent Thévenot's *De la justification* (1991; English *On Justification*, 2006) supplies a typology of *six orders of worth* (*cités* or "polities") that actors draw on to justify actions, criticize others' actions, and resolve disputes. Each derives from a foundational political-philosophical text:

| Order | Foundational text | Higher principle | Worthy objects | Characteristic test |
|---|---|---|---|---|
| **Inspired** | Augustine, *City of God* | Grace, inspiration, creativity | Imagination, the unexpected | Singular event of inspiration |
| **Domestic** | Bossuet | Tradition, hierarchy, generation | Family, custom, established places | Trust, loyalty, propriety |
| **Civic** | Rousseau, *Social Contract* | The general will, collective | Representatives, the public | Demonstration, mobilization |
| **Fame** | Hobbes, *Leviathan* | Public opinion, recognition | Celebrities, reputation, signs | Visibility, public acknowledgment |
| **Market** | Smith, *Wealth of Nations* | Competition, price, desire | Wealth, transactions, deals | Closing the deal, monetary success |
| **Industrial** | Saint-Simon | Productivity, efficiency, technical performance | Tools, machines, professionals, plans | Functioning effectively, measurable performance |

Each order has a six-element grammar: higher common principle; definition of worthy/unworthy states; dignity (capacity for worth shared by all members); repertoire of subjects; repertoire of objects; characteristic test that establishes worth and resolves disputes.

Boltanski and Chiapello's *The New Spirit of Capitalism* (2005) added a seventh order — the *projective city* (*cité par projets*) — with adaptability, connectivity, and project-based engagement as the higher principle, derived from late-twentieth-century management literature.

Three dispute-resolution mechanisms: *clarification* (actors discover they are working in the same order and disagreeing about test-application); *critique* (actors deploy one order to criticize the application of another — "you say it's profitable, but it's destroying community life" — market vs. domestic); *compromise* (hybrid arrangements satisfying multiple orders simultaneously without reducing one to another — the industrial-civic compromise of mid-twentieth-century Western welfare states). Compromises are fragile; *purifying critiques* can destabilize them in favor of one component.

David Stark's *The Sense of Dissonance* (2009) applies the framework to firms, treating organizations as zones of productive friction among multiple orders of worth. Cloutier-Langley (2013) map orders-of-worth onto institutional logics, noting both overlap and methodological tension (institutional-logics is more macro-structural and Weberian; orders-of-worth more micro-pragmatic and Durkheimian).

For our question: Boltanski-Thévenot's substrate is the *justification-repertoire state* of an action, claim, or arrangement. The same work-act, depending on which order is invoked, has different worth-conditions and different tests for success. Morphisms include the invocation of an order in a dispute, the deployment of critique across orders, and the construction (or destabilization) of compromises. The work-category is *plural at the justificatory level*: no single test settles all disputes; the same situation can be reached from multiple orders with different verdicts. This is a genuine multi-coding distinct from institutional logics' organizational multi-coding — orders-of-worth operate on *individual disputes* and *moments of justification*, not on organizational sectors.

### Legal-plural substrate (legal pluralism)

A further substrate distinct from both institutional logics and orders of worth: the *coexistence of multiple legal orders within a single social field*. Legal pluralism developed across roughly seventy years from colonial-administration anthropology through the 1970s–80s strong-pluralism debates to contemporary global legal pluralism.

Leopold Pospisil's *Anthropology of Law* (1971) synthesized the colonial-anthropology literature with the claim that every functioning subgroup has its own legal system, with four essential attributes: *authority*, *intention of universal application*, *obligatio* (binding character), *sanction*. Sally Falk Moore's "Law and Social Change" (1973) supplied the foundational unit: the *semi-autonomous social field* — a field that can generate rules and induce or coerce compliance, while also being vulnerable to rules emanating from the larger world surrounding it (the dressmakers' guild, the dock workers' association, the ethnic neighborhood, the corporation). Marc Galanter's "Justice in Many Rooms" (1981) argued that official state courts are one site among many in which disputes are processed and norms generated; *legal centralism* — the view that state courts are central — is empirically false against the reality of *indigenous law* and *private ordering* across workplaces, families, trade associations, religious bodies, professional disciplines.

John Griffiths's "What is Legal Pluralism?" (1986) supplied the field-defining distinction: *weak* legal pluralism is state-recognition of other rule-systems within carve-outs the state itself sets (colonial indirect rule; contemporary recognition of customary law within the constitutional framework); *strong* legal pluralism is the empirical claim that legal orders other than state law exist and operate independently of state recognition. Griffiths argued the weak conception is jurisprudentially derivative (it presupposes state authority to grant recognition) while the strong conception is sociologically genuine.

Sally Engle Merry's "Legal Pluralism" (1988) synthesized the field around three claims: pluralism is empirically pervasive (not exceptional); both colonial and "new" varieties exist (the new including corporations, professional associations, religious communities, civil-society organizations within Western states); the analytical task is to study *interactions* among coexisting orders, not just enumerate them. Brian Tamanaha's "Folly of the 'Social Scientific' Concept of Legal Pluralism" (1993) mounted the field's most sustained critique: if every rule-generating field is law, the category dissolves into the category of normativity. Franz von Benda-Beckmann's "Who's Afraid of Legal Pluralism?" (2002) defended the program as ongoing empirical research rather than conceptual taxonomy.

Boaventura de Sousa Santos (1987, 2002) generalized to global scale with the concept of *interlegality* — contemporary law constituted through the interaction of local, national, transnational, and supra-state orders that operate at different scales and through different mechanisms. Paul Schiff Berman's "Global Legal Pluralism" (2007) developed the *cosmopolitan pluralist* jurisprudence: the proliferation of overlapping orders should be embraced through procedural mechanisms (margin of appreciation, choice-of-law, recognition of foreign judgments) rather than resolved by harmonization.

For our question: the legal-plural substrate's objects are *semi-autonomous social fields* with their internal normative orders; the global object is the configuration of such fields with their patterns of interaction (accommodation, conflict, forum-shopping, hybridization, mutual influence, resistance). Morphisms include rule-generation within a field, cross-field forum-shopping (taking a dispute to whichever field's order is most favorable), and inter-field accommodation or conflict. Distinct from institutional-logics' multi-coding (which operates at the *organizational* level) and from orders-of-worth (which operates at the *moment-of-justification* level), legal pluralism operates at the level of *rule-systems-with-their-enforcement-apparatuses*: a social field has its own rules with its own ways of inducing compliance, and these rules may be inconsistent with state law or with another field's rules without the inconsistency dissolving either.

### Role substrate (sociological and computational role theory)

A distinct substrate is the *role* — a structured social position with associated expectations, obligations, capabilities, and performance standards, persisting across the particular agents who fill it.

Ralph Linton's *The Study of Man* (1936) introduced the foundational *status / role* distinction: status is a collection of rights and duties; role is the dynamic aspect — the enactment. Talcott Parsons's *The Social System* (1951) made role-expectations the central unit of social analysis: a role is defined by normatively governed orientations that ego has toward alter, embedded in reciprocal normative expectations. Roles are prescriptions, not descriptions of typical behavior; the same acts can be evaluated as excellent, adequate, or deficient by reference to the role's standards.

Erving Goffman's *The Presentation of Self in Everyday Life* (1959) and *Encounters* (1961) develop the *dramaturgical* analysis. Front/back-stage distinction: the same role is performed differently in front regions (audience present, performance managed) and back regions (performance relaxes). *Role distance* — the bearer's signals of critical separation from the role, performing it while establishing they are "more than" the role. *Role embracement* — the opposite, deep identification. Together these define the spectrum of role-person merger. Goffman's contribution: roles are dynamic accomplishments, not static types — enacted, maintained, negotiated.

Ralph Turner's "The Role and the Person" (1978) identifies *role-person merger* — the degree to which a person becomes identified with a role rather than merely performing it. Distinct from Goffman's role distance (a performed signal); Turner's merger is a psychological-and-social fact about how deeply the role constitutes the person's identity.

Bruce Biddle's "Recent Developments in Role Theory" (1986) identifies five strands: *functional* (Parsons — roles exist because the social system requires functions), *symbolic-interactionist* (Mead, Goffman, Turner — roles emerge from interaction; role-taking and role-making are interpretive processes), *structural* (roles as nodes in a network), *organizational* (roles as positions in authority hierarchies; role conflict, ambiguity, overload as coordination failures), *cognitive* (roles as mental schemas).

John Searle's *The Construction of Social Reality* (1995) and *Making the Social World* (2010): the *counts-as* formula — "X counts as Y in context C" — grounds role instantiation in *constitutive rules*. The distinction matters: regulative norms govern pre-existing behavior (speed limits regulate driving); constitutive norms create the possibility of the behavior they govern (the rules of chess constitute what it means to move a piece). Role-filling is constitutive. Grossi, Meyer, and Dignum (2008) supply the logical analysis. Guala and Hindriks (2015) propose the *normative upgrade* — the transition from mere behavioral regularity to explicitly recognized normative position.

Boella and van der Torre (2006, 2007) provide the most formally developed multi-agent account: a role is a bundle of obligations, permissions, and institutional powers in a normative system, indexed to a social position. Filling a role is two-phase: *role adoption* (agent commits to accepting the role's norm-set) and *role enactment* (agent performs actions evaluated against capability signature and norm-set). The set of role-conformant actions is closed under the normative system's closure operator.

Sandhu et al's Role-Based Access Control (RBAC, 1996) gives the computational fragment: $\mathrm{ROLES}, \mathrm{USERS}, \mathrm{PERMS}$ as sets; $\mathrm{PA} \subseteq \mathrm{ROLES} \times \mathrm{PERMS}$ permission assignment; $\mathrm{UA} \subseteq \mathrm{USERS} \times \mathrm{ROLES}$ user-role assignment; role hierarchy as partial order. ANSI/INCITS 359-2004 adds role inheritance, separation of duty (static and dynamic), role activation in sessions. RBAC captures the capability side; it omits obligations, prohibitions, and the role's interaction with the normative system's authority.

For our question: the role substrate has *role-states* as objects — for each (agent, role) pair, the agent's standing in the role (adopted, enacted, distanced, embraced, merged, in conflict with another role, in overload). Morphisms include role-adoption, role-enactment, role-exit, role-conflict-resolution, role-activation/deactivation in sessions. The substrate is naturally multi-actor (roles are defined by reciprocal expectations between ego and alter) and naturally typed (the role-as-type is bearer-independent; the role-as-token is the specific agent's filling at a specific time). The category of work-acts on a role substrate is structurally a fibration with the role-as-type as base and the role-as-token instances as fiber elements.

### Institutional and office substrate

A distinct substrate for work-acts is the *institutional/office* substrate — the normative-jural states that work-acts in governance, administration, and institutional domains operate on. The formal apparatus is well-developed.

An *office* (Kantorowicz 1957; Gierke 1873; Rilinger 2007) is a normative structure that persists independently of any particular holder. The formal model treats an office as a quadruple $O = (P, A, D_O, I^+)$:

- $P$ — the office's normative structure, defining the required predicates the incumbent must settle (Kantorowicz's *body politic* — the dignity that persists across holders; Gierke's *Amt* distinct from *Amtsträger*);
- $A$ — the action domain (acts and relations the office governs);
- $D_O : A \to \{\text{power, duty, privilege, immunity}\}$ — the Hohfeldian deontic profile, assigning each action a normative position independent of the holder;
- $I^+$ — the installation morphism (the constitutive speech act that begins settlement of an incumbency proposition).

John Searle's *The Construction of Social Reality* (1995) and *Making the Social World* (2010) develop the *status function declaration* — "X counts as Y in context C" — as the speech-act form of installation. J. L. Austin's *How to Do Things with Words* (1962) supplies the felicity conditions: appropriate authority, appropriate procedure, completeness. An attempted installation lacking the felicity conditions fails to advance the incumbency, regardless of the words used.

The Roman-law *munus / honor / dignitas* trinity (Callistratus, Digest 50.4.14; Rilinger 2007) corresponds to positions in a two-predicate settlement:

- *Munus* — forward obligation in place without recognized standing (induction settled, recognition unsettled). The leitourgos of Athens was compelled to fund the trireme (*munus*) without acquiring the honor.
- *Honor* — recognized standing has been conferred (recognition settled). The *honor municipalis* is administration with a grade of dignity.
- *Dignitas* — both settled simultaneously (full doubly-stable incumbency). Rilinger's analysis: *dignitas* is inherently comparative and relational, position within a ranked order.

Modestinus's priority rule (Digest 50.4.10) — *"Honorem sustinenti munus imponi non potest"* (one holding an honor cannot have a munus imposed) — is a formal constraint on the order in which the two predicates may settle. The *cursus honorum* (quaestor → praetor → consul) is a chain of office structures with progressively richer required predicates.

Kantorowicz's reconstruction of Tudor legal theory (Plowden's *Commentaries*, c. 1571): "The King has in him two Bodies, viz., a Body natural, and a Body politic." The *body politic* is the normative structure persisting across all histories; the *body natural* is the current occupant. *Dignitas non moritur* — the dignity does not die — because the dignity IS the structural commitment, not the holder. The phrase is medieval canonist formulation (Baldus de Ubaldis, Johannes Andreae) for the succession problem: the dignity passed instantaneously to the successor because it was never attached to the predecessor in the first place.

James Madison's *Federalist No. 51* gives the *constitutional opposition* condition: two offices $O_1, O_2$ are structurally opposed when their required predicates are mutually insulated — no unilateral act of $O_1$'s holder can advance a proposition into $O_2$'s required predicates' settlement, and vice versa. The separation of powers is the framework formulation of this condition. Madison's connection of personal interest to office prerogatives ("Ambition must be made to counteract ambition") converts personal ambition into structural self-defense by the office's required predicates.

The interregnum and vacancy: an office is vacant at history $t$ when its structure is defined but no incumbency claim is in joint affirming settlement on the required predicates. The Roman *interrex* held partial incumbency (induction settled, recognition not) — a *munus* without *honor* — for the duration of the interregnum. The *patrum auctoritas* (Senate's collective authority during interregnum) corresponds to the framework's covering structure on histories, the "rule of recognition" (Hart) at the base of the office.

For our question: the institutional/office substrate's objects are *normative-jural states* (compliance-spaces of offices at a history; incumbency configurations; the Hohfeldian-typed action positions). Morphisms include installation, delegation, recognition, induction; under specific constitutional regimes, additional constraints apply (Modestinus priority; constitutional opposition between offices; felicity conditions on installation). The substrate is naturally indexed by a category of histories or jurisdictions, with the office as a presheaf and the incumbency as a (partial) section. Categorically, the structure is well-modeled by a presheaf of Heyting algebras with nuclear closure operators for recognition and induction, restriction maps for delegation, and geometric morphisms for jurisdiction.

**Formal delegation.** The presheaf $H : T^{\mathrm{op}} \to \mathbf{HA}$ supports a precise formal account of delegation. A delegation of grant $G$ from principal $Q$ (at history $t$) to beneficiary $B$ (at $s \leq t$) corresponds to the restriction map $\rho_{t \to s} : H_t \to H_s$. Five structural facts of delegation follow from the algebra:

1. **Nemo dat (one cannot give what one does not have):** $B$'s accessible authority space is $\mathrm{image}(\rho_{t \to s})$, a sub-Heyting-algebra of $H_s$ isomorphic to $H_t / {\sim_\rho}$ (the *delegation kernel*). $B$ can exercise any HA operation on received elements without exiting the authority sub-HA. The content of nemo dat: $B$'s entire authority space is a quotient of $Q$'s by the coarsening that delegation introduces — $B$ cannot distinguish elements identified by the kernel and therefore cannot act differently on them.

2. **Shadow class stratification:** the type of delegated authority $a_B = \rho_{t \to s}(a_Q)$ in $H_s$ is determined by which nuclear-intertwining conditions hold for $\rho_{t \to s}$. Four cases (yes/no $\times$ yes/no for $\sigma$-intertwining and $\Delta$-intertwining): full authority $H^*_s$, satisfaction-shadow (recognized but not forward-committed), truth-shadow (operational but not backward-recognized), free-shadow (raw grant requiring both nuclear closures).

3. **Conditional grant closure:** $\mathrm{Fix}(\Delta_s)$ is a sub-Heyting-algebra of $H_s$; if scope-condition $c \in \mathrm{Fix}(\Delta_s)$ and granted-act $g \in \mathrm{Fix}(\Delta_s)$, then the conditional authority $c \Rightarrow g \in \mathrm{Fix}(\Delta_s)$. A well-bounded delegation produces forward-committed scope condition and grant, making the conditional authority forward-committed.

4. **Accountability non-transfer as directional asymmetry:** the principal's accountability proposition $\alpha \in H^*_t$ is not in $\mathrm{image}(\rho_{t \to s})$ because $\alpha$ lives in $H_t$ and the presheaf is contravariant — restriction maps run from $t$ to $s$, never the reverse. No operation at $s$ generates an element of $H_t$. This is the formal content of "delegation transfers authority but not accountability."

5. **Delegatus non potest delegare (the delegate cannot delegate further) as the quotient bound:** by presheaf functoriality, $\rho_{s \to r} \circ \rho_{t \to s} = \rho_{t \to r}$. If $B$ sub-delegates to $C$ at $r \leq s$, then $\mathrm{image}(\rho_{s \to r}|_{\mathrm{image}(\rho_{t \to s})}) \subseteq \mathrm{image}(\rho_{t \to r})$. The sub-HA $C$ receives is contained in the sub-HA that would result from $Q$ delegating directly to $r$: $B$ cannot give $C$ more than $Q$ could have given $C$ directly. This separates capacity (the HA-structural ceiling) from authorization (whether $B$'s sub-delegation is a valid act under the normative covering of the history site).

**Founding documents.** Constituting an institutional substrate requires a *founding document* — and the kind of document affects what work-acts on that substrate become possible. Seven document-types recur across history, each with its own structural requirements and governance functions:

- **Charter** — constitution granted by external authority (royal charter, city charter, corporate charter, ship's charter). Created by external grant; the chartering authority retains amendment power.
- **Constitution** — fundamental normative system declared as foundational, typically by an already-existing community (U.S. Constitution, UK unwritten constitution, organizational constitutions). Self-declared; supreme over subordinate documents; high amendment threshold.
- **Articles of incorporation / articles of association** — legal document by which incorporators establish a corporation as a legal entity, filed with the state. Creates legal personhood, liability shield, public notice.
- **Articles of agreement / ship's articles** — contract between captain and crew for a specific voyage. Bounded in time; establishes temporary hierarchy; specifies employment, conduct rules, dispute resolution; an example of a non-permanent founding document.
- **Bylaws** — operational rules subordinate to charter or constitution. Cannot override higher documents; lower amendment threshold; handles administrative machinery (meeting procedures, officer duties, quorum).
- **Covenant** — binding agreement between equals, morally and perpetually binding, emphasizing parties' commitments rather than external enforcement (Magna Carta, social contract, Haudenosaunee Great Law of Peace, church covenants). Distinct from contracts (which exchange value and rely on external enforcement); covenants are typically perpetual.
- **Treaty / compact** — binding agreement between sovereign or autonomous entities, governed by international law (Vienna Convention 1969 defines). Establishes mutual obligations without surrendering sovereignty; coordination between equals without superior authority.

**Cooperative constitutions** (Rochdale Pioneers 1844; Mondragon 1956; International Cooperative Alliance 1995) blend features of corporate articles, constitutional principles, and covenant language, with the seven cooperative principles (voluntary and open membership; democratic member control; member economic participation; autonomy and independence; education, training, and information; cooperation among cooperatives; concern for community).

Seven *universal governance functions* across all founding-document types: (1) constitute the entity with standing and legitimacy; (2) specify membership and standing of members; (3) distribute authority and decision-making power; (4) establish legitimate decision procedures; (5) declare rights and protections that constrain arbitrary power; (6) enable amendment with sufficient stability and flexibility; (7) provide for dissolution and succession. The seven document types are variations on this template, shaped by their origins (external grant vs. internal consent), scope (single organization vs. arrangement between organizations), and reliance on external vs. internal enforcement.

For the work-category: a founding-document type constrains the morphism class. A chartered organization admits morphisms within the charter's scope; a covenant-bound community admits morphisms compatible with the covenanted commitments; a treaty-bound coalition admits morphisms agreed-to by all parties. Conflicts between documents are resolved by the document hierarchy: bylaws subordinate to articles subordinate to charter; consent structures (covenants, treaties) cannot be amended unilaterally.

### Relational and affective substrate (care work, emotional labor, reproductive labor)

Arlene Daniels's "Invisible Work" (1987) develops the broader category: invisible work includes domestic labor, emotional labor, organizational citizenship, infrastructure-maintenance — all systematically uncounted by formal accounting.

Arlie Hochschild's *The Managed Heart* (1983) isolates *emotional labor*: the inducement or suppression of feeling in oneself to produce a particular feeling in another. The flight attendant's smile; the bill-collector's hostility. Emotional labor is genuine work — exhausting, skilled, performance-evaluated — but typically unrecognized because it does not produce a separate output beyond the worker's affective performance. Hochschild distinguishes *surface acting* (performance without inner change) from *deep acting* (self-modification to produce the affect). Her *Second Shift* (1989) documents the gendered distribution of household and child-care work; the "second shift" performed after the paid workday plus the *third shift* of managing emotional consequences.

Evelyn Nakano Glenn's "From Servitude to Service Work" (1992) and *Forced to Care* (2010) situate the analysis racially: paid reproductive labor has been performed disproportionately by women of color, with the racial division of reproductive labor structurally tied to the gendered division.

Silvia Federici's *Caliban and the Witch* (2004) and *Revolution at Point Zero* (2012) read the long arc as capital's enclosure of reproductive work: the systematic externalization of reproductive labor's costs onto unpaid (or underpaid) labor of women, racialized communities, and the global periphery. Dalla Costa-James's *The Power of Women and the Subversion of the Community* (1972) initiated the Wages for Housework tradition: reproductive labor is necessary for capitalist production but excluded from the formal labor relation; the exclusion is the surplus-extraction mechanism at the household level.

Leopoldina Fortunati's *The Arcane of Reproduction* (1995) develops the formal structure: reproductive labor produces use-values (a fed child, a cleaned home, a comforted partner) that the worker-of-tomorrow consumes as means of reproduction of labor power. Nancy Folbre's *The Invisible Heart* (2001) extends to *care economics*: care work has the structural feature that *its quality depends on its non-instrumentalization* — a paid carer can be efficient, but the care itself is qualitatively different from love-driven care.

For our question: this tradition's objects-of-work-acts include *states of the cared-for*, *states of the caring relationship*, *affective states* (the customer's mood, the worker's surface vs. deep performance), and *maintenance-states* (the standing of the household, the integrity of the kinship network, the upkeep of the infrastructure). Morphisms include care-acts, emotional-labor acts, and reproductive-maintenance acts whose target state is the same equivalence class as the source (the caregiver holds the substrate against decay). The visibility status of such morphisms is *not* an intrinsic property of the morphism but a function of the recognizing-system; the same act counts as work in some accounting regimes and not in others.

### Affective and immaterial substrate (post-operaismo)

The Italian *post-operaismo* (post-workerism) tradition, developed from 1960s *operaismo* through 1970s *autonomia* to contemporary cognitive-capitalism theory, supplies the most developed Marxist analysis of work whose output is subjectivity, attention, communicative capacity, knowledge, and affect.

The tradition's foundations: Raniero Panzieri's "Capitalist Use of Machinery" (1961, *Quaderni Rossi*) argues against an objectivist reading of Marx in which technology develops along its own neutral trajectory — technology is itself an instrument of capitalist control shaped by the antagonism at the point of production. The methodological corollary is *conricerca* (co-research) with workers. Mario Tronti's *Operai e Capitale* (1966) supplies the *Copernican inversion*: the working class is the *active subject* whose struggles drive capital's restructurings, not the reverse. The political implication is the *refusal of work* — refusing one's role as labor — and the continuous invention of struggle that capital must respond to.

Marx's *Grundrisse* "Fragment on Machines" (Notebook VII; published 1939, available in Italian in the 1960s) became central: Marx considers a future in which automation has made the *general intellect* of socialized humanity directly a force of production, value can no longer be measured in labor time, and the law of value enters crisis. Post-operaismo reads late-twentieth-century transformations as the gradual realization of this scenario. Carlo Vercellone's "From Formal Subsumption to General Intellect" (2007) systematizes the *cognitive capitalism* thesis as three historical regimes: *mercantile* (formal subsumption of pre-capitalist production), *industrial* (real subsumption through the factory), and *cognitive* (the becoming-productive of socialized knowledge, with the wage relation in protracted crisis).

Maurizio Lazzarato's "Immaterial Labor" (1996) supplied the field's defining concept. *Immaterial labor* is "the labor that produces the informational and cultural content of the commodity," divisible into:

1. **Informational content** — cybernetic and computer-control transformations in which the worker's activity is increasingly the manipulation of symbols and information.
2. **Cultural content** — production of cultural and artistic standards, fashions, tastes, consumer norms, public opinion.

Both kinds (i) produce subjectivity as their characteristic output; (ii) mobilize communicative and affective capacities developed largely outside the wage relation; (iii) cannot be measured in labor time; (iv) spill across the boundary between work and non-work — the worker's whole social life becomes potentially productive.

Hardt-Negri's tetralogy — *Empire* (2000), *Multitude* (2004), *Commonwealth* (2009), *Assembly* (2017) — supplied the macro-political-economic frame. *Empire*: contemporary sovereignty is *de-territorialized network sovereignty* operating through international institutions, transnational corporations, NGO networks, and the global media-information apparatus; there is no outside to capital. *Multitude*: the corresponding subject is not the people (sovereign-political construct) or the working class (Fordist-industrial) but the *multitude* — the open plural network of singularities whose communicative-affective-cognitive labor constitutes Empire's productive substrate, *constitutive* rather than derivative. *Commonwealth* and *Assembly* develop the politics of the *common* and of *assembly*.

Paolo Virno's *A Grammar of the Multitude* (2004) supplied the philosophical-anthropological complement. The general intellect is *ambivalent*: it is both capital's productive substrate and the substrate from which an alternative could be constructed; it can be mobilized for fascism as readily as for emancipation. Virno's multitude is closer to its Spinozan origin than Hardt-Negri's; its political implications are more cautious.

Franco "Bifo" Berardi's *The Soul at Work* (2009) develops the *psycho-pathological* analysis: when capital's value-extraction logic moves to the worker's *soul* — attention, affect, communication, intellect — it consumes the very subjective capacities that produce sociality. Contemporary epidemics of burnout, depression, anxiety, ADHD, suicide among knowledge workers and platform workers are *systemic effects* of value-extraction exceeding the soul's metabolic capacity, not individual pathologies.

Christian Marazzi's *Capital and Language* (2008) develops *language as productive force*: the late-twentieth-century financial revolution — centrality of expectations, communications, narratives in financial markets — is the financial appearance of a transformation in which linguistic activity itself has become directly productive of value.

Critical limits: empirical overreach (the immaterial-labor thesis arguably overestimates novelty and neglects the continuing material-labor base — mining, manufacturing, agriculture, logistics, care, sex work); Northern-Atlantic provincialism (the framework's referents are post-Fordist Western Europe and North America); class-analytic dilution (substituting "the multitude" for "the working class" evacuates analytical specificity); optimism about communicative cooperation (underestimates contemporary work's coercive and disciplinary dimensions). Nicholas Thoburn's *Deleuze, Marx and Politics* (2003) supplies a sympathetic-critical synthesis.

For our question: these traditions add *states of subjectivity*, *states of attention*, *communicative-capacity states*, *states of social cooperation*, and *states of the soul* (Berardi) as substrate. Work-acts that produce or modulate these are part of the category; the Marxian material-state focus does not exhaust the work-substrate of contemporary capitalism. The substrate is also *historically specific*: post-operaismo claims a structural shift from industrial to cognitive capitalism, with corresponding shifts in what substrate work-acts operate on.

### Algorithmic and platform substrate

The decade 2014–2024 produced a substantial empirical and theoretical literature on *platform work* and *algorithmic management* — labor mediated by digital platforms (Uber, TaskRabbit, Mechanical Turk, Deliveroo, Upwork, Care.com, Instacart) and managed not by human supervisors but by software systems allocating tasks, setting prices, evaluating performance, and disciplining workers algorithmically. The literature both reanimates the labor process tradition for new conditions and develops vocabulary for what is genuinely novel about platform-organized work.

Nick Srnicek's *Platform Capitalism* (2017) supplied an early typology: *advertising platforms* (Google, Facebook), *cloud platforms* (AWS), *industrial platforms* (GE Predix), *product platforms* (Spotify), *lean platforms* (Uber, Airbnb). Steven Vallas and Juliet Schor's "What Do Platforms Do?" (2020) supplied the field's standard synthesis: a platform is a digital infrastructure that enables and structures interactions between two or more user types, with the platform owner extracting value through fees, advertising, or data. Key analytical features: algorithmic intermediation, worker classification as contractors rather than employees, rating systems (consumers evaluate workers, workers evaluate consumers), information asymmetry.

Alex Rosenblat and Luke Stark's "Algorithmic Labor and Information Asymmetries" (2016) and Rosenblat's *Uberland* (2018) document how Uber's algorithmic systems exercise *managerial control* — task allocation, performance evaluation, surge pricing, deactivation — while denying employment. Drivers experience the platform as a manager, but a manager that is opaque, unaccountable, and immune to negotiation.

Katherine Kellogg, Melissa Valentine, and Angèle Christin's "Algorithms at Work" (2020) supplies the systematic theoretical synthesis. Algorithmic management is a *new contested terrain of control* (explicitly evoking Edwards 1979) characterized by the *6 R's*:

1. **Restricting** — narrowing the worker's choice set.
2. **Recommending** — directing the worker toward platform-preferred actions.
3. **Recording** — capturing detailed behavioral data.
4. **Rating** — evaluating performance in real time.
5. **Replacing** — substituting workers easily through the matching function.
6. **Rewarding** — adjusting compensation through algorithmically determined pricing.

Worker resistance correspondingly takes new forms: *algoactivism*, gaming the rating system, collective sharing of platform-knowledge through driver forums, regulatory and legal challenges to worker classification.

Alex Wood, Mark Graham, Vili Lehdonvirta, and Isis Hjorth's "Good Gig, Bad Gig" (2019) documents the *autonomy paradox* of platform labor: workers report high autonomy in some dimensions (when, where, how to work) and intense algorithmic control in others (which tasks, what pay, whether they remain on the platform).

Mary Gray and Siddharth Suri's *Ghost Work* (2019) documents the largely invisible labor force performing the "AI" tasks — image labeling, content moderation, transcription, data cleaning — that train and supplement machine-learning systems. Workers on Mechanical Turk and similar platforms perform millions of micro-tasks for fractions of a cent each, providing the human judgment that ostensibly autonomous systems require. The "ghost" is double: invisible to consumers (who experience the AI as unified) and invisible to labor regulation (classified as contractors performing isolated micro-tasks rather than employees performing jobs).

Alexandrea Ravenelle's *Hustle and Gig* (2019) categorizes platform workers as *Success Stories* (a small minority who benefit), *Strugglers* (desperate last resorts), and *Strivers* (the largest group, who entered with entrepreneurial hopes and found themselves precarious). Juliet Schor's *After the Gig* (2020) argues the original "sharing economy" was hijacked by venture-capital-backed platforms that captured the rhetoric while stripping out the redistributive substance.

Niels van Doorn's "Platform Labor" (2017) supplied the gendered and racialized analysis: platform labor disproportionately recruits women and workers of color into reproductive and care work (housecleaning, child care, food delivery) under conditions that strip out limited protections those occupations had achieved. The platform's "neutrality" operates against pre-existing racialized and gendered labor markets that the platform reproduces. Trebor Scholz's *Uberworked and Underpaid* (2017) articulates *platform cooperativism* — retain platform technologies while transferring platform ownership to worker-cooperatives.

Ifeoma Ajunwa's *The Quantified Worker* (2023) supplies the most comprehensive recent treatment of workplace surveillance and quantification — wearable devices, productivity-monitoring software, algorithmic hiring, predictive performance analytics, AI-mediated termination — and argues that contemporary workplaces are subject to a *quantified worker regime* operating largely outside the labor and privacy law frameworks that regulated earlier surveillance forms. Benjamin Shestakofsky's *Behind the Startup* (2024) argues that the imperatives of VC-funded growth — rapid scaling, market capture, eventual exit — drive characteristic patterns of worker classification, algorithmic management, and labor process design that are not reducible to platform technology as such.

For our question: this substrate adds *task-states* (in the platform-fragmented sense where work is atomized below the job level), *algorithmically-mediated assignment states* (the matching algorithm's classification of who-gets-what), *quantified-worker states* (the behavioral-data shadow each worker accumulates), *rating states* (the worker's score that determines future task access), and *information-asymmetry states* (the platform knows what neither workers nor consumers do). Morphisms include the platform's algorithmic operations (matching, pricing, ranking, deactivation) as a new species of work-act that does not have a human supervisor as agent.

A parallel literature treats algorithmic governance beyond the labor side — *governance by software and by indicators*. Karen Yeung's "Hypernudge" (2017) and "Algorithmic Regulation" (2018): *hypernudging* uses big-data analytics to dynamically and continuously personalize choice architectures to influence behavior at scale, far beyond Thaler-Sunstein's static nudges; algorithmic regulatory systems differ along three axes — type of decision (allocational, evaluative, behavioral), mode of operation (reactive vs. preemptive), transparency (open vs. opaque). Mireille Hildebrandt's *Smart Technologies and the End(s) of Law* (2015): classical legal regulation operates through *general rules* applied *after the fact* to *individual cases* under conditions permitting *contestation*; algorithmic regulation operates through *individual predictions* applied *in advance* to *categorized populations* often *precluding* contestation. This is structurally a different regulatory form.

Sally Engle Merry, Kevin Davis, and Benedict Kingsbury's *The Quiet Power of Indicators* (2015) and Merry's *The Seductions of Quantification* (2016): indicators (Doing Business, Human Development, Corruption Perceptions, Rule of Law indices) appear technical but are *constructed*; they exert governance effects without formal authority by making entities visible-and-comparable; they displace democratic deliberation, expert judgment, contextual evaluation by offering apparently-objective numerical alternatives. Wendy Espeland and Mitchell Stevens's "A Sociology of Quantification" (2008) supplies the synthetic framework: quantification is a social process with characteristic effects (commensuration, simplification, objectification).

Tarleton Gillespie's *Custodians of the Internet* (2018) and Nicolas Suzor's *Lawless* (2019): platforms make consequential governance decisions every day about permissible speech, suspensions, demotions, categories to police — decisions affecting billions of users without procedural protections of public regulation. Platform terms of service function as *constitutional documents* without the legitimacy and accountability mechanisms public constitutions are subject to.

Shoshana Zuboff's *The Age of Surveillance Capitalism* (2019): *surveillance capitalism* is a new accumulation logic — distinct from industrial capitalism — that extracts behavioral data as raw material, computes prediction products, and sells them in *behavioral futures markets*. Frank Pasquale's *The Black Box Society* (2015) focuses specifically on algorithmic *opacity* in finance, search, reputation.

Marion Fourcade and Kieran Healy's *The Ordinal Society* (2024, building on "Seeing Like a Market", 2017): contemporary digital infrastructures reorganize social life through *ordinal classification* — systematic ranking on consumer credit scores, FICO, search rankings, social ratings, employment-screening scores, healthcare risk scores, criminal-recidivism scores. Each score is locally rationalized as measurement; collectively they constitute a new social order in which *position in the ordinal hierarchy* re-stratifies life chances — interacting with rather than displacing class, race, and other inherited statuses, often amplifying their effects through ostensibly individualized scoring that imports historical patterns of disadvantage.

Virginia Eubanks's *Automating Inequality* (2018) documents how algorithmic systems in U.S. social services (Indiana welfare eligibility, Los Angeles homeless services, Pittsburgh child protective services) reproduce and amplify existing inequalities — automating and scaling existing punitive logics while obscuring them as technical-neutral. Ruha Benjamin's *Race After Technology* (2019): the *New Jim Code* — algorithmic systems (predictive policing, hiring algorithms, facial recognition, healthcare risk scoring) that systematically disadvantage Black and brown populations under the cover of technical neutrality.

For our question on the algorithmic-governance side: the substrate adds *ordinal-position states* (where each entity sits in the relevant score distribution), *indicator-visibility states* (whether the indicator regime recognizes the entity at all), *behavioral-prediction states* (what futures the algorithmic apparatus predicts for the entity), and *opacity-condition states* (the degree to which the entity can contest decisions made about it). Morphisms include the algorithmic scoring, the indicator-construction, the prediction-product sale, and (on the resistance side) the audit-of-algorithm, the contestation-of-classification, the abolitionist-replacement-of-algorithm.

### Intentional and cognitive substrate (philosophy of action, Bratman)

Returning to the philosophy of action with a substrate-specific lens: the *intentional state* of the agent (what is being attempted, what is being intended, what reasons are being acted on) is itself a possible substrate. Bratman's plans-as-intentions makes the agent's plan-state part of the structure: the morphism advances both the world-state and the agent's plan-state, and partial plans leave both partially specified.

For our question: this substrate gives *agent-intention states* (in the BDI tradition: beliefs, desires, intentions; in Bratman: partial plans, settled means, open ends). Work-acts modify both world-state and agent-intention-state simultaneously.

### Decolonial and non-Western substrates (Indigenous governance, Black radical tradition)

A class of substrates that the dominant Western traditions systematically render invisible or that operate outside Western governance-and-work categories.

**Indigenous governance traditions.** Multiple non-Western governance traditions organize work-and-governance through kinship, reciprocal obligation, ecological embeddedness, and consensus rather than through individual rights and state-sovereignty. Five traditions developed across distinct contexts:

- **Haudenosaunee Confederacy** (Mohawk, Onondaga, Oneida, Cayuga, Seneca, Tuscarora): the *Great Law of Peace* (Gayanashagowa) establishes consensus decision-making in a Grand Council (all member nations must agree); authority of *clan mothers* over the appointment and removal of male leaders (reversing top-down authority — clan mothers hold the impeachment power); and the *Seventh Generation principle* — leaders must consider consequences seven generations forward (~140 years). Documented in the *Encyclopedia of the Haudenosaunee* (Johansen and Mann, 2000); Grinde and Johansen, *Exemplar of Liberty* (1991).

- **Anishinaabe** clan governance: centered on the *Teachings of the Seven Grandfathers* (love, respect, bravery, truth, honesty, humility, wisdom). Clan leaders (*ogimaag*) represent their *doodem* (clan); leadership selection reflects embodiment of the seven teachings; a leader who fails to live according to these principles loses standing. Governance incorporates *seasonal authority* — decision-making structures follow ecological cycles and the calendar of harvests, hunts, ceremonies. Borrows, *Canada's Indigenous Constitution* (2010).

- **Ubuntu** (Southern African): "*I am because we are*" — individual dignity is inseparable from community participation and solidarity. Governance is structured toward maintaining and *restoring* community rather than penalizing violations through individual punishment. Metz (2011): human dignity under Ubuntu consists in one's capacity for community — the ability to identify with others and exhibit solidarity. Rights violations are *egregious degradations of communal capacity*, not violations of individual property or autonomy. Ramose, *African Philosophy Through Ubuntu* (1999).

- **Andean ayllu** (Quechua, Aymara): governance through *ayni* (reciprocal exchange between households — formalized mutual obligation, neither market exchange nor gift), *minka* (collective labor for shared benefit — irrigation, communal lands, ceremony), and *rotational authority* (no one holds permanent executive power; individuals take turns leading specific collective tasks then return to ordinary membership). *Complementarity* shapes authority: distributed across complementary positions, often with gendered dimensions (male/female balancing each other). Murra, *Economic Organization of the Inca State* (1980).

- **Aboriginal Australian** kinship governance: organized through *kinship systems* (moieties, sections, subsections — each person belongs to multiple overlapping groups simultaneously, position determining what they can do, must do, what authority they hold). *Songlines* are sacred routes across the landscape encoding law, history, geography, ceremonial obligation in narrative and song — simultaneously maps, legal codes, and governance documents. Authority over a Songline region belongs to those holding the songline knowledge, typically inherited through kinship. *Age-grade authority* complements kinship authority; leadership tied to life stages. Rose, *Dingo Makes Us Human* (1992); Strehlow, *Songs of Central Australia* (1971).

Common patterns across these traditions: *consensus or thick agreement* (waiting for genuine alignment rather than majority rule); *authority tied to community membership and kinship* (no generic decision-makers); *rotation and term limits* (preventing indefinite accumulation); *ecological embeddedness* (long-term obligation built into decision-making, not external constraint); *restorative accountability* (violations repaired through restoration and reintegration rather than individual punishment); *integration with normativity beyond law* (teachings, philosophy, ceremony, reciprocal obligation, not the operation of a legal system).

What these reveal about state-centric work-and-governance categories: the *cost of depersonalizing authority* (Western governance separates office from person; indigenous systems tie authority to kinship and personal standing); the *possibility of genuine long-term thinking* (Seventh Generation institutionalizes what Western governance treats as external recommendation); *authority as distributed capacity* (governance survives the failure of individuals); *accountability without formal legal machinery* (clan mothers' removal power, elder authority by respect, demonstrated embodiment); *governance as maintenance of relationship* (keeping relationships right between humans, between people and land, between present and future generations).

**Black radical tradition.** Cedric Robinson's *Black Marxism* (1983), Ruth Wilson Gilmore's *Golden Gulag* (2007), Saidiya Hartman's *Scenes of Subjection* (1997) and *Wayward Lives, Beautiful Experiments* (2019), Stefano Harney and Fred Moten's *The Undercommons* (2013), and W. E. B. Du Bois's *Black Reconstruction* (1935) construct a theory of governance-and-work that makes three interconnected claims.

*Racial capitalism* (Robinson): capitalism has *always been* racial; racial ordering is intrinsic to how capitalist systems function, not an accident. Western political systems — state, legal order, formal democracy — inherited racial ordering from feudal and mercantile antecedents. The state, as currently constituted, is fundamentally tied to the racial ordering of labor and value; formal equality within inherited structures reproduces domination at deeper levels.

*Organized abandonment* (Gilmore): contemporary governance operates not primarily through direct violence but through systematic exposure and deprivation. The state governs by deciding which populations, lands, and futures are surplus to requirement and may be abandoned. California's prison expansion was not a policy error but a governance solution to four simultaneous surpluses (land, capital, displaced workers, state capacity). *Abolition* is not merely the negation of this system — it is the positive construction of *life-affirming institutions* to replace those organized around abandonment.

*Afterlife of slavery* and *fugitivity* (Hartman): formal freedom within structures inherited from slavery does not become non-slaveholding by changing the law. The governance structures remain organized around control, containment, disposal. *Fugitivity* is the ongoing practice of evading state capture, creating social forms that elude the categories through which governance ordinarily operates — a normative practice organized by different principles than those the state enforces.

*The undercommons* (Moten-Harney): the governed have their own systems of organization, study, and collective decision-making outside formal institutions. *Black study* — collective intellectual work outside institutional frameworks — is itself a governance practice. The undercommons operates through *planning* — but planning that cannot be captured by the state apparatus, planning that remains fugitive, organized around *refusal*.

*Abolition-democracy* (Du Bois): during Reconstruction (1865–1880), freed people built new governance institutions — schools, hospitals, agencies — as *replacements* for those organized around slavery. This is governance theory in practice: building governance from scratch on different premises. "Abolition is about building life-affirming institutions."

For our question: these traditions add substrate-types that the dominant Western work-categories treat as either non-existent or as merely cultural variation rather than as structurally distinct. The Indigenous traditions add *kin-relation states* (the configuration of obligations across kinship), *relational standing states* (one's standing with respect to ancestors, future generations, the land), *seasonal-cycle states* (where in the annual cycle the work-substrate sits, which determines which work-acts are appropriate), and *ceremonial states* (whether the necessary ceremony has been performed). The Black radical tradition adds *organized-abandonment states* (which populations, lands, futures the system treats as surplus), *fugitivity states* (the configuration of practices that evade state capture), and *abolition-construction states* (the standing of life-affirming institutions being built to replace organized-abandonment ones). Morphisms include the maintenance-of-relationship acts (Indigenous), the construction-of-alternatives acts (Black radical abolitionist), and the refusal-acts (fugitivity, refusal-of-work-traceable to operaismo as well). The work-category on these substrates is structurally different from the Western default: governance-and-work is not the allocation of rights and the enforcement of duties; it is the maintenance of right relationship and the construction of life-affirming alternatives to systems organized for domination.

### Polycentric substrate (Ostrom)

Vincent Ostrom, Charles Tiebout, and Robert Warren's "The Organization of Government in Metropolitan Areas" (1961) introduces *polycentric* governance: a system with many decision-making centers, each formally independent of the others, but collectively producing patterned outcomes through their interaction (competition, contracting, conflict resolution, joint provision). The patterning is not imposed by any single center; it emerges from the rules under which centers interact. Roots in Michael Polanyi's *The Logic of Liberty* (1951) on scientific communities, common-law courts, and markets — domains where coordinated outcomes emerge without central direction.

Elinor Ostrom's *Governing the Commons* (1990) applied this to common-pool resources (irrigation, fisheries, forests, pasturelands, groundwater), where Hardin's 1968 "tragedy of the commons" predicted inevitable over-exploitation absent privatization or centralization. Ostrom documented hundreds of cases worldwide where local users had developed durable, sustainable governance fitting neither template, synthesized as eight *design principles*:

1. Clearly defined boundaries (of resource and of who has rights).
2. Congruence between appropriation/provision rules and local conditions.
3. Collective-choice arrangements with most appropriators participating.
4. Monitoring by appropriators themselves or by accountable monitors.
5. Graduated sanctions proportional to violation seriousness.
6. Conflict-resolution mechanisms — rapid, low-cost, locally accessible.
7. Minimal recognition of rights to organize by external authorities.
8. **Nested enterprises** — layered governance with appropriation, provision, monitoring, enforcement, conflict-resolution, and governance activities organized at multiple nested scales.

The eighth is the explicit polycentric move: durable commons governance embeds local-scale rules in regional-scale rules in larger-scale rules, with each scale operating semi-independently.

The *Institutional Analysis and Development* (IAD) framework (*Understanding Institutional Diversity*, 2005) decomposes any *action situation* into seven elements (positions, actors, allowed actions, available information, control over outcomes, costs and benefits, outcome-functions) and analyzes how biophysical conditions, attributes of community, and *rules-in-use* (operational, collective-choice, constitutional) shape the action situation. The seven rule types — boundary, position, choice, aggregation, information, payoff, scope — can each be modified at the three rule levels:

- **Operational rules** govern day-to-day choices of actors within fixed positions.
- **Collective-choice rules** govern how operational rules are made and modified.
- **Constitutional rules** govern how collective-choice rules are made and modified.

Changes at higher levels propagate down; changes at lower levels do not propagate up.

Ostrom's late work (2010) generalized polycentricity to complex economic systems including climate governance — effective response is necessarily polycentric (city, regional, national, international scales overlapping) rather than a single global regime.

For our question: the polycentric substrate is the *configuration of multiple decision centers* with their patterned interactions. Morphisms include operational rule-following, collective-choice rule-modification (which presupposes operational compatibility), and constitutional rule-modification (which presupposes collective-choice compatibility). The category is structurally *three-tiered* in the IAD sense: morphisms at each level can modify rules at the level below, but not above. The category supports the eight design principles as structural conditions — work-categories that violate them (e.g., centralized monitoring without local participation; sanctions disproportional to violation seriousness; absence of conflict-resolution mechanisms) tend toward unsustainability. The nested-enterprise structure (principle 8) requires the category to support multi-scale recursion, similar to Beer's recursive Viable System Model but with different content (governance of common-pool resources rather than viability of organizations).

### Practice substrate

Theodore Schatzki's *Social Practices* (1996) and *The Site of the Social* (2002), Andreas Reckwitz's "Toward a Theory of Social Practices" (2002), and Elizabeth Shove, Mika Pantzar, and Matt Watson's *Dynamics of Social Practice* (2012) treat *practices* themselves as the unit of analysis. A practice (cooking, driving, queuing, doctoring) is an organized array of doings and sayings linked by understandings, rules, and teleoaffective structures. Persons are *carriers* of practices, not their authors; the practice persists across its individual performances and its individual carriers.

Shove-Pantzar-Watson's three-element model: a practice bundles *materials* (physical objects, infrastructures, bodies), *competences* (skills, know-how), and *meanings* (significance, motivations). Practices are reproduced when carriers re-integrate the three elements; practices change when the elements reorganize. Activity theory's contradiction-driven development (Engeström) and practice theory's element-reorganization-driven change are partially convergent: both treat the unit of analysis (activity / practice) as the carrier of its own developmental dynamic.

For our question, practice theory sits at an oblique angle to the basic categorical proposal. The substrate is *the practice itself*: its state of integration (which materials, competences, meanings are currently bundled), its state of recruitment (which carriers it currently has), its state of relative dominance (whether it is being performed, displaced, or innovated). Morphisms are *performances* (each performance reproduces or modifies the practice), *recruitments* (a new carrier takes up the practice), and *integrations* (a new element is added to the bundle). The category of work-acts on a practice substrate is structurally different from the others: the unit of analysis is not the substrate-being-worked-on but the *practice-doing-the-work*. The framework has been read by some practice theorists as a critique of the standard subject-acts-on-object reading, not a specialization of it.

## Settlement structure

A separate body of work classifies work-acts not by their substrate but by *how settled the act itself is* — whether what to do and how to do it are known in advance. This is the work-type classification tradition.

The classical four-fold (across many sources, with names varying) classifies by two dimensions:

| | Execution settled | Execution open |
|---|---|---|
| Meaning settled | **Process** (routine; assembly line) | **Procedure** (engineering; custom manufacture) |
| Meaning open | **Derivation** (craft; artisan work) | **Inquiry** (research; non-routine) |

Charles Perrow's "Framework for the Comparative Analysis of Organizations" (1967) maps this onto *task analyzability* × *task variety*:

| | Low variety | High variety |
|---|---|---|
| High analyzability | Routine | Engineering |
| Low analyzability | Craft | Non-routine |

David Snowden and Mary Boone's Cynefin framework (2007) classifies situations by the relation between cause and effect:

- **Clear** (obvious) — cause and effect evident; best practice applies; sense-categorize-respond.
- **Complicated** — cause and effect require expertise; good practice applies; sense-analyze-respond.
- **Complex** — cause and effect coherent only in retrospect; emergent practice; probe-sense-respond.
- **Chaotic** — no relation between cause and effect at the system level; novel practice; act-sense-respond.
- **Confused** — you don't know which domain you're in.

Cynefin maps onto the four-fold: Clear ↔ Process, Complicated ↔ Procedure, Complex ↔ Inquiry. Chaotic requires immediate action to establish order, mapping less neatly. Cynefin's *disorder* domain is significant: the first act when in disorder is itself an inquiry to determine which domain one is in.

Ralph Stacey's matrix (2001) adds a dimension the basic four-fold does not capture: the degree of *agreement* among stakeholders. Two axes: certainty (technical solution understood?) and agreement (stakeholders agree on what to do?). A task can have settled meaning (goal clear) but low agreement (priorities disputed) — relevant in multi-stakeholder settings.

Stuart and Hubert Dreyfus's five-stage skill model (1980) — novice, advanced beginner, competent, proficient, expert — classifies the *worker's relationship to the work*, not the work itself. The same task can be process-type for an expert (executed automatically) and inquiry-type for a novice (executed by figuring out where to start). Work type is not intrinsic to the task; it is a *relation* between the task and the agent.

Gary Klein's *Sources of Power* (1998) studies how experts make decisions under time pressure. The recognition-primed decision model: experts recognize the situation, mentally simulate a course of action, and execute if simulation succeeds; analysis happens only when simulation reveals a problem. This explains why proficient and expert agents can execute procedure-type work as if it were process-type — they don't consciously branch; they recognize the pattern and act.

Across many sources, the four-fold is held to be *not a static classification* but a *trajectory*: inquiry settles to derivation when meaning is fixed; derivation settles to procedure when execution is encoded; procedure settles to process when edge cases are formalized. This is the **settlement path**.

John Dewey's *Logic: The Theory of Inquiry* (1938) gives the philosophical grounding: inquiry is "the controlled or directed transformation of an indeterminate situation into one that is so determinate in its constituent distinctions and relations as to convert the elements of the original situation into a unified whole." Dewey's *situation* is what gets transformed; the settlement path is Dewey's inquiry-cycle applied repeatedly.

Lave and Wenger's *Situated Learning: Legitimate Peripheral Participation* (1991) gives the social grounding: the trajectory from novice to expert practitioner is settlement-path-like at the worker level (Dreyfus). Bloom's "Learning for Mastery" (1968) gives the educational grounding: mastery learning produces fixed-point competence.

Mathematically: each settlement step is a *closure operator* on the work — extensive, monotone, idempotent. Inquiry under articulation-closure becomes derivation; derivation under encoding-closure becomes procedure; procedure under edge-case-formalization-closure becomes process. The settlement path is the composition of these closure operators.

For our question: the four-fold and the settlement path are not properties of the *objects* per se — they are properties of the *morphisms* (work-acts) and of the *settlement state* of the act-type. They suggest that the category of work-acts may carry additional structure: a *settlement-grading* on morphisms, or equivalently, a filtration of the category into subcategories of morphisms at each settlement level.

## Temporal structure

Endeavors have temporal character — and the temporal character is *not* a free parameter. It determines what cadences are structurally necessary, how urgency manifests, and what governance the endeavor requires. Bratman's defeasibility, Reinertsen's *Principles of Product Development Flow* (2009), and MacIntyre's *After Virtue* (1981) supply complementary accounts; the structural distinctions are stable across them.

Three temporal types:

**Aim-terminated endeavors** have a recognizable end-state. Build a bridge. Complete a novel. Cure a disease. The aim creates a *natural horizon* — a limit on how far ahead planning must look. Urgency comes from the *deadline* implied by the aim, increasing as the aim approaches. Cadence is *milestone-driven review*: phase gates created by the structure of phases, not imposed by external rhythm. The lifecycle is linear: preparation → execution → completion → closeout. Project-management frameworks (Gantt charts, critical path analysis, earned value tracking) all assume this temporal shape.

**Indefinite endeavors** have no natural endpoint. Pursue justice. Care for a family. Maintain an ecosystem. Advance human knowledge. The condition the endeavor addresses persists, possibly indefinitely. There is *no natural horizon* to work backward from. This creates a structural problem: indefinite endeavors *must impose artificial horizons through cadences*. A weekly review, a quarterly planning cycle, an annual retrospective — these are not convenience features but structural necessities. Without them, there is no recurrence, no checkpoints, no way to mark progress. Urgency in indefinite endeavors comes from *cadence boundaries*, not deadlines: "we must have a credible account of this week's progress by Friday" is not the same kind of urgency as "we must achieve justice by Friday." Indefinite endeavors require *nested horizons* (weekly, monthly, quarterly, annual, generational) with information flowing upward across scales.

**Aim-open endeavors** have an aim that transforms as the endeavor advances. Understand physics. Design a just society. Discover what healing means. The endpoint is not absent but unknown and self-revising. Horizons in aim-open endeavors must be *shorter and more flexible* than in aim-terminated ones: cannot plan five years ahead because five years of striving will transform what the aim means. Cadences must be *reflective rather than checkpointing*: not "did we hit the plan?" but "what are we learning about what the aim really is?" The cadence is the occasion for *aim-revision*. Urgency is decoupled from deadlines because completion is itself indeterminate.

For our question: the category of work-acts carries a *temporal-typing* on its endeavors (which are paths of composed morphisms, not single morphisms). Each endeavor-path is aim-terminated, indefinite, or aim-open, and the type determines what composition structures and what cadence morphisms the endeavor admits. An endeavor of one type cannot be governed with the operational infrastructure of another — running an indefinite endeavor with project-management Gantt charts fails structurally, as does trying to govern a bridge-building project with only weekly retrospectives. A complete category of work-acts admits all three types and the *multi-scale operations* their nesting requires.

Real endeavors are often *nested temporally*: a long-arc indefinite or aim-open endeavor contains aim-terminated sub-endeavors at shorter scales (a movement for justice contains specific aim-terminated campaigns; a research program contains specific aim-terminated experiments). The composition structure must support this nesting, with cadences appropriate to each scale and information flow between scales.

### Temporal structure of normative systems (Hart, Kelsen)

Beyond endeavor-temporality, the *normative system that governs the work-category itself* has its own temporal structure — a body of work originating with H. L. A. Hart's *The Concept of Law* (1961) and Hans Kelsen's *Pure Theory of Law* (1967).

Hart distinguishes *primary rules* (impose duties directly: "stop at red lights", "file a tax return") from *secondary rules* (rules about rules — they govern how norms are created, modified, extinguished). Three kinds of secondary rules:

- **Rules of recognition** specify which norms are in force — the criteria by which a rule counts as valid. The rule of recognition is not itself a norm validated by a higher rule (which would produce infinite regress); it is a social practice among officials.
- **Rules of change** authorize persons or bodies to introduce, modify, or repeal norms (a legislature's amendment authority; a constitutional convention's rewriting power).
- **Rules of adjudication** confer authority to determine whether a norm has been violated on a particular occasion (courts, administrative agencies, disciplinary boards).

Without secondary rules, a normative system is static; primary rules alone can sustain custom in a small stable community but any complex institution requires the secondary apparatus. Kelsen's *lex posterior* — the later norm overrides the earlier when they conflict — is itself a temporal rule that orders conflicting norms by time.

*Recurrence as the temporal mechanism of accountability*: democratic governance depends on a particular temporal structure. Elections recur, terms expire and renew, audits repeat, reviews are periodic. Without recurrence, accountability disappears: an official who cannot be removed, who faces no periodic review, who has no term limit, is accountable only to themselves. The Haudenosaunee Great Law of Peace encodes recurrence at the generational scale (Seventh Generation principle as temporal-horizon-setting); modern democratic theory formalizes it as term limits, periodic elections, regular audits, scheduled reviews.

*Accountability horizons*: does accountability persist after the bearer is relieved from their position? The answer is a design choice — office-bounded (the prior captain is no longer answerable) or perpetual (war-crimes tribunals hold former leaders accountable for acts during their tenure). *Sunset clauses* impose lifecycles on norms themselves (laws that expire unless renewed force periodic legislative reconsideration), making the temporal horizon of the norm explicit.

*Norm evolution vs. norm revolution*: how do normative systems change without collapsing? Hart's rule of change permits *evolutionary* amendment within existing secondary rules. Three traditions: *common law* evolves through repetition with distinction (*stare decisis* as the secondary rule governing how primary law evolves); *statutory* tradition through explicit rewriting; *Islamic jurisprudence* (fiqh) through *ijtihad* — reasoned interpretation by qualified jurists adapting norms to new circumstances while maintaining continuity with foundational texts. *Revolution* breaks the lifecycle — old norms abolished, new ones created, often without continuity with prior secondary rules (the American, French, Russian revolutions each broke with prior systems of recognition).

*Meaning-settlement vs. execution-settlement*: a norm can be meaning-settled (everyone recognizes it as in force) without being execution-settled (actually obeyed). This is why violated norms remain norms — the norm persists as meaning-settled even when execution fails. The legal system functions despite widespread violation because norm validity is not behavior-dependent.

For our question: the work-category lives *under* a normative system that has its own temporal structure. Morphisms include primary-rule-applications (within-norm work-acts), secondary-rule-operations (changes to the rules themselves), recurrence-acts (election, audit, review), and amendment-acts (with their amendment-thresholds). The category must accommodate the meaning/execution-settlement distinction: morphisms can be meaning-settled (the act-type is recognized as valid work-acting in the system) without being execution-settled (actually performed correctly).

## Composition structure

How do work-acts compose? The literatures supply several answers.

**Sequential composition** is uncontroversial: if $a$ takes state $S_1$ to $S_2$ and $b$ takes $S_2$ to $S_3$, then $b \circ a$ takes $S_1$ to $S_3$. This is the basic state-transition reading shared by von Wright, STRIPS, Petri, workflow management, and the basic Marxian labor process.

**Parallel/concurrent composition** is the tensor product: work-acts on disjoint substrates can happen in parallel without interfering. Meseguer-Montanari formalize this for Petri nets (concurrent firings on disjoint places); Joyal-Street formalize it in general; Thompson's pooled and sequential interdependence types reflect it operationally. The category of work-acts is at minimum *symmetric monoidal*.

**Reciprocal interdependence** (Thompson 1967) does not fit cleanly into the symmetric monoidal structure: units pass work back and forth, requiring real-time mutual adjustment. Categorically, this points toward *traced* monoidal structure (with feedback loops) or 2-categorical structure (with mutual-adjustment 2-cells between work-acts).

**Multi-agent structure.** Real work is divided across agents. Thompson's interdependence typology and Mintzberg's coordination mechanisms classify how work is held together across agents. Categorically, a *fibration* over a category of agents captures this: each fiber is the world from one agent's perspective; the global structure is the Grothendieck construction. Pooled interdependence is the trivial-morphism case; sequential is a chain; reciprocal is cyclic or symmetric.

**Goldman's act-trees** give a vertical composition: derived acts are performed-by-way-of basic acts. This is fibration-like — each act-token has a tree of act-types above it — not sequential composition.

**Articulation 2-cells.** Strauss's articulation work, formalized, gives morphisms-on-morphisms: a scheduling-act $\alpha: f \Rightarrow g$ aligns or orders two first-order work-acts $f, g$. The category of work-acts is at minimum a 2-category when articulation work is included.

**Marx-Braverman conception-execution split.** Under deskilling, work-acts factor: $w = e \circ c$, with conception-acts and execution-acts on different substrates (plan-documents vs. material). The category of work-acts under industrial capitalism is *not* the free composition of all morphisms — control regimes impose constraints on which compositions are admitted (which agent can perform conception, which can perform execution).

**Pull vs. push dispatch (kanban).** David Anderson's *Kanban* (2010) introduces a fundamentally different dispatch model. In *push* systems (traditional project management), work is assigned by a dispatcher; in *pull* systems, agents pull work from a queue when they have capacity. The pull model naturally limits work-in-progress (agents only pull when ready), eliminates the dispatcher bottleneck, gives agents autonomy over sequencing — but requires a well-ordered queue, which presupposes prioritization. Categorically, push and pull are dual: push is a morphism initiated by the dispatcher with the agent as target; pull is a morphism initiated by the agent with the queue as source. Routine work (process/procedure types) suits pull; complex work (derivation/inquiry types) often requires push by a coordinator with expertise about which agent fits the work.

**Barnard's zone of indifference.** Chester Barnard's *The Functions of the Executive* (1938) supplies the *acceptance theory of authority*: an order has authority only if the person receiving it accepts it. Barnard's *zone of indifference* is the range of orders a subordinate will accept without question; orders inside the zone are executed; orders outside the zone are questioned, resisted, or ignored. Categorically, this means the dispatch-morphism class is bounded by the receiving agent's acceptance-zone — a dispatch morphism that exits the zone is not a successful work-acting; it is a *failed dispatch* even if the issuer had formal authority. The zone is itself a property of the agent's substrate-state and shifts over time with experience, relationship, and accumulated trust.

**Multi-agent task allocation (Gerkey-Mataric).** Brian Gerkey and Maja Matarić's "A Formal Analysis and Taxonomy of Task Allocation in Multi-Robot Systems" (2004) supplies the formal taxonomy. Three dimensions classify allocation problems: single-task vs. multi-task agents; single-agent vs. multi-agent tasks; instantaneous vs. time-extended allocation. Each combination yields a distinct algorithmic problem with characteristic complexity. The taxonomy applies beyond robotics to any multi-agent work-allocation setting, including human-agent and mixed-team work.

## Failure modes

Work-acts fail in structured ways. Safety science and ethnomethodology supply the typology.

James Reason's *Human Error* (1990) gives a hierarchical taxonomy:

- **Slips** — right intention, wrong execution. The worker intended $f: A \to B$ but produced $f': A \to B'$.
- **Lapses** — right intention, no execution. The worker intended $f$ but produced nothing (omission).
- **Mistakes** — wrong intention. Planning-failure: the worker chose $f$ when the appropriate act was $g$.
- **Violations** — deliberate deviation for reasons external to the work itself.

Reason's *Swiss-cheese model* of organizational accidents: failure passes through aligned holes in multiple defense layers. Each defense is a barrier-morphism; each hole is a partial condition under which the barrier admits the failure-trajectory.

Charles Perrow's *Normal Accidents* (1984) establishes that in systems with *interactive complexity* (many non-linear interactions) and *tight coupling* (failures propagate fast), accidents are *normal* — structurally inevitable, not the result of careless workers. The failure rate is determined by topological properties of the work-graph, not just individual reliability.

Diane Vaughan's *The Challenger Launch Decision* (1996) establishes *normalization of deviance*: small deviations that produce no immediate failure become accepted as the new baseline, gradually shifting the operating point toward catastrophe. The capability-update is not always toward higher skill — it can be toward higher acceptance of risk, with the system's failure rate trending up while individual subjective competence remains stable.

Harold Garfinkel's *Studies in Ethnomethodology* (1967) establishes the *constitutive* role of breach and repair: the methodical character of social action becomes visible when expectations are breached and members repair the breach. Work is studded with micro-breaches and micro-repairs; the repair work is itself work and is the visible content of articulation work.

For our question: failure types are properties of *morphisms* — each work-act carries a realization-type (ok, slip, lapse, mistake, violation). Equivalently, the category of work-acts may be enriched in a *realization* monoidal category that records what actually happened on each attempted morphism. The endeavor/achievement gap (Chisholm/Hornsby/O'Shaughnessy) is exactly the gap between the morphism-as-attempted and the morphism-as-realized.

## Cross-cutting concepts (events, flow, records, distributed time)

A distinct body of work supplies *cross-cutting* concepts that bind the work-category's structure across all stages and substrates, rather than living in any one of them.

**Events and event sourcing.** Greg Young's "CQRS and Event Sourcing" (2010) and the broader event-sourcing tradition treat the *event log* — the immutable sequence of facts about what happened, with timestamps and actors — as the authoritative record. Current state is a derived view (a fold over events). Every work-act is an event; the event log is the audit trail. Categorically, the work-category is enriched in an *event monoid* (the free monoid on events); the current-state functor is the fold over events. An EAVT (Entity-Attribute-Value-Transaction) datastore is naturally event-structured: each transaction ID totally orders facts within a session.

**Flow as value delivery.** Donald Reinertsen's *The Principles of Product Development Flow* (2009) treats the work-system as a value stream. *Lead time* = entry to exit; *throughput* = exit rate; *WIP* (work in progress) = amount in the system. Reinertsen's principle: optimize for flow, not utilization. Every decision has a *cost of delay* — value lost per unit time while the decision is pending — and prioritization should follow cost-of-delay (Weighted Shortest Job First, WSJF). Categorically, flow gives the work-category a *throughput-metric* and a *delay-cost* functor on morphisms; the category's economic efficiency is its lead-time distribution and its bottleneck-stage identification.

**Records.** ISO 15489 (2016) defines a record as information created, received, and maintained as evidence — with four properties: *authenticity* (the record is what it claims to be), *reliability* (the record accurately represents the transaction it documents), *integrity* (complete and unaltered), *usability* (locatable, retrievable, interpretable). Records span all stages: plans, assignments, execution logs, metrics, reviews, feedback actions. Categorically, the work-category is enriched in a *record functor* assigning each morphism a record-state; the record-state's four properties determine whether the morphism's audit trail is intact.

**Distributed time.** Leslie Lamport's "Time, Clocks, and the Ordering of Events in a Distributed System" (1978) establishes that in a distributed system there is no global clock — only the partial ordering of events by *causality*. Event A happened-before event B iff A could have causally influenced B. Categorically, the work-category in any multi-agent setting carries a *partial order* on events, not a total order; concurrent events are unordered; the merging of concurrent partial results is itself a work-act (with characteristic failure modes — merge conflicts, double-counting, lost updates). Vector clocks, version vectors, and CRDTs (Conflict-free Replicated Data Types) are the formal apparatus for working with the partial order.

For our question: these cross-cutting concepts do not add new substrates or new morphisms; they add *enrichments* applying to all substrates and all morphisms. Every work-category in any non-trivial deployment carries an event-monoid enrichment (for accountability), a flow-throughput enrichment (for economic analysis), a record functor (for auditability), and a distributed-time partial order (whenever the category has more than one agent or one place).

## Feedback and self-regulation

A distinct body of work addresses how work-systems sense their own state, compare it to their intentions, and correct course. This is the cybernetic tradition and its descendants — feedback control, organizational learning, adaptive management. It supplies the structural account of how a work-category remains *viable* across time, not merely how its morphisms compose at an instant.

Norbert Wiener's *Cybernetics* (1948) takes its name from the Greek *kubernetes*, the steersman. The helmsman does not command the ship to turn; the helmsman turns the wheel, observes whether the ship responds, and corrects continuously. Governance, on this view, is not the issuance of commands but the maintenance of a system's course through feedback. A system under feedback control has: a *sensor* (measures current state), a *comparator* (compares measured to desired), and an *effector* (acts to reduce the difference). Wiener's *The Human Use of Human Beings* (1950) extends the analysis to human organizations: workers and managers are part of the feedback loop, not passive recipients of commands. Wiener distinguishes *negative feedback* (reduces deviation; the thermostat) from *positive feedback* (amplifies deviation; the microphone in front of its speaker).

W. Ross Ashby's *Introduction to Cybernetics* (1956) supplies the *Law of Requisite Variety*: only variety can absorb variety. A control system can regulate a target system only if the controller's repertoire of responses is at least as complex as the disturbances the target faces. Applied to work-organization: a highly centralized authority with a narrow rule set cannot govern a complex, heterogeneous workforce; the gap between the authority's response capacity and the world's complexity creates "black holes" where the system cannot respond. The implication: governance structures must be *distributed* — multiple agents at multiple scales with overlapping but distinct response capacities. Distribution of authority is a structural necessity, not a concession.

Stafford Beer's *Brain of the Firm* (1972) develops the *Viable System Model* (VSM) — five functions any organization must perform to remain viable in a changing environment:

- **System 1 (Operations)** — the units that do the actual work. Each is itself a viable system with its own feedback loops.
- **System 2 (Coordination)** — mechanisms that prevent System 1 units from oscillating against each other (a railroad timetable; an operating-room schedule).
- **System 3 (Control)** — management monitoring System 1's performance against organizational purpose, allocating resources. System 3* (audit) gives management an independent check.
- **System 4 (Intelligence)** — strategic planning and environmental scanning. The forward-sensing function.
- **System 5 (Policy)** — arbitrates between Systems 3 (current optimization) and 4 (environmental adaptation). Decides organizational identity.

The VSM is *recursive*: each level contains a complete five-function structure within itself. An organization with only System 1 and System 3 (operations and control) may be efficient short-term but is brittle — it cannot sense long-term changes. Beer's 1971–1973 *Project Cybersyn* in Allende's Chile demonstrated the VSM operationally: a telex network (Cybernet) linking factories to a central data store, an economic-model simulation (CHECO) for strategic foresight, a designed operations room with real-time displays, and the explicit goal of devolving authority to factory workers. The system proved its value during the 1973 truck-drivers' strike, directing scarce resources to regions most in need through decentralized coordination without centralized command. The project was interrupted by the September 1973 military coup.

Gregory Bateson's *Steps to an Ecology of Mind* (1972) added the analysis of pathological feedback — the *double-bind*: a situation where an agent receives contradictory messages from an authority and cannot escape or acknowledge the contradiction. A norm says "all employees are valued"; incentives reward those who suppress dissent. An authority says "we want innovation"; the review process penalizes all ideas that fail. The structural consequence: a system that feeds contradictory information to its agents loses the ability to receive accurate feedback — workers stop reporting problems; middle managers tell superiors what they want to hear; the feedback mechanism becomes corrupted.

Niklas Luhmann's *Social Systems* (1984) develops *autopoiesis* (Maturana-Varela): a system that produces and reproduces its own elements, *operationally closed*, using environmental disturbances as occasions for self-organization. The legal system reads the world through legal/illegal; the economic through payment/non-payment; the political through power/non-power. A mature social system does not respond to external signals directly — it translates them into its own internal operations. The governance implication: one cannot govern a social system from outside; one can only *irritate* it, creating occasions for its own self-correction.

Argyris and Schön's *Organizational Learning* (1978) develops the *single-loop / double-loop / triple-loop* distinction:

- **Single-loop** — change actions within the current plan. The review found a task took too long; adjust the estimate for similar tasks.
- **Double-loop** — change the plan, goals, or governing assumptions. The review found the plan was pursuing the wrong objective; revise the plan.
- **Triple-loop** — change how the organization learns. The review found that reviews aren't happening; institute a review cadence.

Most organizations stay in single-loop, getting better at executing their current approach but never questioning whether the approach is right. A complete feedback structure supports all three loops.

Mike Rother's *Toyota Kata* (2009) reveals that Toyota's continuous improvement is not cultural magic but a structured practice with four steps: understand the long-term direction, grasp the current condition (measured, not assumed), establish the next target condition (not the final goal, the next step), iterate toward the target (what obstacle prevents reaching it? what experiment will you run? what did you expect? what happened?). C. S. Holling's *Adaptive Environmental Assessment and Management* (1978) treats every management action as an experiment: plans should carry hypotheses; review checks whether the hypothesis held; if not, the feedback stage adjusts. Michael Nygard's Architecture Decision Records (2011) and Masaaki Imai's *Kaizen* (1986) supply the artifacts (ADRs that capture decisions with their context for future agents; small-incremental-change practice operating at session granularity) that make feedback recoverable in subsequent cycles.

For our question: the category of work-acts requires at minimum the *feedback structure* — sensor, comparator, effector — recurring at multiple scales (operational, organizational, strategic, identity-level). The *Law of Requisite Variety* is a structural constraint on which work-categories can govern which work-substrates. The *Viable System Model* gives the five-function structure that recursive viability requires. The *double-bind* analysis identifies a pathology that any work-category embedded in a normative system can develop: contradictory signals that destroy feedback integrity. The *autopoietic* framing reorients governance from external command to structural coupling — work-systems irritate but do not directly control each other. The *learning loops* give a typology of feedback morphisms (loop-1 morphisms operate on plans; loop-2 morphisms operate on goals; loop-3 morphisms operate on the learning process itself). Categorically, this is at least a three-tier 2- or 3-categorical structure: morphisms at one tier are 2-cells (or higher) relative to the tier they modify.

## Formalized theorems from the sociological literature

Several well-established findings can be stated as formal theorems on the category of work-acts (or its enriched variants), making the empirical content checkable against the categorical apparatus rather than merely organizable by it.

**Theorem (Perrow normal-accident lower bound).** *In a work-category with interactive complexity $\chi$ (maximum branching at any state) above $\chi_0$ and tight coupling $\tau$ (inverse of the time-window for worker intervention before failure propagation) above $\tau_0$, there exists $p_0 > 0$ depending only on $(\chi, \tau)$ such that for any work-chain $f_1, \ldots, f_n$, the probability of system failure is bounded below by $1 - (1 - p_0)^n$.* (Perrow 1984.) Empirical content: in normal-accident systems, training and individual diligence cannot reduce failure below $p_0$; what reduces it is reducing $\chi$ or $\tau$ — structural redesign, not worker effort.

**Theorem (Hochschild emotional-labor exhaustion).** *Deep-acting emotional labor has capability-update that depletes the worker's autonomous-affect resource by some $\delta > 0$ per act. Under sustained deep-acting, the capability trajectory converges monotonically to zero; the worker arrives at burnout, after which the emotional labor can be performed only through surface-acting or not at all.* (Hochschild 1983.) Empirical content: emotional-labor regimes requiring sustained deep acting (flight attendants, care workers, teachers) systematically produce burnout as a structural consequence of the labor's repeated draw on autonomous affect, not as a defect of individual workers.

**Theorem (Folbre care-pricing paradox).** *Suppose care-work has $V_{\mathrm{care}}(f, \mathrm{non\text{-}instrumentalized}) > V_{\mathrm{care}}(f, \mathrm{instrumentalized})$ — non-instrumentalized care produces more care-specific value than instrumentalized care. Then market-pricing of care shifts the motivation-distribution toward instrumental and strictly reduces aggregate care-value. Marketization of care-work produces a Pareto-inferior valuation outcome relative to non-market provision.* (Folbre 2001; care-economics literature.) Empirical content: paid care is systematically lower-quality than unpaid kin-care, controlled for hours and resources, because the act of pricing changes the act of caring.

**Theorem (Marx-Braverman surplus-and-deskilling).** *Under the Braverman conception-execution capability-flow constraint, sustained deskilling produces three effects: (i) the reproduction-cost of capability decreases over time as $\mathcal{C}$ becomes execution-heavy and conception-light, since conception is the high-value capability; (ii) the surplus gap between value-produced and wage-paid widens, since value tracks the management-determined plan while wages track the deskilled wage; (iii) the worker's capability trajectory loses its conception-component, so future work-acts requiring conception become unavailable — deskilling is structurally irreversible from the worker's side.* (Braverman 1974.) Empirical content: capitalist labor-processes structurally push toward deskilling and surplus-extraction; the asymmetry is not policy-contingent but built into the conception-execution split.

Other findings admit similar formal statements: Burawoy 1979's manufactured-consent (a control regime configuration producing high surplus while workers experience effort as voluntary); Edwards 1979's three control regimes as distinct configurations of the agent-fibration; Star 1991's politics-of-visibility (observer-relative visibility predicates have equilibria favoring privileged observers); Federici 2004's primitive-accumulation (a historical drift moving morphisms from production to reproduction while shifting their visibility to "refused"); Vaughan 1996's normalization-of-deviance (capability-update has a risk-accommodation component producing monotone risk-tolerance increase even with stable subjective skill).

That well-known sociological findings about real work admit clean formal statements on the categorical apparatus is itself a structural fact about the framing: the framing is contentful enough to derive empirical claims, not just descriptive enough to organize them.

## Visibility

A cross-cutting structural feature: not all work-acts are equally visible to the systems that count and recognize work. Strauss, Star, Suchman, Daniels, Hochschild, and Federici collectively establish that *visibility is political* — the choice of which work to count and which to leave uncountable is a political-economic choice, and the systems that count are themselves built by particular interests.

For our question: a visibility-predicate on morphisms is observer-relative. Each observing agent has a visibility-assessment of each work-act (typically with at least four values: recognized, refused, unsettled, contested). The formal accounting system (a privileged agent) has its visibility function; affected workers may have different ones; struggle changes the system's function over time. This makes the recognition-status of a work-act *not* a property of the morphism in isolation but of the (work-act, observer) pair.

## What the literatures collectively suggest

Reading across the literatures, four points converge and several diverge.

### Convergence 1: Objects are states-of-a-substrate

Across philosophy of action (von Wright, Goldman), planning (STRIPS), Petri nets (markings), workflow management (case-states), pragmatism (Dewey's situations), Marxian labor process (states of the Gegenstand), activity theory (states of the activity-object), CSCW (coordination states, situated configurations), classical organization theory (organizational states), care work (states of the cared-for and the relation), affective labor (subjectivity-states), and categorical process semantics (system-types) — the categorical objects are *states of some substrate*. Whitehead's process metaphysics resists this (actual occasions are processes, not states), but is the minority view.

The disagreements are about *what the substrate is*:

| Tradition | Substrate carrying the state |
|---|---|
| Philosophy of action (von Wright, Goldman) | The world (states of affairs / propositions that hold) |
| STRIPS / classical planning | The world (sets of ground atomic predicates) |
| Petri nets / workflow | The net (multisets of tokens on places) |
| Marx (labor process) | The material being worked on (Gegenstand) |
| Braverman | The material + conception-documents + execution-instructions |
| Burawoy | The material + the game-state at the point of production |
| E. P. Thompson | The worker's temporal-discipline state |
| Activity theory (Vygotsky, Leont'ev, Engeström) | The object-of-activity (oriented-toward goal-object) |
| CSCW (Strauss, Schmidt-Bannon) | Coordination configurations |
| Suchman | Situated configurations |
| Bowker-Star | Infrastructural / classification states |
| Classical organization theory (Mintzberg, Thompson J.D.) | Organizational states (structure, coordination, decision-premises) |
| Institutional logics (Friedland-Alford, Thornton-Ocasio-Lounsbury, DiMaggio-Powell) | Multiply-coded organizational states (market / state / family / profession / religion logics simultaneously) |
| Weber on legitimate domination | Legitimation states (traditional / charismatic / rational-legal positions and their routinization trajectories) |
| Boltanski-Thévenot orders of worth | Justification-repertoire states (which of the six cités is invoked; tests pending; compromises in place) |
| Role theory (Linton, Parsons, Goffman, Turner, Searle, Boella, RBAC) | Role-states ((agent, role) standing: adopted/enacted/distanced/embraced/merged/in-conflict) |
| Feminist organizational theory (Acker, Calás-Smircich, Martin, Federici, hooks) | Gendered (and racialized/classed) organizational states; the gendering-practices themselves as substrate |
| Indigenous governance traditions (Haudenosaunee, Anishinaabe, Ubuntu, ayllu, Aboriginal Australian) | Kin-relation states; relational-standing states (ancestors, future generations, land); seasonal-cycle states; ceremonial states |
| Black radical tradition (Robinson, Gilmore, Hartman, Moten-Harney, Du Bois) | Organized-abandonment states; fugitivity states; abolition-construction states (life-affirming institutions being built) |
| Polycentric governance (Ostrom Bloomington School) | Configurations of multiple decision centers; operational/collective-choice/constitutional rule-state at each level |
| Bratman | Agent-intention states (partial plans) |
| Care theory (Federici, Hochschild, Glenn, Folbre) | The cared-for; the caring relationship; affective states |
| Post-operaismo / immaterial labor (Lazzarato, Hardt-Negri, Virno, Berardi, Marazzi, Vercellone) | Subjectivity, attention, communicative capacity, the soul, language-as-productive-force, the general intellect |
| Platform/algorithmic work (Rosenblat, Kellogg-Valentine-Christin, Gray-Suri, Ajunwa) | Task-states (sub-job atomization), algorithmic-assignment states, quantified-worker behavioral-data states, rating states, information-asymmetry configurations |
| Dewey | The situation (indeterminate → determinate) |
| Whitehead | (Resists state-as-object — actual occasions are processes) |
| Office theory (Kantorowicz, Gierke) | Incumbency states; institutional positions |
| Cybernetic tradition (Wiener, Ashby, Beer, Bateson, Luhmann) | Feedback-system states (sensor reading, comparator gap, effector position); five-function viability state (VSM); double-bind / signal-integrity state; autopoietic self-reproduction state |
| Categorical process semantics (Joyal-Street, Coecke) | System-types (parametrically) |

What "the" category of work-acts has as objects depends on what work is being done. A category that pretends to be universal will trivialize. Realistic candidates are *parameterized* — categories of work-acts on a specified kind of substrate — and the cross-tradition structural commonality is that each tradition has *its* substrate filled in.

### Convergence 2: Morphisms are acts, and they compose at minimum symmetric-monoidally

Sequential composition (do $a$, then $b$) is uncontroversial. Parallel composition (do $a$ and $b$ on disjoint substrates simultaneously) is built into Petri-net theory, the categorical process semantics tradition, Thompson's pooled interdependence, and the activity-theoretic recognition that activities are multi-actor. The category of work-acts is at minimum symmetric monoidal.

### Convergence 3: The category is multi-agent

Real work is divided across agents in structured ways. Mintzberg's coordination mechanisms, Thompson's interdependence typology, Engeström's activity systems, Strauss's articulation work, and Marx's technical-vs-social division of labor all foreground multi-agent structure. The category is naturally read as a *fibration* over a category of agents (or activity systems), with the fibers being agent-local views of the work-substrate and the global structure being the Grothendieck construction.

### Convergence 4: Work-acts have settlement-grade

The four-type classification (process / procedure / derivation / inquiry) and its many cousins (Perrow's analyzability × variety; Cynefin's domains; Dreyfus's skill levels; Stacey's certainty × agreement) classify work-acts by how settled their meaning and execution are. The settlement is a *trajectory*, not a static fact: inquiry settles to derivation to procedure to process under repeated closure operations. This is a grading on morphisms, structurally orthogonal to substrate-choice.

### Divergence 1: The inner/outer (endeavor/achievement) gap

Chisholm/Hornsby/O'Shaughnessy insist on the gap between trying and doing. Reason's failure typology operationalizes the gap (slip = right intention, wrong execution; lapse = right intention, no execution). The endeavor tradition treats normative weight as attaching to the trying independently of the achievement. The formal traditions (planning, Petri nets, process semantics) typically do not encode this — a morphism is its image.

The substantive question: is the category of work-acts the category of *attempts* (with successful attempts being a subcategory or functorial image) or the category of *achievements* (with attempts being only the morphisms that landed)? The endeavor and failure-mode literatures argue for the attempts reading with a forgetful functor to the achievements category. The formal traditions argue implicitly for the achievements reading. Both are defensible; the literature does not settle.

### Divergence 2: Visibility / countability is observer-relative

Strauss/Star/Suchman/Daniels/Hochschild/Federici establish that what counts as work depends on the recognizing system. This complicates any categorical formalization that takes the work-act class as fixed: the morphism-class itself is observer-relative. Different observers (the formal accounting system, the workers themselves, the household-economy, the racialized division of reproductive labor) recognize different morphism-classes. The category of work-acts is *multi-observer*: each observer has its own subcategory of recognized morphisms, related by inclusion functors with non-trivial obstructions.

### Divergence 3: Failure modes require enrichment

Reason's typology (slips/lapses/mistakes/violations), Perrow's normal accidents, Vaughan's normalization of deviance, and Garfinkel's breach-repair structure require the category to carry failure-typing data. The plain morphism-as-state-transition reading does not natively express that a morphism *attempted* one transition but *realized* another. The category needs at minimum enrichment in a realization-monoid; richer treatments require Swiss-cheese composition structure (failure-trajectories through layered defenses).

### Divergence 4: Reproductive and maintenance work

Marx's labor process implicitly assumes transformation — the Gegenstand changes state under the work-act. Reproductive labor (Federici, Dalla Costa-James, Fortunati, Glenn, Folbre) works *against* state-decay: the worker holds the substrate against the world's drift. Categorically, these are *endo-morphisms* whose source and target are the same equivalence class under the salient-categorization, but whose existence is required to prevent the natural drift from taking the substrate to a different equivalence class. Reproductive labor's structural invisibility tracks this exactly: maintenance work appears as the absence of breakdown, not as a visible transformation.

## Toward a definition

The minimal commitment supported by the literatures collectively, posed with appropriate parameterization:

> **Definition (draft).** Given a *work-substrate* $\mathbf{S}$ — a class of states-of-the-thing-being-worked-on, supplied by the chosen tradition's account of what work operates on — and a category $\mathbf{Agt}$ of agents, the **category of work-acts on $(\mathbf{S}, \mathbf{Agt})$**, $\mathbf{Work}_{\mathbf{S}, \mathbf{Agt}}$, is a symmetric monoidal 2-category fibered over $\mathbf{Agt}$, equipped with realization, visibility, and settlement-grading enrichments, with:
>
> - **0-cells / objects** are elements of $\mathbf{S}$ (states of the work-substrate).
> - **1-cells / morphisms** $a : S_1 \to S_2$ are work-acts that *attempt* to transition $S_1$ to $S_2$. Each carries a description of agent, instruments, mediating artifacts, intention-under-which, social-and-normative context, and (for emotional/affective work-acts) the inner-side commitment alongside outer-side performance.
> - **2-cells** are *articulation acts* — morphisms-on-morphisms that align, schedule, repair, or reflexively monitor first-order work-acts (Strauss-Schmidt-Bannon).
> - **Composition** $b \circ a$ is sequential performance, defined when $a$'s target equals $b$'s source.
> - **Identity** $1_S$ is the no-op act at $S$ (Garfinkel's "nothing happened" — which itself, on closer look, is often maintenance work).
> - **Monoidal product** $\otimes$ is parallel performance on disjoint substrate-parts (Meseguer-Montanari for Petri nets; Joyal-Street in general).
> - **Fibration over $\mathbf{Agt}$**: each fiber is the work-substrate from one agent's perspective; the global structure is the Grothendieck construction. Thompson's pooled/sequential/reciprocal interdependence types correspond to the morphism-structure of $\mathbf{Agt}$. Mintzberg's coordination mechanisms correspond to subcategorical features.
> - **Realization-enrichment**: each morphism carries a realization-type in $\{$ok, slip($B'$), lapse, mistake($g$), violation($g$)$\}$ (Reason). Composition is Swiss-cheese composition.
> - **Visibility-enrichment**: each morphism carries an observer-relative visibility-predicate $\mathrm{vis} : \mathbf{Agt} \times \mathrm{Mor} \to \{$recognized, refused, unsettled, contested$\}$ (Strauss-Star-Suchman).
> - **Settlement-grading**: each morphism has a settlement-grade in $\{$inquiry, derivation, procedure, process$\}$ (or one of the equivalent four-folds); the grade is a property of the act-type-relative-to-agent (Dreyfus).
> - **Optional control-regime constraints**: under specific historical conditions, restrictions on which agents may perform which compositions (Marx's formal/real subsumption; Braverman's conception/execution split; Edwards's simple/technical/bureaucratic control; Friedman's direct control vs. responsible autonomy).
> - **Optional value/wage/surplus structure**: a valuation functor into a value-quantale and a wage functor on capability-states; the surplus-gap is a structural property of the resulting setup (Marx, Braverman).
> - **Optional temporal-typing on endeavors**: aim-terminated / indefinite / aim-open, with corresponding cadence structure (deadline-driven, cadence-boundary-driven, reflective). Nested temporal scales (session, daily, weekly, quarterly, annual, generational) with information flowing across scales.
> - **Optional feedback structure**: five-function viability (Beer's VSM) recursively at each scale; sensor-comparator-effector triples; requisite-variety constraint (Ashby) on which work-categories can govern which work-substrates; double-bind detection (Bateson); learning-loop tier (Argyris-Schön loops 1, 2, 3 as morphisms-on-morphisms-on-morphisms).
> - **Optional institutional-logics multi-coding**: the same substrate-state is simultaneously read under multiple logics (market, state, profession, family, religion); each logic admits different morphisms; the work-category's content depends on which logic is operative.
> - **Optional gendering / racialization / class-structuring** on the substrate (Acker, Federici, hooks): the substrate is not neutral but carries reproduction of social hierarchies through formal practices; gendering-practices are themselves morphisms on subjectivity-and-relational states.
> - **Optional algorithmic-management constraints** (Kellogg-Valentine-Christin's 6 R's; Rosenblat-Stark information asymmetry; Ajunwa quantified-worker regime): under contemporary platform conditions, work-acts are mediated by software systems with characteristic restriction/recommendation/recording/rating/replacing/rewarding morphisms.
> - **Optional legitimation-type structure** (Weber): each authority-bearing morphism carries a legitimation-basis (traditional / charismatic / rational-legal) and the substrate carries the routinization-trajectories along which one basis transforms into another.
> - **Optional plural-justification structure** (Boltanski-Thévenot): morphisms carry the order(s) of worth they are justified under; disputes are settleable by within-order tests, cross-order critiques, or hybrid compromises; the work-category admits multiple irreducible justification regimes simultaneously.
> - **Optional role-typed structure**: morphisms are typed by the role under which they are performed; role-adoption and role-enactment are two-phase operations; role-conflict and role-overload are structural failure modes.
> - **Optional kin-and-ceremonial structure** (Indigenous traditions): morphisms include kin-obligation-discharges, ceremonial maintenance acts, seasonal-cycle observances; the substrate carries seven-generation horizons and ancestor/future-generation relational standings; rotational and consensus structures on authority-bearing morphisms.
> - **Optional abolitionist/fugitive structure** (Black radical tradition): morphisms include refusal-acts (refusing participation in reproduction of inherited systems), fugitivity-acts (evading state capture), abolition-construction acts (building life-affirming institutions); the substrate carries organized-abandonment-states and counter-construction states.
> - **Optional polycentric structure** (Ostrom): the category is three-tiered with operational, collective-choice, and constitutional levels; rule-modification morphisms at each level presuppose compatibility at the level below; the eight design principles are structural conditions for sustainability of common-pool-resource work-categories; nested-enterprise structure for multi-scale recursion.
>
> The category may require further enrichment for specific substrates: relational/affective enrichment for care and emotional labor (Hochschild, Folbre); maintenance-vs-transformation structure for reproductive labor (Federici); contradiction-structure for activity-system development (Engeström); boundary-object structure for cross-community coordination (Star-Griesemer); recognition-primed-decision structure for expert-skill work (Klein); coalgebraic structure for plan-as-intention (Bratman); autopoietic structural-coupling (Luhmann) for inter-system irritation.

The variation across the literatures shows up entirely in:

1. **What fills the substrate $\mathbf{S}$** — material, organizational, situated, relational, affective, intentional, symbolic — which is a choice each tradition makes about what work operates on.
2. **What structure $\mathbf{Agt}$ has** — single agent, team, organization, multi-organization activity-system, kin-network, market.
3. **Which enrichments are operative** — realization, visibility, settlement-grading, value/wage, control regime — depending on which features of the work-situation the analysis is meant to capture.

The categorical apparatus (symmetric monoidal 2-category fibered over agents, with appropriate enrichments) is shared across traditions; the substantive disagreements are about substrate, agent structure, and which enrichments matter. This is not a defect of the framing — it is what the framing reveals.

### What the literatures collectively do *not* settle

- Whether the category of work-acts on a substrate is *uniquely determined* by the substrate, or whether multiple non-equivalent categories operate on the same substrate (different control regimes give different categories on the same Gegenstand; Braverman vs. Friedman vs. Burawoy each pick out a different category on the same factory floor).
- Whether the cross-tradition unification — one big category that contains everyone's morphisms — is achievable or even desirable. The convergence is structural (the formal apparatus is shared); the substantive content (what each substrate is) is not. Suchman, Lazzarato, and Whitehead each give principled reasons to resist the unifying move.
- Whether the inner/outer distinction (endeavor vs. achievement) is best handled as a 2-cell structure, a functor between attempt-category and achievement-category, or a different category altogether.
- Whether work-acts on social/relational/affective substrates compose categorically in the same way work-acts on material substrates do. Folbre's care-pricing paradox suggests not: the act of pricing care changes the act of caring; this is a structural non-locality the symmetric monoidal apparatus does not natively capture.
- The status of *contradiction* (Engeström) as developmental engine in $\mathbf{Work}$: is it a 2-categorical structure (contradiction as 2-cell pointing to its own resolution-act)? An obstruction class in cohomology? A separate cycle structure?
- The exact relationship between the four-fold settlement classification and the categorical structure. Is settlement a grading? A filtration? A factor through a quotient category? The literature gives the four-fold but no formal statement of its categorical content.

## What I synthesized this session that may not be in source

- The framing "category of work-acts" with the explicit categorical apparatus (objects, morphisms, composition, identity, monoidal structure, fibration, 2-categorical articulation, enrichments) as the unifying frame across the literatures is mine. Few of the substantive traditions (philosophy of action, labor process theory, activity theory, CSCW, care/feminist theory) pose the question categorically; the formal traditions (planning, Petri nets, categorical process semantics) do. The cross-tradition unification under the categorical apparatus is the survey's structural move and should be treated as one available framing, not as the literatures' own framing.
- The table mapping traditions to substrate-fillings is mine, organized to display the structural commonality. Specialists in any one tradition would refine or push back on individual rows; activity theory's "object of activity" in particular has a delicate technical meaning that specialists may want preserved more carefully than the table allows.
- The reading of Goldman's act-trees as a fibration over basic acts is mine. Goldman does not pose his framework categorically.
- The reading of Marx's labor process as *the category whose objects are states of the Gegenstand* is straightforward from Marx's text but is not how labor-process-theory literature itself frames it; the literature typically frames the labor process as a *system* or a *site*.
- The reading of Strauss's articulation work as 2-categorical structure on $\mathbf{Work}$ is mine, drawn from the structural content of Strauss's four articulation moves. Strauss did not pose articulation work in 2-categorical terms.
- The reading of reproductive labor as maintenance endo-morphisms is mine, drawn from Federici/Fortunati's structural argument that reproduction holds the worker against decay. The reproductive-labor literature does not pose this categorically.
- The reading of failure modes (Reason) as a realization-enrichment on the morphism class is mine.
- The convergence claim — that across the literatures, objects are states-of-something and morphisms are acts — is real but partial. Whitehead is the clearest dissenter (actual occasions are processes, not states). Practice theory dissents implicitly (the practice, not its states, is the unit of analysis). Suchman dissents formally (no pre-specified state-space). The "convergence" should be read as "most traditions most of the time," not as a settled cross-tradition agreement.
- The draft definition is mine. No source writes it down in this form. It is the cleanest formalization the categorical-process-semantics tradition makes available, instantiated with the variable substrate $\mathbf{S}$, agent-category $\mathbf{Agt}$, and enrichments that the substantive literatures supply.
- The reading of the *6 R's* of algorithmic management as a constraint-system on morphisms in the work-category is mine. Kellogg-Valentine-Christin name the 6 R's as control mechanisms, not categorical constraints.
- The reading of institutional logics as multi-coding of the substrate is mine. Friedland-Alford and Thornton-Ocasio-Lounsbury treat logics as cognitive/cultural structures, not formal multi-codings.
- The reading of the Viable System Model's five functions as a recursive structure on the work-category is largely faithful to Beer's own framing, but Beer did not write the structure in 2-categorical or higher-categorical terms; the formal lift is mine.
- The reading of double-binds as signal-integrity defects in the feedback enrichment is mine. Bateson named double-binds as pathologies; reading them as feedback-enrichment defects is my categorical translation.
- The reading of the three temporal types (aim-terminated / indefinite / aim-open) as a typing on endeavor-paths is faithful to the philosophical/sociological literature on temporality but is not formalized there as a categorical typing.
- The reading of feminist organizational theory's practicing-gender (Martin) as morphisms on subjectivity-and-relational states is mine. Martin's "doing gender" frame is sociological, not categorical.
- The reading of Weber's three pure types as positions in a routinization-trajectory triangle is largely faithful to Weber's own treatment (the *Veralltäglichung des Charisma* is his own term), but the categorical-trajectory framing is mine.
- The reading of Boltanski-Thévenot's orders of worth as a distinct kind of multi-coding from institutional logics' multi-coding is mine. Both literatures treat plural normative structures; the methodological distinction (Weberian-macro vs. Durkheimian-pragmatic) is Cloutier-Langley's; the categorical reading that they are distinct enrichments of the work-category is my interpolation.
- The reading of role theory as a fibration with role-as-type as base and role-as-token as fiber elements is partially faithful to Masolo et al's foundational distinction but pushes further than their treatment.
- The reading of Indigenous governance traditions as adding kin-relation, relational-standing, seasonal-cycle, and ceremonial states to the substrate is mine. None of the source traditions pose the categorical reading; the sociology-of-governance surveys describe the practices without categorical formalization.
- The reading of the Black radical tradition as adding organized-abandonment, fugitivity, and abolition-construction states is mine. The source thinkers (Robinson, Gilmore, Hartman, Moten-Harney, Du Bois) do not write categorically. The reading is faithful to their substantive claims about what governance does and what alternatives are possible; the categorical reformulation is interpretive.
- The reading of Ostrom's IAD framework as a three-tiered category (operational / collective-choice / constitutional) with upward-propagation constraints is largely faithful to her own framing of rule levels; the categorical-tier vocabulary is mine.
- The remaining operational-domain surveys (`planning-and-scheduling-survey`, `execution-and-monitoring-survey`, `review-and-retrospective-survey`, `tracking-and-measurement-survey`, `personal-task-management-survey`, `settlement-of-work-management`, `capability-dictionary`) appear to parallel surveys already incorporated (`formal-planning-theory`, `feedback-and-organizational-learning-survey`, etc.) and to operationalize concepts already covered (the settlement path, capability/skill vocabulary). Specialist additions from these would refine without restructuring. The terms/ subtree (~100 individual term definitions) has not been entered; some terms (e.g., `manufacturing-consent`, `contested-terrain`, `bounded-rationality`, `general-intellect`, `iron-cage`, `deskilling`, `articulation-work`) anchor scholarly concepts already covered above, while others (`cadence`, `capability`, `delegation`, `dispatch`, `endeavor`, `execution`, `plan`, `task`, `workflow`) are working vocabulary for which the substantive scholarship has been incorporated via the texts.

## Provenance

The substantive content of this survey draws on the repo's existing surveys of the cited literatures — `labor-process-theory-survey.md`, `activity-theory-survey.md`, `articulation-work-and-invisible-labor-survey.md`, `classical-organization-theory-survey.md`, `work-type-classification-survey.md`, `sociological-extensions-of-the-work-theory.md`, `formal-planning-theory.md`, `the-settlement-path.md`, `philosophy-of-endeavor.md`, `ontology-of-work-operations.md`, `algebraic-structure-of-work.md`, `formal-structure-of-office.md` — read in full this session, plus direct knowledge of the cited primary sources.

Cited works (consolidated bibliography):

**Analytic philosophy of action:** Anscombe (1957), Chisholm (1976), Davidson (1980), Goldman (1970), Hornsby (1980), O'Shaughnessy (1980), von Wright (1963, 1971).

**Process philosophy and pragmatism:** Dewey (1938), Whitehead (1929).

**Marxian labor process theory:** Marx (*Capital* Vol. I, 1867; *Resultate* 1864/1933), Braverman (1974), Burawoy (1979, 1985 — *The Politics of Production*), Edwards (1979), Friedman (1977), Thompson and Smith (eds., 2010), Knights and Willmott (eds., 1990), Paul Thompson (1983), E. P. Thompson (1967).

**Cultural-historical activity theory:** Vygotsky (1978), Leont'ev (1978), Engeström (1987, 2001), Cole (1996), Kaptelinin and Nardi (2006), Blackler (1995), Miettinen (1999).

**CSCW and articulation work:** Strauss (1985, 1988), Star (1991), Star and Strauss (1999), Star and Griesemer (1989), Schmidt and Bannon (1992), Suchman (1987, 1995), Bowker and Star (1999), Daniels (1987).

**Classical organization theory:** Taylor (1911), Fayol (1916), Mayo (1933), Roethlisberger and Dickson (1939), Barnard (1938), Simon (1947), March and Simon (1958), Cyert and March (1963), J. D. Thompson (1967), Galbraith (1973), Mintzberg (1979, 1983), Selznick (1949).

**Care, feminist, and reproductive labor:** Hochschild (1983, 1989), Glenn (1992, 2010), Federici (2004, 2012), Dalla Costa and James (1972), Fortunati (1995), Folbre (2001).

**Affective and immaterial labor / post-operaismo:** Panzieri ("The Capitalist Use of Machinery", 1961), Tronti (*Operai e Capitale*, 1966), Marx (*Grundrisse*, 1857–1858/1939), Lazzarato (1996), Hardt and Negri (2000, 2004, 2009 — *Commonwealth*, 2017 — *Assembly*), Virno (2004), Berardi (*The Soul at Work*, 2009), Marazzi (*Capital and Language*, 2008), Vercellone ("From Formal Subsumption to General Intellect", 2007), Thoburn (*Deleuze, Marx and Politics*, 2003).

**Platform and algorithmic work:** Srnicek (*Platform Capitalism*, 2017), Vallas and Schor ("What Do Platforms Do?", 2020), Rosenblat and Stark ("Algorithmic Labor and Information Asymmetries", 2016), Rosenblat (*Uberland*, 2018), Kellogg, Valentine, and Christin ("Algorithms at Work", 2020), Wood, Graham, Lehdonvirta, and Hjorth ("Good Gig, Bad Gig", 2019), Gray and Suri (*Ghost Work*, 2019), Ravenelle (*Hustle and Gig*, 2019), Schor (*After the Gig*, 2020), van Doorn ("Platform Labor", 2017), Scholz (*Uberworked and Underpaid*, 2017), Ajunwa (*The Quantified Worker*, 2023), Shestakofsky (*Behind the Startup*, 2024).

**Algorithmic governance and governance-by-indicators:** Yeung ("Hypernudge", 2017; "Algorithmic Regulation", 2018), Hildebrandt (*Smart Technologies and the End(s) of Law*, 2015), Merry, Davis, and Kingsbury (eds., *The Quiet Power of Indicators*, 2015), Merry (*The Seductions of Quantification*, 2016), Espeland and Stevens ("A Sociology of Quantification", 2008), Gillespie (*Custodians of the Internet*, 2018), Suzor (*Lawless*, 2019), Zuboff (*The Age of Surveillance Capitalism*, 2019), Pasquale (*The Black Box Society*, 2015), Fourcade and Healy ("Seeing Like a Market", 2017; *The Ordinal Society*, 2024), Eubanks (*Automating Inequality*, 2018), Benjamin (*Race After Technology*, 2019).

**Legal pluralism:** Pospisil (*Anthropology of Law*, 1971), Moore ("Semi-Autonomous Social Field", 1973), Galanter ("Justice in Many Rooms", 1981), Griffiths ("What is Legal Pluralism?", 1986), Merry ("Legal Pluralism", 1988), Tamanaha ("The Folly of the 'Social Scientific' Concept of Legal Pluralism", 1993; "Understanding Legal Pluralism", 2008), Benda-Beckmann ("Who's Afraid of Legal Pluralism?", 2002), Santos ("Law: A Map of Misreading", 1987; *Toward a New Legal Common Sense*, 2002), Berman ("Global Legal Pluralism", 2007).

**Cross-cutting work concepts:** Young ("CQRS and Event Sourcing", 2010), Reinertsen (*The Principles of Product Development Flow*, 2009), ISO 15489-1:2016 (*Records management*), Lamport ("Time, Clocks, and the Ordering of Events in a Distributed System", 1978), Anderson (*Kanban*, 2010), Gerkey and Matarić ("A Formal Analysis and Taxonomy of Task Allocation in Multi-Robot Systems", 2004), Barnard (*The Functions of the Executive*, 1938 — referenced again for the acceptance theory of authority and zone of indifference).

**Cybernetics and organizational learning:** Wiener (*Cybernetics*, 1948; *The Human Use of Human Beings*, 1950), Ashby (*Introduction to Cybernetics*, 1956), Beer (*Brain of the Firm*, 1972; *Designing Freedom*, 1974), Bateson (*Steps to an Ecology of Mind*, 1972), Luhmann (*Social Systems*, 1984), Project Cybersyn (1971–1973, as documented by Medina in *Cybernetic Revolutionaries*, MIT Press 2011), Argyris and Schön (*Organizational Learning*, 1978), Rother (*Toyota Kata*, 2009), Holling (*Adaptive Environmental Assessment and Management*, 1978), Nygard ("Documenting Architecture Decisions", 2011), Imai (*Kaizen*, 1986), Reinertsen (*Principles of Product Development Flow*, 2009), MacIntyre (*After Virtue*, 1981).

**Feminist organizational theory:** Acker ("Hierarchies, Jobs, Bodies", 1990), Calás and Smircich ("From the Woman's Point of View", 1996), Martin ("'Said and Done' Versus 'Saying and Doing'", 2003; "Gendering and Evaluating Dynamics", 2001), Federici (2004, 2012), hooks (*Feminist Theory: From Margin to Center*, 1984).

**Institutional logics:** DiMaggio and Powell ("The Iron Cage Revisited", 1983), Friedland and Alford ("Bringing Society Back In", 1991), Thornton, Ocasio, and Lounsbury (*The Institutional Logics Perspective*, 2012), Greenwood et al. ("Institutional Complexity and Organizational Responses", 2011), Boltanski and Thévenot (*On Justification*, 2006).

**Practice theory:** Schatzki (1996, 2002), Reckwitz (2002), Shove, Pantzar, and Watson (2012).

**Safety science and ethnomethodology:** Reason (1990), Perrow (1984), Vaughan (1996), Garfinkel (1967).

**Office and institutional work:** Kantorowicz (1957), Gierke (1873), Rilinger (2007), Searle (1995, 2010), Austin (*How to Do Things with Words*, 1962), Madison (*Federalist No. 51*, 1788), Selznick (1949, 1957 — *Leadership in Administration*), Plowden (*Commentaries*, c. 1571, as treated by Kantorowicz), Callistratus and Modestinus (*Digest* 50.4, as treated by Rilinger), Baldus de Ubaldis and Johannes Andreae (as treated by Kantorowicz on *dignitas non moritur*).

**Founding documents:** *Magna Carta* (1215), *U.S. Constitution* (1787) and *Bill of Rights* (1791), *UK Constitution* (Magna Carta plus Bill of Rights 1689 plus Acts of Parliament plus constitutional conventions), *Treaty of Westphalia* (1648), *UN Charter* (1945), Vienna Convention on the Law of Treaties (1969), *Rochdale Pioneers Cooperative* (1844), *Mondragon Cooperative Corporation* (founded 1956), International Cooperative Alliance Statement on Cooperative Identity (1995), British Merchant Shipping Act (1850), Royal Charter of the Royal College of Physicians (1535), *Nuclear Non-Proliferation Treaty* (1968), *International Covenant on Civil and Political Rights* (1966), Haudenosaunee Great Law of Peace (Gayanashagowa, oral tradition), various Indigenous-state treaties (often violated but binding in principle).

**Temporality of normative systems:** Hart (*The Concept of Law*, 1961, for primary/secondary rules and rules of recognition/change/adjudication), Kelsen (*Pure Theory of Law*, 1967, for *lex posterior* and the Grundnorm hierarchy), Haudenosaunee Confederacy (Great Law of Peace, for the Seventh Generation principle as generational-recurrence). Common-law / *stare decisis* tradition; statutory amendment tradition; Islamic *ijtihad* tradition; revolutionary-rupture tradition (American 1776, French 1789, Russian 1917).

**Weber on authority and bureaucracy:** Weber (*Wirtschaft und Gesellschaft*, 1922; *Economy and Society*, English ed. Roth and Wittich, 1968; *Politik als Beruf* / "Politics as a Vocation", 1919; *The Protestant Ethic and the Spirit of Capitalism*, 1904–05), Bendix (*Max Weber: An Intellectual Portrait*, 1960), Mommsen (*The Age of Bureaucracy*, 1974), Beetham (*Max Weber and the Theory of Modern Politics*, 1985), du Gay (*In Praise of Bureaucracy*, 2000).

**Orders of worth / French pragmatic sociology:** Boltanski and Thévenot (*De la justification*, 1991; *On Justification*, English 2006), Boltanski and Chiapello (*The New Spirit of Capitalism*, 2005), Thévenot ("The Plurality of Cognitive Formats and Engagements", 2007), Lamont and Thévenot (eds., *Rethinking Comparative Cultural Sociology*, 2000), Stark (*The Sense of Dissonance*, 2009), Cloutier and Langley ("The Logic of Institutional Logics", 2013), Patriotta, Gond, and Schultz ("Maintaining Legitimacy", 2011).

**Social role theory:** Linton (*The Study of Man*, 1936), Parsons (*The Social System*, 1951), Goffman (*Presentation of Self in Everyday Life*, 1959; *Encounters*, 1961), Turner ("The Role and the Person", 1978), Biddle ("Recent Developments in Role Theory", 1986), Searle (1995, 2010, repeated for the constitutive-rules treatment of role-instantiation), Grossi, Meyer, and Dignum ("Counts-as", 2008), Guala and Hindriks ("A Unified Social Ontology", 2015), Masolo et al. ("Social Roles and their Descriptions", 2004), Boella and van der Torre (2006, 2007), Sandhu et al. ("Role-Based Access Control Models", 1996), ANSI/INCITS 359-2004 (*Role Based Access Control*).

**Indigenous governance:** *Great Law of Peace* (Gayanashagowa, oral constitution), Johansen and Mann (eds., *Encyclopedia of the Haudenosaunee*, 2000), Grinde and Johansen (*Exemplar of Liberty*, 1991), Borrows (*Canada's Indigenous Constitution*, 2010), Metz ("Ubuntu as a Moral Theory", 2011), Ramose (*African Philosophy Through Ubuntu*, 1999), Murra (*The Economic Organization of the Inca State*, 1980), Rose (*Dingo Makes Us Human*, 1992), Strehlow (*Songs of Central Australia*, 1971).

**Black radical tradition:** Robinson (*Black Marxism*, 1983), Gilmore (*Golden Gulag*, 2007), Hartman (*Scenes of Subjection*, 1997; *Wayward Lives, Beautiful Experiments*, 2019), Harney and Moten (*The Undercommons*, 2013), Du Bois (*Black Reconstruction in America*, 1935).

**Polycentric governance and the Bloomington School:** Vincent Ostrom, Tiebout, and Warren ("The Organization of Government in Metropolitan Areas", 1961), Vincent Ostrom ("Polycentricity", 1972; "Polycentricity Part 1 and Part 2", 1999), Polanyi (*The Logic of Liberty*, 1951), Elinor Ostrom (*Governing the Commons*, 1990; *Understanding Institutional Diversity*, 2005; "Beyond Markets and States", 2010), Poteete, Janssen, and Ostrom (*Working Together*, 2010), Cole and McGinnis (eds., *Elinor Ostrom and the Bloomington School*, 2015), Aligica and Tarko ("Polycentricity: From Polanyi to Ostrom", 2012), Hardin ("Tragedy of the Commons", 1968, as the foil Ostrom answered).

**AI planning theory:** Fikes and Nilsson (1971), Sacerdoti (1975), Tate (1977), Pednault (1989), McAllester and Rosenblitt (1991), Ghallab, Howe, Knoblock et al. (1998), Bratman (1987), Ghallab, Nau, and Traverso (2004), Fox and Long (2003), Erol, Hendler, and Nau (1994).

**Petri nets and workflow:** Petri (1962), Reisig (1985), Meseguer and Montanari (1990), van der Aalst (1998, 2011).

**Categorical process semantics:** Joyal and Street (1991), Selinger (2010), Coecke and Kissinger (2017), Baez and Stay (2010), Atiyah ("Topological Quantum Field Theories", *Publications mathématiques de l'IHÉS*, 1988), Baez and Dolan ("Higher-Dimensional Algebra and Topological Quantum Field Theory", *Journal of Mathematical Physics*, 1995), Lurie ("On the Classification of Topological Field Theories", *Current Developments in Mathematics*, 2009), Coecke, Fritz, and Spekkens ("A Mathematical Theory of Resources", *Information and Computation*, 2014).

**State machines:** Mealy (1955), Moore (1956), Harel (1987).

**Work-type classification:** Perrow (1967), Snowden and Boone (2007), Stacey (2001), Dreyfus and Dreyfus (1980), Klein (1998).

**Settlement-path grounding:** Dewey (1938), Lave and Wenger (1991), Bloom (1968).

## Status

This file is research output: a survey of the cross-disciplinary literatures on work, organized around the question of what they take to be the objects of the category of work-acts. The draft definition in §"Toward a definition" is a candidate, not a settled claim; the items in §"What the literatures collectively do not settle" are genuine open problems the literatures carry forward.

The survey is intentionally cross-tradition and does not commit to any single tradition's resolution of the question. Subsequent passes may push on individual open items (the inner/outer distinction; the cross-tradition unification question; the structural status of relational/affective/reproductive substrates; the categorical content of the settlement path; the formal handling of contradiction as developmental engine), or may push on traditions this pass treated thinly (practice theory, Whitehead, affective labor, the broader feminist organizational tradition).

No downstream records were derived from this session's work at write time.
