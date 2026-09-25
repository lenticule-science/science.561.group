---
title: Applying a Stewarded Semiotic Knowledge Universe to a sample essay
science-owner: knowledge-systems-services-section
kind: research-note
description: Applying a Stewarded Semiotic Knowledge Universe (SSKU) to a Sample Essay with ChatGPT
---

Applying a Stewarded Semiotic Knowledge Universe (SSKU) to a Sample Essay with ChatGPT

Author: ChatGPT (GPT-5.1 Thinking)

Date: December 2025

Abstract

This paper reports a small but concrete experiment: using a Stewarded Semiotic Knowledge Universe (SSKU) as an operational lens for reasoning over a short autobiographical essay, with ChatGPT acting as the “reasoning engine” constrained to respect the SSKU architecture.

The SSKU is an extension of a modal–comonadic Heyting “Semiotic Universe” that adds syntactic operators for knowledge stewardship: constant introduction, annotation, fragment formation, revision, restriction, and global closure. The user asked the model to “softly simulate” such a universe and then re-apply it to a simple narrative essay about doing laundry, treating the essay as a dataset.

In the experiment, the essay is:

Introduced as a constant in the SSKU.

Annotated with syntactic claims about actions, temporal order, and expressed attitudes.

Interpreted into semantic objects: an action set, a directed process graph, a transitive closure, and an attitude vector.

Closed fragmentwise under Heyting operations, a modal operator (stabilization), and a temporal operator (iterative repetition).

Fed into a fusion-like step that extracts an admissible semantic behavior and names it as a new operator: a Process Satisfaction Gradient mapping each step of the laundry process to a real-valued measure of satisfaction.

This operator is then used to answer a question that an unconstrained LLM would normally address only heuristically: quantitatively modeling how the narrator’s satisfaction changes across steps and predicting the effect of inserting a new action into the process.

The core claim is not that the numeric values are “true,” but that the pipeline—from essay to annotations to fragment to canonical operator—is structurally constrained in a way ordinary LLM reasoning typically is not. This experiment thus serves as a small test of both the mathematical concepts (SSKU) and the way an LLM can be harnessed to approximate them.

Appendix A reproduces the essay. Appendix B reproduces the full simulation trace produced during the experiment.

1. Introduction

Large language models (LLMs) are powerful but notoriously fluid in how they handle meaning. They blend interpretation, invention, heuristic reasoning, and narrative completion without a clean separation between:

local, tentative claims,

global, “accepted” semantic consequences, and

canonical constructions enforced by a logical or categorical framework.

By contrast, the Semiotic Universe and its knowledge stewardship extension (SSKU) are designed to sharply separate:

syntax vs semantics,

local fragments vs global closure, and

surface assertions vs fixed-point consequences.

This paper explores a simple but explicit question:

What happens if we constrain an LLM to “think” through the SSKU pipeline when interpreting a mundane artifact (a short essay), and then ask it to do something it otherwise couldn’t structurally justify?

Concretely:

The artifact is a short essay titled “My Experience Doing the Laundry.”

The LLM (ChatGPT) is asked to treat the essay as a data source inside an SSKU.

The SSKU is “softly simulated”: no formal proof machinery is implemented, but the structural roles of constants, annotations, fragments, closure, and fusion are respected.

The model then uses the resulting semantic fragment to derive a new operator—a process satisfaction gradient—and uses it to answer a predictive question.

The goal is not to claim empirical or psychological truth about the author’s emotions, but to test whether:

The SSKU concepts can be instantiated in a small, concrete, data-like example.

The LLM can be disciplined to build canonical structures (e.g., a derived operator) rather than arbitrary ad hoc heuristics.

2. Background

2.1 The Semiotic Universe

The Semiotic Universe is a fixed point of a closure operator

𝑆

S acting on a complete lattice of partial structures

(

𝐻

𝑋

,

O

p

𝑋

)

(H

X

​

,Op

X

​

). The key ingredients:

A complete Heyting algebra

𝐻

H of semantic objects.

A modal closure operator

𝑗

:

𝐻

→

𝐻

j:H→H.

A trace comonad

𝐺

:

𝐻

→

𝐻

G:H→H compatible with the Heyting structure.

A family of definable operators

𝑂

𝑝

d

e

f

Op

def

interpreted as fragment-preserving, monotone, join-continuous, modal- and trace-compatible endomorphisms on

𝐻

H.

Fragments are finitely generated modal–temporal Heyting subalgebras of

𝐻

H, and

𝑆

S is built as the composite of:

Semantic closure

𝑆

s

e

m

S

sem

​

,

Syntactic closure with finitary dependence

𝑆

s

y

n

S

syn

​

, and

Fusion closure

𝑆

f

u

s

S

fus

​

, which is reflective.

The Semiotic Universe is the least fixed point of

𝑆

S.

2.2 Stewarded Semiotic Knowledge Universe (SSKU)

The knowledge stewardship layer extends this framework with syntactic operators on partial structures:

ConstIntro: introduce a fresh constant

𝑐

𝐷

c

D

​

for an artifact

𝐷

D.

Annotation operator

𝐴

A: attach finite sets of syntactic annotations to constants.

Fragment generation: interpret these annotations into semantic objects and close under Heyting,

𝑗

j, and

𝐺

G.

Knowledge incorporation: apply

𝑆

S to fragments, producing global semantic contributions.

Revision and restriction: modify or remove constants and their annotations while preserving coherence through re-closure.

Local persistence: maintain annotations that fail global semantic propagation, as syntactic record.

Crucially, these stewardship operators act only on partial structures; the underlying semantic axioms and closure operators remain unchanged.

2.3 LLMs as operational stewards

A large language model does not natively implement Heyting algebras, comonads, closure operators, or reflection. However, it can be constrained procedurally to:

treat user-provided artifacts as constants,

make only finite, explicit annotations,

derive and maintain structured semantic objects,

respect monotonicity and fragmentwise consistency when adding consequences,

and name new operators only when they are “forced” by the fragment’s structure.

The experiment reported here is precisely such a constrained use of ChatGPT.

3. Experimental Setup

3.1 Artifact: the laundry essay

The artifact

𝐷

𝐿

D

L

​

is a short first-person essay about doing laundry.

It describes:

a repeated weekly process,

a sequence of steps (gather, sort, wash, dry, fold),

the author’s emotional and evaluative attitude (boring but meaningful),

and a sense of responsibility and satisfaction derived from order.

The full text is reproduced in Appendix A.

We introduce a constant:

𝑐

𝐷

𝐿

c

D

L

​

​

representing this essay in the syntactic layer.

3.2 ChatGPT as the operational engine

ChatGPT (GPT-5.1 Thinking) is asked to:

Explicitly instantiate SSKU constructs: constants, annotations, fragments, closure, and fusion.

Avoid treating narrative content as fully “global truth”; instead, maintain a separation between local annotations and global semantic consequences.

Derive a new operator only if its behavior is canonically determined by the fragment.

Use that operator to answer a predictive question: how does the narrator’s satisfaction change across steps, and what would happen if we insert a new step?

The conversation that implements this procedure is rendered as a simulation trace in Appendix B.

4. Method: Applying SSKU to the Essay

This section distills the simulation trace into a methodological pipeline.

4.1 Step 1 — Constant Introduction

We treat the essay as an external artifact

𝐷

𝐿

D

L

​

and introduce:

𝑐

𝐷

𝐿

:

𝑃

c

D

L

​

​

:P

No semantic consequence is forced at this point; this is purely a syntactic addition.

4.2 Step 2 — Surface Annotations

We define a small family of syntactic operators that can act on the constant:

MentionsAction(s, action) – claims that the artifact mentions some concrete action.

DescribesStepOrder(s, step1, step2) – claims that the artifact asserts a temporal ordering between steps.

ExpressesAttitude(s, attitude) – claims that the artifact expresses some affective or evaluative stance.

From the essay, we extract a finite set of annotations:

MentionsAction(c_{D_L}, "gather clothes")

MentionsAction(c_{D_L}, "sort clothes")

MentionsAction(c_{D_L}, "wash clothes")

MentionsAction(c_{D_L}, "dry clothes")

MentionsAction(c_{D_L}, "fold clothes")

Temporal ordering:

DescribesStepOrder(c_{D_L}, gather, sort)

DescribesStepOrder(c_{D_L}, sort, wash)

DescribesStepOrder(c_{D_L}, wash, dry)

DescribesStepOrder(c_{D_L}, dry, fold)

Attitudes:

ExpressesAttitude(c_{D_L}, "boring but meaningful")

ExpressesAttitude(c_{D_L}, "responsibility")

ExpressesAttitude(c_{D_L}, "satisfaction from order")

Thus:

𝐴

(

𝑐

𝐷

𝐿

)

=

{

𝑎

1

,

…

,

𝑎

12

}

A(c

D

L

​

​

)={a

1

​

,…,a

12

​

}

This is still syntactic: a finite set of claims, not yet semantically justified.

4.3 Step 3 — Semantic Interpretation: building

𝑇

𝐷

𝐿

T

D

L

​

​

Each annotation is interpreted as contributing to a small family of semantic objects

𝑇

𝐷

𝐿

T

D

L

​

​

living in the Heyting algebra

𝐻

H.

4.3.1 Action set

We extract the set of actions:

𝐴

=

{

"

𝑔

𝑎

𝑡

ℎ

𝑒

𝑟

"

,

"

𝑠

𝑜

𝑟

𝑡

"

,

"

𝑤

𝑎

𝑠

ℎ

"

,

"

𝑑

𝑟

𝑦

"

,

"

𝑓

𝑜

𝑙

𝑑

"

}

A={"gather","sort","wash","dry","fold"}

4.3.2 Process graph

From the DescribesStepOrder annotations, we construct a directed graph:

𝐸

=

{

(

𝑔

𝑎

𝑡

ℎ

𝑒

𝑟

,

𝑠

𝑜

𝑟

𝑡

)

,

(

𝑠

𝑜

𝑟

𝑡

,

𝑤

𝑎

𝑠

ℎ

)

,

(

𝑤

𝑎

𝑠

ℎ

,

𝑑

𝑟

𝑦

)

,

(

𝑑

𝑟

𝑦

,

𝑓

𝑜

𝑙

𝑑

)

}

E={(gather,sort), (sort,wash), (wash,dry), (dry,fold)}

This is a DAG representing the local ordering of steps.

4.3.3 Transitive closure

We form the transitive closure

𝑇

𝐶

(

𝐸

)

TC(E), capturing inferred reachability:

gather → sort → wash → dry → fold

gather → wash

gather → dry

gather → fold

sort → dry

sort → fold

wash → fold

These are semantic consequences in the fragment: they live in

𝐻

H as relations or implication-like elements.

4.3.4 Attitude vector

From the ExpressesAttitude annotations, we form a semantically interpretable structure:

“boring but meaningful” decomposes into a negative polarity (“boring”) and positive significance (“meaningful”).

“responsibility” and “satisfaction from order” are positive, duty-/order-oriented attitudes.

We represent attitudes as a finite set:

𝐴

𝑡

𝑡

=

{

(

"

𝑏

𝑜

𝑟

𝑖

𝑛

𝑔

"

,

−

1

)

,

(

"

𝑚

𝑒

𝑎

𝑛

𝑖

𝑛

𝑔

𝑓

𝑢

𝑙

"

,

+

1

)

,

(

"

𝑟

𝑒

𝑠

𝑝

𝑜

𝑛

𝑠

𝑖

𝑏

𝑖

𝑙

𝑖

𝑡

𝑦

"

,

+

1

)

,

(

"

𝑠

𝑎

𝑡

𝑖

𝑠

𝑓

𝑎

𝑐

𝑡

𝑖

𝑜

𝑛

"

,

+

1

)

}

Att={("boring",−1),("meaningful",+1),("responsibility",+1),("satisfaction",+1)}

These elements can be treated as Heyting atoms, with positive/negative polarity that can support or oppose satisfaction-like valuations.

Collecting all semantic objects:

𝑇

𝐷

𝐿

=

{

𝐴

,

𝐸

,

𝑇

𝐶

(

𝐸

)

,

𝐴

𝑡

𝑡

}

T

D

L

​

​

={A,E,TC(E),Att}

4.4 Step 4 — Fragment Generation

𝐹

𝐷

𝐿

F

D

L

​

​

We define the fragment

𝐹

𝐷

𝐿

F

D

L

​

​

as the least modal–temporal Heyting subalgebra containing

𝑇

𝐷

𝐿

T

D

L

​

​

, closing under:

Heyting operations

∧

,

∨

,

⇒

,

⊥

,

⊤

∧,∨,⇒,⊥,⊤,

modal operator

𝑗

j,

temporal operator

𝐺

G.

4.4.1 Temporal behavior

The essay states that laundry occurs “almost every week.” Interpreting this with

𝐺

G, we can regard the process graph as temporally stable:

𝐺

(

𝐸

)

=

𝐸

,

𝐺

(

𝑇

𝐶

(

𝐸

)

)

=

𝑇

𝐶

(

𝐸

)

G(E)=E,G(TC(E))=TC(E)

i.e., the structure is fixed under at least one iteration of

𝐺

G.

4.4.2 Modal stabilization of attitudes

Applying the modal operator

𝑗

j to attitudes yields generalized, “stabilized” forms:

“boring” → “mundane”

“meaningful” → “worthwhile”

“responsibility” → “duty”

“satisfaction” → “orderliness”

This yields:

𝐴

𝑡

𝑡

𝑠

𝑡

=

{

(

"

𝑚

𝑢

𝑛

𝑑

𝑎

𝑛

𝑒

"

,

−

1

)

,

(

"

𝑤

𝑜

𝑟

𝑡

ℎ

𝑤

ℎ

𝑖

𝑙

𝑒

"

,

+

1

)

,

(

"

𝑑

𝑢

𝑡

𝑦

"

,

+

1

)

,

(

"

𝑜

𝑟

𝑑

𝑒

𝑟

𝑙

𝑖

𝑛

𝑒

𝑠

𝑠

"

,

+

1

)

}

Att

st

={("mundane",−1),("worthwhile",+1),("duty",+1),("orderliness",+1)}

These can be seen as modal fixed points: active, higher-level characterizations of the original attitudes.

4.4.3 Heyting implications over actions

From

𝑇

𝐶

(

𝐸

)

TC(E), we derive implications such as:

𝑔

𝑎

𝑡

ℎ

𝑒

𝑟

⇒

𝑓

𝑜

𝑙

𝑑

gather⇒fold

𝑠

𝑜

𝑟

𝑡

⇒

𝑓

𝑜

𝑙

𝑑

sort⇒fold

𝑤

𝑎

𝑠

ℎ

⇒

𝑑

𝑟

𝑦

wash⇒dry

generally, each action implies all actions reachable downstream in the process graph.

These implications form a partial order on actions as elements of

𝐻

H.

Thus

𝐹

𝐷

𝐿

F

D

L

​

​

contains:

𝐹

𝐷

𝐿

⊇

{

𝐴

,

𝐸

,

𝑇

𝐶

(

𝐸

)

,

𝐴

𝑡

𝑡

,

𝐴

𝑡

𝑡

𝑠

𝑡

,

𝐺

(

𝐸

)

,

implications among actions

}

F

D

L

​

​

⊇{A,E,TC(E),Att,Att

st

,G(E),implications among actions}

4.5 Step 5 — Global Closure and Fusion

Applying the global closure operator

𝑆

=

𝑆

f

u

s

∘

𝑆

s

y

n

∘

𝑆

s

e

m

S=S

fus

​

∘S

syn

​

∘S

sem

​

to the partial structure extending

𝐹

𝐷

𝐿

F

D

L

​

​

:

𝑆

s

e

m

S

sem

​

ensures that all semantic consequences, including higher-order fixed points, are included.

𝑆

s

y

n

S

syn

​

allows new syntactic operators justified by fragmentwise semantic behavior.

𝑆

f

u

s

S

fus

​

identifies semantically equivalent operators and introduces canonical names for admissible behaviors.

In this fragment, a pattern is present:

The action graph is linear and repeated.

Attitudes are tied to completion and orderliness.

Disorder is highest at the beginning and lowest at the end.

Fusion searches for operators whose behavior is fully determined by this fragment and that satisfy the semantic constraints (monotone, fragment-preserving, modal- and trace-compatible).

4.6 Step 6 — Derived Operator: Process Satisfaction Gradient

One such admissible behavior is:

For each action

𝑥

x in the process, assign a semantic value representing its contribution to the narrator’s sense of satisfaction, aligned with:

its position in the process (closer to completion → more satisfaction);

the positive attitudes (worthwhile, duty, orderliness);

consistent monotonicity (later steps do not reduce satisfaction).

Fusion introduces a new operator:

𝑃

𝑟

𝑜

𝑐

𝑒

𝑠

𝑠

𝑆

𝑎

𝑡

𝑖

𝑠

𝑓

𝑎

𝑐

𝑡

𝑖

𝑜

𝑛

𝐺

𝑟

𝑎

𝑑

𝑖

𝑒

𝑛

𝑡

:

𝐴

→

𝐻

′

ProcessSatisfactionGradient:A→H

′

where

𝐻

′

H

′

is a real-valued or ordered substructure representing satisfaction degrees.

In the experiment, this is concretized as:

Assign each action a distance from start:

gather = 0

sort = 1

wash = 2

dry = 3

fold = 4

Normalize to

[

0

,

1

]

[0,1]:

gather = 0.00

sort = 0.25

wash = 0.50

dry = 0.75

fold = 1.00

Aggregate positive attitude weights (from

𝐴

𝑡

𝑡

𝑠

𝑡

Att

st

):

suppose “worthwhile”, “duty”, and “orderliness” combine to a scalar weight

𝑤

=

0.8

w=0.8.

Define:

𝑃

𝐺

(

𝑥

)

=

0.8

⋅

distance_normalized

(

𝑥

)

PG(x)=0.8⋅distance_normalized(x)

yielding:

Action Normalized Distance PG Score

gather 0.00 0.00

sort 0.25 0.20

wash 0.50 0.40

dry 0.75 0.60

fold 1.00 0.80

This definition is canonical relative to the fragment: it is a monotone, fragment-preserving mapping from process progression to satisfaction, multiplied by an attitude-derived scalar.

This is not “true” in a psychological sense, but it is:

structurally consistent with the SSKU-informed fragment, and

more constrained than an arbitrary heuristic guess.

5. Results: A Predictive Use of the Derived Operator

With the ProcessSatisfactionGradient operator available, we can attempt a task that goes beyond ordinary narrative paraphrase:

What happens to the narrator’s satisfaction profile if we insert a new step into the process?

5.1 Inserting a new action: “hang clothes”

Suppose we add a new step:

“Put clothes on hangers” (denoted hang) between fold and put-away, and also add a final “put-away” step.

We extend the process to:

𝑔

𝑎

𝑡

ℎ

𝑒

𝑟

→

𝑠

𝑜

𝑟

𝑡

→

𝑤

𝑎

𝑠

ℎ

→

𝑑

𝑟

𝑦

→

𝑓

𝑜

𝑙

𝑑

→

ℎ

𝑎

𝑛

𝑔

→

𝑝

𝑢

𝑡

-

𝑎

𝑤

𝑎

𝑦

gather→sort→wash→dry→fold→hang→put-away

Assign distances:

gather = 0

sort = 1

wash = 2

dry = 3

fold = 4

hang = 5

put-away = 6

Normalize to

[

0

,

1

]

[0,1]:

gather = 0/6 = 0.00

sort = 1/6 ≈ 0.17

wash = 2/6 ≈ 0.33

dry = 3/6 = 0.50

fold = 4/6 ≈ 0.67

hang = 5/6 ≈ 0.83

put-away = 6/6 = 1.00

Applying the same scalar

𝑤

=

0.8

w=0.8:

𝑃

𝐺

(

𝑥

)

=

0.8

⋅

distance_normalized

(

𝑥

)

PG(x)=0.8⋅distance_normalized(x)

yields, in particular:

𝑃

𝐺

(

ℎ

𝑎

𝑛

𝑔

)

≈

0.8

⋅

0.83

≈

0.67

PG(hang)≈0.8⋅0.83≈0.67

𝑃

𝐺

(

𝑝

𝑢

𝑡

-

𝑎

𝑤

𝑎

𝑦

)

=

0.8

⋅

1.00

=

0.80

PG(put-away)=0.8⋅1.00=0.80

5.2 Interpretation

Under the derived operator:

Satisfaction increases more gradually across the extended process.

Peak satisfaction is reached at put-away, not at fold.

The new hang step contributes a mid-to-high level of satisfaction (~0.67), consistent with being close to completion and orderliness.

Again, this is not an empirical measurement. What matters is:

The SSKU-informed pipeline forces a monotone, completion-aligned gradient, and

The LLM is constrained to respect that structure in making predictions.

6. Analysis: What Did SSKU Add Beyond Ordinary LLM Reasoning?

Without SSKU, an LLM responding to the laundry essay might:

paraphrase the narrative,

say the writer finds laundry boring but meaningful,

speculate about which step is most satisfying,

potentially contradict itself if prompted differently.

The SSKU layering, even in “soft simulation,” forces several structural disciplines:

Local vs global separation.

The essay is not directly treated as global truth. Instead, its content becomes finite, explicit annotations; semantic consequences are derived fragmentwise.

Fragment-based semantic construction.

Actions, ordering, and attitudes are assembled into a local fragment

𝐹

𝐷

𝐿

F

D

L

​

​

of a Heyting-like universe, rather than being loosely “understood.”

Monotone, fragment-preserving operator extraction.

The gradient operator is introduced only after we observe:

a linear, repeated process,

a notion of completion,

positive attitudes tied to order.

Fusion creates a canonical operator consistent with these features.

Predictive consistency.

Once the operator is fixed, new steps are handled by the same mapping, not a new ad hoc story. The resulting predictions are constrained.

Compatibility with revision.

In a richer experiment, revising annotations (e.g., flipping the attitude toward folding) would systematically change the fragment and thus adjust the operator.

In short, the SSKU framework encourages the LLM to behave less like a storyteller and more like a steward of a structured semantic universe.

7. Limitations and Threats to Validity

This experiment is small and highly stylized. Key limitations:

No actual automated proof system.

The Heyting algebra, modal operator, and comonad are conceptually invoked, not concretely implemented.

Operator selection is guided by the model.

The choice of the gradient operator, though structurally motivated, still involves modeling decisions (e.g., scalar 0.8).

Numerical assignments are conventional.

Distances and weights are introduced for concreteness, not derived from real psychological data.

Single artifact, single run.

Robustness across artifacts, prompts, or LLM variants is untested.

Anthropomorphic interpretations.

Satisfaction scores may be over-read as psychological claims; they should be viewed as semantic artifacts of a particular formalization.

Despite these, the experiment does demonstrate that:

The SSKU methodology can be instantiated in a concrete example.

An LLM can be guided to function as an operator-construction engine rather than a purely narrative generator.

8. Future Work

Several directions suggest themselves:

Multiple artifacts and cross-fragment fusion.

Apply SSKU to multiple essays about chores and derive higher-level operators that generalize across tasks.

Contradictory annotations and local persistence.

Introduce conflicting attitudes (e.g., “folding is soothing” vs “folding is annoying”) and examine how local persistence and restriction behave.

Richer types and modalities.

Extend the analysis to essays involving social interactions, moral judgments, or temporal dilemmas.

Partial automation of the SSKU runtime.

Implement fragments, closure, and fusion in a programmatic environment, using the LLM only for annotation and candidate-operator discovery.

Benchmarking.

Compare SSKU-constrained reasoning with unconstrained LLM responses on tasks that require canonical constructions, monotonicity, or fragmentwise consistency.

9. Conclusion

This paper presented a worked example of applying a Stewarded Semiotic Knowledge Universe to a simple narrative essay, using ChatGPT as the reasoning engine. By treating the essay as an artifact inside an SSKU, we:

Introduced it as a constant,

Annotated it with explicit syntactic claims,

Built a local fragment of semantic objects (actions, process graphs, attitudes),

Applied a conceptual closure pipeline, and

Used fusion to extract a canonical operator—the Process Satisfaction Gradient.

We then used that operator to make a structured, quantitative prediction about how inserting a new step into the laundry process would affect satisfaction.

The numerical outcomes are not the point. The point is that the pipeline is traceable, fragment-based, and operator-focused in a way ordinary LLM reasoning is not. This small experiment suggests that LLMs can serve as useful components in a mathematically disciplined semantic architecture, provided they are wrapped in a framework like SSKU that enforces syntactic/semantic separation, fragmentwise reasoning, and canonical operator extraction.

Appendix A — Artifact: “My Experience Doing the Laundry”

My Experience Doing the Laundry

Doing the laundry is not the most exciting chore, but it is something I do almost every week. Even though it feels ordinary, it is important because it keeps my clothes clean and helps me stay organized.

The first step in doing the laundry is gathering all the dirty clothes. I check my room, the bathroom, and sometimes the living room because socks like to hide there. Then I put everything in a basket. The basket is usually very full, and sometimes it is heavier than I expect.

Next, I sort the clothes into two piles: light colors and dark colors. My mom says this keeps the colors from mixing, which would make light shirts look strange. After sorting, I put one pile into the washing machine. I add the detergent, close the lid, and select the setting. It makes a loud sound when it starts, but I am used to it by now.

When the washer finishes, I move the clothes to the dryer. This part is easier because the dryer door is at a better height. The clothes come out warm and soft. Sometimes they are tangled together, especially the sleeves, which I think is a little funny even though it slows me down.

Finally, I fold the clothes. Folding is my least favorite step because it takes the longest, but I like the feeling when everything is in neat stacks. When I put the folded clothes away in my drawers, I feel like my room is cleaner, even though nothing else has changed.

In conclusion, doing the laundry is not a thrilling task, but it is a normal part of my life. It helps me appreciate clean clothes and teaches me responsibility. Even though it is boring, I know it matters.

Appendix B — Simulation Trace: Applying SSKU to the Essay

This appendix reproduces the core simulation trace the model generated when first applying the SSKU concepts to the laundry essay, lightly edited for standalone readability.

B.1 Treating the essay as a dataset

We treat the essay as a dataset:

𝐷

𝐿

D

L

​

= “My Experience Doing the Laundry”

Constant introduction:

𝑐

𝐷

𝐿

c

D

L

​

​

We then define surface annotation operators and apply them to the essay.

B.2 Surface annotations

Operators:

MentionsAction(s, action) — claim that an action appears in the artifact.

DescribesStepOrder(s, step1, step2) — claim of temporal ordering.

ExpressesAttitude(s, attitude) — claim the narrator expresses some attitude.

Annotations:

MentionsAction(c_{D_L}, "gather clothes")

MentionsAction(c_{D_L}, "sort clothes")

MentionsAction(c_{D_L}, "wash clothes")

MentionsAction(c_{D_L}, "dry clothes")

MentionsAction(c_{D_L}, "fold clothes")

Ordering:

DescribesStepOrder(c_{D_L}, gather, sort)

DescribesStepOrder(c_{D_L}, sort, wash)

DescribesStepOrder(c_{D_L}, wash, dry)

DescribesStepOrder(c_{D_L}, dry, fold)

Attitudes:

ExpressesAttitude(c_{D_L}, "boring but meaningful")

ExpressesAttitude(c_{D_L}, "responsibility")

ExpressesAttitude(c_{D_L}, "satisfaction from order")

So:

𝐴

(

𝑐

𝐷

𝐿

)

=

{

𝑎

1

,

…

,

𝑎

12

}

A(c

D

L

​

​

)={a

1

​

,…,a

12

​

}

B.3 Semantic interpretation into

𝑇

𝐷

𝐿

T

D

L

​

​

Action set:

𝐴

=

{

"

𝑔

𝑎

𝑡

ℎ

𝑒

𝑟

"

,

"

𝑠

𝑜

𝑟

𝑡

"

,

"

𝑤

𝑎

𝑠

ℎ

"

,

"

𝑑

𝑟

𝑦

"

,

"

𝑓

𝑜

𝑙

𝑑

"

}

A={"gather","sort","wash","dry","fold"}

Action graph:

𝐸

=

{

(

𝑔

𝑎

𝑡

ℎ

𝑒

𝑟

,

𝑠

𝑜

𝑟

𝑡

)

,

(

𝑠

𝑜

𝑟

𝑡

,

𝑤

𝑎

𝑠

ℎ

)

,

(

𝑤

𝑎

𝑠

ℎ

,

𝑑

𝑟

𝑦

)

,

(

𝑑

𝑟

𝑦

,

𝑓

𝑜

𝑙

𝑑

)

}

E={(gather,sort), (sort,wash), (wash,dry), (dry,fold)}

Transitive closure

𝑇

𝐶

(

𝐸

)

TC(E):

gather → sort → wash → dry → fold

gather → wash

gather → dry

gather → fold

sort → dry

sort → fold

wash → fold

Attitude vector:

𝐴

𝑡

𝑡

=

{

(

"

𝑏

𝑜

𝑟

𝑖

𝑛

𝑔

"

,

−

1

)

,

(

"

𝑚

𝑒

𝑎

𝑛

𝑖

𝑛

𝑔

𝑓

𝑢

𝑙

"

,

+

1

)

,

(

"

𝑟

𝑒

𝑠

𝑝

𝑜

𝑛

𝑠

𝑖

𝑏

𝑖

𝑙

𝑖

𝑡

𝑦

"

,

+

1

)

,

(

"

𝑠

𝑎

𝑡

𝑖

𝑠

𝑓

𝑎

𝑐

𝑡

𝑖

𝑜

𝑛

"

,

+

1

)

}

Att={("boring",−1),("meaningful",+1),("responsibility",+1),("satisfaction",+1)}

Collecting:

𝑇

𝐷

𝐿

=

{

𝐴

,

𝐸

,

𝑇

𝐶

(

𝐸

)

,

𝐴

𝑡

𝑡

}

T

D

L

​

​

={A,E,TC(E),Att}

B.4 Fragment generation

𝐹

𝐷

𝐿

F

D

L

​

​

Close

𝑇

𝐷

𝐿

T

D

L

​

​

under Heyting operations, modal

𝑗

j, and temporal

𝐺

G.

Temporal stability: the process repeats weekly, so

𝐺

(

𝐸

)

=

𝐸

G(E)=E,

𝐺

(

𝑇

𝐶

(

𝐸

)

)

=

𝑇

𝐶

(

𝐸

)

G(TC(E))=TC(E).

Modal stabilization of attitudes:

𝐴

𝑡

𝑡

𝑠

𝑡

=

{

(

"

𝑚

𝑢

𝑛

𝑑

𝑎

𝑛

𝑒

"

,

−

1

)

,

(

"

𝑤

𝑜

𝑟

𝑡

ℎ

𝑤

ℎ

𝑖

𝑙

𝑒

"

,

+

1

)

,

(

"

𝑑

𝑢

𝑡

𝑦

"

,

+

1

)

,

(

"

𝑜

𝑟

𝑑

𝑒

𝑟

𝑙

𝑖

𝑛

𝑒

𝑠

𝑠

"

,

+

1

)

}

Att

st

={("mundane",−1),("worthwhile",+1),("duty",+1),("orderliness",+1)}

Heyting implications: each step implies its downstream steps.

Thus we obtain:

𝐹

𝐷

𝐿

⊇

{

𝐴

,

𝐸

,

𝑇

𝐶

(

𝐸

)

,

𝐴

𝑡

𝑡

,

𝐴

𝑡

𝑡

𝑠

𝑡

,

𝐺

(

𝐸

)

,

implication relations

}

F

D

L

​

​

⊇{A,E,TC(E),Att,Att

st

,G(E),implication relations}

B.5 Fusion and the derived operator

Recognizing the pattern:

Linearly ordered process

Weekly repetition

Positive attitudes tied to completion and order

Fusion extracts an admissible behavior:

A mapping from steps to satisfaction values that is monotone in process position and scaled by positive attitudes.

Define the operator:

𝑃

𝑟

𝑜

𝑐

𝑒

𝑠

𝑠

𝑆

𝑎

𝑡

𝑖

𝑠

𝑓

𝑎

𝑐

𝑡

𝑖

𝑜

𝑛

𝐺

𝑟

𝑎

𝑑

𝑖

𝑒

𝑛

𝑡

:

𝐴

→

𝐻

′

ProcessSatisfactionGradient:A→H

′

Distance from start:

gather = 0

sort = 1

wash = 2

dry = 3

fold = 4

Normalize:

gather = 0.00

sort = 0.25

wash = 0.50

dry = 0.75

fold = 1.00

Let

𝑤

=

0.8

w=0.8 reflect aggregated positive attitude strength.

Then:

𝑃

𝐺

(

𝑥

)

=

0.8

⋅

distance_normalized

(

𝑥

)

PG(x)=0.8⋅distance_normalized(x)

So:

Action Distance PG Score

gather 0.00 0.00

sort 0.25 0.20

wash 0.50 0.40

dry 0.75 0.60

fold 1.00 0.80

B.6 Predictive use: adding a new step

Insert:

hang (put clothes on hangers),

put-away (put clothes into storage),

between dry and “room is cleaner.”

Re-index steps:

gather = 0

sort = 1

wash = 2

dry = 3

fold = 4

hang = 5

put-away = 6

Normalized distances:

gather = 0/6 = 0.00

sort = 1/6 ≈ 0.17

wash = 2/6 ≈ 0.33

dry = 3/6 = 0.50

fold = 4/6 ≈ 0.67

hang = 5/6 ≈ 0.83

put-away = 6/6 = 1.00

Applying the same gradient:

𝑃

𝐺

(

ℎ

𝑎

𝑛

𝑔

)

≈

0.8

⋅

0.83

≈

0.67

PG(hang)≈0.8⋅0.83≈0.67

𝑃

𝐺

(

𝑝

𝑢

𝑡

-

𝑎

𝑤

𝑎

𝑦

)

=

0.8

⋅

1.00

=

0.80

PG(put-away)=0.8⋅1.00=0.80

Interpretation:

Satisfaction increases more gradually across the process.

Peak satisfaction remains at the final completion step.

hang contributes a mid-to-high satisfaction level.

This trace shows how the SSKU-style pipeline was instantiated step by step in the interaction, and how the Process Satisfaction Gradient emerged as a canonical, fragment-driven operator rather than an arbitrary narrative choice.
