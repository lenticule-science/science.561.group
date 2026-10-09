---
title: "State, Time, and Event: A Survey of Substance and Process Accounts"
date-created: 2026-04-03
text-type: survey
description: "Survey of philosophical accounts of state, time, and event — examining substance and process traditions, from McTaggart's A-series and B-series to Whitehead's actual occasions, Buddhist momentariness, and process philosophy. Addresses the interrelation of permanence and change across Western analytic philosophy, continental philosophy, and non-Western traditions."
references:
  - McTaggart, J.M.E. (1908). "The Unreality of Time". *Mind*, 17(68), 457-474.
  - Prior, Arthur. (1957). *Time and Modality*. Oxford University Press.
  - Prior, Arthur. (1967). *Past, Present, and Future*. Oxford University Press.
  - Barwise, Jon & Perry, John. (1983). *Situations and Attitudes*. MIT Press.
  - Harel, David. (1987). "Statecharts: A Visual Formalism for Complex Systems". *Science of Computer Programming*, 8(3), 231-274.
  - Kim, Jaegwon. (1976). "Events as Property Exemplifications". *The Journal of Philosophy*, 73(19), 589-603.
  - Davidson, Donald. (1969). "The Individuation of Events". *Essays on Actions and Events*. Oxford University Press.
  - Le Poidevin, Robin. (2007). *The Images of Time*. Oxford University Press.
  - Whitehead, Alfred North. (1929). *Process and Reality: An Essay in Cosmology*. Macmillan.
  - Bergson, Henri. (1889). *Time and Free Will: An Essay on the Immediate Data of Consciousness*. Dover Publications.
  - Deleuze, Gilles. (1969). *The Logic of Sense*. Columbia University Press.
  - Prigogine, Ilya. (1997). *The End of Certainty: Time, Chaos, and the New Laws of Nature*. Free Press.
---

State, [time](../../../glossary/terms/time.md), and [event](../terms/event.md) form a cluster tight enough that you cannot define one without the others. A [state](../terms/state.md) is a configuration at a moment. An event is a transition between states. Time is what makes both state and change possible. These three are among the most disputed concepts in philosophy: they are fundamental to metaphysics, yet remain deeply puzzling.

Why does this matter? Because every coherent worldview must answer: What persists and what changes? How do we distinguish a thing at one moment from itself at another? What is the relationship between a thing's enduring identity and the flow of temporal experience? Is time real at all, or is it illusion?

Two great traditions offer competing accounts, and they remain unreconciled. The substance tradition — running from Aristotle through contemporary analytic philosophy — treats state as fundamental and time as something you add to your ontology afterward. States are the primary data; time is an indexing system that situates them. The process tradition — from Whitehead and Bergson through Indigenous cosmologies and contemporary physics — reverses this: time is fundamental, and states are abstractions from ongoing processes. Which is correct shapes everything that follows: how we model continuity, how we explain change, and what we count as real.

## The substance account: states, snapshots, and state machines

In substance philosophy, a [thing](../terms/thing.md) is a persisting entity that has [qualities](../terms/quality.md) and stands in [relations](../terms/relation.md). At any given moment, the thing exemplifies a set of qualities — this is its state. The state of a chess game is the configuration of pieces on the board. The state of a patient is a clinical profile: blood pressure, hormone levels, reported symptoms, diagnosis. The state of a legal proceeding is its position in the process: preliminary motion, trial, appeal.

McTaggart formalized the structure of temporal description in 1908, distinguishing the A-series (past, present, future — tensed, perspectival) from the B-series (earlier-than, later-than, simultaneously-with — tenseless, objective). The substance account privileges the B-series: there is an objective temporal order, and every state has a coordinate on that temporal order. The state of the chess game at t₁ differs from the state at t₂ because different qualities are exemplified at those times. The state itself is a snapshot: all the qualities present at a single moment.

This leads to a straightforward definition: a state is a complete specification of all the qualities a thing has at a given moment. Incompleteness is practical, not conceptual — in principle you could specify *everything* about the chess position at t₁, but you choose not to, because you only care about piece locations, not the ambient temperature or the time of day.

But snapshots are not the only substance account of state. An alternative, more powerful one comes from automata theory and computer science: a state is a node in a graph of possible states, and events are transitions between nodes. David Harel's statecharts formalize this in his foundational 1987 paper. In Harel's account, a state is not defined by the qualities present at a moment — it is defined by its relationships to other states. A chess game in the state "white to move" is one that transitions to "black to move" when a legal move occurs. The "white to move" state *is* the collection of those transitions. This is why statecharts are hierarchical and can have orthogonal regions: you can have nested states (a chess match can be "in progress, game 3 active") and independent state machines running in parallel (a player's physical condition is independent of the game state).

This graph-based account is more flexible than snapshots: you can represent partial states (systems in intermediate configurations, incompletely specified), and you can represent complex temporal logic (the game is "in progress" if it's past the opening position but before the endgame, and moves are constrained by rules, not arbitrary). Arthur Prior's tense logic formalizes this constraint-based view in modal terms: "the game will be won" is a genuine modal statement, not merely a description of a fact at a later time. It captures necessity and constraint.

Both the snapshot and the graph accounts assume that states exist independently of time: they are defined first (as collections of qualities or as nodes in a graph), and then they are placed on a timeline. This is the substance assumption: the thing and its states are primary; time is secondary. Time is where states are indexed.

## Time as partial specification: situation theory

Barwise and Perry's situation theory, developed in their 1983 *Situations and Attitudes*, offers a middle ground between snapshots and pure temporal indexing. A situation is a partial specification of reality. It is not a complete snapshot — it is explicitly partial, with acknowledged gaps. A situation is constituted by *facts* and *absences*: "the chess game is in the endgame; the white king is on e4; the black king is off the board." The power of situation theory is that it formalizes incompleteness as a feature, not a deficiency.

A doctor's assessment is a situation in this sense: "The patient's blood pressure is elevated; their white blood cell count is normal; we have not yet tested for cardiac markers." The assessment is not false or incomplete in a defective way; it is complete *as a situation*. It answers specific clinical questions and leaves others open for further investigation. The situation is partial, but adequate for what it aims to describe.

Situations are indexed by parameters. "The situation at location-L and time-T" specifies not just which facts hold, but *where* and *when* they hold. This is how situation theory differs from propositional logic: propositions are true or false globally; situations are true or false *locally*, within bounds. A patient's clinical state at Monday 10am is one situation; the same patient at Monday 4pm is a different situation. The time-parameter is intrinsic to what is being specified.

Barwise and Perry formalize this with *infons* — basic units of information like "the board position is stalemate" or "the patient's oxygen saturation is 95%." These can be true or false; they can be positive or negative. A situation is a set of infons, indexed by time and location. Situations support—what makes a situation true? A situation is true at a location-time because of facts in the world at that location-time. The chess position you describe is true because that is how the pieces are actually arranged. The clinical assessment is true because those are the patient's actual vital signs.

## The process account: time as creative advance

Whitehead's *Process and Reality* inverts the substance account entirely. For Whitehead, the fundamental unit of reality is not a thing or a substance, but an *actual occasion* — a "drop of experience" or an event. An actual occasion comes into being, achieves definiteness (what Whitehead calls "concrescence" — growing together, integrating influence from prior occasions), and then perishes. It becomes data for the next actual occasion.

Time is not a line that occasions sit on. Time *is* the creative advance of actual occasions. Each occasion brings something genuinely new into being — it is not a mere rearrangement of pre-existing possibilities. Once an occasion achieves its definiteness, it perishes. It does not persist.

This is radically different from the substance view. For Aristotle and the substance tradition, a thing persists through time, changing its qualities. For Whitehead, there is no such persistence. What appears as persistence is actually a causal series of actual occasions, each taking the previous one as data and producing a successor. A person is not a single persistent substance; a person is a "society" of actual occasions, connected by causal order. A chess game is not one game enduring through moves; it is a causal series of distinct game-occasions, each prehending the previous one.

The state of an occasion, in Whitehead's account, is not a snapshot at a moment. It is the "achieved satisfaction" of the occasion — the final result of its concrescence, the definiteness it achieves. Once achieved, the occasion perishes and becomes "objective data" for the next occasion. The state is not something that persists; it is something that becomes. It is the actualization of a moment.

Bergson makes a complementary point from a different direction. In *Time and Free Will* (1889), Bergson distinguishes real time (*durée*) from spatialized time. Real time is qualitative, heterogeneous, continuous, irreversible. When you represent time as a line of discrete points (t₁, t₂, t₃ ...), you spatialize it. You treat time like space: you can count the points, measure distances, reverse direction. But real time is not reversible. The past is *alive* in the present — not as a separate historical fact, but as the living ground of what is now becoming. To reduce duration to timestamped snapshots is to falsify it.

Consider a court proceeding: if you represent its history as a sequence of timestamped snapshots (opening arguments at 10:00, witness testimony at 11:30, closing arguments at 14:00), you have spatialized the proceeding's becoming. You have treated it as if the trial's history is a fixed line in space-time. But the trial's *real* history — the unfolding tension, the unexpected testimony, the judge's reasoning as it develops — is not captured by timestamped snapshots. It is captured only by understanding the proceeding as a duration, a continuous becoming that is irreversible. Once testimony is given, it cannot be taken back. The proceeding moves forward in real time; it does not merely occupy a sequence of points on an external timeline.

## Events: what are they?

An event is what happens — a change, a transition, something that marks a difference in the world. But what is an event, exactly? Four major philosophical accounts compete.

**Kim's account:** An event is the exemplification of a property by an object at a time. E = [x, P, t], where x is an object, P is a property, and t is a time. A victory is [the white player, property-of-having-won, 14:30]. A diagnosis is [the patient, property-of-being-diagnosed-with-hypertension, 10:00 Tuesday]. This is clean and compositional — events are constructed from objects, properties, and times, all relatively independent.

But there is a persistent problem: the same object can exemplify the same property at different times. The patient can be diagnosed with hypertension on Tuesday and again, independently, on Friday — are these one event or two? If we say two, we must distinguish them somehow. If we say the property is "being-diagnosed-with-hypertension-on-Tuesday," then the property becomes hopelessly specific and gerrymandered.

**Davidson's account:** An event is individuated by its causes and effects. What makes event A different from event B? Not a difference in properties or times, but a difference in what caused it or what it caused. If A and B have the same causes and effects, they are the same event — regardless of how you describe them. "The tumor was detected" and "the X-ray revealed a shadow on the left lobe" may be different descriptions of the same event. This is coarse-grained — it treats many different descriptions as referring to the same event. It is also intrinsically causal: you cannot understand an event without understanding its place in a causal order.

**Whitehead's account:** An event *is* an actual occasion. Events are not things that happen *to* substances; events are the fundamental units of reality. An occasion is an event. It comes into being, achieves definiteness, and perishes, becoming data for the next occasion. There is no substance apart from events; substances are abstractions from patterns of events. Under this account, a victory is not a property exemplification — it is an actual occasion in which the game achieves a definite end-state. The game is a society of occasions. There is no persisting game apart from the occasions that constitute it.

**Deleuze's account:** An event is incorporeal — it does not exist as a thing in the world. Instead, an event is the sense or *meaning* of what happens. Deleuze distinguishes Chronos (the present moment that consumes past and future, sequential and measurable) from Aion (the pure event, always already past and always about to come, unmeasurable and eternal). A trial's scheduled verdict date is in Chronos — you can measure it, schedule around it, count down. But the trial's *meaning* — what the case was *for*, what it revealed about law and justice — is in Aion. This meaning is not located at a moment; it runs through the entire duration of the proceedings. It is the sense that integrates all the moments into a coherent whole.

## Time: linear, cyclical, or something else?

Is time a line? McTaggart himself thought time might be unreal altogether — a contradiction at the heart of the concept. But if time is real, is it:

1. **Presentism:** Only the present moment exists. Past and future are not real; they are memories or anticipations. What exists is temporally local — what exists depends on when you ask. The present is always now; the past is always gone.

2. **Eternalism:** All moments are equally real — past, present, and future. The distinction between past and future is perspectival, not ontological. The universe has four-dimensional structure, with time as a fourth dimension alongside space. You are simultaneously young and old at different times, and both are equally real.

3. **Growing Block:** The past and present are real; the future is not. The present is a moving boundary: as new moments come into being, they become real and join the past. This captures becoming — genuine novelty — without McTaggart's A-series contradictions.

The substance account typically leans toward eternalism: if you define states as coordinates on a timeline, you are committing to the reality of all times, not just the present. Whitehead leans toward growing block: the future is genuinely open; actual occasions come into being (become real) in the creative advance.

But there is another possibility that mainstream Western philosophy has often overlooked: **cyclical or spiral time**. Many Indigenous traditions — Lakota, Haudenosaunee, Aboriginal Australian — understand time as cyclical, returning, or spiral rather than linear. Seasons return; ceremonies recur; obligations are generational. Patterns repeat, but never exactly: the winter that comes is both the same winter pattern and genuinely new.

Ilya Prigogine's *The End of Certainty* (1997) offers a modern physics argument for irreversibility as fundamental. In systems far from equilibrium, genuine novelty emerges; they are not rearrangements of pre-existing possibilities. The thermodynamic arrow of time — entropy increase — is not a statistical accident but a feature of reality itself. From this view, time is not a reversible container but an inherently directed flow. Forward in time means genuinely different states; backward in time is forbidden by thermodynamics.

A natural cycle — a year of seasons, a day-night cycle — illustrates this well: the year does recur, but it is not a perfect cycle. Each year's spring is spring again, but the climate has shifted. The flowers bloom again, but in a changed world. The cycle is real; the newness is real. Prigogine calls this spiral time: cycles are real, but they are not closed loops. Each iteration is genuinely new, and the system carries an irreversible forward direction.

## Buddhist momentariness: the causal theory of persistence

In the Sautrantika and Yogacara schools of Buddhist Abhidharma philosophy, everything exists for exactly one moment — one *kṣaṇa*. This is not a limit of our perception or a practical approximation. It is metaphysical: momentariness is the nature of existence. What appears as persistence is not a single entity lasting through time; it is a causal series of momentary entities, each causing the next.

This is a genuine theory of ontology, not psychology or metaphor. You do not have one book persisting and changing; you have a causal series of momentary books. Book-at-t₁ causes (via continuity of matter and form) book-at-t₂, which causes book-at-t₃. They are numerically distinct; their unity is causal. The book persists as a causal pattern, not as a substance.

This theory has surprising contemporary parallels. The patient undergoing chemotherapy is not a single persistent patient; there is a causal series of distinct momentary patients, each caused by the previous one, each shaped by the treatment. The chess game at move 10 is distinct from the game at move 11; they are linked by causation, not identity. Persistence is causal continuity.

Whitehead's actual occasions are conceptually similar: both treat the momentary unit as fundamental, and both treat persistence as a causal pattern. The difference is metaphysical interpretation: Whitehead sees occasions as drops of experience; Buddhist Abhidharma sees dharmas as impersonal constituents of experience. But in both cases, what we call "a thing" is really a causal series of distinct momentary entities. Identity through time is not intrinsic persistence; it is a name for a causal pattern.

## State machines and hierarchical time

Harel's statecharts provide a model of state that integrates hierarchy and independence. A state can contain substates (hierarchy), and a system can be in multiple states simultaneously if they belong to different orthogonal regions.

This is not merely a diagramming convenience; it is a philosophical account of state structure. Consider a trial: it can be in the state "in progress" and simultaneously in the state "awaiting expert testimony." These are not contradictory — they are different aspects of the state. The trial's full state is structured: {in progress, awaiting testimony, pre-verdict}. A state is not a single property; it is a structured *configuration* of properties.

Statecharts also formalize the notion of a *valid trajectory*: which state transitions are allowed? A chess game cannot go directly from "in opening" to "checkmate" without passing through midgame states. The statechart encodes these constraints — the valid paths through state-space. This reflects a deep truth: not all transitions are possible. The structure of valid transitions is part of what it means for a system to be in a particular state. The state includes both where you are and where you can go.

This raises a philosophical question: is the valid trajectory something we *impose* on the system (prescriptive), or something we *discover* in it (descriptive)? In statechart modeling, the answer is often both. A trial has constraints on state transitions because of procedural rules (imposed) and because of the logic of evidence (discovered). The state encodes both structure and possibility.

## The difference it makes: substance vs. process

Here is where the two traditions diverge in their implications:

**Substance:** State is primary. Time is a parameter you add. Events are state transitions. The system's correctness is determined by the states it can enter and the transitions between them. The state machine defines legal behavior. Future states are computable from current state plus rules.

**Process:** Time is primary. States are abstractions from the flow of occasions. Events are actual occasions coming into being. The system's correctness is determined by the *directionality* of time — is it genuinely generating novelty, or merely shuffling pre-existing possibilities? Future states are not fully determined by present state alone; there is genuine indeterminacy and openness.

Consider a legal example: **What happens when a trial gets stuck?** A witness fails to appear; no one knows if they will ever testify.

From the substance perspective: the trial is in a state with no valid transition out. The trial procedure is frozen; the constraints defining valid states are violated. You fix it by changing the state (declare a mistrial, reschedule) or by providing the missing condition (find the witness, issue a subpoena).

From the process perspective: the trial has entered a stalled moment. Time is not flowing forward. The issue is not merely that a state is wrong; it is that the creative advance has stopped. To fix it, you must do more than rearrange the state — you must re-establish time's flow by generating genuinely new events (the judge takes action, the witness appears, something unprecedented happens).

Neither perspective is false. They are complementary ways of understanding complex systems. The substance perspective is efficient for design and verification (you can formalize a statechart and check it). The process perspective is necessary for understanding meaning, direction, and real change (you can ask: is this genuinely moving forward, or is it stuck?).

## State, time, and event: the synthesis

The accounts surveyed here are not competing for a single truth. Rather, they illuminate different facets of how state, time, and event relate:

- **Snapshots** are useful when we want to describe a system's configuration at a moment. They work when change is discrete and states are clearly bounded.
- **State machines** are essential when we want to understand what transitions are possible, what constraints govern change, and what counts as a valid sequence of states.
- **Situations** (Barwise & Perry) capture the partiality of real knowledge. We never have complete information; situations formalize how partial information can still be complete-as-a-situation.
- **Occasions** (Whitehead) ground us in time's flow. They remind us that reality is not static; it is a process of becoming, where novelty is fundamental.
- **Momentariness** (Buddhist philosophy) shows that persistence is not intrinsic but causal. What we call "a thing" is a causal pattern.
- **Duration** (Bergson) reveals that the qualitative character of time cannot be captured by spatialized points and intervals.
- **Spiral time** (Indigenous traditions, Prigogine) acknowledges that cycles are real but not perfect — that recurrence coexists with novelty and directionality.

Which account applies depends on what you are trying to understand. Are you designing a system? Use statecharts. Are you tracking historical events? Use situations and events-as-tuples. Are you interested in metaphysics — what is real? Consider Whitehead and Buddhist momentariness. Are you concerned with lived experience and meaning? Return to Bergson and Deleuze. Are you understanding how systems evolve over time? Prigogine and spiral time offer insight.

The deepest philosophical point is this: no single account exhausts state, time, and event. We need multiple frameworks because these concepts are genuinely complex. A mature theory uses multiple perspectives, choosing the right lens for each question.

## See also

- [thing](../terms/thing.md) — the base category of substance philosophy
- [quality](../terms/quality.md) — properties that things exemplify
- [relation](../terms/relation.md) — how things connect and interact
- [time](../../../glossary/terms/time.md) — the fundamental parameter of becoming
- [event](../terms/event.md) — what happens; transition and change
- [state](../terms/state.md) — configuration at a moment
- Peirce's pragmatism and semiotics on how signs relate to time and event
- Edmund Husserl's phenomenology on temporal consciousness and the constitution of time
- Martin Heidegger's *Being and Time* on temporality and authenticity
- Maurice Merleau-Ponty on embodied temporality and perception
- Gilles Deleuze's *Difference and Repetition* on time, identity, and difference
- Susanne Langer on symbolism and the symbolic transformation of experience
- Alfred Whitehead's metaphysics of becoming and the ontology of process
- David Ray Griffin (editor) of *The Reenchantment of Science*, contemporary process thought
- Donna Haraway on relationality and temporality in knowledge practices
- Bruno Latour's actor-network theory and temporal ordering of innovation
