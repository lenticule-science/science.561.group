---
description: Survey of work (object) and working (morphism) in theories/, lifting the general form from non-formal prior thought and disambiguating against four named specializations — kyriarchial, lakotaean, governance-as-work, and the predicated mathematical realization. Companion to work-concept-family-from-theories-may-2026 taken on a narrower cut.
status: complete
session-date: 2026-05-15
topic: work
surveys-source: theories/humanities/theories/sociology/theories/work/
---

# Survey of Work and Working in theories/

## Scope

This survey assembles the best prior thought in `theories/` about **work** (the object) and **working** (the morphism) — the thing-and-act pair that organizes the work domain. It then disambiguates the *general* form of each from four named specializations: kyriarchial, lakotaean, governance-as-work, and the predicated mathematical realization.

The general theory is constructed here from the non-formal prior thought — the philosophy texts, the ontology, the algebraic-structure exposition, and the term definitions. **No predication theory appears in the general theory.** Predicated work is treated below as one specialization among the others; the mathematical formalization is not the general form, it is one cut.

The earlier work-concept-family survey covered the *vocabulary* of the work domain (work, task, plan, project, goal, objective, campaign, milestone, mission, endeavor, captain). That survey is horizontal across the vocabulary; this one is vertical through a single pair. The two are complementary.

Reading discipline: foundational texts in `work/texts/` read in full (`algebraic-structure-of-work`, `ontology-of-work-operations`, `the-settlement-path`, `philosophy-of-endeavor`); other survey texts in `work/texts/` named in the body but not read this session (`articulation-work-and-invisible-labor-survey`, `immaterial-labor-and-post-operaismo-survey`, `activity-theory-survey`, `labor-process-theory-survey`, `formal-structure-of-office`, `formal-structure-of-delegation`); `work/terms/work.md` read in full; the kyriarchial-work `_index.md` and the predicated-lakotaean-work `_index.md` and the governance-child-theory `_index.md` read; `predicated-work/{concepts,morphisms,objects}/` listed not read.

## Work — the object

### The base concept

Work is **an act with a defined output**. The text at `terms/work.md` makes this the individuating predication: an act that produces nothing nameable is not work, just time spent. Work inherits from the more general concept of *act* the structure of capacity realization — something has the potential to produce an output, and work is the episode where that potential is realized.

This frames work as a *thing* in the ontology of work operations (cf. `texts/ontology-of-work-operations.md`): a task is a thing; a work-unit is a thing; a plan is a container that holds those things; a project is a vessel that holds plans. The vocabulary is taken from a general thing/quality/state/act/container/vessel ontology, which the work texts apply directly to organizational work the way game-design literature (Bartle 2003, Nystrom 2014) applies it to virtual worlds. The architecture is the same; only the entities differ.

### Four work-types — the settlement classification

Work admits a four-way classification by which qualities of the act are settled in advance — whether the *meaning* of the output is known (meaning-settled) and whether the *execution path* to produce it is known (execution-settled):

| Work type | Meaning settled | Execution settled |
|-----------|-----------------|-------------------|
| Process   | yes | yes |
| Procedure | yes | no  |
| Derivation| no  | yes |
| Inquiry   | no  | no  |

This is the base layer of what `texts/the-settlement-path.md` calls the settlement path — the organizing principle that recurs at every level of the work corpus. The same four-fold appears in the formality scale (F0/F1/F2/F3), in model-tier allocation (Opus/Sonnet/Haiku/script), and in the automation pipeline (observation/instinct/skill/hook). These are not analogies — they are the same structure described in different vocabularies.

### Work units, workflows, tasks

The work hierarchy distinguishes three layers of specification:

- **Operation** — an abstract operation symbol with an arity. "Review" is a binary operation (reviewer × document). The *type* of an act.
- **Work** — an application of an operation. May still have free variables. The *enacted* operation.
- **Work unit** — a *ground* application: every parameter bound to a concrete value. The *fully determined* instance.

A work unit without parameters is not yet a work unit; it is a template, an open term awaiting the substitution that closes its variables. The act of binding free variables is itself a *settlement step* — moving the work along the inquiry → derivation → procedure → process path. `texts/algebraic-structure-of-work.md` makes this precise by reading the work hierarchy as a free term algebra: operations are signatures, work is term application, work units are ground terms, settlement is substitution closure. (This is mathematical but not predication-theoretic — it is universal algebra applied to the work taxonomy.)

Work composes:

- **Workflow** — a set of work units constrained so that initial input type equals final output type (the workflow takes X and produces X). Algebraic — workflows compose.
- **Task** — a named planning container for work units, with a completion condition. Organizational — tasks group work for planning and tracking.

The distinction is real: workflows are algebraic objects that compose by typing; tasks are organizational objects that group by purpose. The two layers coexist.

### Work, practice, method

`terms/work.md` closes with a small but load-bearing structure:

> Work is the thing that practice does and method governs. Practice without work is idle; method without work is shelfware; work without method is improvisation; work without practice is a plan that never executes.

Work is the *episode*. Practice is the *recurring conduct* that produces episodes. Method is the *normative governance* that constrains how the conduct runs. The three are mutually constitutive — none of them is the work itself, but none of them functions without the others.

## Working — the morphism

If work is the thing — an output-individuated episode — then **working is the act of bringing that episode about**. The prior thought treats working under several different names. Pulled together, they describe the same morphism.

### Working as endeavoring (Chisholm/Hornsby/O'Shaughnessy)

`texts/philosophy-of-endeavor.md` reads three philosophical traditions as converging on a single structure. Chisholm (1976): *endeavoring* is the general form of intentional activity. Every intentional act is an endeavoring, but not every endeavoring is a doing — endeavor can be fully present when the action is absent (the paralyzed agent endeavors to move the arm; the arm does not move; the endeavoring occurred). Hornsby (1980): trying-events are the *inner side* of action; the outer side is what happens in the world. O'Shaughnessy (1980): a single intent gives rise to many tryings — *sustained* trying is what converts attempt into endeavor.

The convergence: working — the morphism — is the **directed, committed, sustained, failure-open striving** that *may or may not* produce the work-output. Working is logically prior to work because working can occur when work does not.

This matters for accountability: if the inner side (trying) is distinct from the outer side (achieving), normative weight can attach to the trying independently. You can fail to achieve and still have worked fully. You can achieve and still have failed to work, if achievement came by accident rather than through striving.

### Working as the six-stage operations loop

`texts/ontology-of-work-operations.md` reads working at organizational scale as a six-stage loop: **planning → dispatch → execution → tracking → review → feedback**. Each stage is itself a working — an act that changes a work-entity's state. Planning creates work-things. Dispatch creates assigned-to relations between things and agents. Execution advances state from "assigned" toward "completed." Tracking observes without changing. Review compares actual against planned. Feedback modifies future plans.

The acts compose across stages. A planning act creates the work-units that a dispatch act later assigns; a dispatch act creates the assignments that an execution act later advances. Goldman's act trees (1970) apply directly: "complete a plan" is derived from "complete all its tasks"; "complete a task" is derived from "perform the work and mark it done." The primitive acts are the basic state transitions; everything else composes from them.

A working that is also an *event* — an act recorded with a time, an actor, and a state transition — is automatically an entry in the audit trail. The sequence of events IS the trail; it is not a logging layer bolted on. Working leaves witness because it is, at base, the state-transition act on a thing in the work-world.

### Working as settlement

The longest-arc reading of working is the one in `texts/the-settlement-path.md`: working is **the act of moving work from open to determined**. Inquiry becomes derivation when meaning settles. Derivation becomes procedure when execution settles. Procedure becomes process when edge cases are formalized away. Each step is a closure operation — adding what is missing until nothing new appears.

Progressive automation is this principle applied as a policy: every task completion should encode the work so that something less capable — less experienced, less expensive, less contextual — can do it next time. Inquiry produces findings; findings encode into derivations; derivations encode into procedures; procedures formalize into processes. Working is what carries the work along this trajectory.

The settlement reading subsumes the operations-loop reading. The six stages are the *short-cycle* shape of working (one trip through a single work-unit); the settlement path is the *long-arc* shape (the cumulative effect of many cycles on a kind of work).

### Working composes; it is not atomic

A consequence of the above: working is not a single primitive verb. It decomposes into the stage-acts of the operations loop, which compose along act trees, which collectively produce settlement at the longer scale. To say "they worked" is to claim some structure of these — planning that connects to dispatch that connects to execution that records as event that gets reviewed that feeds back into the next planning. A "working" without this internal articulation is closer to mere activity.

## Disambiguation

Below are four specializations of the work-and-working pair. The general theory above is meant to be the form against which each of these is a specialization — none of these *is* the general theory.

### Kyriarchial work and working

`theories/.../work/theories/kyriarchial-work/_index.md` analyzes work through the lens of *kyriarchism* — work as organized within interlocking systems of domination (patriarchy, white supremacy, capitalism, heteronormativity, ableism). The core commitments differ from the general theory in five ways:

1. **Work is never neutral.** All work occurs within and reproduces kyriarchal relations.
2. **Valorization is intersectional.** What counts as "valuable work" or "skilled labor" varies by where the worker sits in intersecting hierarchies.
3. **Exploitation is systemic.** Workplace exploitation flows from the same interlocking systems that produce domination elsewhere.
4. **Resistance is situated.** Strategies for transformation emerge from specific positionalities.
5. **Transformation requires dismantling.** Reforming workplace practice is not enough — the interlocking systems themselves must be dismantled.

Read against the general theory: the kyriarchial form does not deny that work is an output-individuated act, nor that working is sustained directed striving. It denies that the *output* is just the artifact. In kyriarchial working, every work-cycle produces **two outputs**: the named artifact (the document, the meal, the surgery, the code), and the *reproduced regime* — the valorization that decides whose labor counts, the hierarchy that decides who can supervise whom, the precarity distribution that decides who bears risk. Working is always also working-the-hierarchy.

The four-stage settlement classification remains, but the closure operators are tilted: who is permitted to perform inquiry, whose derivation gets recorded, whose procedure becomes canonical, whose process gets institutionalized — these are not neutral pipelines, they are kyriarchally distributed. The settlement path runs through power.

(The kyriarchial-work subtree has empty `concepts/`, `objects/`, and `morphisms/` directories — the substantive content lives only in the `_index.md` and prospective subtheories. The above summary reflects only what is present.)

### Lakotaean work and working

`theories/.../predicated-lakotaean-politics/theories/predicated-lakotaean-work/_index.md` exhibits a Lakota work-form that differs structurally from the Western form. (The subtree is named "predicated" because its rigorous form is given in the predication-categories language; the *substantive* differences below are not predication-theoretic — they are claims about how Lakota work actually runs.) The load-bearing differences:

1. **Work flows through kin-obligation, not dispatch.** The Western form's central morphism is dispatch — an authority assigning a task to an agent. The Lakota form has no such central morphism; work is enacted because the agent's kin-position obligates them.
2. **Capability is kin-embedded, not standalone.** Capabilities propagate through kin-relations and through apprenticeship under kin, rather than being separable bundles attached to individuals.
3. **Cadence is annual, not project.** The recurrence-pattern is the annual cycle, keyed to ceremonial markers and seasonal availability — not project scope.
4. **Completion is obligation-discharge, not task-done.** Working completes when the relational obligation has been discharged, not when an artifact is final.
5. **Work-classes are distinguished by predicate-class.** Five named classes: wówašake-work (physical-skill), wakȟáŋ-work (sacred-bearing), wótakuye-work (kin-relation), káğapi-work (making), wahúŋkpa-work (collective-coordination). Not strictly disjoint.
6. **No surplus-cell fires.** The closure rules contain no rule that installs a surplus-cell over the worker. The absence is constitutive — work flows through gift-economy redistribution, not accumulation.

Gendered division is complementary rather than hierarchical: men's primary in wówašake and some wakȟáŋ; women's primary in wótakuye, káğapi, some wakȟáŋ, and the lodge itself; wíŋkte and tȟokáhe (two-spirit) positions structurally recognized with their own work-roles; wahúŋkpa-work mixed. The polity's wealth-cells run through women's substrate-position; the hunting/war-cells through men's. Both are needed; neither is sufficient.

Read against the general theory: the lakotaean form keeps **work as output-individuated act** and **working as sustained striving**, but the *output that individuates* and the *who-is-bound-to-work* differ. The general form treats work-output as artifact; the lakotaean form treats output as relational obligation-discharge. The general form treats working as dispatched-and-executed; the lakotaean form treats working as kin-obligation-discharge. These are not minor variations — they are *different structural identifications* of what the work-object is and what working consists in.

The reservation-period imposition of wage-labor is named explicitly as the operational form of *importing* the surplus-cell-installing rules onto the polity's substrate. The resulting conflict between the imported and indigenous work-forms is a continuing substrate feature, not a transition that has been completed.

(Sources cited in the _index: Deloria 1944, Walker 1982, Powers 1986, Medicine 2001, Estes 2019, White Hat 2012.)

### Governance as a work-form

The work theory contains a child theory `theories/.../work/theories/work/governance/` that takes governance as a *kind of work*. The _index there is brief: governance is the structures, processes, and principles through which collectives make decisions, exercise authority, and maintain accountability. Authority structures, decision-making mechanisms, accountability assignment, and institutional forms are the domains.

Read against the general theory: governance-as-work specializes the operation set. Where the general theory's operations are open — review, write, dispatch, etc. — governance work operates on *decisions*, *authority assignments*, *accountability records*. The output of a governance work-unit is a decision (with conditions and revisability), an authority delegation (with bounds and revocation), or an accountability record (with attribution and basis). Working-as-endeavoring still applies: governance has its inner side (deliberation, weighing, intending) and outer side (the decision recorded, the authority exercised, the record entered). The settlement path still applies: governance work can be inquiry (open deliberation), derivation (clear question, judgment required), procedure (codified deliberation with branching), or process (the deterministic vote-tally).

The governance child-theory is less developed than the kyriarchial or lakotaean specializations — it is a domain marker more than a worked theory. But its placement *as a child of work* is itself a structural claim: governance is not a separate domain from work; it is a specialized work-form.

### Predicated work — the mathematical realization

`theories/.../work/theories/predicated-work/` is the formalization of the work theory in the predication-categories mathematics. Objects include `task-cell-system`, `plan`, `workflow`, `operations-loop`, `operations-base`, `capability-fiber-bundle`, `work-symmetry-group`, `handoff-cobordism`, `quantifier-adjoints-on-work-fibers`. Morphisms include `dispatch`, `decompose-task`, `lift-task-to-plan`, `settle-cycle`, `witness-as-increment`, `adjudicate-witness-conflict`, `retrospect-via-cosettling`, `project-fiber-to-capability`. Concepts include `aim-generativity`, `cadence-as-modal-frame`, `closure-driven-coordination`, `dispatch-readiness`, `enacted-capability-staleness`, `normative-operational-layering`, `operational-evidence`, `shared-closure-rule-vocabulary`, `work-regime`. The math chapter develops a temporal 2-category of plan execution and CALM-style monotonicity arguments for which fronts of working are coordination-free.

Read against the general theory: **predicated work is not the general form** — it is a specialization in a particular formal language. The general theory's work-as-output-individuated-act becomes, in predicated work, a task-cell-system whose goal-cells are required to settle to a target valuation. The general theory's working-as-sustained-striving becomes the firing of closure rules over cells across a temporal sequence of substrate states. The four work-types become regimes of the rule subsystem (strict / inquiry-permitting / aim-open). The six-stage operations loop becomes a 1-cell in the temporal 2-category.

This is a *rigorous formalization* — but it is one formalization. The general theory above does not depend on this formalization; the algebraic-structure text gives an alternative (universal algebra over operation signatures) that does not invoke predication. A polity could adopt the general work theory without adopting predicated work, and a polity could adopt predicated work as a particular formalization without thereby denying the other specializations.

The placement under work, parallel to kyriarchial-work and governance, is structurally honest: it is a sibling, not the parent.

## What 561 inherits

This survey is the input for deciding which specializations the polity adopts as load-bearing. At the time of writing the polity has only `code/structures/work.md` and the two work-related concepts (`iteration-as-work`, `substrate-work-is-constitutive`) on the substrate side, plus the family-survey-derived structures from the earlier session (audit pending).

- The **general form** — work as output-individuated act, working as sustained directed striving plus the operations loop plus the settlement path — is the candidate for the polity-level work theory.
- The **lakotaean form** is load-bearing for the tiyóšpaye side of the polity: work flows through kin-obligation; cadence is annual; no surplus-cell.
- The **kyriarchial form** is load-bearing as a *diagnostic*: the polity is being founded inside a kyriarchally structured environment and needs to recognize when its working reproduces or resists those regimes.
- **Governance-as-work** is structurally important: the polity's governance is a work-form, not a separate kind of activity.
- **Predicated work** is one available formalization the polity may adopt for its substrate-level machinery, but it is not the general theory.

These are working hypotheses, not settled positions.

## Notable things noticed but not pursued

- The work / practice / method trio at `terms/work.md`'s closing paragraph — the four-fold (idle / shelfware / improvisation / plan-that-never-executes) is a useful diagnostic and probably wants its own short text in 561's prose layer.
- `texts/articulation-work-and-invisible-labor-survey.md` and `texts/immaterial-labor-and-post-operaismo-survey.md` are likely additional disambiguations (articulation work, affective labor, general intellect).
- `texts/formal-structure-of-office.md` and `texts/formal-structure-of-delegation.md` formalize the office and delegation morphisms — relevant for the captain/staff layer but read as outside the work-and-working pair specifically.
- `texts/activity-theory-survey.md` (Vygotsky / Leont'ev / Engeström) is a separate non-kyriarchial, non-lakotaean tradition for analyzing working as mediated activity. May be a further specialization or a complementary general account.
- `texts/labor-process-theory-survey.md` (Braverman and successors) is an obvious precursor to kyriarchial-work; the kyriarchial form may be readable as an intersectional extension of labor-process theory.

## What I synthesized this session that may not be in the source

- The framing of working as **the morphism** while work is **the object** is the user's framing for this survey, not a frame found in the source texts. The source texts have all the ingredients (endeavoring, the operations loop, settlement), but the object/morphism reading is the polity's. Future lifts should not attribute this framing to the source.
- The two-output claim in the kyriarchial section (every kyriarchial work-cycle produces both an artifact and a reproduced regime) is my reading of the source's commitments, not a verbatim claim from it.
- The diagnostic role of kyriarchial-work for 561 (a recognition tool for when polity-working reproduces or resists ambient regimes) is my framing, not the source's.
- The "less developed than" judgment about governance-as-work is my reading of the file thinness, not a claim by the source.
- The claim that predicated-work is a *sibling* to kyriarchial and lakotaean rather than a parent — that is, that predicated-work is not the general form — is the user's explicit position in this session, against an apparent assumption in some of the source material that the predicated form is *the* form. Future lifts should treat this as the polity's settled position.

## Provenance

Source files read in session 2026-05-15 for this survey:

- `theories/humanities/theories/sociology/theories/work/_index.md`
- `theories/humanities/theories/sociology/theories/work/terms/work.md`
- `theories/humanities/theories/sociology/theories/work/texts/algebraic-structure-of-work.md`
- `theories/humanities/theories/sociology/theories/work/texts/ontology-of-work-operations.md`
- `theories/humanities/theories/sociology/theories/work/texts/the-settlement-path.md`
- `theories/humanities/theories/sociology/theories/work/texts/philosophy-of-endeavor.md`
- `theories/humanities/theories/sociology/theories/work/theories/kyriarchial-work/_index.md`
- `theories/humanities/theories/sociology/theories/work/theories/work/governance/_index.md`
- `theories/humanities/theories/sociology/theories/politics/theories/predicated-politics/theories/predicated-lakotaean-politics/theories/predicated-lakotaean-work/_index.md`
- Directory listings of `predicated-work/{concepts,morphisms,objects}/` for the predicated specialization summary.

External authors cited or named in source: Chisholm 1976, Hornsby 1980, O'Shaughnessy 1980, Goldman 1970, Harel 1987, Evans 2003, Bartle 2003, Nystrom 2014, Whitehead 1929, Mintzberg 1979, Dewey 1938, Lave & Wenger 1991, Bloom 1968, Deloria 1944, Walker 1982, Powers 1986, Medicine 2001, Estes 2019, White Hat 2012, plus the labor-process / immaterial-labor / activity-theory literatures named in their respective survey files but not read this session.

No downstream polity records were derived from this survey at write time.
