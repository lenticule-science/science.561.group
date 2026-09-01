---
type: reference
class: book
status: cited
authors: ["Claude E. Shannon", "Warren Weaver"]
year: 1949
title: "The Mathematical Theory of Communication"
publisher: "University of Illinois Press"
location: "Urbana, IL"
isbn: "978-0252725487"
see-also:
  - ../objects/shannon-channel.md
  - teaching/explanations/channel.md
---

# Shannon & Weaver 1949 — *The Mathematical Theory of Communication*

Claude E. Shannon and Warren Weaver, *The Mathematical Theory of Communication* (Urbana: University of Illinois Press, 1949). The book pairs Shannon's 1948 *Bell System Technical Journal* paper with Weaver's expository essay aimed at a general audience.

## What it establishes

Shannon's part introduces the mathematical theory of communication as a problem of reproducing at one point a message selected at another point. The construction proceeds in five steps: a discrete information source modeled as a stationary stochastic process; entropy as the rate of information production; a discrete memoryless channel modeled as a probabilistic mapping from input alphabet to output alphabet; channel capacity as the maximum mutual information between input and output, optimised over input distributions; and the channel coding theorem, which states that arbitrarily reliable transmission is possible at any rate below capacity (and impossible above it). The continuous-channel and noisy-channel extensions follow.

Weaver's expository essay frames Shannon's result as one of three "communication problems": the technical problem (how accurately can the symbols be transmitted), the semantic problem (how precisely do the transmitted symbols convey the desired meaning), and the effectiveness problem (how effectively does the received meaning affect conduct). Weaver argues that Shannon's theory addresses the first problem and that the second and third problems load on the first but go beyond it. This three-level framing is what later traditions extend or contest.

## Why this corpus cites it

The book underwrites [shannon-channel](../objects/shannon-channel.md) as the foundational formal model of a communication channel and the source-channel-receiver tradition more broadly. The corpus's [channel](teaching/explanations/channel.md) concept declares Shannon's discrete memoryless channel as its prototype.

The Weaver essay is also load-bearing in a different way: it is the first place where the *limits* of the mathematical theory are stated by its own framers — that semantic content and effectiveness on conduct are real questions that the mathematical theory does not address. The corpus's [pragmatics](teaching/explanations/pragmatics.md) and [audience](teaching/explanations/audience.md) concepts inherit this distinction. The [humanities-side communication theory](../../../humanities/theories/communication/_index.md)'s explicit position — that communication is *not* Shannon — is best read as a development of Weaver's distinction rather than an attack on Shannon's theorem.

## Editions

The 1949 first edition contains both Shannon's and Weaver's contributions and is the canonical citation for "Shannon-Weaver." Shannon's part is also cited as Shannon 1948 (the original *Bell System Technical Journal* publication). Both citations refer to the same mathematical content.
