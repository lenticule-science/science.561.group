---
title: "The pool as a priced rotating credit association"
description: "The theory behind Tidepool, read from the literature the house admitted on 2026-09-05: the rotating credit association and its descendants (savings groups, joint-liability lending, crowdstaking) as one lineage; what each contributes and what each leaves unpriced; the house's additions (a draw priced on the record of matched crossings, a barrier that is a time series, two-witness books, a default held rather than punished); the distribution problem a pool of directed yield faces and the four lawful answers to it; and the register used throughout."
date-created: 2026-09-05
type: notes
name: 2026-09-05-note-on-the-pool-as-a-priced-rotating-credit-association
status: draft-for-review
authors:
  - emsenn
  - claude-fable-5-1
keywords:
  - tidepool
  - pool
  - rotating-savings-and-credit-association
  - savings-group
  - social-collateral
  - tally-credit
  - common-pool-resource
  - quadratic-funding
  - prize-linked-savings
  - cooperative
  - emergent-strategy
  - mutual-aid
references:
  besley1993:
    authors: ["Timothy Besley", "Stephen Coate", "Glenn Loury"]
    title: "The Economics of Rotating Savings and Credit Associations"
    publication: "American Economic Review 83(4)"
    year: 1993
  besley1995:
    authors: ["Timothy Besley", "Stephen Coate"]
    title: "Group lending, repayment incentives and social collateral"
    publication: "Journal of Development Economics 46(1)"
    year: 1995
    doi: "10.1016/0304-3878(94)00045-E"
  ghatak1999:
    authors: ["Maitreesh Ghatak", "Timothy W. Guinnane"]
    title: "The economics of lending with joint liability: theory and practice"
    publication: "Journal of Development Economics 60(1)"
    year: 1999
    doi: "10.1016/S0304-3878(99)00041-3"
  ostrom1990:
    authors: ["Elinor Ostrom"]
    title: "Governing the Commons"
    publisher: "Cambridge University Press"
    year: 1990
    doi: "10.1017/CBO9780511807763"
  buterin2019:
    authors: ["Vitalik Buterin", "Zoë Hitzig", "E. Glen Weyl"]
    title: "A Flexible Design for Funding Public Goods"
    publication: "Management Science 65(11)"
    year: 2019
    doi: "10.1287/mnsc.2019.3337"
  kearney2010:
    authors: ["Melissa Schettini Kearney", "Peter Tufano", "Jonathan Guryan", "Erik Hurst"]
    title: "Making Savers Winners: An Overview of Prize-Linked Savings Products"
    publication: "NBER Working Paper 16433"
    year: 2010
    doi: "10.3386/w16433"
  karlan2017:
    authors: ["Dean Karlan", "Beniamino Savonitto", "Bram Thuysbaert", "Christopher Udry"]
    title: "Impact of savings groups on the lives of the poor"
    publication: "Proceedings of the National Academy of Sciences 114(12)"
    year: 2017
    doi: "10.1073/pnas.1611520114"
  hansmann1996:
    authors: ["Henry Hansmann"]
    title: "The Ownership of Enterprise"
    publisher: "Belknap Press of Harvard University Press"
    year: 1996
  brown2017:
    authors: ["adrienne maree brown"]
    title: "Emergent Strategy: Shaping Change, Changing Worlds"
    publisher: "AK Press"
    year: 2017
  spade2020:
    authors: ["Dean Spade"]
    title: "Mutual Aid: Building Solidarity During This Crisis (and the Next)"
    publisher: "Verso"
    year: 2020
---

# The pool as a priced rotating credit association

Written on Settlerday, 2026-09-05, for a product intended to meet and then
beat what Breadchain Cooperative does and offers, for
the United States named Tidepool, and to make the science sections richer than
any session's context. This note is the theory that order rests on. Every
outside claim is cited to a bibliography carrier the house admitted the same
day; every house claim is cited to its carrier; what is this note's own reading
is marked as such.

## 1. One lineage

The instrument has been reinvented many times and the house's version is one
more. Read in order:

| form | what it adds | what it leaves unpriced |
|---|---|---|
| [rotating savings and credit association](../../../../../../glossary/terms/rotating-savings-and-credit-association.md) | value from timing alone: every member but the last gets an indivisible good sooner than by saving alone, and none later ([Besley 1993](../../../../bibliographies/besley1993.md)) | default (enforcement left to social sanction outside the model); need that differs in kind between members |
| [savings group](../../../../../../glossary/terms/savings-group.md) | accumulation, a written ledger, lending at interest, a social fund, share-out by savings; measured to raise savings, credit access, and resilience with small income effects ([Karlan 2017](../../../../bibliographies/karlan2017.md)) | the draw limit (set by meeting consensus); a barrier that moves |
| [joint-liability lending](../../../../../../glossary/terms/joint-liability-lending.md) | an outside lender's capital secured by [social collateral](../../../../../../glossary/terms/social-collateral.md): the group selects, monitors, verifies, and enforces ([Ghatak 1999](../../../../bibliographies/ghatak1999.md)) | the strength of the sanction, exogenous in the model ([Besley 1995](../../../../bibliographies/besley1995.md)); contagion of default across the group |
| crowdstaking (Breadchain's form; measured today in the public financial section's record) | members hold a dollar token, its yield goes to a pool, the pool is split among member projects by a fixed share and a voted share | this note's reading, pending the record: the token itself is an issuance the United States restricts, and the split has no efficiency argument |

Each form keeps what the one before it found and prices one more thing. The
house's version prices the draw.

## 2. What the house adds

Four things, each already a house carrier:

1. **The draw is priced on the record of circulation.** A member's line is
   [tally credit](../../../../../../../../../monetary-economics-science-services-section/content/text/glossary/terms/tally-credit.md):
   a function of their matched tallies, the release and admission receipts
   that agree on each past crossing, never of the balance they hold. The
   group-lending literature established that a borrower's relations secure
   credit and that peers' observation is an asset, and it left the strength
   of the sanction outside the model; the tally record is that strength made
   legible, so the risk need not be moved onto anyone. The contextuality
   reading behind it (booked value capped at 2 on the pentagon, circulating
   value √5) is in the 2026-09-04 nesting note beside the science root and in
   `Obsmetrologia/QuantumContextuality/KCBS.lean`.
2. **The barrier is a time series.** The pool is a sleeve with its own
   absorbing barrier, below which it can no longer re-seed anyone, and that
   barrier rises with correlated hazard (the sizing note of 2026-09-04,
   section 5, in this section's notes). No form in the table carries a
   moving barrier; the savings group's social fund is a fixed reserve.
3. **Two witnesses.** Every draw and settlement is booked in the member's
   ledger and the pool's, and reconciled as agreed, mismatch, posted-only,
   asserted-only, or inactive. A pool whose books are not true is a bank with
   extra steps.
4. **A default is held, not punished.** Both witnesses are recorded, the line
   closes, the unmatched half stays on the worklist, and the next limit is
   computed from the record including the default. This keeps the social
   collateral without the contagion joint liability transmits through a
   defaulter's peers, at the cost of the peer pressure Ghatak and Guinnane
   count as enforcement; whether that trade holds is the instrument's
   falsifier (a default rate above balance-secured lines of the same size).

This note's reading: the four additions are what makes the house pool an
engineered instrument rather than a re-enactment; the first is the one nobody
lending against balances can copy.

## 3. The distribution problem

A pool that receives its members' directed yield must decide each cycle what
the yield buys. Four answers are lawful and the house has carriers for each:

- **Reserve.** The barrier series says how much must stay; below it the pool
  cannot re-seed anyone. This comes first and is not a choice.
- **Float capacity.** Tally-credit draws need a standing fund; the yield that
  funds it is the pool's income on the [poverty premium](../../../../../../../../../finance-science-services-section/content/text/glossary/terms/poverty-premium.md),
  the fee a member would otherwise have paid.
- **Distribution to member enterprises.** Breadchain's fixed-equal plus
  vote-weighted split is the reference; [quadratic funding](../../../../../../glossary/terms/quadratic-funding.md)
  is the split with an efficiency argument ([Buterin 2019](../../../../bibliographies/buterin2019.md)),
  and it requires exactly the bounded membership the pool already keeps,
  because one person under many names captures it.
- **A prize among members.** [Prize-linked savings](../../../../../../../../../finance-science-services-section/content/text/glossary/terms/prize-linked-savings.md)
  draws deposits from people who do not otherwise save
  ([Kearney 2010](../../../../../../../../../finance-science-services-section/content/text/documents/articles/bibliographies/kearney2010.md));
  the on-chain form is the no-loss prize pool.

The pot is a [common-pool resource](../../../../../../glossary/terms/common-pool-resource.md),
and Ostrom's eight principles are the checklist its governance is measured
against ([Ostrom 1990](../../../../bibliographies/ostrom1990.md)): bounded
membership, rules fit to conditions, member-made rules, accountable
monitoring, graduated sanctions, cheap dispute resolution, recognized
autonomy, nesting. The open item is the fifth: whether a default held as a
recorded contradiction can stand in for graduated sanctions. The form that
holds the pot is a [cooperative](../../../../../../../../../business-science-services-section/content/text/glossary/terms/cooperative.md),
and Hansmann's condition applies: the members must want the same thing from
it, or the cost of deciding together exceeds the cost of an outside owner
([Hansmann 1996](../../../../../../../../../business-science-services-section/content/text/documents/articles/bibliographies/hansmann1996.md)).
What the members receive is a [patronage dividend](../../../../../../../../../business-science-services-section/content/text/glossary/terms/patronage-dividend.md)
if they are patrons; whether member enterprises are patrons is the question
the membership rule answers before the distribution rule can be lawful.

## 4. The register

The register is
[emergent strategy](../../../../../../../../../../../sociology-science-services-section/content/text/glossary/terms/emergent-strategy.md)
and post-2020 [mutual aid](../../../../../../../../../../../../content/text/glossary/terms/mutual-aid.md),
not any labeled program, readable by people in both worlds and mostly the
first, and it changes the theory and the prose, not the mechanism. Read in
that register the mechanism already fits: small is all is one draw, one
crossing, at the scale the ledger keeps ([brown 2017](../../../../../../../../../../../sociology-science-services-section/content/text/documents/articles/bibliographies/brown2017.md));
move at the speed of trust is the tally record, trust made measurable one
matched pair at a time; the members are the fund, so the pool is
participation and not charity, meets a need directly, and builds a shared
record of why the need exists, which is Spade's definition read off a ledger
([Spade 2020](../../../../../../../../../../../sociology-science-services-section/content/text/documents/articles/bibliographies/spade2020.md)).
The mechanism stays bound by finance and law; the register is how members
meet it.

## 5. The United States difference

Breadchain mints a redeemable dollar token and routes its yield. This note's
reading, to be settled by the economic specification of the same day in the
finance operations section: the house issues no token and holds no
principal; a member's position stays in their own account or wallet,
redeemable by them alone, and only the yield stream moves under the member's
standing instruction. That keeps the instrument outside stablecoin issuance
and money transmission and leaves the pool exactly the lineage's oldest
shape, a fund of what members chose to put in common, with the draw priced.

## 6. What would show this is wrong

- Tally-secured lines default at a higher rate than balance-secured lines of
  the same size on the same market: circulation is not creditworthiness.
- Member participation in the cycle vote falls below the quorum the
  governance specification sets: the pot is a commons nobody governs.
- The yield rate measured today, times any pool size the membership can
  reach, is below the operating cost of the cycle: the pool is a ledger with
  nothing to distribute.
- A legal reading of the routing that makes it money transmission: the
  instrument is not lawful in the shape this note assumes.
