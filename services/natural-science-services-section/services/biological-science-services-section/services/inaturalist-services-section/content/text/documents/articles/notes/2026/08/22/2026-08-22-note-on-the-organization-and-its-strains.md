---
title: "The Organization and Its Strains"
description: "iNaturalist spun off as an independent 501(c)(3) in 2023 on a $10M grant and has grown to roughly 300 million observations and 4.3 million users on a staff of only 17, a scale mismatch that produced open governance strain in 2025-2026: a $1.5M Google.org generative-AI grant announced before community consultation triggered volunteer backlash and an apology from the executive director, and co-founder Ken-ichi Ueda departed in January 2026 citing leadership unresponsiveness, with a claimed 30%-in-three-months staff turnover figure and separate moderation-culture complaints both resting on single, uncorroborated secondary sources that this note flags rather than asserts as fact."
date-created: 2026-08-22
type: notes
name: 2026-08-22-note-on-the-organization-and-its-strains
authors:
  - claude-sonnet-5
status: draft-for-owner-review
keywords: ["inaturalist", "nonprofit-spinoff", "google-ai-grant", "generative-ai-controversy", "ken-ichi-ueda", "staff-turnover", "moderation-culture", "terms-of-service", "ai-training-data", "organizational-strain"]
tags: ["draft", "note", "organization", "competitive-landscape"]
---


This note is a study of iNaturalist as an organization from its 2023
independence to August 2026, read for one purpose — understanding what
kind of institution currently stands behind the platform, at what
scale, under what strain — compiled from a single research pass
(`report-4.md`, 2026-08-22) built from iNaturalist's own blog and
forum posts, press coverage, and several secondary/community sources.
Method: the report's cited sources were read as reported; this note
does not re-verify primary sources beyond what the report already
did. Anywhere the underlying report flagged a figure as resting on a
single source or a secondary account rather than a primary statement,
that flag is carried forward here rather than smoothed into plain
fact — this matters because two of the most citable claims below (a
30% staff-turnover figure and a moderation-culture complaint) are
exactly that kind of single-sourced, uncorroborated material.

## From institutional project to independent nonprofit

iNaturalist began in 2008 as a UC Berkeley master's project, became a
California Academy of Sciences initiative in 2014, operated jointly
with the National Geographic Society from 2017, and in 2023 spun off
as an independent 501(c)(3) nonprofit (Tax ID 92-1296468, based in San
Rafael, CA), reportedly launched with a $10 million startup grant.
([Bay Nature: iNaturalist Strikes Out on Its Own](https://baynature.org/2023/09/12/science-nature/urban-nature/inaturalist-strikes-out-on-its-own/),
[Spreading Our Wings](https://www.inaturalist.org/blog/82010-spreading-our-wings-inaturalist-is-now-an-independent-nonprofit),
[Wikipedia: iNaturalist](https://en.wikipedia.org/wiki/INaturalist))
No detailed 2024-2025 revenue/expense breakdown was retrievable in the
underlying research pass — iNaturalist's own financials page returned
an HTTP 403 — so the $10M 2023 grant and a separate $1.5M 2025 Google
grant (below) are the only hard funding figures available here.

## Scale versus staff: the central structural fact

By spring 2026 iNaturalist crossed roughly 300 million observations
(first reported approaching that threshold in August 2025), contributed
by about 4.3 million registered users (as of December 2024) and
roughly 400,000 monthly active users (as of August 2025).
([iNaturalist at 300 Million Observations](https://www.inaturalist.org/blog/126478-inaturalist-at-300-million-observations),
[BioScience](https://academic.oup.com/bioscience/article/75/11/953/8185761))
Against that scale, a 2025 team-growth blog post put total staff at
**17**, governed by a 9-member board, with the post itself describing
a recent hiring round that added 5 staff and 2 board members — i.e.
even the growth announcement is describing a team that remains small
relative to the platform it runs.
([The iNaturalist team continues growing](https://www.inaturalist.org/blog/120141-the-inaturalist-team-continues-growing))
This scale-to-staff ratio is the single fact that most directly frames
everything else in this note: a platform with hundreds of millions of
data points and millions of users is operated, moderated, and
technically maintained by a team smaller than many single engineering
teams at a mid-size tech company.

## The app rewrite: in progress, not confirmed complete

iNaturalist maintains a public React Native rewrite
(`inaturalist/iNaturalistReactNative` on GitHub), intended to
eventually replace the separate native iOS and Android apps and reach
feature parity with them; Seek, iNaturalist's companion offline app,
is already built on React Native. As of August 2026 the repository
shows continued active development. **This status is inferred from
repository activity alone** — the underlying research pass did not
locate a stated completion percentage or a shipped-parity announcement,
so treat "rewrite in progress" as observed, and "how close to done" as
unknown. ([GitHub: iNaturalistReactNative](https://github.com/inaturalist/iNaturalistReactNative))

## The 2025 Google generative-AI grant and its fallout

On June 10, 2025, iNaturalist announced a $1.5 million grant from
Google.org's "Generative AI Accelerator" program, intended to fund
tools that explain *why* the computer-vision model suggests a given
species — not just producing a ranked list — including summarizing
community identification-comment text with generative AI.
([Scientific American](https://www.scientificamerican.com/article/google-ai-grant-to-inaturalist-prompts-community-outcry/))

The announcement produced significant volunteer backlash. Objections
spanned several distinct lines: the environmental cost of generative
AI (energy, water, e-waste, and rare-earth-mineral demand); fear that
generative summaries would hallucinate misidentifications into a
platform whose entire value rests on identification accuracy; concern
that the initiative would devalue the unpaid expert labor of
volunteer taxonomists who do the actual identification work; and
anger, specific to the rollout itself, that Google publicly announced
the partnership before the community was consulted — read by many
volunteers as evidence that the grant agreement was signed before any
internal or community discussion took place. Some volunteers
threatened to delete their observation history and leave the platform
over the announcement.
([pivot-to-ai.com](https://pivot-to-ai.com/2025/06/19/google-bribes-inaturalist-to-use-generative-ai-volunteers-quit-in-outrage/),
[Scientific American](https://www.scientificamerican.com/article/google-ai-grant-to-inaturalist-prompts-community-outcry/))

iNaturalist's leadership responded the next day, June 11, 2025:
Executive Director Scott Loarie apologized for how the rollout was
communicated, stated plainly "There's no way we're going to unleash AI
generated slop onto the site," and committed to abandoning the
generative-AI demo entirely if it compromised data quality, produced
outsized environmental impact, or otherwise proved "too flawed."
([Response to iNaturalist's Google AI grant](https://www.inaturalist.org/posts/113257-response-to-inaturalist-s-google-ai-grant-and-the-discussion-happening))

## The January 2026 departure of Ken-ichi Ueda

In January 2026, co-founder Ken-ichi Ueda ("kueda") left iNaturalist
after roughly 18 years with the project. He publicly stated that
leadership was not listening to staff and user concerns, that internal
warnings the Google-AI rollout would backfire had gone unheeded, and
that the organization had reportedly offered buyouts to staff who
dissented from that direction.
([Oregon Mycological Society write-up](https://www.wildmushrooms.org/2026/01/07/inat-founder-quits/),
[forum: Thank you, Ken-ichi Ueda](https://forum.inaturalist.org/t/thank-you-ken-ichi-ueda/74414))

One figure attached to this departure — that roughly **30% of staff
turned over in the three months** around it — comes from a single
secondary blog summary, not from a primary iNaturalist or Ueda
statement, and the underlying research pass explicitly could not
verify it against a primary source. **[UNVERIFIED]** Given a total
staff of only 17 (above), even a modest number of departures would
register as a large percentage, which is worth keeping in mind when
weighing how alarming this specific figure should be read as — the
underlying event (a co-founder's public, critical departure) is
independently documented across two sources; the turnover percentage
attached to it is not.

## Moderation-culture complaints: a separate, weaker-sourced thread

Independent of the Google-AI episode, there are recurring complaints
about iNaturalist's volunteer-curator moderation — described as
inconsistent and, per one account, influenced by a participant's
platform "status" — along with specific claims of harassment following
disputes with curators, and an assertion that community guidelines are
enforced unevenly and are "not always the safest for neurodivergent or
LGBT+ people." This entire thread rests on one first-person Medium
essay plus associated forum discussion; it has not been independently
verified or adjudicated. **[UNVERIFIED / anecdotal — single
first-person source]** ([When iNaturalist Becomes A Toxic Community](https://medium.com/@LBramwyre/when-inaturalist-becomes-a-toxic-community-f6cd42dbcafa))
Separately, and on firmer footing as an observed pattern rather than a
single account, there is ongoing low-level friction on the platform's
own forum over AI-generated ("slop") nature photos being uploaded as
if they were real observations — a live data-integrity concern for
both the CV training corpus and for citizen-science credibility more
broadly, distinct from but adjacent to the generative-AI grant
controversy above. ([forum: What is this – iNaturalist and generative AI?](https://forum.inaturalist.org/t/what-is-this-inaturalist-and-generative-ai/66140))

## The commercial AI-training restriction

iNaturalist's Terms of Service and API-use guidance explicitly prohibit
using its data to train AI, machine-learning, or large-language
models — or similar systems — for commercial purposes. This sits
alongside more conventional API rate limits (roughly 100 requests/min
hard cap, with 60/min or lower requested as a courtesy; a soft cap
around 10,000 requests/day; and a stated risk of a permanent block for
downloading more than 5GB/hour or 24GB/day of media). The restriction
is directly relevant to any organization — competitor or otherwise —
considering iNaturalist's corpus as a bootstrap dataset for a
commercial classifier: the ToS forecloses that path without a
separate agreement, which is a governance fact as much as a technical
or licensing one, and sits in some tension with iNaturalist's own
2025 embrace of a generative-AI partnership funded by Google.
([API recommended practices](https://www.inaturalist.org/pages/api+recommended+practices),
[forum: commercial-purpose terms](https://forum.inaturalist.org/t/is-this-use-of-inaturalist-content-a-breach-of-the-commercial-purpose-terms/9841))

## What this adds up to

Read together, these threads describe an organization operating well
past the scale its formal structure was built for: a 17-person
nonprofit staff running a platform with roughly 300 million
observations and millions of users, that in 2025 accepted an
AI-industry grant without first consulting the volunteer community
whose unpaid labor is the platform's actual product, triggered a
backlash serious enough to prompt a same-week public apology, and
several months later lost a founding staff member who said publicly
that leadership had not been listening. The specific severity
figures attached to that strain — 30% turnover, a pattern of biased
moderation — are each sourced to one place and were flagged as
unverified in the underlying research; the pattern of institutional
strain they describe, by contrast, is corroborated across multiple
independent sources (Scientific American, iNaturalist's own posts,
the forum, and the Oregon Mycological Society piece) even where any
one number inside it is not.

## Sources

- https://baynature.org/2023/09/12/science-nature/urban-nature/inaturalist-strikes-out-on-its-own/
- https://www.inaturalist.org/blog/82010-spreading-our-wings-inaturalist-is-now-an-independent-nonprofit
- https://en.wikipedia.org/wiki/INaturalist
- https://www.inaturalist.org/blog/126478-inaturalist-at-300-million-observations
- https://academic.oup.com/bioscience/article/75/11/953/8185761
- https://www.inaturalist.org/blog/120141-the-inaturalist-team-continues-growing
- https://github.com/inaturalist/iNaturalistReactNative
- https://www.scientificamerican.com/article/google-ai-grant-to-inaturalist-prompts-community-outcry/
- https://pivot-to-ai.com/2025/06/19/google-bribes-inaturalist-to-use-generative-ai-volunteers-quit-in-outrage/
- https://www.inaturalist.org/posts/113257-response-to-inaturalist-s-google-ai-grant-and-the-discussion-happening
- https://www.wildmushrooms.org/2026/01/07/inat-founder-quits/
- https://forum.inaturalist.org/t/thank-you-ken-ichi-ueda/74414
- https://medium.com/@LBramwyre/when-inaturalist-becomes-a-toxic-community-f6cd42dbcafa
- https://forum.inaturalist.org/t/what-is-this-inaturalist-and-generative-ai/66140
- https://www.inaturalist.org/pages/api+recommended+practices
- https://forum.inaturalist.org/t/is-this-use-of-inaturalist-content-a-breach-of-the-commercial-purpose-terms/9841

## Gaps

- No detailed 2024-2025 iNaturalist revenue/expense breakdown was
  retrievable (financials page returned HTTP 403); only the $10M 2023
  startup grant and the $1.5M 2025 Google grant are confirmed figures.
- The React Native rewrite's actual completion percentage is unknown;
  only that development is ongoing as of August 2026.
- The 30%-staff-turnover figure and the moderation-culture/harassment
  claims are each sourced to a single secondary account and were not
  independently corroborated in the underlying research pass.
