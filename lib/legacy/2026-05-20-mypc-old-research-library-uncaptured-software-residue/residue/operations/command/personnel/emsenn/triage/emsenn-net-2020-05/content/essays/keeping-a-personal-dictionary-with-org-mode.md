+++
title = "Keeping a Personal Dictionary with Org-mode"
author = ["emsenn"]
tags = ["OrgMode"]
draft = false
+++

A few days ago I wrote a letter to my parlour, where I explained how I
updated my website to make better use of some of Org-mode's more basic
features, like `INClUDE` statements, or the index features.

Today I stumbled upon a new use - to me - for Org-mode's `INCLUDE`
statements. A brief explanation, first:

A file, `foo.org`, contains the text: `/Galavant/ was a great
television show.` Another file has the text:

```org
Here's what I think about /Galavant/:

#+INCLUDE: "./foo.org"
```

If I _export_ that file, the text will show up as:

```text
Here's what I think about /Galavant/:

/Galavant/ was a great television show.
```

A silly example. More pragmatically, unless I've changed my method
since writing it, this document's introduction contains at least one
INCLUDE'd statement - the editorial and license information, and
perhaps the disclaimer about literate programming, and the license in
the supplements was INCLUDE'd as well. It helps me not repeat myself.

So, that's INCLUDE statements.

Now, some background on me: because of the type of content I write, I
end up being very precise in my use of some terms that might have a
more casual meaning elsewhere. In software documentation, "archive"
might mean something very very particular. In role-playing games,
"sleeping" might not include naps, and so on.

I've developed the style of italicizing these _key terms_ when I use
them before defined, and using bold italics when I define them: **_key
terms_** are those words that have a technical meaning within the scope
of a document. I also italicize key terms if they get mentioned a
decent enough distance from their definition, like in another section.
If you're curious, I'm developing my own _Style Manual_ that explains
a lot of my personal rules for this sort of stuff.

A useful thing, especially in longer documents, is being able to
include a dictionary of definitions for these terms. If I use the
same term with the same definition in a dozen documents, that's the
perfect use of an INClUDE statement.

So, I've made a new file, `dict.org`, and put some terms in it. They
look like this:

```org
BEGIN: key-term
- key term :: A /key term/ is a word or phrase whose definition is
	    fixed and precise within the scope of a document or
	    project.
END
```

Then, in any document where I'd have a dictionary that needs that
definition, I can add in the line `#+INCLUDE: "./dict.org::key-term"`
and the term will render in the dictionary! For the record, the
document I was working on when I stumbled upon this need is my _Online
Communication Manual_.

I'll need to write up the rules for how to name terms - and what to do
if there is more than one definition for a term (though I can't think
of any.) But, it's certainly a better solution than copy-pasting.

Oh, I didn't even mention: one perk of INCLUDE statements is that if I
change the INCLUDEd file, I change what shows up every time the files
that use it are exported - so to change the editorial and license
information at the head of every document on my site, I just have to
change one file, rather than re-copy/paste everything.

It's always awkward ending essays like this that are just kind of an
explanation of how I did a thing. I'm done explaining now. Have a nice
day.