---

name: "instance"
aliases:
  - "instance"
date-created: 2025-12-31
tags: []
---

A **Mastodon instance** is a server running Mastodon software, hosting user accounts and their posts. Each instance operates independently with its own rules, moderation policies, and community norms, but participates in the [fediverse](../../../../internet/theories/fediverse/terms/fediverse.md) by [federating](../../../../internet/theories/fediverse/terms/federation.md) with other instances through [ActivityPub](../../../teaching/explanations/internet/topics/activitypub/index.md).

Users on one instance can follow and interact with users on any federated instance. The instance administrator controls which other instances to federate with: they can silence (hide from public timelines but allow individual follows) or suspend (block entirely) instances whose moderation standards or content do not align with their community's norms.

An instance's identity is its domain name. User addresses take the form `@username@instance.domain`, making the instance an explicit part of a user's identity on the network. This contrasts with centralized platforms where the platform itself is invisible in the address — there is no "instance" because there is only one.

Instance size varies from single-user installations to servers with hundreds of thousands of accounts. Larger instances carry more moderation burden and more infrastructure cost; smaller instances offer more community cohesion and administrative control. The choice of instance shapes the local timeline (a feed of all public posts from users on that instance) and therefore the ambient social context a user experiences.
