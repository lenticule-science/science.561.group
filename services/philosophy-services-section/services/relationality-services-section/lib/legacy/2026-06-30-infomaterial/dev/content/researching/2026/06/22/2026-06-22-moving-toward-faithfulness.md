# Moving toward faithfulness

## What this is

If you are picking up work on RelMath, read this first — slowly.
It is not a task list and it names no files.
It is the *context* you need so that you act from understanding rather than executing someone else's steps.
The person who wrote it had to learn all of this the hard way, over a long and confusing session, and kept getting it wrong before getting it right.
The actions you should take will follow from understanding these ideas; if you skip the understanding and ask only "what do I do," you will reproduce the very mistakes this is meant to prevent.

## The problem you are here to address

A lot of this library **overclaims**.
The name of a theorem and the prose around it promise a deep result; the Lean underneath proves something trivial, or even tautological.
The gap between what is *claimed* and what is *established* is the single most important thing to learn to see, and to close.

This is not an accident, and it is not malice.
The ambition of the project is enormous — a re-founding of mathematics — and much of the existing code and commentary was written by AI under the pull of that ambition.
The result drifts grandiose: declarations that sound like they reconstruct heavy machinery but are, underneath, rigged to be true by fiat.
That pull is real and it will act on you too.
Everything below is how you resist it.

## The one idea everything rests on: stating is not proving

In Lean, writing a theorem down and proving it are two separate acts.
A statement is a *type* — a precise sentence you can name and point at — and on its own it carries no proof.
The proof is a separate object that fills it.
Nothing forces them to arrive together.

That separation is not a weakness.
It is the *room* the system gives you for the frontier.
You can always write down the real, ambitious claim.
The only honest question is what you then do about the proof.

## Three honest stances, and one dishonest one

A working mathematician already lives with three relationships to a sentence, and the system has a shape for each:

- **A theorem** — you have a proof.
- **A conjecture** — you state the claim at full strength and leave the proof an open, loudly-flagged hole.
  This is honest.
  No one can mistake it for proved.
- **A conditional** — you assume some unproven fact as an explicit hypothesis and prove what follows.
  Also honest: everything downstream is openly "modulo that assumption."

And exactly one dishonest move: keeping a statement *looking* strong by quietly making it trivial — most often by defining the thing you want to be the thing you already have, then "proving" they are equal.
The prose claims the mountain; the proof establishes `x = x`.

That move is the disease.
Learn its smell: a definition that wears an ambitious name but is set equal to something humble; a one-line proof under a grand claim; prose that says "we model X by Y," "on the nose," or "documented in prose, not stubbed."

## The honest hole is honesty, not failure

This is the reversal that matters most, and the one the previous author kept getting backwards.
An open proof hole is **not** cheating.
It is the honest marker of the frontier: the real statement, written at full strength, with its proof left open and visibly flagged.
The cheating is the *other* thing — faking the statement so you never have to leave a hole at all.

A project that forbids honest holes outright does not become more rigorous; it becomes dishonest, because the only remaining moves for a hard target are to delete it (and lose the ability to even *name* the frontier) or to fake it.
The right rule is narrow: never leave a hole in something you could simply prove — but when you genuinely cannot prove it yet, state it honestly and leave the hole.

Real frontier mathematics looks exactly like this.
A settled, shared library is free of holes because it is *settled*.
The living projects — the ones actually extending mathematics — are full of them by design.
They state the whole cathedral as open claims, wire up the dependencies, and fill the holes one at a time.
That is how a frontier moves.
This project is one of those.
It has been pretending to be the settled archive.

## Rigor and honesty are different — and only one is mechanical

There are tools that tell you whether a proof secretly leans on an open hole or on forbidden assumptions.
That is a *rigor* check, it is real, and it is worth running.
But understand its limit, because the limit is the trap:

A claim can pass every rigor check — no hidden hole, only the permitted assumptions — and still be a lie, because rigor cannot tell you whether the *statement* says anything at all.
The rigged tautology is perfectly rigorous.
No tool certifies that a claim is non-trivial, or that it means what its prose says.
That judgment is yours, made by reading the statement against the claim.
Rigor is mechanical; honesty is mathematical.
Never let a clean check convince you the mathematics is sound.

## What faithfulness asks of you

To make a claim *faithful* is to make it say exactly what has been established — no more.
The work is a way of seeing before it is a way of editing:

- Read each statement and ask honestly: *does this claim what its name and prose say, and is the proof real?*
- Where it overclaims, right-size it to the honest thing that is actually true.
- Do **not** delete the ambition.
  The genuine target it was reaching for is real mathematical insight; it belongs somewhere honest — a full-strength statement left as an open hole, or a hypothesis made explicit.
  Move the frontier into the open.
  Do not erase it, and do not fake it.
- Write commentary like a mathematician, not a press release: state the mathematics, cut the self-justification.
  Defensive prose ("no free data," "nothing is stubbed," "headline," "on the nose") is itself a *symptom* — it is usually there to paper over the gap between claim and proof.

## Why it matters

A re-founding of mathematics earns the name only if it is ruthless about the line between what it has established and what it aspires to.
Overclaiming is not cosmetic here; it is the failure mode that turns a genuine reconstruction into grandiose nonsense.
One fake result, dressed in the same confident prose as the real ones, poisons the credibility of everything beside it.

And the frontier has to be *visible* to be advanced.
If fakes are painted the same color as theorems, you cannot see where the real edge is, and so you cannot push it.
Faithfulness is not bookkeeping; it is the precondition for the project being real at all.

So resist the pull toward the impressive-sounding theorem.
An honest, weaker statement standing next to an open, clearly-marked frontier is worth incomparably more than a grand tautology.
Build the cathedral with honest holes in it — and then fill them, one at a time.
