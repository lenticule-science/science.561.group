---
title: "2020-10-23, HashUp Semantic Plaintext Markup"
aliases:
  - "2020-10-23, HashUp Semantic Plaintext Markup"
  - "2020-10-23, hashup semantic plaintext markup"
date-created: 2020-10-23
type: letter
authors:
  - emsenn
mirrors:
  - https://emsenn.substack.com/p/hashup-semantic-plaintext-markup
tags: []
---

Hey folks! I hope everyone's week has been going well. I've enjoyed the little  conversations some of us have been having through the week.

Today I'd like to announce a small little project I'm working on: [HashUp](https://code.cyberearth.systems/emsenn/hashup).

I've always been dissastisfied with the physical act of writing: with pen and paper it's slow and requires a fair amount of concentration to write smoothly, and with computers... well, there's What-you-see-is-what-you-get style editors like #Word, which I dislike: I'm not trying to typeset a document to be printed, I'm trying to write! Unfortunately, most non-WYSIWYG editors and formatting languages like #Markdown are similar in the same fundamental way: they exist to facilitate visual formatting, not help an author encode semantic meaning.

I pretty much never want to, when I'm writing, record that a certain word is italicized. I want to, maybe, record that it's emphasized: modern HTML has at least come that far, letting #CSS handle the styling past that semantic.But more likely, as a writer, I want to say, "this is a foreign term," or "this is a character's internal monologue," or, "this is emotional." All of those are usually conveyed by adding emphasis through italics, that's not guaranteed, and beside, emphasis isn't nearly as precise.

When I was using #Org-mode, I got in the habit of using its macros to wrap text that might otherwise be emboldened or emphasized, so that it could also be, say, if the document was being exported as #HTML, changed to link directly to my website.

But that was clunky, and by now I've drifted rather far from Org-mode, and I'm not even using #Emacs, the only text-editor Org-mode works in, right now! HashUp is my solution to my current problem, of "I don't know how to format the text I write in a way that makes it useful to me, later."

It's influenced by a lot: what I talked about above, but also using social media and other programming languages.

At its most basic, it's simple: start using hashtags in your writing, and the HashUp processor will replace them with whatever string you've configured. If you want to do something special with that hashtag, throw a pair of {} after

the word, and fill them in with the arguments to the relevant processor function. (If there's no relevant function, the text is untouched.)

It has a bunch of limitations: there's no nesting or scope-awareness, so any opened block needs to be closed, for example. And it requires either writing your own processor functions, or me writing a standard set and publishing that.

But! It's definitely a lot closer to what I want than Markdown, even after just an afternoon tinkering.

Has anyone else tried their hand at a custom markup format? If so, I'd love to see what you came up with!
