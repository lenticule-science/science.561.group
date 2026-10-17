---
title: "Foundational ontology research — source brief for six surveys"
specialization: analysis
date-created: 2026-04-03
serves: foundational-ontology-research
description: The foundational terms at library/terms/ are the base tokens everything else builds on.
---

# Foundational Ontology: Research Surveys — Source Brief

## The problem

The foundational terms at `library/terms/` are the base tokens everything else builds on. The solid ones — thing, object, vessel, container, force, information — are grounded in real scholarship (Aristotle, Shannon, Bateson, Newton). The stubs — act, quality, state, condition, energy, environment, knowledge, document, everything — are one-sentence circular definitions that reference each other and concepts that don't exist yet.

You can't enrich a stub by writing more prose around a circular definition. You have to study the concept first. "Act" is not just "a manifestation of energy resulting in change" — it's the subject of 2,400 years of philosophy, from Aristotle's *energeia* through Whitehead's actual occasions to Davidson's event-causal theory. The term should reflect that lineage, not invent from scratch.

This plan produces six survey texts. Each survey studies a cluster of related foundational concepts, engages with real sources, and identifies what the repo's terms should say. The surveys then feed the enrichment plan, which writes (or rewrites) the actual terms.

All six surveys can run in parallel. Each must engage with real disciplinary sources — philosophy, physics, logic, information science — not summarize Wikipedia or produce AI prose.

## Substance and process: both traditions, taken seriously

Western philosophy has two major ontological traditions. **Substance philosophy** (Aristotle, Locke, Leibniz, Armstrong) asks: what ARE things? What properties do they HAVE? What makes them the SAME thing over time? **Process philosophy** (Heraclitus, Whitehead, Bergson, Deleuze, Simondon) asks: how do things BECOME? What processes CONSTITUTE them? How does identity PERSIST through change?

The repo's own framework is process-relational at its core. The predication paper treats relations (morphisms, predicate-argument combinations) as primary structure — objects are nodes, but relations do the work. The work domain defines everything by output, not substance. The TAB model includes "Behaviors" alongside "Attributes." The four work types are classified by what is SETTLED, which is a process concept.

Every survey must engage both traditions with at least equal depth. Not as a token gesture — process philosophy isn't a supplement to "the real ontology." For many of these concepts (action, change, event, relation, environment), the process-relational account may be more natural for what the repo actually needs. The surveys should present both traditions honestly and let the implications section identify which insights bear the most load.

Beyond Western philosophy, several other traditions offer deep resources:
- **Buddhist philosophy** — dependent origination (*pratītyasamutpāda*), emptiness (*śūnyatā*), momentariness (*kṣaṇavāda*). Everything arises in dependence on conditions; nothing has self-nature. Rigorous process ontology with 2,500 years of development.
- **Indigenous relational ontologies** — land as kin, knowledge as relational and place-based, cyclical time, seven-generations thinking. A family of worldviews that center relation over substance.
- **American pragmatism** (Peirce, James, Dewey) — experience as primary, relations as real, knowledge as the outcome of inquiry. The bridge between analytic and process traditions.

## Connection to the repo's own theory

The predication paper (`library/domains/science/domains/information/texts/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md`) provides the algebraic framework: frontmatter keys are predicates, predicate-argument combination is a residuation on a bilattice, extending (⊙) and restricting (⇒) are adjoint. The foundational terms are what the predicates talk ABOUT.

The TAB model (Things with Attributes and Behaviors) in thing.md provides the base hierarchy: thing → object → container → vessel, with person as the mobile agent. The research should clarify how abstract concepts (quality, state, relation) fit into or extend this hierarchy.

The work domain already defines work, process, procedure, derivation, inquiry. These depend on act, state, condition, and change being well-defined. The surveys should note where foundational concepts bear load for the work domain specifically.

## The Dual-Cone Architecture

The library has two cones, not one:

**Cone 1: Standard disciplines.** Apex at foundational math/mereology, expanding through physics, chemistry, biology, ecology, sociology, governance, work.

**Cone 2: Relationality.** Its own apex (the claim that things exist only through acts of relating), its own foundational concepts (relational entity, relational operation, dual nuclei, nuclear quartet), building outward into its own world — the relational computer, the semiotic universe, the generative comonad. Currently mostly in `operations/engineering/triage/content/relationality/` — NOT YET integrated into the library.

**Cone 2 sits UNDER Cone 1.** The standard disciplines assume entities exist and then relate. Relationality says: the relating is prior, entities are constituted by their relations. So the math at Cone 1's apex is itself supported by Cone 2's relational ontology.

**Captain's correction:** None of the triage's relationality material is ready to simply move into the library. This is original research — more rigorous than Hegel, a year+ of work expressing novel ideas. It needs its own subdepartment under science with its own editorial process. Processing it requires understanding the mathematics, not formatting into frontmatter.

## Algebraic Tower Preservation

When this research feeds into implementation, don't flatten the algebraic tower. Each survey should be aware that the concepts it studies live at specific strata:
- Level 0: asserted claims (raw frontmatter)
- Level 1: saturated/closed claims (what the closure operator forces)
- Level 2: settled/fixed claims (active under both nuclei)
- Level 3: observable claims (what MCP can truthfully report)

The surveys should note which level a philosophical claim operates at.

## What each survey covers

### research-action-and-change — What it means to act and what acts produce

The most load-bearing gap. Every operation, task execution, state transition, and workflow step IS an act.

**Substance sources:**
- Aristotle, *Metaphysics* IX — *energeia* (actuality) and *dunamis* (potentiality). *kinesis* (motion toward an end) vs. *energeia* (activity complete at every moment).
- Aristotle, *Physics* III–IV — change (*metabole*) as actualization of the potential. Four types: generation/corruption, alteration, growth/diminution, locomotion.
- G.E.M. Anscombe, *Intention* (1957) — action under a description.
- Donald Davidson, "Actions, Reasons, and Causes" (1963) and *Essays on Actions and Events* (1980) — event-causal theory.
- Hannah Arendt, *The Human Condition* (1958) — labor, work, action.
- Alvin Goldman, *A Theory of Human Action* (1970) — act-trees, basic acts, level-generation.
- Physics: conservation of energy, thermodynamics.

**Process sources:**
- Whitehead, *Process and Reality* (1929) — actual occasions; concrescence.
- Bergson, *Creative Evolution* (1907) and *Time and Free Will* (1889) — *élan vital*, *durée*.
- Peirce — Firstness/Secondness/Thirdness.
- Simondon, *Individuation* (1958/2005) — individuation, pre-individual field.
- Deleuze, *Difference and Repetition* (1968) — becoming prior to being; intensive/extensive.
- Heraclitus — *panta rhei*.
- Buddhist *karma* and Abhidharma dharma analysis.

**Key questions:** Is act or thing more fundamental? What is change (Aristotle, Bergson, Whitehead)? Does act/potency map to meaning-settled/execution-settled? How does Goldman's act-tree relate to workflow composition? Energy vs. force? Agent-less action (Buddhist)?

**Produces:** `library/domains/humanities/domains/philosophy/texts/action-and-change-survey.md`

### research-quality-and-property — What things are like, and how we know

Every frontmatter field IS a quality or property of a thing.

**Substance sources:**
- Aristotle, *Categories* 8 — four species of quality.
- Locke, *Essay* (1689) II.8 — primary/secondary qualities.
- D.C. Williams, "On the Elements of Being" (1953) — trope theory.
- Armstrong, *Universals and Scientific Realism* (1978).
- George Molnar, *Powers* (2003) — dispositional vs. categorical.
- Kim, "Supervenience and Mind" (1993).

**Process sources:**
- Whitehead, *Process and Reality* III — eternal objects and ingression.
- Simondon — qualities emerge through individuation.
- Deleuze — intensive vs. extensive qualities.
- James, *Essays in Radical Empiricism* (1912).
- Buddhist Abhidharma — dharma streams.
- Peirce — Firstness as quality.

**Key questions:** Quality vs. property? Is condition temporally-indexed quality? Dispositional vs. categorical (powers vs. states)? Does Deleuze's intensive/extensive cut more usefully? Static vs. becoming qualities?

**Produces:** `library/domains/humanities/domains/philosophy/texts/quality-and-property-survey.md`

### research-state-time-and-event — When things are and what happens

**Substance sources:**
- McTaggart, "The Unreality of Time" (1908) — A-series vs. B-series.
- Prior, *Time and Modality* (1957) — tense logic.
- Barwise & Perry, *Situations and Attitudes* (1983).
- Harel, "Statecharts" (1987) — hierarchical states, orthogonal regions.
- Kim, "Events as Property Exemplifications" (1976).
- Davidson, "The Individuation of Events" (1969).
- Le Poidevin, *The Images of Time* (2007).
- Physics: relativity, thermodynamic arrow of time.

**Process sources:**
- Whitehead, *Process and Reality* II — epochal theory of time.
- Bergson, *Time and Free Will* (1889) — *durée* vs. spatialized time.
- Peirce — tychism, synechism.
- Deleuze, *Logic of Sense* (1969) — Chronos vs. Aion.
- Buddhist momentariness (*kṣaṇavāda*).
- Indigenous cyclical time (Lakota, Haudenosaunee, Aboriginal Australian).
- Prigogine, *The End of Certainty* (1997) — irreversibility as fundamental.

**Key questions:** State as snapshot vs. state-machine configuration vs. Whitehead's "drop"? What is an event (Kim, Davidson, Whitehead, Deleuze)? Temporal indexing vs. theory of time? Situation theory and frontmatter? Cyclicality of the operations loop?

**Produces:** `library/domains/humanities/domains/philosophy/texts/state-time-and-event-survey.md`

### research-relation-and-identity — How things connect and what makes them themselves

**Substance sources:**
- Aristotle, *Categories* 7 — relatives (*pros ti*).
- Russell, *The Principles of Mathematics* (1903) XXVI–XXXI — relations as primitives.
- Bradley, *Appearance and Reality* (1893) — Bradley's regress.
- Leibniz — identity of indiscernibles.
- Kripke, *Naming and Necessity* (1980) — rigid designation.
- Geach, "Identity" (1967) — relative identity.
- The predication paper itself.

**Process sources:**
- Whitehead, *Process and Reality* — internal relations, prehensions.
- James, *Essays in Radical Empiricism* (1912) — relations as experienced.
- Peirce — Thirdness; triadic semiotics.
- Nāgārjuna, *Mūlamadhyamakakārikā* — *śūnyatā*, dependent origination.
- Simondon — individual as result, not starting point.
- Barad, *Meeting the Universe Halfway* (2007) — intra-action.
- Category theory — morphisms primary, objects secondary (Yoneda).

**Key questions:** Is relation a thing? Does predication resolve Bradley's regress? What makes a file THIS file (path, hash, id, history)? Identity and `defines:`? Triadic vs. dyadic relations?

**Produces:** `library/domains/humanities/domains/philosophy/texts/relation-and-identity-survey.md`

### research-knowledge-and-documentation

**Substance sources:**
- Plato, *Theaetetus* — JTB.
- Gettier (1963).
- Polanyi, *The Tacit Dimension* (1966).
- Nonaka & Takeuchi (1995) — SECI.
- Briet, *Qu'est-ce que la documentation?* (1951).
- Buckland, "Information as Thing" (1991).
- Archival science.

**Process sources:**
- Dewey, *Logic: The Theory of Inquiry* (1938) — knowledge as outcome of inquiry.
- Peirce — fallibilism, community of inquiry.
- Bateson, *Steps to an Ecology of Mind* (1972) — pattern that connects.
- Haraway, "Situated Knowledges" (1988).
- Kimmerer, *Braiding Sweetgrass* (2013) — Indigenous knowledge systems.
- Whitehead, *The Function of Reason* (1929), *Modes of Thought* (1938).

**Key questions:** Information vs. knowledge (Dewey, Polanyi)? Document as thing-that-carries vs. thing-that-is information? Bilattice model and knowledge states? Knowledge and work types? Tacit/situated knowledge in FARS?

**Produces:** `library/domains/science/domains/information/texts/knowledge-and-documentation-survey.md`

### research-environment-and-totality

**Substance sources:**
- Aristotle, *Physics* IV — place (*topos*).
- von Uexküll, *A Foray into the Worlds of Animals and Humans* (1934) — *Umwelt*.
- Gibson, *The Ecological Approach to Visual Perception* (1979) — affordances.
- Tansley (1935) — ecosystem.
- Mereology: Leśniewski, Leonard & Goodman (1940).
- Set theory: Cantor, Russell's paradox.
- Cantor on the absolute infinite.

**Process sources:**
- Whitehead — extensive continuum.
- Ingold, *The Perception of the Environment* (2000) — meshwork.
- Barad — agential cuts.
- Maturana & Varela — autopoiesis, structural coupling.
- Haraway, *Staying with the Trouble* (2016) — sympoiesis.
- Indigenous relational ontologies (*Mitákuye Oyás'iŋ*).
- Nāgārjuna — totality as mutual dependence.

**Key questions:** Is environment a thing? Affordances and agential cuts? What is "everything"? Container vs. environment? Structural coupling of repo and Claude?

**Produces:** `library/domains/humanities/domains/philosophy/texts/environment-and-totality-survey.md`

## Derived task: rederive-holography-from-predication

Per captain directive `rederive-holography-from-predication`: produce a library text that derives holographic structure directly from the predication paper — no reliance on the relationality framework. Outsiders can follow predication (SPO on a bilattice) but get stuck on relationality. This clarifies which parts of the library genuinely need relationality vs. which can be grounded in predication alone. Target: `library/domains/science/`.

## How surveys connect to terms

Each survey produces a text documenting what the discipline knows about these concepts. Each survey ends with "Implications for the foundational ontology":
1. Which existing terms need enrichment and what the key insights are
2. Which new terms need to be created
3. What distinctions matter (and which don't) for this repo's purposes
4. How the concepts connect to the repo's own framework (predication, TAB, work types)

The enrichment plan takes these implications and produces the actual term files.

## Quality standard

Each survey should:
- Engage with at least 6 primary sources — at least 3 from substance, at least 3 from process/relational (not secondary summaries)
- Include at least one non-Western source where relevant
- Distinguish positions honestly (do not flatten one tradition into the other's vocabulary)
- Connect external scholarship to the repo's specific framework
- Be 2000–4000 words
- Follow writing conventions: no hedging, no AI prose performance
- End with honest assessment of which tradition bears the most load for each concept
