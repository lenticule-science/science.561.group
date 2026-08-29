---
title: "The Structural Rules and What They Cost"
description: "An explanation of weakening, contraction, and exchange — the three quiet rules that classical logic uses without naming — and what becomes visible when you drop them: resources, order, and the substructural logics this corpus builds its language base on."
date-created: 2026-06-19
date-modified: 2026-06-19
keywords: ["substructural-logic", "structural-rules", "weakening", "contraction", "linear-logic", "lambek-calculus", "sequent-calculus", "resources"]
---

# The Structural Rules and What They Cost

This is an explanation.
It does not teach you to run a sequent calculus; it tries to make visible three rules you have used your whole life without ever being told they were rules, so that you can see what they were silently deciding on your behalf — and what reasoning becomes when you take the decision back.
The rules are called the **structural rules**, and the reason they are easy to miss is that they govern not the logical connectives but the *bookkeeping of assumptions*: not what you may conclude, but what you may do with what you have assumed.

## The three quiet rules

Write a claim of consequence as a sequent: `Γ ⊢ A`, "from the list of assumptions `Γ`, the conclusion `A` follows." Most of logic's named rules tell you how to introduce or eliminate a connective — how `∧` or `→` enters a proof. The structural rules are different. They tell you how the *list* `Γ` may be manipulated, and there are three:

- **Weakening** — if `Γ ⊢ A`, then `Γ, B ⊢ A`. You may add an assumption you never use. Having proved the conclusion, you are allowed to drag in extra premises and ignore them.
- **Contraction** — if `Γ, B, B ⊢ A`, then `Γ, B ⊢ A`. You may use an assumption as many times as you like. One copy of `B` licenses arbitrarily many uses of `B`.
- **Exchange** — if `Γ, B, C, Δ ⊢ A`, then `Γ, C, B, Δ ⊢ A`. The order of assumptions does not matter; `Γ` is really a *set*, or at most a multiset, not a sequence.

Classical and intuitionistic logic help themselves to all three without comment. That is why, in ordinary reasoning, an assumption is like a *fact*: once you have it you can use it zero times, once, or a hundred times, in any order, and nothing is consumed. This feels not like a choice but like the nature of truth. It is a choice.

## What the rules were deciding

Each rule, stated as a permission, hides an assumption about what an assumption *is*.

Weakening assumes premises are **free to ignore** — that having more than you need is harmless. Contraction assumes premises are **free to copy** — that an assumption is an inexhaustible fact, not a thing you spend. Exchange assumes premises are **unordered** — that "what you know" is a heap, not a sequence. Together they encode a single picture: an assumption is an eternal, duplicable, order-indifferent truth.

That picture is exactly right for *facts about the timeless world* and exactly wrong for almost everything else. A five-dollar bill is not a fact: if you have one, you can buy a thing that costs five dollars *once*, not repeatedly, and you cannot weaken in a second purchase you did not fund. A word in a sentence is not order-indifferent: "dog bites man" and "man bites dog" are built from the same assumptions in different orders and mean different things. A permission, a reagent in a reaction, a token of authority, a step that changes state — none of these are facts you may freely copy and reorder. The structural rules quietly assumed they were.

## Dropping them, one at a time

A **substructural** logic is one that withholds one or more of the structural rules. Refusing a rule does not weaken the logic into saying less; it *sharpens* it into seeing more, because the thing the rule was papering over becomes visible and controllable.

Drop **contraction and weakening**, keep exchange, and you get **linear logic**. An assumption is now a *resource*: it must be used **exactly once** — not ignored (no weakening), not duplicated (no contraction). Implication splits. The familiar `A → B` ("if I had `A` I could get `B`," reusably) separates from the linear `A ⊸ B` ("spend one `A`, get one `B`"). Conjunction splits too, into a "both, and you choose which to use" and a "both, simultaneously produced." Linear logic does not describe a different universe of truths; it describes the *same* truths while tracking what gets consumed — which is why it is the logic of state, of concurrency, of anything where doing a thing uses a thing up. (When you *want* the old reusability back for a particular assumption, linear logic gives you a modality, `!A`, "as many `A` as you like" — copyability becomes an explicit, marked permission rather than a silent global law.)

Drop **exchange** as well and you get **ordered** logic — the **Lambek calculus**. Now assumptions cannot even be reordered, so position is meaning. Implication splits *again*, by side: `A \ B` ("an `A` on the left of me makes a `B`") differs from `B / A` ("an `A` on the right of me makes a `B`"). This is precisely the logic of grammar — a transitive verb is something that takes a noun phrase on its left and one on its right to make a sentence — and it is the **Lambek** face of the Curry–Howard correspondence: proof, program, morphism, *and parse*. The corpus's language base lives here, which is why word order is first-class rather than an afterthought.

## Why this corpus withholds the rules on purpose

The corpus reads a filepath as a [Curry–Howard proof coordinate](../../../../../typed-theory/content/type-theory/docs/explanations/propositions-as-types.md): descending a path is deriving a sequent, each segment a licensed step. Once you see filing as derivation, the structural rules stop being abstract and become governance over what a path may do with its segments.

- Refusing free **weakening** is refusing to drag in a path segment that does no work. A provenance segment — a source repo, an ingestion date — is exactly a weakening-in: an assumption added to the address that the document's *meaning* never uses. The corpus forbids it because the path is a proof, and a proof with an idle premise is not canonical.
- Refusing free **contraction** is refusing to restate, as a tag, a facet the path already spent as a segment. You do not get to use the same classificatory assumption twice and have it count twice; a facet is spent where it is asserted.
- Honoring **order** is honoring directionality itself — `recognize_child = recognize_parent ∧ local` builds the sequent left to right, premise before conclusion, and the entailment runs one way down the path. The Lambek discipline that makes `A \ B` differ from `B / A` is the same discipline that makes `science/logic` a different proof-term from `logic/science`.

And at the evidence base, withholding the rules is what lets contradiction be carried rather than detonate. A logic that freely contracts and weakens, on top of classical negation, is a logic where one contradiction proves everything. The corpus's [paraconsistent, four-valued evidence](../../../settling/content/order-theory/docs/explanations/why-truth-comes-in-a-lattice.md) is downstream of taking the structural rules as *adjustable*, not given.

## The thing to carry away

Three rules you never noticed — that an assumption may be ignored, copied, and reordered at will — were quietly deciding that everything you reason about is an eternal, inexhaustible, order-free fact. Most of what matters is not: money, words, permissions, reagents, state, and the segments of an honest address are all *spent, placed, and ordered*. Substructural logic is what you get when you stop granting the three permissions for free and instead hand them out deliberately, where they are earned. The logic does not become weaker; reasoning becomes able to see the resource, the order, and the cost it was throwing away — which is exactly the bookkeeping a corpus needs if it intends to treat a filepath as a proof and a contradiction as a value.
