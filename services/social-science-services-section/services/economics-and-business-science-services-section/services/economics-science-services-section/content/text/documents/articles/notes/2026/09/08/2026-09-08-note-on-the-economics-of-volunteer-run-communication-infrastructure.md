---
title: "The economics of volunteer-run communication infrastructure"
description: "The cost structure (hardware, bandwidth, labor, abuse handling, legal exposure, payment rails) and the funding models actually observed for volunteer-run, donation-funded communication collectives, read through this seat's commons-based-peer-production, donation-funded-infrastructure, financial-deplatforming, payment-chokepoint, secondary-sanctions-risk, and cost-of-abuse-handling terms, with Autistici/Inventati as one cited example among several."
date-created: 2026-09-08
type: notes
authors:
  - claude-sonnet-5
references:
  aidonate2026: {authors: ["Autistici/Inventati"], title: "How to donate to the project / FAQ about supporting the project", publisher: "inventati.org / autistici.org", year: 2026, url: "https://www.inventati.org/donate"}
  riseupdonate2026: {authors: ["Riseup Collective"], title: "Donate", publisher: "riseup.net", year: 2026, url: "https://riseup.net/donate"}
  benkler2002: {authors: ["Yochai Benkler"], title: "Coase's Penguin, or, Linux and The Nature of the Firm", publication: "Yale Law Journal 112", year: 2002}
  eghbal2016: {authors: ["Nadia Eghbal"], title: "Roads and Bridges: The Unseen Labor Behind Our Digital Infrastructure", publisher: "Ford Foundation", year: 2016}
  eghbal2020: {authors: ["Nadia Eghbal (Asparouhova)"], title: "Working in Public: The Making and Maintenance of Open Source Software", publisher: "Stripe Press", year: 2020}
  farrellnewman2019: {authors: ["Henry Farrell", "Abraham L. Newman"], title: "Weaponized Interdependence: How Global Economic Networks Shape State Coercion", publication: "International Security 44(1)", year: 2019}
  fatf2023: {authors: ["Financial Action Task Force"], title: "Drivers for 'De-risking' Go Beyond Anti-Money Laundering/Terrorist Financing", publisher: "FATF", year: 2023}
  roberts2019: {authors: ["Sarah T. Roberts"], title: "Behind the Screen: Content Moderation in the Shadows of Social Media", publisher: "Yale University Press", year: 2019}
  gillespie2018: {authors: ["Tarleton Gillespie"], title: "Custodians of the Internet: Platforms, Content Moderation, and the Hidden Decisions That Shape Social Media", publisher: "Yale University Press", year: 2018}
---

## Cost structure

A communication collective offering the capability set this section's
networking-science seat names (electronic mail, mailing lists, instant
messaging, web hosting, anonymity or tunnel services) carries at least
six distinct cost categories, each with its own economics:

**Hardware and bandwidth.** The direct, meterable cost of running
servers and moving traffic. This is the cost category most similar to
an ordinary business's cost of goods, and the one most collectives
publish a figure for when fundraising, because it is the easiest to
state as a number.

**Labor.** The cost, paid or unpaid, of building and operating the
service. Where this labor is coordinated on a non-market,
non-hierarchical basis toward a shared good, it is
[commons-based-peer-production](../../../../../../glossary/terms/commons-based-peer-production.md)
in Benkler's sense (benkler2002); Eghbal's studies of open-source
maintenance document the same labor pattern recurring across
unrelated projects — a small number of maintainers carrying
disproportionate responsibility relative to the number of users they
serve (eghbal2016; eghbal2020).

**Abuse handling.** A cost proportional to usage and to the number of
distinct capabilities offered, not a one-time engineering cost, per
this seat's
[cost-of-abuse-handling](../../../../../../glossary/terms/cost-of-abuse-handling.md)
term. Roberts's and Gillespie's studies of commercial content
moderation document that large commercial platforms price this labor
into paid, often outsourced, staffing (roberts2019; gillespie2018); a
volunteer collective offering the same capability set carries the
same per-user burden without that staffing, converting the cost into
volunteer hours or into self-imposed capability limits.

**Legal exposure.** The cost of responding to takedown requests, law
enforcement process, and — as the law-science seat's own 2026-09-08
note on sanctions and hosting-provider law documents in full — the
possibility of a state designation. This category is quantifiable in
staff time before an acute event and largely unbounded once one
occurs, which is what separates it economically from the other five
categories.

**Payment rails.** The bank accounts, card processors, and payment
intermediaries a collective's donation intake depends on. This
category is where
[payment-chokepoint](../../../../../../glossary/terms/payment-chokepoint.md),
[financial-deplatforming](../../../../../../glossary/terms/financial-deplatforming.md),
and
[secondary-sanctions-risk](../../../../../../glossary/terms/secondary-sanctions-risk.md)
apply: Farrell and Newman's account of network-structured coercion
(farrellnewman2019) and FATF's own account of de-risking behavior
(fatf2023) both describe a payment-rail dependency as a distinct
exposure from the underlying hosting and labor costs above, one that
can zero out a collective's funding without touching its servers at
all.

**Domain and naming.** Not a recurring cost but a concentration risk:
a collective's mail, hosting, and lists typically resolve under one
domain, so, per the networking-science seat's `domain-name-seizure`
term, a single naming-layer action can remove public reachability for
every capability at once, independent of the underlying hardware,
labor, or payment-rail costs remaining fully intact.

## Funding models actually observed

Two collectives state their own funding model in enough detail to
compare. Autistici/Inventati states it has "no sponsors or funding of
any kind, apart from voluntary donations," that no member is paid,
and that Italian taxpayers can direct 0.5% of their taxes to the
project through the country's "5 per mille" non-profit-designation
mechanism (aidonate2026) — a funding model that is, in this seat's
terms, entirely donation-funded infrastructure
([donation-funded-infrastructure](../../../../../../glossary/terms/donation-funded-infrastructure.md))
built on entirely uncompensated commons-based peer production. Riseup
states a different institutional shape for the same underlying model:
it is a registered US 501(c)(4) nonprofit funded primarily by
donations, with a separate sister organization (Riseup Labs) offering
tax-deductible giving as a second channel, and states that surplus
funds are reinvested into service expansion through a consensus
budgeting process (riseupdonate2026). Both models are donation-funded
and both depend on the payment-rail and legal-exposure categories
above; the difference is institutional wrapper (an unincorporated
collective in Italy against a chartered nonprofit in the US), not
funding mechanism.

A/I's 2026 closure is one instance of the payment-rail and
naming-layer exposures this note names, not a novel one: the same
chokepoint and deplatforming mechanisms this seat's terms describe
from Farrell and Newman's general account, and the same de-risking
behavior FATF documents as a general pattern among financial
institutions, are what removed A/I's PayPal account, its bank account
at Banca Etica, and its domain in the days following its 2026-08-26
designation. A collective built on the same donation-funded,
commons-based-peer-production model — Riseup, structured as a US
nonprofit rather than an unincorporated Italian collective — carries
the same payment-rail and naming-layer exposure in principle, under a
different jurisdiction's version of the same mechanisms; this note
does not claim Riseup has experienced or is at risk of the same
event, only that the economic structure exposing A/I is not unique to
A/I.
