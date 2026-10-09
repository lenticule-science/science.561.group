---
title: "The service portfolio of a radical server collective"
description: "What Autistici/Inventati, Riseup, Nadir, Espiv, and NoBlogs actually list as their own services, fetched from each collective's first-party pages, generalized into the capability classes this section's glossary names, against the occasion of A/I's 2026 closure."
date-created: 2026-09-08
type: notes
authors:
  - claude-sonnet-5
references:
  aipress2026:
    authors: ["Autistici/Inventati"]
    title: "Press Release — August 28, 2026"
    publisher: "inventati.org"
    year: 2026
    url: "https://www.inventati.org/campaign/press"
  aiservices2026:
    authors: ["Autistici/Inventati"]
    title: "Which services do A/I provide?"
    publisher: "inventati.org/services"
    year: 2026
    url: "https://www.inventati.org/services"
  statedept2026:
    authors: ["United States Department of State, Office of the Spokesperson"]
    title: "Designation of Autistici/Inventati as a Specially Designated Global Terrorist"
    publisher: "U.S. Department of State"
    year: 2026
    url: "https://www.state.gov/releases/office-of-the-spokesperson/2026/08/designation-of-autistici-inventati-as-a-specially-designated-global-terrorist"
    note: "fetched only as WebSearch snippets; cited as such, not as a directly retrieved primary text"
  ofac2026:
    authors: ["Office of Foreign Assets Control, US Department of the Treasury"]
    title: "Counter Terrorism Designations; Issuance of Counter Terrorism General License 36"
    publisher: "US Department of the Treasury"
    year: 2026
    url: "https://ofac.treasury.gov/recent-actions/20260826"
  riseupabout2026:
    authors: ["Riseup Collective"]
    title: "About Us"
    publisher: "riseup.net"
    year: 2026
    url: "https://riseup.net/en/about-us"
  nadir2026:
    authors: ["Nadir"]
    title: "nadir.org"
    publisher: "nadir.org"
    year: 2026
    url: "https://www.nadir.org/"
  espiv2026:
    authors: ["Espiv Collective"]
    title: "espiv.net"
    publisher: "espiv.net"
    year: 2026
    url: "https://www.espiv.net/"
  noblogs2026:
    authors: ["Autistici/Inventati"]
    title: "noblogs.org"
    publisher: "noblogs.org"
    year: 2026
    url: "https://www.noblogs.org/"
---

## The occasion

On 2026-08-26 the US State Department, acting with Treasury's Office of
Foreign Assets Control under Executive Order 13224, designated
Autistici/Inventati (A/I), an Italian volunteer collective operating
since 2001, a Specially Designated Global Terrorist, alleging the
collective provides digital infrastructure to designated
organizations ([statedept2026](https://www.state.gov/releases/office-of-the-spokesperson/2026/08/designation-of-autistici-inventati-as-a-specially-designated-global-terrorist);
unverified beyond the WebSearch snippet cited, the underlying press
release page having returned an error to direct fetch). A/I's own
press release rejects the designation and states its activities
"consist in providing tools for digital self-defence and
infrastructure for the freedom of communication," not material support
for terrorism ([aipress2026](https://www.inventati.org/campaign/press)).
PayPal suspended A/I's account 2026-08-27; the autistici.org domain
entered `serverHold` and stopped resolving around 2026-08-28, which
A/I attributes to the Public Interest Registry managing the `.org`
top-level domain, without a public confirmation from PIR that it acted
on an OFAC order specifically (aipress2026 — this attribution is A/I's
own statement, not independently confirmed here); Banca Etica
suspended A/I's account 2026-09-01, citing secondary-sanctions
exposure. OFAC issued General License 36 authorizing a wind-down of
transactions with A/I through 2026-09-25 ([ofac2026](https://ofac.treasury.gov/recent-actions/20260826)).
On 2026-09-06, eleven days after the designation, A/I announced it
would close rather than attempt to continue operating under the
sanction.

## Five collectives, read from their own pages

Five collectives offering a broadly similar capability set to a
broadly similar demographic — activists, movements, and individuals
wanting communication infrastructure outside commercial platforms —
were checked against their own first-party service pages on
2026-09-08.

**Autistici/Inventati** states its own service list as seven
categories: Email, Blogs, Mailing lists and Newsletters, Web Hosting,
Instant Messaging and Chat, Videoconference, and Anonymity Services
([aiservices2026](https://www.inventati.org/services)). NoBlogs.org,
the blog-hosting platform A/I runs, is a separate branded surface for
one of those seven categories ([noblogs2026](https://www.noblogs.org/)).

**Riseup** (US-based, operating since 1999) lists, under its "about
us" page: email ("Red accounts," at mail.riseup.net), a VPN ("Black
accounts"), mailing lists (lists.riseup.net), collaborative document
editing (Pad, at pad.riseup.net), file hosting (Share, at
share.riseup.net), and group collaboration tooling (Groups, at
we.riseup.net) ([riseupabout2026](https://riseup.net/en/about-us)).

**Nadir** (German-language, oriented to left-wing history and
publishing) lists a Jitsi-based videoconferencing platform (currently
password-gated), an online archive of left political history, and
hosting for periodicals, campaigns, and long-term political
initiatives, describing itself as a "cross-current publication
platform, communication structure, and information system for the
radical left" ([nadir2026](https://www.nadir.org/)).

**Espiv** (Greek collective) lists webmail (Roundcube-based, at
mail.espiv.net), file upload/storage (files.espiv.net), blog hosting
(Espivblogs), mailing lists, and onion services for its own
infrastructure, describing its offer as κινηματικές υποδομές
("movement infrastructure") ([espiv2026](https://www.espiv.net/)).

## Generalized into this section's capability classes

No collective's own page names its offer in this section's science
vocabulary, and none should be expected to — a first-party service
page addresses a prospective user, not a taxonomy. Reading the five
lists together, every named service falls into one of the classes this
section's glossary already terms:

- **Email** (A/I, Riseup, Espiv) is
  [electronic-mail](../../../../../../glossary/terms/electronic-mail.md);
  the "Newsletters" A/I lists alongside mailing lists, and the list
  services Riseup and Espiv each run, are
  [mailing-list](../../../../../../glossary/terms/mailing-list.md). Every
  operator running mail for members is, in RFC 5598's terms, one
  Administrative Management Domain, and its
  [email-deliverability](../../../../../../glossary/terms/email-deliverability.md)
  and [email-metadata](../../../../../../glossary/terms/email-metadata.md)
  exposure follow from that role regardless of the collective's size.
- **Instant messaging and chat, and videoconferencing** (A/I's
  "Instant Messaging and Chat" and "Videoconference"; Nadir's Jitsi
  platform) fall under
  [instant-messaging](../../../../../../glossary/terms/instant-messaging.md),
  which this section's own term definition states extends to "voice
  and video" in extended protocols — no collective in this set
  publishes which underlying protocol (XMPP, Matrix, or a bespoke
  Jitsi deployment) each service runs, which is a gap in what a
  first-party page states, not a gap this note can resolve without a
  technical audit of each platform.
- **Web hosting, blogs, file hosting, pads, and initiative/periodical
  hosting** (A/I's Web Hosting and Blogs; Riseup's Pad and Share;
  Nadir's periodika/kampagnen/initiativ hosting; Espiv's Espivblogs
  and file upload; NoBlogs as a dedicated blog-hosting surface) are
  all instances of
  [web-hosting](../../../../../../glossary/terms/web-hosting.md): the
  underlying capability, storing content and serving it over HTTP, is
  one term regardless of whether the collective brands the surface as
  a blog platform, a pad, or a file-share.
- **Anonymity services and onion services** (A/I's "Anonymity
  Services"; Espiv's onion services for its own infrastructure) are
  [onion-service](../../../../../../glossary/terms/onion-service.md); a
  VPN offered as a separate product (Riseup's "Black accounts") is
  [virtual-private-network](../../../../../../glossary/terms/virtual-private-network.md)
  and is, per this section's own term, a distinct capability from an
  onion service rather than an interchangeable one — a collective
  offering both, as Riseup and A/I each effectively do across their
  portfolios, is offering two different guarantees to two different
  threat models, not the same guarantee twice.
- Every capability above generates the same standing operational
  exposure this section's glossary states once and does not restate
  per service: the domain a collective's mail, hosting, and lists all
  resolve under is a single point a
  [domain-name-seizure](../../../../../../glossary/terms/domain-name-seizure.md)
  can remove entirely, as happened to autistici.org; and every
  channel a member can use is a channel a member can misuse, which is
  [abuse-handling](../../../../../../glossary/terms/abuse-handling.md)'s
  standing cost, independent of which collective or which capability
  is under discussion.

A/I is one instance of this capability class, not the class itself:
Riseup, Nadir, and Espiv compose the same small set of house-science
terms — electronic mail, mailing lists, instant messaging, web
hosting, and anonymity or tunnel services — into differently branded
portfolios, at different scales, under different jurisdictions, and
(per the economics seat's 2026-09-08 note) under a funding model each
collective states for itself rather than one this note infers.
