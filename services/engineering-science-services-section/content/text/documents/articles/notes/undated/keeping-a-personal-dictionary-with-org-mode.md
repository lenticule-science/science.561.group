---
aliases:
  - keeping-a-personal-dictionary-with-org-mode
tags: 
created: 2019-05-03T11:18:03
modified: 2025-07-13T11:20:01
title: Keeping a Personal Dictionary with Org mode
description: This document was written by me, emsenn, and is released for the benefit of the public under the terms included in the "License" supplement.
specialization: research
author: ["emsenn"]
draft: false
---

## Introduction

This document was written by me, [emsenn](https://emsenn.net/), and is released for the benefit of the public under the terms included in the ["License"](https://emsenn.neocities.org/keeping-a-personal-dictionary-with-org-mode#supplements-license) supplement. It was made possible with financial [contributions](https://emsenn.neocities.org/keeping-a-personal-dictionary-with-org-mode#supplements-contribute) from humans like you. Please direct comments to my [public inbox](https://lists.sr.ht/~emsenn/public-inbox/) or, if necessary, my [personal email](mailto:emsenn@emsenn.net).

## Keeping a Personal Dictionary with Org-mode

A few days ago I wrote a [letter to my parlour](https://emsenn.neocities.org/dear-parlour-i-updated-my-website.html), where I explained how I updated my website to make better use of some of Org-mode's more basic features, like `INClUDE` statements, or the index features.

Today I stumbled upon a new use - to me - for Org-mode's `INCLUDE` statements. A brief explanation, first:

A file, `foo.org`, contains the text: `/Galavant/ was a great television show.` Another file has the text:

Here's what I think about /Galavant/:

#+INCLUDE: "./foo.org"

If I *export* that file, the text will show up as:

Here's what I think about /Galavant/:

/Galavant/ was a great television show.

A silly example. More pragmatically, unless I've changed my method since writing it, this document's introduction contains at least one INCLUDE'd statement - the editorial and license information, and perhaps the disclaimer about literate programming, and the license in the supplements was INCLUDE'd as well. It helps me not repeat myself.

So, that's INCLUDE statements.

Now, some background on me: because of the type of content I write, I end up being very precise in my use of some terms that might have a more casual meaning elsewhere. In software documentation, "archive" might mean something very very particular. In role-playing games, "sleeping" might not include naps, and so on.

I've developed the style of italicizing these *key terms* when I use them before defined, and using bold italics when I define them: ***key terms*** are those words that have a technical meaning within the scope of a document. I also italicize key terms if they get mentioned a decent enough distance from their definition, like in another section. If you're curious, I'm developing my own [_Style Manual_](https://emsenn.neocities.org/style-manual.html) that explains a lot of my personal rules for this sort of stuff.

A useful thing, especially in longer documents, is being able to include a dictionary of definitions for these terms. If I use the same term with the same definition in a dozen documents, that's the perfect use of an INClUDE statement.

So, I've made a new file, `dict.org`, and put some terms in it. They look like this:

BEGIN: key-term
- key term :: A /key term/ is a word or phrase whose definition is
			  fixed and precise within the scope of a document or
			  project.
END

Then, in any document where I'd have a dictionary that needs that definition, I can add in the line `#+INCLUDE: "./dict.org::key-term"` and the term will render in the dictionary! For the record, the document I was working on when I stumbled upon this need is my [_Online Communication Manual_](https://emsenn.neocities.org/online-communication-manual.html).

I'll need to write up the rules for how to name terms - and what to do if there is more than one definition for a term (though I can't think of any.) But, it's certainly a better solution than copy-pasting.

Oh, I didn't even mention: one perk of INCLUDE statements is that if I change the INCLUDEd file, I change what shows up every time the files that use it are exported - so to change the editorial and license information at the head of every document on my site, I just have to change one file, rather than re-copy/paste everything.

It's always awkward ending essays like this that are just kind of an explanation of how I did a thing. I'm done explaining now. Have a nice day.

## Supplements

- [Contribute](https://emsenn.neocities.org/keeping-a-personal-dictionary-with-org-mode#supplements-contribute)
- [License](https://emsenn.neocities.org/keeping-a-personal-dictionary-with-org-mode#supplements-license)

### Contribute

This document was made possible with contributions from humans like you. Thank you! I currently accept contributions through the following platforms:

- One-time through…
	- [Paypal](https://www.paypal.me/emsenn)
	- [Ko-fi](https://ko-fi.com/emsenn)
- Recurring through…
	- [Liberapay](https://liberapay.com/emsenn/donate)

If there is another service through which you'd like to contribute, please [send an email.](mailto:emsenn@emsenn.net) ***Please note*** that in accordance with my [personal directives #003](https://emsenn.neocities.org/personal-directives.html#003) and [#018](https://emsenn.neocities.org/personal-directives.html#018), I release all useful information I create for free, so financial contributions do not entitle you to access to any "exclusive content."

### License

Copyright 2019 emsenn

Permission is hereby granted, free of charge, to any person obtaining a copy of this document and associated media files (the "Document"), to deal in the Doftware without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Doftware, and to permit persons to whom the Doftware is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

**

The Document is provided "as is," without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose, or noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort, or otherwise, arising from, out of or in connection with the Document or the use or other dealings in the Document.

**

```org
Here's what I think about /Galavant/:

#+INCLUDE: "./foo.org"
```
