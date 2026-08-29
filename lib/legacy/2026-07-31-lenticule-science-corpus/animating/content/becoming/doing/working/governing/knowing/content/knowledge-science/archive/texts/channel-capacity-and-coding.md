---
title: "Channel Capacity and Coding"
aliases:
  - "Channel Capacity and Coding"
id: channel-capacity-and-coding
authors:
- gpt-5.2-codex
date-created: 2025-12-30
type: lesson
description: How channels limit information and how codes approach capacity.
tags: []
requires:
- /information/curricula/mutual-information.md
teaches:
  - "Channel Capacity and Coding"
---


## Assumed audience

- Reading level: technical.
- Background: entropy and mutual information.
- Goal: understand capacity and why codes matter.

## Channel capacity

A communication channel accepts an input and produces an output, but noise along the way can corrupt the signal. Channel capacity is the maximum rate at which information can pass through the channel with an error probability that can be made as small as desired. This maximum exists regardless of how clever the encoding scheme is -- it is a [property](../../sociology/terms/property.md) of the channel itself, determined by its noise characteristics.

[Shannon](../../general/people/claude-shannon.md)'s channel coding theorem (1948) establishes that reliable communication is possible at any rate below capacity, and impossible at any rate above it. This is a sharp threshold: below capacity, codes exist that reduce errors to near zero; above capacity, no code can prevent errors from accumulating.

## The core formula

Capacity is the maximum of mutual information over all possible input distributions:

$$C = \max_{p(x)} I(X;Y)$$

Here $I(X;Y)$ measures how much knowing the output $Y$ tells you about the input $X$. The maximization searches for the input distribution $p(x)$ that makes the channel carry the most information per use. For a binary symmetric channel with crossover probability $p$, capacity is $C = 1 - H(p)$ bits per use, where $H(p)$ is the binary entropy function. As $p$ approaches 1/2 (maximum noise), capacity drops to zero.

## Coding intuition

Error-correcting codes add structured redundancy so that the receiver can detect and correct errors introduced by the channel. A simple example: repeating each bit three times and taking the majority vote at the receiver corrects any single-bit error per triplet, but at the cost of sending three times as many bits. This triple-repetition code is inefficient -- it operates well below capacity.

Good codes approach capacity by distributing redundancy in more sophisticated ways. Turbo codes and low-density parity-check (LDPC) codes, developed in the 1990s, come within fractions of a decibel of the [Shannon](../../general/people/claude-shannon.md) limit on many practical channels. The key insight is that redundancy does not need to be brute-force repetition; structured redundancy can protect against errors while wasting far fewer channel uses.

## Why this matters

Channel capacity defines a hard physical limit for every communication system: wireless links, fiber optics, disk storage, and biological signaling. Engineers use capacity as the benchmark against which real codes are evaluated. Understanding capacity also clarifies why some channels are fundamentally harder to communicate through than others, and why no amount of engineering can exceed the limit that noise imposes.
