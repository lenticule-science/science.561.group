---
id: 861d8401-0ff1-4674-9ac2-ef7946603653
name: attention
date-created: 2025-10-18
date-modified: 2026-10-09
description: "Attention (ATT) is the finite budget a bounded agent spends, once and irreversibly, to reconcile obstructions; it is denominated in wits, it is not a coin beside WIT and ACK, and attending to an acknowledgement is a wit taken of an ACK."
identity: attention
provenance:
  domain: economy
  scheme: distinction-denomination
  authors:
    - Claude Sonnet
  sources:
    - "Leader, 2026-10-09: WIT, ACK and ATT are not meant to be ambiguous; ATT is attention and there is meant to be good theory on it."
    - "Operator, 2026-07-13 (exchange thread, line 45): the whole session's work is attention economics; attention is the scarce resource reconciliation spends."
    - "Leader, 2026-09-04 (acknowledgement-beside-wit note, lines 211-218): the three economies named in one breath, witness, acknowledgement, attention."
relations:
  requires:
    - wit
  uses:
    - tally
    - attention-worklist
    - attention-economy
---
**Attention** (ATT) is the finite budget a bounded agent spends to reconcile
obstructions. The budget is spent once and cannot be refunded. What it buys is
the removal of held contradiction. ATT is not an abbreviation with several
readings; it is attention, and the house holds a proved theory of it.

## The theory

**1. Attention is the scarce resource that reconciliation spends.** The operator
stated it on 2026-07-13: "Attention = the scarce resource reconciliation spends"
(thread:45). The 2026-09-03 field note states the same in plain words: "Attention
is which obstructions the organism can afford to discharge" (field:260-261).

**2. The structure is an allocation under an irreversible budget.** A bounded
agent holds a budget `B` and a list of obstructions, each with a reconciliation
cost (its certificate size or settling flux) and a benefit (the held-`⊤` it
removes) (AA:6-12, 33-42). Four laws are proved (AA:66-123, `attention_allocation`):

- the empty selection is feasible and leaves the maximal residual;
- spend is monotone, so selecting an obstruction never lowers total cost
  (`cost_monotone_cons`), which is the irreversibility of a jump;
- feasibility is downward closed (`feasible_of_cons`);
- residual is antitone in captured benefit (`residual_antitone`), so the optimum
  is the feasible selection of maximum benefit.

The solver returns that optimum (AS:1-20). A left fold and a right fold reach the
same optimal value, and on a benefit tie they keep opposite beads: "the optimum is
chirality-invariant; the choice is not" (AS:14-17). Attention allocation is the
demand side of reconciliation; the currency cocone prices the cost side (AA:6-9), and the light cone makes it more than a free knapsack (AA:14-20).

**3. The budget is the seed's free energy.** At the closing step the free energy
splits as the reversible spend `commits + mints` plus the irreversible spend
`2·jumps` (`budget_splits`, FEL:1109-1137). Both spends are bounded by the seed
energy, and the irreversible spend exhausts it exactly when no reversible spend
occurs (`irreversible_within_budget`, FEL:1139-1150). The ledger counts "energy
discharged equals knowledge gained, unit for unit" (FEL:470-473).

**4. The budget is denominated in wits.** A wit is one witnessed distinction-step
in the FOUR knowledge order: bottom to true, bottom to false, a determinate value
to both (WIT:17-19). The ledger counts three steps of exactly that shape: a
commitment takes `⊥ₖ` to a truth pole, a mint takes a truth pole to `⊤ₖ`, and a
jump takes `⊥ₖ` straight to `⊤ₖ`, "worth two units" (FEL:473-478, 544-553). One
unit of flux is therefore one wit, and a jump is two wits taken in one cell.
Attention is spent in the same unit the wit names. ATT is not a second currency.
The ACK note states the same conclusion from the other side: "Attention is not a
fourth currency" (ACK:290-297).

**5. ACK is the other party's recognition.** An acknowledgement is minted only at a
border, by a party other than the asserter. Tally's admission half is held by the
counterparty, and "transfer settles when the halves match" (TALLY:17-21). An ACK
records recognition and not resolution: "acknowledgement does not promise to clear
the contradiction; it promises to record that it is recognised" (ACK:312-327).

**6. How WIT, ACK and ATT relate.** WIT is the maker's move, one distinction-step
counted at the asserted stratum. ACK is the border act of a second party that
takes the asserted step into its own record. ATT is the budget the knowing face
spends in reading the playing face's section, so attending to an acknowledgement
is a wit taken of an ACK (ACK:250-262). The three are one spiral: witness, then
acknowledgement, then the witnessing of that acknowledgement, each turn the same
move one level up. An acknowledgement of attention is the next turn's witness
(ACK:299-308). Settlement is regime-restricted and never absolute: TCP stops at
ESTABLISHED after three messages, and the work rail stops at `H*` once cited
evidence closes under `verifyProofClosure` (ACK:264-280, 299-308).

**7. The three meet in operation.** The attention worklist of a Tidepool pool
selects, under the cycle's budget, the held contradictions and the half-tallies
older than the settlement window (WORKLIST:11). A half-tally is a release with no
matching admission, that is, a WIT with no ACK. It is an obstruction that demands
ATT. The Group's ringleader does the same at the scale of the enterprise: it
"routes finite, irreversibly consumed attention toward reconciliation that removes
an observed obstruction to the enterprise's declared trajectory" (WQ:22-24).

**8. The Group's own attention has five forms**, priced differently: the founder's
hands, collaborators' hands, frontier sessions, commissioned lots, production
machinery (GROUP:39-61). The allocation law above applies to each.

## Attention and the attention economy

The **attention economy** is a distinct external order in which a person's
attention is the scarce resource that a third party pays for (ECON:22-24, after
Simon 1971 and Goldhaber 1997). ATT is the internal budget of a reconciling agent.
The attention economy sells human attention at a border; ATT is spent inside a
settlement's own ledger. The two meet where the Group's attention is invested
across its economies (GROUP:39-61).

## Readings the house holds beside the theory

- **Attention as simulated time.** Compute spent buys access to more of an agent's
  future light cone before the calendar delivers it. The note states the claim as
  "not yet proved anywhere in the vault" (SIM:18-19). The proved base is item 2.
- **Attention as heat.** For a transformer, attention is one step of modern
  Hopfield energy descent, literal by equation; that a physical inverse
  temperature is dissipated, and that attention weights form a spin glass with
  holonomy, are overreach (THERMO:36-60, 164-182).

## Where the house disagrees with itself

Each reading, and the one the Leader's statements select, is stated in the note
[2026-10-09-note-on-wit-ack-and-att](../../../../../../../social-science-services-section/services/economics-and-business-science-services-section/services/monetary-economics-science-services-section/content/text/documents/articles/notes/2026/10/09/2026-10-09-note-on-wit-ack-and-att.md).

## Carriers

Paths are relative to `lib/emsenn/services/561-group/services/`; line numbers are
those of the files as of 2026-10-09.

- WIT: `science-services-section/services/social-science-services-section/services/economics-and-business-science-services-section/services/monetary-economics-science-services-section/content/text/glossary/terms/wit.md`
- TALLY: same directory, `tally.md`
- ACK: same section, `content/text/documents/articles/notes/2026/09/04/2026-09-04-note-on-acknowledgement-beside-wit.md`
- AA, AS: `science-services-section/services/social-science-services-section/services/economics-and-business-science-services-section/services/economics-science-services-section/lib/obsmetrologia-economics/ObsmetrologiaEconomics/AttentionAllocation.lean` and `AllocationSolver.lean`
- WORKLIST: same economics section, `content/text/glossary/terms/attention-worklist.md`
- ECON: same economics section, `services/participation-economy-science-services-section/content/text/glossary/terms/attention-economy.md`
- FEL: `science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Dynamics/Flow/FreeEnergyLyapunov.lean`
- THREAD: same obsmetrological section, `content/text/documents/articles/notes/2026/07/11/2026-07-11-research-on-infomaterial-top-h1-exchange-thread.md`
- FIELD, GROUP, WQ: `561-group-services-section/content/text/documents/articles/notes/2026/` at `09/03/2026-09-03-note-on-the-561-group-as-a-witnessed-field.md`, `09/06/2026-09-06-note-on-investing-the-group-s-attention-across-its-economies.md`, `08/12/2026-08-12-note-on-wang-qiong-attention-and-canal-routing.md`
- SIM: `science-services-section/content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-attention-as-simulated-time.md`
- THERMO: `science-services-section/services/information-science-services-section/services/semiotics-science-services-section/services/biomimetic-semiotics-science-services-section/content/text/documents/articles/notes/2026/08/26/2026-08-26-note-on-attention-thermodynamics-audited.md`
