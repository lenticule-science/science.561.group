---
title: "Why Radical Tech Collectives Persist and Fail"
description: "Synthesizes the sociology, infrastructure-studies, affect-theory, and anarchist-praxis literature on volunteer-run radical tech collectives (email, hosting, and anonymity providers for activist populations) against five cases — Autistici/Inventati, Riseup, Indymedia, Nadir, and Espiv — to state which failure modes the evidence supports (funding exposure, burnout, state repression) and where a founder's diagnosis of 'dogmatic avoidance of technologies' as a cause of collapse is and is not supported by the literature."
date-created: 2026-09-08
type: research-note
in-service-of: lib/emsenn/services/561-group/services/science-services-section/services/philosophy-services-section/services/relationality-services-section/services/agent-science-services-section/services/social-science-services-section/services/sociology-science-services-section/services/critical-theory-science-services-section
name: note-on-why-radical-tech-collectives-persist-and-fail
keywords: [sociology, tech-collective, infrastructure-maintenance, burnout, security-culture, technological-purism, digital-autonomy]
tags: [research]
status: complete
authors: [Claude Sonnet]
references:
  milan2013:
    authors: ["Stefania Milan"]
    title: "Social Movements and Their Technologies: Wiring Social Change"
    publisher: "Palgrave Macmillan"
    year: 2013
  wolfson2014:
    authors: ["Todd Wolfson"]
    title: "Digital Rebellion: The Birth of the Cyber Left"
    publisher: "University of Illinois Press"
    year: 2014
  maxigas2012:
    authors: ["Maxigas"]
    title: "Hacklabs and Hackerspaces: Tracing Two Genealogies"
    publication: "Journal of Peer Production, Issue 2"
    year: 2012
  star1999:
    authors: ["Susan Leigh Star"]
    title: "The Ethnography of Infrastructure"
    publication: "American Behavioral Scientist 43(3), 377-391"
    year: 1999
  russellvinsel2016:
    authors: ["Andrew L. Russell", "Lee Vinsel"]
    title: "Hail the Maintainers"
    publication: "Aeon"
    year: 2016
    url: "https://aeon.co/essays/innovation-is-overvalued-maintenance-often-matters-more"
  puigdelabellacasa2017:
    authors: ["María Puig de la Bellacasa"]
    title: "Matters of Care: Speculative Ethics in More Than Human Worlds"
    publisher: "University of Minnesota Press"
    year: 2017
  redcross2021:
    authors: ["Paola M. Bagnasco", "Elisa Catania", "Michela Zanini", "Giovanni Aleo", "Luca Sasso"]
    title: "Prevalence of burnout syndrome among Italian volunteers of the Red Cross: a cross-sectional study"
    publication: "Industrial Health 59(2), 117-127"
    year: 2021
    url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8010165/"
  fernandesjesus2021:
    authors: ["Maria Fernandes-Jesus", "Guanlan Mao", "Evangelos Ntontis", "Chris Cocking", "Michael McTague", "Anna Schwarz", "Joanna Semlyen", "John Drury"]
    title: "More Than a COVID-19 Response: Sustaining Mutual Aid Groups During and Beyond the Pandemic"
    publication: "Frontiers in Psychology 12, 716202"
    year: 2021
    url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8563598/"
  stallman2002:
    authors: ["Richard M. Stallman"]
    title: "Free Software, Free Society: Selected Essays of Richard M. Stallman"
    publisher: "GNU Press"
    year: 2002
  coleman2013:
    authors: ["E. Gabriella Coleman"]
    title: "Coding Freedom: The Ethics and Aesthetics of Hacking"
    publisher: "Princeton University Press"
    year: 2013
  morozov2013:
    authors: ["Evgeny Morozov"]
    title: "To Save Everything, Click Here: The Folly of Technological Solutionism"
    publisher: "PublicAffairs"
    year: 2013
  mccormickowen2000:
    authors: ["Gordon H. McCormick", "Guillermo Owen"]
    title: "Security and coordination in a clandestine organization"
    publication: "Mathematical and Computer Modelling 31(6-7), 175-192"
    year: 2000
  abusalma2017:
    authors: ["Ruba Abu-Salma", "M. Angela Sasse", "Joseph Bonneau", "Anastasia Danilova", "Alena Naiakshina", "Matthew Smith"]
    title: "Obstacles to the Adoption of Secure Communication Tools"
    publication: "2017 IEEE Symposium on Security and Privacy"
    year: 2017
  giddens1990:
    authors: ["Anthony Giddens"]
    title: "The Consequences of Modernity"
    publisher: "Stanford University Press"
    year: 1990
  gordon2008:
    authors: ["Uri Gordon"]
    title: "Anarchy Alive!: Anti-Authoritarian Politics from Practice to Theory"
    publisher: "Pluto Press"
    year: 2008
  graeber2004:
    authors: ["David Graeber"]
    title: "Fragments of an Anarchist Anthropology"
    publisher: "Prickly Paradigm Press"
    year: 2004
  boggs1977:
    authors: ["Carl Boggs"]
    title: "Marxism, Prefigurative Communism, and the Problem of Workers' Control"
    publication: "Radical America 11(6), 99-122"
    year: 1977
  yates2015:
    authors: ["Luke Yates"]
    title: "Rethinking Prefiguration: Alternatives, Micropolitics and Goals in Social Movements"
    publication: "Social Movement Studies 14(1), 1-21"
    year: 2015
  kaos2012:
    authors: ["Autistici/Inventati"]
    title: "+KAOS: Ten Years of Hacking and Media Activism"
    publisher: "Agenzia X (Italian original); Institute of Network Cultures (English translation, 2017)"
    year: 2012
  wright2002:
    authors: ["Steve Wright"]
    title: "Storming Heaven: Class Composition and Struggle in Italian Autonomist Marxism"
    publisher: "Pluto Press"
    year: 2002
---

## 0. Occasion and scope

On 2026-08-26 the US State Department designated Autistici/Inventati (A/I), a
volunteer-run Italian collective that had provided email, hosting, mailing
lists, blogs, chat, video, streaming, and anonymity services to activists
since 2001, a Specially Designated Global Terrorist under Executive Order
13224. PayPal cut A/I's account on 2026-08-27, Banca Etica followed on
2026-09-01, the `autistici.org` domain was deleted and its funds seized, and
A/I announced closure on 2026-09-06, affecting roughly 16,000 mailboxes,
1,500 websites, 5,500 mailing lists, and 10,000 blogs. This note treats A/I
as one case inside a general sociological problem — the persistence and
failure of volunteer-run, horizontally organized
[tech collectives](../../../../../../glossary/terms/tech-collective.md)
that build
communication infrastructure for political movements outside state and
market provision — and asks what the literature says about why such
collectives fail, including the founder's stated diagnosis that they fail
partly through "dogmatic avoidance of technologies." The claim is evaluated
against five cases: A/I, Riseup, Indymedia, Nadir, and Espiv.

## 1. Five cases

**Autistici/Inventati (Italy, 2001-2026).** Grew out of more than a decade
of Italian autonomist organizing — pirate radio, bulletin-board systems,
squatted social centers, and the European Counter Network / Isole nella Rete
lineage of the 1990s — and operated for a quarter century on a mix of
donations and grassroots fundraising before its 2026 closure under a
state-terrorism designation and the associated seizure of its domain and
funds [@kaos2012]. Its failure mode was neither burnout nor technological
refusal but external legal and financial exposure: a state actor removed
its banking and domain infrastructure faster than the collective could
route around the removal.

**Riseup (United States, 1999-present).** Launched in Seattle with borrowed
equipment, Riseup has provided secure email, mailing lists, VPN, and chat
to activists for over two decades, funded by donor contributions and
staffed by volunteers, with no advertising or data-tracking revenue model.
It has run periodic public funding drives to cover infrastructure costs and
remains active as of this note, making it the longest-lived case in this
set — evidence against a strong version of the "volunteer infrastructure
inevitably collapses" claim.

**Indymedia (global network, 1999-2000s).** The Independent Media Center
network, analyzed at length by Wolfson, grew directly out of the Zapatista
movement's network-organizational and participatory-governance practices
[@wolfson2014]. Its most visible failure event was external: on 2004-10-07,
Indymedia servers hosted by Rackspace in the US and UK were seized at the
request of foreign law enforcement agencies (Italy's among them, via a
Mutual Legal Assistance Treaty request), silencing more than twenty
Indymedia sites and several mailing lists for days before ambiguous return.
Indymedia's subsequent decline as a coordinated global network is better
explained by the diffusion of its participatory-journalism function into
social media platforms than by a single collapse event, but the 2004
seizure is a direct precedent for the A/I domain and fund seizure two
decades later: legal and infrastructural attack on volunteer media/tech
collectives by state actors, executed through the commercial providers
those collectives still depend on (a registrar, a bank, a hosting company)
even when their politics is explicitly anti-capitalist.

**Nadir (Germany, 1990s-present).** A Hamburg-based portal serving German
left movements, one of the oldest continuously operating projects in this
set. Nadir's documented trajectory is not collapse but gradual
functional supersession: as Indymedia's open publishing model spread, Nadir's
original curated-portal function was substantially replaced by it, even as
Nadir's underlying infrastructure and archive continued. This is a
different failure mode again — neither external attack nor burnout, but
obsolescence of function within a still-live collective.

**Espiv (Greece, 2008-present).** Hosted at Panteion University and
maintained by the Cybrigade collective, Espiv provides email, mailing
lists, and blog hosting (roughly 850 blogs) to Greek anarchist, labor, and
neighborhood-assembly projects, and has explicitly discussed, in its own
public communications after more than a decade of operation, the changed
material conditions under which continuing to run the server is possible.
This is a case of a collective naming its own sustainability question in
public before any external attack forces the issue — the practice this
note's §4 treats as a documented countermeasure to several of the failure
modes below.

## 2. Funding and legal exposure as a failure mode

Across all five cases, the sharpest and most decisive failure events are
external and financial/legal, not internal: Indymedia's 2004 server
seizure, executed through a commercial hosting provider under legal process
from foreign law enforcement; A/I's 2026 closure, executed through a
payment processor (PayPal), a bank (Banca Etica), and a domain registrar,
following a terrorism designation. In both cases, the collective's own
infrastructure and governance were not what failed — the third-party
commercial and legal infrastructure the collective still necessarily
depends on (banking rails, domain registration, hosting colocation) was
withdrawn or seized by state action. Milan's study of the "liberated
technologies" social movements build documents this dependency directly:
movement communication infrastructure is rarely fully autonomous from
commercial and state-regulated substrates even when its politics is
explicitly built against them [@milan2013]. This is the single
best-evidenced failure mode in this case set, and it is a mode that
technological purism (§4) does not protect against, since the exposed
dependencies (banking, domain registration) are not swappable for a
"purer" technology at the collective's discretion.

## 3. Burnout and maintenance labor as a failure mode

The disaster-response and mutual-aid literature documents burnout —
chronic exhaustion, depersonalization, and reduced sense of accomplishment
— as a measured outcome among volunteers doing sustained, high-pressure,
under-resourced care and coordination work, including specifically among
volunteers keeping communities and networks functioning under strain
[@redcross2021; @fernandesjesus2021] (see this section's
[burnout](../../../../../../../../../../content/text/glossary/terms/burnout.md) term). Infrastructure
studies generalizes the underlying mechanism: Star's ethnographic program
treats infrastructure as work that becomes visible mainly when it breaks,
meaning the labor that prevents breakage is structurally under-recognized
and under-resourced relative to the labor of building something new
[@star1999]; Russell and Vinsel make the same point as a normative
argument, that maintenance work is systematically devalued relative to
"innovation" even though it is what keeps systems running
[@russellvinsel2016]. None of the five cases in this set documents a
publicly attributed burnout collapse as decisively as Indymedia's and A/I's
external seizures, but Espiv's own public discussion of "the real
conditions under which the project continues to operate" after more than a
decade of unpaid maintenance work is consistent with the burnout mechanism
operating as a slower, less externally visible pressure alongside the
sharper legal/financial failure mode of §2. Puig de la Bellacasa's
extension of care ethics to sociotechnical maintenance work supplies the
normative frame for why this pressure is not merely a personnel problem:
treating server administration, abuse response, and user support as
ethico-political care labor rather than neutral technical upkeep is what
makes its systematic under-support visible as a structural, not personal,
failure [@puigdelabellacasa2017].

## 4. Technological refusal: where the founder's diagnosis holds and where it does not

The founder's diagnosis is that radical tech collectives fail partly
through "dogmatic avoidance of technologies." The literature gives a mixed
verdict, supporting a narrower claim than the founder's and contradicting a
broader one.

**Where it is supported.** Morozov's critique of "technological
solutionism" is not itself a study of radical tech collectives, but it
names the general failure this diagnosis is pointing at from the other
direction: an unreflective belief that adopting or refusing a technology,
by itself, resolves a political or organizational problem
[@morozov2013]. A collective that refuses a widely-adopted tool (a
mainstream chat platform, a modern authentication scheme, a maintained
language runtime) purely because it is mainstream, without a stated threat
model the refusal actually serves, is running the same solutionist error
in reverse — treating a technology choice as inherently virtuous or
inherently compromised rather than evaluating it against the collective's
actual adversary and actual maintenance capacity. Where a collective's
technology choices are driven by symbolic purity rather than a stated
threat model or maintenance-capacity argument, refusal functions exactly
as the founder describes: a dogma that narrows the collective's tool
options without improving its security or reducing its labor burden, and
that can compound the burnout mechanism of §3 by forcing volunteers to
maintain more custom infrastructure than their capacity supports.

**Where it is not supported.** Coleman's ethnography of free-software
communities documents that F/OSS commitments are load-bearing ethical and
legal claims — about copyright, patent exposure, auditability, and
control — not merely aesthetic preferences, and that hackers reformulate
free speech, transparency, and freedom-from-restrictive-licensing as
substantive political commitments through sustained practice, not as an
arbitrary style choice [@coleman2013]. Stallman's own foundational essays
state the free-software commitment as a freedom-and-control argument (the
user's ability to run, study, modify, and redistribute the software that
controls their own infrastructure), not as avoidance for its own sake
[@stallman2002]. And the empirical study of why activists do and do not
adopt "more secure" communication tools finds that adoption failure is
overwhelmingly driven by fragmented user bases, incompatible tools, and
users not understanding what a given tool's encryption actually protects
against — not by dogmatic refusal of available technology
[@abusalma2017]. McCormick and Owen's formal treatment of clandestine
organizations states the underlying tradeoff directly: operational
capacity and operational security trade off against each other, so a
given tool-adoption or tool-refusal decision can be the threat-model-correct
choice for a group under real state surveillance even when it costs
capacity [@mccormickowen2000]. On the evidence here, refusing a particular
tool because it fails a stated threat model (state legal process, platform
seizure, third-party data retention) is not the same phenomenon as
"dogmatic avoidance," and none of the five cases in this set documents a
collapse actually caused by threat-model-driven tool refusal. The A/I and
Indymedia failures in particular were not caused by the collectives
refusing available technology — they were caused by state action against
the commercial and legal infrastructure (banks, registrars, hosting
providers) the collectives had no choice but to depend on regardless of
their own technology commitments.

The net reading: "dogmatic avoidance of technologies" is a real
documented failure mode when refusal is driven by symbolic purity
untethered from a stated threat model, but the strongest documented
failures in this case set were caused by external legal/financial attack
(§2) and, more slowly, by under-resourced maintenance labor (§3) — not by
technological refusal. A program built to avoid this founder-named failure
mode should therefore prioritize stated threat models over blanket tool
policies in either direction (neither "always adopt the mainstream tool"
nor "always refuse it"), and should treat funding/legal diversification and
maintainer support as the higher-leverage interventions the evidence
actually supports.

## 5. Governance and security culture as a double-edged practice

Security culture — compartmentalized information-sharing, need-to-know
disclosure, and resistance to informal gossip about who is doing what —
exists precisely to manage the capacity/security tradeoff McCormick and
Owen formalize [@mccormickowen2000]. Practiced correctly it protects
members and infrastructure from informants and legal process; practiced as
an unreflective norm rather than a threat-model-driven discipline, it
degrades the "operational capacity" side of the same tradeoff — new
volunteers are harder to recruit and onboard, coordination is slower, and
the compartmentalization that protects against infiltration also raises
the maintenance burden documented in §3. This is the same mechanism as §4's
technological-purism finding, applied to organizational practice rather
than tool choice:
[security culture](../../../../../../glossary/terms/security-culture.md)
is threat-model-correct when it answers a stated adversary, and becomes a
self-imposed capacity tax — feeding burnout and narrowing the volunteer
pool a collective can draw on — when it does not.

## 6. What persists

Reading the five cases together, persistence correlates with (a) funding
diversification away from a single bank or payment processor, (b) explicit,
periodic collective discussion of maintenance capacity and sustainability
(Espiv's practice; the Riseup funding-drive practice) rather than treating
maintenance as an unaccounted background cost, and (c) threat-model-driven
rather than symbolically-driven technology and security decisions. It does
not correlate with the presence or absence of technological purism as
such: the evidence does not show that adopting more mainstream tools would
have saved A/I or Indymedia, because both were attacked through commercial
and legal infrastructure no tool choice removes dependency on. It also does
not show that refusal itself is safe: refusal without a stated threat model
compounds the maintenance-labor failure mode documented in §3 for no
compensating security gain. The founder's diagnosis is best read as a
caution against unreflective refusal, not as a general license to adopt
mainstream tools without a threat-model argument for each adoption.
