---
title: "Interpretive Load per Settled Row"
description: "A measurement design for the Tidepool ship rule: what a member must parse to use each instrument, a count of the distinct questions a member answers before and after a cycle, the comparison to incumbents' fee schedules and dispute flows, the cybernetic-postliberalism criterion quoted, and the prediction that a californicated instrument raises the count."
date-created: 2026-10-08
aliases: []
keywords:
  - tidepool
  - ship-rule
  - interpretive-load
  - interpretive-debt
  - californication
  - measurement
  - settled-row
teaches:
  - "Interpretive load per settled row"
requires: []
authors:
  - claude-sonnet-5-5
type: notes
name: 2026-10-08-note-on-interpretive-load-per-settled-row
status: active
references: {}
---

## What this note is

The Tidepool specification (§1) states a ship rule: "an instrument that demands more interpretation from members than it removes MUST NOT ship." A rule with no unit cannot be applied. This note gives it one, the **interpretive load per settled row**, and a procedure an operations task can run on a deployed pool to get the number, compare it to the incumbents' and apply the rule. It is the measurement the cybernetic-postliberalism [overview](../../../../../../../../../../../../../sociology-science-services-section/services/cybernetic-postliberalism-services-section/content/text/documents/articles/notes/overview.md) says its own corpus "cannot run ... from inside its own vocabulary." The S5 criterion in the [viable-system note](2026-10-08-note-on-the-pool-as-a-viable-system.md) is the reason the number matters; this note makes it a number.

The note cites no outside research row. Every claim about the incumbents' fee schedules is left to the procedure, which collects them first-party with dates. No incumbent figure appears here.

## The criterion, quoted

The overview ("Rigor and open problems") states the test the measurement must serve:

> A californicated practice returns its output to the individual as improved coping. A practice that breaks the loop exports its output as a *transferable* reduction in someone else's interpretive cost — a pattern which, once named, lets another reader skip the parsing rather than perform it more elegantly. That criterion is empirical and it cuts against the corpus as easily as for it: if readers do more interpretive work about governance after reading this than before, the corpus is californicated and should say so of itself.

Two requirements follow. The measure counts interpretive work, not satisfaction, because coping is what a californicated practice improves. And it must show a *transfer*: the reduction has to appear for someone other than the person the practice was designed around. The procedure below has a step for each.

## Definitions

**Question.** A decision or fact a member must resolve before an instrument will do what they want, that the instrument's own record does not resolve for them. "How much of my yield do I route, and up to what cap per cycle?" is a question. "What is my sleeve's address?" is not, because the factory resolves it from the owner. A question is counted once per distinct content, not once per time it is asked; a question the member answers the same way every cycle by a stored default counts once at setup and zero afterward.

**Settled row.** One entry in the pool's record that reached a determinate end in the cycle under measurement: a draw with status `Matched` or `LateMatched`, a distribution claimed, a clearing edge reduced to zero, a reseed grant executed, a question that reached `Consensus`. A row that is held (⊤) or still open is not settled and is counted separately.

**Interpretive load per settled row, L.** For one member and one cycle, the number of distinct questions the member answered, divided by the settled rows that member has in the cycle. For an instrument, L is the mean over members. Reported with the question count and row count it came from, never as a ratio alone: a member with one question and one row and a member with ten and ten share L = 1 and are not alike.

**Load before and after.** *Before* is the set of questions the member answered to do the same job through whatever they used previously. *After* is the set answered through the instrument. The comparison is within member, on the same job: obtaining a short advance, holding principal against a known obligation, getting a share of a pooled return.

## Step 1: inventory what a member must parse

For each instrument in the deployed set, list every member-callable entry point (those whose `msg.sender` must be the member or the member's sleeve) and every named refusal the member can meet. The sources are the Appendix A interfaces and the SDK. For each entry point write the questions it asks, in the form of a closed catalog: a numbered list in `ops/interpretive-load/question-catalog.json` (written by the generating script, not by hand) with fields `id`, `instrument`, `entryPoint`, `text`, `defaultable` (true if a charter or stored default answers it). The initial inventory the specification supports:

| Instrument | Questions the specification makes a member answer |
|---|---|
| Sleeve (A1) | routing share (`bps`), cap per cycle, routing mode, barrier level, stage |
| Tally credit (A3) | amount, due date, repayment instrument, release site; at v0.1 the price is 0 and fixed, so it is no question |
| Barrier (A6) | kind, due date, amount, whether to post the bond |
| Consensus by withdrawal (A4) | assent, object (with an alternative formula id), withdraw, rejoin |
| Reseed (B4) | whether to claim, and the declared obligation behind it |
| Clearinghouse (B1) | whether to open an edge, whether to admit one |

This table is an inventory from the specification, not a measurement. The operations task replaces it with the generated catalog, adding questions raised by refusals: `Held(cell)`, `HiveFloatShort`, `Replayed(nonce)` and every other named error a member can see each add the question "what must I do now?" unless the error carries its datum and the SDK shows the next action.

## Step 2: measure after, on chain and by asking

Two measurements run together because each covers the other's blind spot.

**2a. From the record (no survey).** For every member and cycle, from chain events and the reconciler's cell list, compute: distinct entry points called; calls that reverted with a named error; distinct cells the member told as witness; distinct cells about the member that were ⊤ at cycle close; and elapsed time from the member's first call to its first settled row. These are proxies for the catalog count. They are exact, cheap and blind to anything done off chain (reading documentation, asking another member).

**2b. From the member (catalog check).** At cycle close show each member who used an instrument the catalog entries for it and ask, for each, "did you have to decide this?" with three answers: decided, defaulted, did not arise. Add two free-text lines, "what did you not understand" and "who did you ask", each coded afterward into new catalog entries. Counting "decided" gives the question count Q for L. The questionnaire is fixed before the cycle opens and not changed within a measurement.

A member's L for the cycle is Q_decided ÷ settled rows. The record proxies must correlate with Q_decided at ρ ≥ 0.6 across members for the proxies to be used alone in later cycles; below that, 2b stays in.

## Step 3: measure before

At admission, before the member's first call, ask for the previous means of the same three jobs and the question catalog for it in the same form: a short advance, a store against an obligation, a share of a pooled return. A member with no previous means for a job records "none", and that job is excluded from the paired comparison rather than scored zero. Where the member's previous means was a fee-bearing product, attach the product's fee schedule and dispute process (Step 4).

## Step 4: the incumbents' schedules and dispute flows

For each previous means a member names, and for the incumbents the pool is compared to on the specification's list, the operations task collects from the provider's own current documents, with the date read:

1. **Fee schedule load.** The count of distinct fee line items, the count of conditions that change a fee, and the count of rate or term changes the provider may make without the member's consent. Each is a question the member must resolve before knowing what an action costs.
2. **Dispute flow load.** The number of steps, parties and documents from "I think this charge is wrong" to a determinate end, and whether the end can be the member losing the money with no stated reason.
3. **Time to a determinate end.** Days from the first dispute step to the end.

The pool's counterparts are counted the same way: fee line items (v0.1: the draw price is fixed at 0 for person draws and the keeper bounty is capped, so the count is the number of fees the member can be charged, which the charter states); conditions that change a fee (charter parameters, adopted before the cycle); consents needed for a change (every parameter change is an A4 question); and dispute flow (the §2.8 challenge or the daimon path for a contested cell). No incumbent's number is stated in this note. A comparison that cites an incumbent without its document and read-date is not valid.

## Step 5: the ship-rule test

An instrument passes if, across the members who used it in the measured cycle:

1. **Paired load falls.** For members with a "before" for the same job, L_after ≤ L_before, tested with the exact sign test on the within-member difference (a tie counts for neither side). With the small cohorts a pool has, the test has power only for a large effect, so a pass on the sign test with n < 8 is recorded as *not contradicted*, not as established.
2. **The pool's schedule is lighter.** The pool's fee-line and dispute-step counts do not exceed the lowest of the incumbent counts collected in Step 4.
3. **The reduction transfers.** The second-cohort check below is satisfied.
4. **Held rows do not hide the load.** The share of rows held (⊤) at close is reported with L. A low L bought by leaving rows unsettled is not a pass.

An instrument that fails any item is reported to the specification's S5 channel as a ship-rule breach: the worklist entry in v0.2, a question to the members in v0.1.

### The transfer check

The overview's criterion needs a reduction that reaches someone other than the original beneficiary. For each instrument, admit a second cohort (members who joined after the first cycle, at least three) who see only the published documentation and the SDK, not the first cohort's help. Compute L for them in their first cycle. The reduction transfers if second-cohort L ≤ first-cohort L in its first cycle, and second-cohort questions asked of other members (2b free-text "who did you ask") number no more than the first cohort's. If L falls for the first cohort but not the second, the gain was coping and tacit help, not an exported pattern.

## The prediction

A californicated instrument raises the count. The mechanism is the overview's: it converts structure into something a member manages. Concretely, an instrument that adds any of the following will show a higher Q than its plain form, for the same settled rows:

- a score, tier or status the member must interpret or improve (a creditworthiness number, a "health" rating) rather than a record they can read;
- discretionary outcomes decided without a stated rule, which leave the member asking why;
- notifications, nudges or encouragement the member must decide whether to heed;
- a dashboard summary that replaces the underlying cells where the member must reconcile the two.

The prediction is falsifiable in both directions. If an instrument with these additions shows lower Q and higher stated satisfaction, the count is measuring comfort and the design is wrong. If a plain instrument shows a high Q, the count has found real load the specification missed and the instrument fails its own rule. The measurement should be run once on a deliberately californicated variant of one instrument (a test deployment with a risk score added to the draw flow) to show it separates the two. If it does not separate, the procedure is not a valid test of the criterion and the ship rule has no unit.

## Output the operations task owes

1. `question-catalog.json` (generated) and the two questionnaires, with the version used.
2. A table per instrument: members, Q, settled rows, L, the held share, the before pairs, the sign-test result.
3. The incumbent table: provider, product, each count, document URL, date read.
4. The second-cohort result and the californicated-variant result.
5. A one-line verdict per instrument: pass, fail, or not contradicted at this n, with the item that decided it.

## What this note leaves open

1. The interpretive-debt problem in the sociology corpus asks where the load goes: transferred or dissipated. This measurement counts load at the member; it does not identify a sink. The transfer check tests one direction only, to later members. Whether the pool moves load onto its keepers, its patrons or its operators needs a count of *their* questions, which the procedure does not yet include and should as the pool grows (the keeper and operator catalogs follow the same form).
2. A question's cost varies with who answers it. The count treats all questions as equal, which understates the load of a legal or tax question next to a routing percentage. A weighting is not defined here; the first run should report the unweighted count and the free-text lines that would justify weights.
3. The threshold of 8 members for a conclusion is a placeholder. The first run sets the real sample sizes.
