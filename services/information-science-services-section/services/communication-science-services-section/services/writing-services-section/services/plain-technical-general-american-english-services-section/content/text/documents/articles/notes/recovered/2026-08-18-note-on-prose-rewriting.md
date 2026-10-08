---
title: "A Script to Route Prose Into a Rewriter"
description: "The idea for a tool that sends the prose in a markdown file to an AI model and gets back the same meaning in plain, general American English. Not built yet. This note is the plan, not the tool."
date-created: 2026-08-18
type: note
name: a-script-to-route-prose-into-a-rewriter
keywords:
  - writing
  - tooling
  - plain-language
  - markdown
tags:
  - draft
status: draft
authors:
  - Claude Opus
---

# A Script to Route Prose Into a Rewriter

## Why this exists

Earlier the same day, three new sections got written by AI agents, and the prose in them was bad in a specific way: dense, full of hedges, and shaped like other AI-written files instead of like something a person would say out loud.
Morgan pointed out that this repo already has real writing-quality content (a wordcraft guidebook, elsewhere), and none of it stopped this from happening, because nobody is actually checking new prose against it.
A rule that isn't enforced isn't a rule.

Morgan's proposal: a script that reads a markdown file's prose, sends it to an AI model with instructions to rewrite it in plain, general American English, and gets a result back.
Not a person manually rewriting things by hand, and not a person just telling the next agent to "write normal."
An actual tool that runs the same way every time.

This note is a first pass at the design.
It is not the tool.
Morgan asked specifically for this to be planned properly instead of built fast, so most of this note is open questions, not answers.

## What the tool needs to protect

Some text in this repo must not be paraphrased, because paraphrasing it changes what it is, not just how it reads.

Direct quotes.
If a document quotes what Morgan, or anyone else, actually said, rewriting that quote in different words turns it into something nobody said.

Evidence-graded claims.
The biography and other reference documents use a grading system: DOCUMENTED, ARCHIVE, INFERENCE, SELF-REPORT.
A sentence's grade often depends on its exact wording.
Rewriting it for style risks quietly changing its evidentiary weight.

Frontmatter, code, tables, and links.
The existing semantic-linefeed-normalization-service in this repo already knows how to leave these alone while reflowing prose around them.
This tool should reuse that logic instead of reimplementing it.

A rough idea for how to do this mechanically, not a final answer: before sending text to the model, pull out anything inside quotation marks that is attributed to a named source, and anything in a blockquote, and swap it for a placeholder.
Send the rest.
Put the real text back in place of the placeholders afterward.
This means the model never actually sees, and can't accidentally reword, the parts that have to stay exact.

## What the tool should not do by itself

It should not silently overwrite files.
Given what just happened in this same conversation, a tool that runs a rewrite and applies it without anyone looking is the same mistake in script form.
At minimum, it needs a mode that only shows what it would change, separate from a mode that actually writes the change, and the second one should not be the default.

It should not be the only check on quality.
It catches word choice and register.
It does not know whether a claim is true, whether a citation is real, or whether something got deleted that should not have been.
That is still a person's job, or a different tool's job.

## Open questions, not decided here

Which files does it run on.
Every markdown file in the repo is a huge and risky first target.
Should this start scoped to whatever a person names explicitly, and grow from there, or does it need an exclude list for whole categories (reference documents, transcripts, anything with an evidence grade) from day one.

Which model.
Morgan suggested Haiku, mainly because it is cheap enough to run over a lot of files.
That is a real reason, but plain-language rewriting while leaving exact terms and citations untouched is a task where a cheaper model can also be more likely to get it wrong.
Worth actually comparing outputs before picking one, not assuming cheap is good enough.

What happens on a second run.
If the same file gets rewritten twice, does the tool produce the same wording again, or does it drift a little each time.
If it drifts, running it repeatedly could slowly erode a document instead of settling it.
One option: once a file is accepted, mark it in its frontmatter as already plain, and skip it on later runs unless someone clears that mark.

How it fits with the validator.
This repo already has a validate-markdown-document-service that flags things like non-normalized linefeeds and bad frontmatter.
Should this tool run through that validator before and after, as a basic sanity check, even though the validator cannot tell whether the meaning survived the rewrite.

Who reviews the output.
For most files, Morgan looking at a diff is probably enough.
For anything evidence-graded, that review might need to be stricter, or that category might be excluded from this tool entirely and left to be rewritten by hand, if at all.

## Where this fits

This section, 561-group-writing-services-section, is new, created for this idea.
Right now it holds only this note.
The actual script, once it gets built, belongs here too, following the pattern already used elsewhere in this repo for real tools: a proper package with its own scripts, not a one-off file dropped somewhere.
