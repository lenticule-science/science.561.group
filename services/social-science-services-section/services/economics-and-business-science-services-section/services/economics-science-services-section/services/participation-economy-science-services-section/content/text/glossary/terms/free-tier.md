---
description: A free tier is a bounded quantity of a product or service, usually reset on a recurring schedule, that a provider makes available at zero price as one tier of an otherwise paid offering.
identity: free-tier
name: Free tier
date-created: 2026-09-05
references:
  shampaniermazarariely2007:
    authors:
      - Kristina Shampanier
      - Nina Mazar
      - Dan Ariely
    title: "Zero as a Special Price: The True Value of Free Products"
    publication: Marketing Science 26(6)
    year: 2007
---
A free tier is a bounded quantity of a paid product — a number of requests, tokens, or units of compute, typically reset daily or monthly — that a provider gives away at zero price, distinct from the provider's paid tiers of the same product. Every AI inference provider measured for this program (Groq, OpenRouter's free models, Cloudflare Workers AI's daily Neuron allocation, Google Gemini's free rate limits, and others in the accompanying incumbent-and-provider measurement record) offers a free tier of this kind, each with its own quota, reset period, and signup identity requirement measured and recorded per provider.

A free tier is distinguished from a genuinely free product (Ollama, run locally with no account at all) by the presence of a bound: a free tier is a slice of a product the provider could charge for and has chosen not to, up to a limit, while a fully free product has no paid counterpart to be a tier of. A free tier is also distinguished from a trial: a trial is time-bounded and ends, converting to paid or expiring, while a free tier's quota resets and persists indefinitely as long as the provider keeps offering it. The zero-price effect documented by Shampanier, Mazar, and Ariely explains why a free tier attracts disproportionate signup relative to an equivalently cheap paid tier: a price of exactly zero produces an affective response distinct from a merely low price [@shampaniermazarariely2007].

The engineering consequence is that a free tier's terms commonly restrict automated or high-volume use even while advertising the tier as free, and several free tiers measured for this program require a payment card on file before the free quota can be used at all — a fact this program's catalog records as a distinct capability from the tier's price, since a card-gated free tier is a materially different offer from one requiring only an email address.
