---
title: "Communication Is Not Shannon"
date-created: 2026-05-02
---

The dominant inheritance in the word "communication" in the twentieth century is Shannon's mathematical theory of communication: a sender, a channel, a message, noise, a receiver, and a measure of how reliably the message survives the channel. The theory is exact, fertile, and important. It has founded entire fields. It is also not what the framework studies, and its dominance has obscured what the framework studies.

This text says what the framework studies *instead*, and where Shannon's apparatus genuinely applies and where it does not.

## What Shannon's theory describes

Shannon's setup assumes a discrete message, a channel that can corrupt it, and a receiver whose task is to recover the message that was sent. The theory's power is its quantification: it tells you the channel capacity, the encoding strategies that approach it, the bounds on reliable transmission. Within its setup, the theory is essentially unimprovable.

The setup assumes the *meaning* of the message is fixed before transmission and that successful reception means the receiver ends up with the same bit pattern the sender intended. The theory takes no position on what the bits *mean*, on whether the receiver and sender share the framework that gives the bits content, on whether the bits matter, or on whether the receiver is the right receiver for these bits. These are deliberately bracketed. Shannon's theory is a theory of channels, not of meaning.

## What the framework studies

The framework studies cases where the meaning is not fixed before "transmission." A proof, a lecture, a tutorial, a sign, a policy document — these do not exist as encoded bits in some unambiguous sense, and the reader's task is not to recover a pre-existing message but to *perform* the work the artifact asks for. Closure happens in the reader, not in the channel. The artifact's responsibility is not to survive a noisy channel; it is to license the closures the reader is being asked to perform.

This is a different problem. It does not have an analogue of channel capacity. It has gaps, frames, icons, sequences, registers, audiences. It has the [closure budget](../terms/closure-budget.md) the audience can spend. It has the [legibility debt](../terms/legibility-debt.md) the artifact accumulates when its closures exceed what its readers can do. None of these have meaningful Shannon-style numerical measures, and any attempt to give them such measures (information-theoretic readability scores, channel models of teaching, capacity arguments about textbook design) has consistently produced research that is mathematically clean and operationally useless.

## Where Shannon does apply

Shannon's apparatus genuinely describes cases where the meaning is fixed, the channel is the issue, and the receiver's task is recovery. Examples: digital communication of a known data payload over a noisy network; audio transmission of recorded speech; storage of a known file with possible corruption. In all of these, the channel-recovery model is exactly right, and Shannon's bounds tell you what is possible. The framework does not contest any of this.

The error is the casual extension of Shannon's vocabulary outside the channel-recovery cases — treating teaching as transmission, treating reading as decoding, treating a proof as a message that the writer encodes and the reader decodes. The model fails because the closure is not in the channel. It is in the reader, who is not recovering a message but performing work the artifact has asked for.

## What the framework also is not

The framework is also not the rhetoric tradition (which studies persuasion, while the framework studies the conditions under which artifacts can be relied on at all). It is not literary theory (which studies what reading produces, while the framework studies what the artifact licenses). It is not pedagogy (which studies how learning happens, while the framework studies what an artifact owes its reader regardless of whether learning is the aim). It draws on each of these where useful — Berlant's account of genre, Eisner's account of craft, Andersen's account of acceptability — but it is none of them.

What the framework is: a vocabulary for analyzing how communicatively responsible an artifact is, with respect to the closures it asks the reader to perform. It is a discipline of disciplined absence, in McCloud's sense.
