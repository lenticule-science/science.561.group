---
title: "Clearing and Demurrage for a Pool"
description: "What the records hold as prior art for the Tidepool clearinghouse (B1) and for demurrage on idle float and persistent credit (B3): Wörgl, Fisher's stamp scrip, the Chiemgauer and the velocity table of nine complementary currencies; what the mutual-credit record does not yet hold; the open question of the rate; and the statements of Netting.clear_conserves_net and Demurrage.step_conserves."
date-created: 2026-10-08
aliases: []
keywords:
  - tidepool
  - mutual-credit
  - clearing
  - netting
  - demurrage
  - local-currency
  - clearinghouse
teaches:
  - "Clearing and demurrage for a pool"
requires:
  - demurrage
authors:
  - claude-sonnet-5-5
type: notes
name: 2026-10-08-note-on-clearing-and-demurrage-for-a-pool
status: draft
references:
  delarosastodder2015:
    authors:
      - Josep Lluis De La Rosa
      - James Stodder
    title: On velocity in several complementary currencies
    year: 2015
    publication: International Journal of Community Currency Research
    doi: 10.15133/j.ijccr.2015.012
    url: https://doi.org/10.15133/j.ijccr.2015.012
  fareouldahmed2017:
    authors:
      - Marie Fare
      - Pepita Ould Ahmed
    title: Complementary currency systems and their ability to support economic and social changes
    year: 2017
    publication: Development and Change
    doi: 10.1111/dech.12322
    url: https://doi.org/10.1111/dech.12322
  fisher1933:
    authors:
      - Irving Fisher
    title: Stamp Scrip (Chapter III, Stamp Scrip Described)
    year: 1933
    publication: Stamp Scrip
    publisher: Adelphi Company
    url: https://userpage.fu-berlin.de/~roehrigw/fisher/stamp3.html
  ottacher2024:
    authors:
      - Gebhard Ottacher
    title: "Der Welt ein Zeichen geben: Das Freigeldexperiment von Wörgl 1932/33"
    year: 2024
    publisher: Verlag für Sozialökonomie
    url: https://www.silvio-gesell.de/files/luxe/img/Download-Dateien/Ottacher.W%C3%B6rgl.1932-33.korr24.pdf
  september2026:
    authors:
      - Jeremy September
    title: A sustainable miracle? Examining the long-term viability of the Wörgl experiment
    year: 2026
    publication: International Journal of Community Currency Research
    doi: 10.26034/zh.ijccr.2026.9551
    url: https://www.ijccr.net/article/view/9551
  gelleri2009:
    authors:
      - Christian Gelleri
    title: "Chiemgauer Regiomoney: theory and practice of a local currency"
    year: 2009
    publication: International Journal of Community Currency Research
    doi: 10.15133/j.ijccr.2009.006
    url: https://ijccr.net/2012/05/29/chiemgauer-regiomoney-theory-and-practice-of-a-local-currency
  zeller2020:
    authors:
      - Sarah Zeller
    title: Economic advantages of community currencies
    year: 2020
    publication: Journal of Risk and Financial Management
    doi: 10.3390/jrfm13110271
    url: https://doi.org/10.3390/jrfm13110271
  keynes1936:
    authors:
      - John Maynard Keynes
    title: The General Theory of Employment, Interest and Money, chapter 23 section VI
    year: 1936
    publication: The General Theory of Employment, Interest and Money
    url: https://www.marxists.org/reference/subject/economics/keynes/general-theory/ch23.htm
  rehme2024:
    authors:
      - Guenther Rehme
    title: "On rusting money: Silvio Gesell’s Schwundgeld reconsidered, Parts I and II"
    year: 2024
    publication: Review of Economic Analysis
    url: https://doi.org/10.15353/rea.v16i2.4942
---

## What this note is

Task TP-SCI-007 of the cooperative-pooling roadmap. The specification of the Tidepool protocol (dated 2026-10-08) has a clearinghouse (§3 B1, core in v0.1) and, from v0.2, demurrage on the float's idle balance, on unclaimed distributions and on persistent clearinghouse credit, never on a member's holding (§3 B3). This note sets down what the research records hold as prior art for each, states which prior art the records do not yet hold, leaves the rate open, and states the two Lean theorems. Outside claims cite rows of the `demurrage-and-local-currency-evidence` record by their labels.

## State of the evidence

| Record | Rows at this note's date |
|---|---|
| `demurrage-and-local-currency-evidence` | nine rows, nine searches |
| `mutual-credit-and-clearing` | frame only: no rows, no searches |
| `mutual-credit-and-trustline-protocols` (finance-science) | the file does not exist |

The task names Sardex, WIR, Cycles/MTCS and the bancor plan as prior art for B1, and Circles as prior art for B3. The mutual-credit records that would hold them are empty or absent, so this note states nothing about how Sardex, Cycles/MTCS, the bancor plan or Circles work and cites no figure for them. The one WIR figure the records hold is a velocity row in De La Rosa & Stodder 2015, below. The specification's own sentence that Sardex, Credit Commons and Trustlines share "a signed net position per member bounded by a limit pair that straddles zero and a pool-level balance-of-trade account" is the specification's claim, not a record's, and it stays unchecked until the mutual-credit rows are read.

## B1: clearing

### What the records hold

- De La Rosa & Stodder 2015 harmonise nine complementary currencies to 2011 (Bristol Pound and RES Catalonia to 2013) and report velocity and annual turnover. WIR is 2.60 on CHF 1.55 billion, RES 1.89 on 31.76 million. The source's words: "WIR velocity is 2.6 while RES velocity is 1.9 despite being similar currencies." The record notes that the paper also lists blended loans, purely virtual accounts being slower than partly paper currencies, and unregistered members among the explanations of velocity differences, apart from demurrage.
- Fare & Ould Ahmed 2017 is a literature review (abstract read) of the objectives, forms, governance and political connections of complementary currency systems. It gives no clearing figure.
- No row in any record measures multilateral netting of obligations, liquidity saved by clearing, or counter-cyclicality. The frame of the empty record asks for them.

### What the specification does

`ClearinghouseV1` holds member-to-member obligations as edges opened by the debtor and admitted by the creditor. `clear(cycles[])` is permissionless: each cycle must be closed, each edge exists and is admitted, the cycle amount is at most the minimum of the edges' `remaining`, and the reductions apply atomically. Clearing moves no money and the contract has no function that transfers assets; a residual obligation is paid by the debtor's own transfer or stays a tally. A debtor who wants the pool's float takes an ordinary A3 draw in their own name.

### The statement: `Netting.clear_conserves_net`

In module `Obsmetrologia.Economics.Netting` (TP-LEAN-008). Define a party's net position as the sum of `remaining` over edges on which it is creditor minus the sum over edges on which it is debtor. The theorem `Netting.clear_conserves_net` states: for every closed cycle whose `amount` is at most the `remaining` of each of its edges, applying `Netting.clear` leaves every party's net position unchanged. Reason: a closed cycle enters and leaves each party on it equally often, and `clear` lowers each edge on the cycle by the same amount, so each party's creditor-side and debtor-side sums fall by the same total. Its companions, by name:

- `Netting.clear_edge_le`: the cleared edge's `remaining` is not more than before, and the subtraction carries the hypothesis `amount ≤ remaining`.
- `Netting.no_transfer`: clearing is a function on `remaining` only; no balance appears in its type.

The realizer is `ClearinghouseV1.clear`. Because clearing conserves each net position, it changes what is owed on the gross edges and not who is owed in net.

## B3: demurrage

### Prior art the record holds

- **Fisher's stamp scrip.** Fisher 1933 describes 52 weekly dated stamps at 2 cents each; a dollar of scrip returns to the treasury finding the $1.04 that paid for the stamps, so the issue is self-liquidating and redeemed in cash after a year. His speed claim is a design estimate: the average certificate "unloaded" at least twice a week. The tax falls on holding and not on sales: "the stamp is more like a tax on hoarding than a sales tax." The record marks the speed figure as an estimate, not a measured series.
- **Wörgl.** Ottacher 2024 gives the design: notes of 1, 5 and 10 Schilling, 32,000 Schilling initially printed, a charge of 1 percent of face value per month by stamp, redeemable at the municipality for a 2 percent fee. On average ATS 5,490 was in circulation, ATS 1.3 per citizen against ATS 158.76 of Nationalbank money per citizen, and the notes passed through the municipal treasury 36.43 times a year on average. Arrears receipts in the first eight and a half months rose 53.8 percent over the previous year. Wendel's correction puts the unemployment fall at 11 to 16 percent against a 19 percent national rise, not the often-quoted 25 percent. The experiment ended by court and National Bank action in the autumn of 1933. Ottacher 2024 records that no price rise was observed and that the expected interest-rate reduction did not occur because circulation was local. September 2026 finds a data inconsistency in the redemption figures and that acceptance for municipal taxes "served as a major stimulus for their exceptionally rapid circulation"; the paper leaves the long-term viability question largely unanswered. The Tiroler Anzeiger view in Ottacher 2024 is that success needs unemployment, business stagnation and tax arrears together.
- **The Chiemgauer.** Gelleri 2009, an issuer-manager account, gives demurrage of 2 percent per quarter (8 percent per year), euro-backed at 1:1, a 5 percent reconversion fee and 3 percent of purchases to a chosen non-profit. After five years its velocity was three times the euro's; De La Rosa & Stodder 2015 give 11.30 for 2011 and 4.97 times the euro's 2.27. The record notes that Gelleri's estimate that 600,000 euro of turnover was new has no control group.
- **What demurrage does not explain alone.** De La Rosa & Stodder 2015 list other drivers of velocity. Zeller 2020 finds community currencies economically advantageous only where national-currency liquidity is insufficient (Chiemgauer and Sarafu Credit). Keynes 1936 endorses the stamped-money principle and names the obstacle: if currency loses its liquidity premium, "a long series of substitutes would step into their shoes." Rehme 2024 finds in a theoretical model that Gesell's short-run claim holds in a demand-determined equilibrium and that depreciation alone may not benefit the long run.

Circles has no row. Nothing is stated about it.

### What the specification takes

B3 charges demurrage on three things: the float's idle balance, unclaimed distributions older than N cycles, and persistent clearinghouse credit. It never charges a member's holding, and no member balance is rebased; the float's idle balance accrues a holding charge to the reserve through a rebasing index over the float's internal accounting. The Keynes row bears on this boundary. A charge on money that people hold for their own use moves liquidity into substitutes; the specification charges balances the pool itself holds idle and credit that persists, which are not a member's store of value. The records do not test this design. Fisher's tax falls on every holder, and Wörgl and the Chiemgauer charged every holder; the specification charges none of the holders those cases did.

### The open question: what rate

The records give three rates, none for a pool:

| Case | Rate in the record | Source |
|---|---|---|
| Fisher's scrip | 52 stamps of 2 cents, $1.04 per dollar of scrip over a year | Fisher 1933 |
| Wörgl | 1 percent of face value per month, 12 percent per year | Ottacher 2024 |
| Chiemgauer | 2 percent per quarter, 8 percent per year | Gelleri 2009 |

All three charged the money holders used to trade. None charged idle pooled float or credit. The records hold no measurement of what rate on such balances moves an idle balance into use, or at what rate it sends it to a substitute. The specification sets the rate in the charter. This note recommends none; the rate is fixed from a measurement the protocol makes after launch (idle float over time at a series of charter rates) and from the keepers' behaviour.

### The statement: `Demurrage.step_conserves`

In module `Obsmetrologia.Economics.Demurrage` (TP-LEAN-011; the specification lists `step`, `step_conserves`, `index_monotone`). The theorem `Demurrage.step_conserves` states: for an idle balance `b`, a charge `c` computed from the charter rate and the elapsed cycles with the hypothesis `c ≤ b`, one `Demurrage.step` yields idle balance `b − c` and reserve `r + c`, and the sum of idle balance and reserve is the same before and after: `(b − c) + (r + c) = b + r`. The step is defined on idle float, unclaimed distributions and persistent credit only, and the holding of a member is not an argument of `step`. Its companion `Demurrage.index_monotone` states that the index never falls. The realizer is the float's rebasing index. The exact types are the Lean task's to fix, and the statement above is the note's proposal against the specification's description of B3.

## Left open

- Read and record Sardex, WIR, Cycles/MTCS, the bancor plan and the clearing-studies literature into `mutual-credit-and-clearing` and the finance-science trustline record, then revise this note; until then B1's prior art is unchecked.
- Read and record Circles into the `demurrage-and-local-currency-evidence` record.
- The rate (above), and whether a charge on idle float and persistent credit changes keepers' behaviour as a charge on a circulating currency changed holders'.
- The `Netting` theorem is stated for a closed cycle of admitted edges. The case of an edge that is part of two cycles in one `clear` call is the Lean task's to state.
