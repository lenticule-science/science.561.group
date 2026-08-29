---
title: "hashtag"
aliases:
  - "hashtag"
date-created: 2026-03-04
tags: []
---

A hashtag is a word or phrase prefixed with the `#` symbol, used as a tag within social media and web platforms to mark content as relevant to a topic. The convention was proposed by Chris Messina on Twitter in August 2007 as a way to group conversations around shared topics without requiring any platform infrastructure beyond text search. Twitter initially had no formal tag system; Messina's proposal succeeded because it was simple, required no platform support, and could be adopted unilaterally by any user.

Hashtag usage has diverged across platforms as each community developed distinct conventions. On Mastodon and the broader Fediverse, hashtags are functionally essential because there is no recommendation algorithm and no full-text search across federated instances — hashtags are the primary cross-instance discovery mechanism, and the community strongly advocates CamelCase formatting (capitalizing each word) for screen reader accessibility. On Tumblr, hashtags serve a dual purpose: discovery and commentary, with users writing discursive, sentence-length tags that function as asides and reactions — a use that has no equivalent on other platforms. On Twitter/X and Instagram, algorithmic recommendation has overtaken hashtags as the primary discovery mechanism, reducing tags to a secondary signal. On platforms like DEV.to, hashtags have evolved toward curated lists closer to a [controlled vocabulary](./controlled-vocabulary.md), as the community encountered the classic [folksonomy](./folksonomy.md) problems of synonym fragmentation and tag spam.

The CamelCase convention for hashtags originated as an accessibility practice and has become a recognized best practice across the web. Screen readers parse CamelCase text by detecting capitalization transitions and reading each word separately, so `#BlackLivesMatter` is read as three words while `#blacklivesmatter` is read as a single unintelligible string. W3C Web Content Accessibility Guidelines and Fediverse community norms both recommend capitalizing every word in a hashtag, including articles and prepositions, to ensure consistent accessibility.
