---
name: "Trailing State Synchronization"
description: "A mirrored-server synchronization mechanism (TSS) that keeps several live, continuously executing copies of the same simulation running at successively larger synchronization delays, so that corrections to the least-settled, rendered copy can be drawn from a more-settled live copy rather than from a static rollback snapshot."
instance-of: concept
date-created: 2026-08-22
references:
  cronin2004:
    authors: ["Eric Cronin", "Burton Filstrup", "Anthony R. Kurc", "Sugih Jamin"]
    title: "An Efficient Synchronization Mechanism for Mirrored Game Architectures"
    publication: "Multimedia Tools and Applications (extended from NetGames 2001)"
    year: 2004
---

Trailing State Synchronization (TSS) is a synchronization mechanism for mirrored game servers, introduced by Eric Cronin, Burton Filstrup, Anthony R. Kurc, and Sugih Jamin. Instead of maintaining one execution state corrected by periodic full-checkpoint rollback, TSS keeps a small, fixed number of live, continuously executing copies of the same simulation, each running at a different synchronization delay d0 < d1 < d2 < …. The leading copy, at the shortest delay, is the one rendered to players and is the most exposed to reordering errors from out-of-sequence commands; each trailing copy has had strictly more time to receive commands in their correct order before executing them, and so sees fewer misorderings than the copies ahead of it.

The paper documents TimeWarp in careful detail as the baseline optimistic algorithm TSS is built to improve on: TimeWarp takes a snapshot of the execution context before every event, rolls back to that snapshot when a late event arrives, and re-executes forward from it, which requires "anti-messages" to cancel effects that a now-retracted event had already propagated — a mechanism that can itself cascade into further rollbacks, which the paper treats as a real cost of TimeWarp's design. TSS's own innovation is stated directly: "instead of copying the state from a snapshot taken just prior to the offending command as TimeWarp does, TSS copies the state from a second copy of the same game that is running at a delay." That is, correction draws on a dynamically updated, already-more-settled live state rather than a static snapshot frozen at an earlier moment.

The settlement-substrate research program holds TSS as the cleanest documented real-world instance of a graded family of settlement stages applied to one causal history — several simultaneously live states at increasing degrees of settledness, with the least-settled state rendered and the more-settled states available to correct it. The section reads this as an existence proof that such a graded structure is buildable as ordinary engineering practice, not merely a theoretical convenience; this is a proposed reading the program offers as a rhyme with its own apparatus, not a claim the paper itself makes in those terms. Rollback netcode, by contrast, corrects divergence by discarding shown frames and resimulating them from scratch rather than by consulting an already-live, more-settled copy, which is the point of contrast Cronin et al.'s own comparison to TimeWarp implicitly extends to any rewind-and-replay architecture.
