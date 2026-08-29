---

title: "Rate-Distortion and Lossy Compression"
aliases:
  - "Rate-Distortion and Lossy Compression"
date-created: 2025-12-30
description: The tradeoff between compression rate and distortion.
tags: []
requires:
- /information/curricula/entropy-and-surprise.md
teaches:
  - "Rate-Distortion and Lossy Compression"
---


## Assumed audience

- Reading level: technical.
- Background: entropy and probability.
- Goal: understand rate-distortion tradeoffs.

## Core idea

Lossless compression has a hard floor: you cannot encode a source using fewer than $H$ bits per [symbol](../../linguistics/theories/semiotics/terms/symbol.md) on average without losing information. Lossy compression breaks through that floor by tolerating some distortion -- a controlled difference between the original data and the reconstruction. Rate-distortion theory quantifies the best possible tradeoff between compression rate and distortion, answering the question: for a given tolerance of error, what is the minimum number of bits per [symbol](../../linguistics/theories/semiotics/terms/symbol.md) required?

The theory applies whenever perfect reproduction is unnecessary or impractical. Speech, images, and video all contain more detail than a listener or viewer can distinguish, so discarding some of that detail in a principled way allows dramatic reductions in data rate without perceptible loss.

## Rate-distortion function

The rate-distortion function $R(D)$ gives the minimum bit rate needed to represent a source such that the expected distortion does not exceed $D$:

$$R(D) = \min_{p(\hat{x}|x) : \, E[d(X, \hat{X})] \le D} I(X; \hat{X})$$

Here $d(X, \hat{X})$ is a distortion measure (for example, squared error for continuous signals or Hamming distance for discrete symbols), and the minimization searches over all conditional distributions $p(\hat{x}|x)$ that satisfy the distortion constraint. The function $R(D)$ is convex and decreasing: accepting more distortion always permits a lower rate, but the marginal savings diminish as $D$ grows.

For a memoryless Gaussian source with squared-error distortion, the rate-distortion function has a clean closed form: $R(D) = \frac{1}{2} \log_2 \frac{\sigma^2}{D}$ for $D \le \sigma^2$, and $R(D) = 0$ for $D > \sigma^2$. This means that halving the distortion tolerance costs an additional half bit per sample.

## Why this matters

Rate-distortion theory provides the theoretical limits behind audio codecs (MP3, AAC), image formats (JPEG, WebP), and video compression (H.264, AV1). Every practical lossy codec operates somewhere on or above the $R(D)$ curve for its source model. Understanding this tradeoff clarifies why no codec can simultaneously achieve low bitrate and low distortion beyond what the theory permits, and it gives engineers a benchmark for evaluating how close their designs come to the fundamental limit.
