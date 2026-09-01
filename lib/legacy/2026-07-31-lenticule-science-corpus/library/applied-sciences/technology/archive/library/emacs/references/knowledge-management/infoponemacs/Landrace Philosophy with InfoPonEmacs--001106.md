---
dg-publish: true
type: "[[descriptive essay]]"
series: "[[Catalog of emsenn's Letters to the Web]]"
description: Looking at managing knowledge with a bespoke Emacs configuration.
date-published: "[[2023-09-04]]"
---

I mentioned briefly in my Ko-fi blog post that "I'm going to come back to representing myself, as myself, not focusing on building up a presence for any of the groups I coordinate with."

That's a pretty abstract sort of declaration, so I'd like to take some time to explain what exactly I mean by it. I'm hoping that this might be the first in a series of fairly casual posts onto my Ko-fi, that can serve as a kind of re-introduction into who I am and what that means I do, in a more holistic way than just seeing a photo from the garden or a snippet of political thought every three months.

As folk around me note, I tend to do things for my own reasons; I appear to practice a coherent philosophy that affects how I view and interact with the world around me, and this philosophy is notably different (and dischordant) from the philosophy that's hypernormalized in our society.

A part of this practice, for me, has always been keeping some sort of records - if only very firm memories - of what it is I believe, and why. I've pretty much always maintained access to computers, so often times these records are digital.

In the late 2010s a term, "digital garden," started to become more popular, and it fit very well for the kind of work I do on a computer. The metaphor also allows me to explain my motivation for recordkeeping in another way.

By doing digital gardening, I am stewarding those qualities of information I find valuable into growth, and limiting the qualities that I view harmful. The records serve as a tool for framing what's going on in my day through my own philosophy, and this lets me, over time, develop a "landrace philosophy," one that is cultivated out of the experiences of its own environment.

Over the years I've used a wide range of tools to do digital gardening, as influenced by my environment as the information that went into them. These days, I'm using Emacs, a text-editor, and Org-mode, a text-markup, to get the work done. Emacs, for those readers who don't know, is a ridiculously sophisticated (complex) text-editor. In fact, its fans and detractors both make the joke that "Emacs is a fine operating system, but it's a shame they didn't include a text editor." One cool thing about Emacs is that it runs using its own programming language, Elisp, and so is really, _really_, configurable. In fact it's so configurable, there's different "flavors" of Emacs a person can run, and many users have created what's called an "Emacsen," an Emacs configuration that's catered to exactly how they use Emacs and their computers.

Org-mode is a way of writing text files so that the Org-mode interpretter, which runs inside Emacs, can extrapolate data from relatively human-readable files. Y'all might be familiar with Markdown, which lets you put a word in `*asterisks*` and the computer can swap those for _emphasis_ when the text is rendered. Org-mode is like that, but with a _lot_ more features. It lets you associate schedules and deadlines with topics, give them progress states, tags. You can use all this metadata to filter and report across files. Org-mode also allows for _tangling_ code in with writing, so a document can be both the words about some computer code, and the computer code.

There's a third component to this, called Beancount, which is software for maintaining ledgers. This is a big part of the "code" that is tangled in with the rest of the records.

My Emacsen configuration, I call "InfoPonEmacs," a portmanteau of _information_, _ponics_ (derived from hydroponics et al), and Emacs. It's essentially a very bare-bones Zettelkasten system, if readers are familiar with that. _(It's so bare-bones because I'm often running Emacs on phones hooked up to bluetooth keyboards, and so something like Org-roam with its running database system just isn't feasible.)_ I'm not ready to release any of it yet, but I thought the techy folk in the readership here might be curious to know what specific tech tool I use to maintain my center.