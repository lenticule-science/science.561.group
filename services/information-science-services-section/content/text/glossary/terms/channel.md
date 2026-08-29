---
title: "Channel"
date-created: 2026-03-29
type: term
defines:
  - "Channel"
  - "delivered-via"
  - "medium"
requires: [directed-relation]
---

A channel is a medium through which something travels from one place to another. An email list is a channel for sponsored content. A network cable is a channel for data. A language is a channel for meaning.

The channel does not create what travels through it. It shapes it — every channel has a capacity, a bandwidth, noise characteristics, and constraints on what it can carry. Shannon's channel capacity theorem quantifies this: the maximum rate at which information can travel through a noisy channel without error.

The channel is distinct from the message. The same message can travel through different channels and arrive differently — compressed, delayed, distorted, or filtered. The choice of channel shapes what the recipient receives.

When this library uses `delivered-via` as a predicate, the subject is the thing being transmitted and the object is the channel it travels through.
