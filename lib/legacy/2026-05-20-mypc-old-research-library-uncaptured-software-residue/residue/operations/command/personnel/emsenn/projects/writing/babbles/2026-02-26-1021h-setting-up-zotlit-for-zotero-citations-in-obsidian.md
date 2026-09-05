---
title: "2026-02-26, 1021h, Setting up zotlit for zotero citations in Obsidian"
aliases:
  - "2026-02-26, 1021h, Setting up zotlit for zotero citations in Obsidian"
  - "2026-02-26, 1021h, setting up zotlit for zotero citations in obsidian"
date-created: 2026-02-26T10:21:00
type: babble
tags: []
cites:
  - "Moloch's Bargain as Necessary Misalignment of Truth-Value Under Epistemic Constraint"
---
In order to enrich my notes in a certain way, I need to figure out how I'm going to handle citations.

I was starting to use Zotero, toward the end of 2025, because extending out of critical theory into other sciences meant I was incorporating way more sources into any given piece of writing.

And, I'd figured out some way, if I recall, of exporting my Zotero bibliography to a single file, which my Org-mode files were able to draw on in such a way that when I published PDFs or HTML files, a bibliography was properly rendered at the bottom of the page.

I'm guessing, without going further into it, that the [static site generator](../../../general/terms/static-site-generator.md) I'm using, Quartz, doesn't have an innate capability of doing something like that, because Obsidian doesn't. So I will probably have to divide this into a few chunks:

- Getting my Zotero bibliography out of Zotero and someplace where my Obsidian vault can see it.
- Getting my Obsidian notes to be able to treat those entries as some type of linkable thing.
- Getting Quartz to render a bibliography of the citations used in a given note, when it's turned into a page.

I'm just assuming that getting Quartz to do that will require writing some new "component" for it, and I believe that'd require using JavaScript, so I'm comfortable postponing that for now. As-is, citations are just, broken or unavailable, and I receive few complaints, so the focus is very much on improving the research, not publishing, side of things.

When I took a brief look at this stuff last night, I found the [Zotlit](https://zotlit.aidenlx.top/) extension, which seems to be in that sweet spot of developed-enough, and still-actively-developing, that makes it a good choice.

I've just gone ahead and installed that, enabled it, configured "literature notes" to go into [References](../../../general/references/index.md) and... testing something, here: [@emsenn_MolochsBargainNecessaryMisalignment_2025] 

Yes, that seems to find things in my Zotero library seamlessly. And if I click through to that, it attempts to open the matching file in /References/ - creating it, since it didn't already exist. A bit of poking, and it seems like it finds the file via the `citekey` frontmatter, which means I'm free to change any other part of the file how I like. It also means, I think, that I can add things to that folder which aren't in my Zotero, i.e. [@emsenn_test_2026]

...Yes, but then I don't get autocomplete via Zotero's API. Fair enough.

And, this is actually without installing the plugin to Zotero.

I've now done that, and I see it gives me the ability to create or update a literature note from Obsidian. That's handy, because it means that - with some template tweaks, I believe - I can make my Obsidian notes have all the information I want from my Zotero stuff.

I'll have to actually try and fix up the citations in something, now, but that should be all I need to get set up to make citations work better, internally.

Since that was easier than expected, let me check what Quartz has to say about citations...

Surprising! There's a whole (short) [page of documentation](https://quartz.jzhao.xyz/features/Citations) on the concept. It tells me that it's using [Rehype-Citation](https://github.com/timlrx/rehype-citation), which I hadn't heard of before, but it looks like I might actually have functional citations *now*, without further configuration... Oh! Missed a line on the Quartz documentation: I have to learn how to enable the Citations plugin, which I think is explained [on the Configuration docs](https://quartz.jzhao.xyz/configuration).

So, this teaches me that plugins "act as a series of transformations over content," and fall into three categories: transformers, filters, and emitters. The Citation doc says it's a Transformer.

That means I'll be editing `config.configuration.plugins.transformers` in `quartz.config.ts`, in my Quartz instance.

Ahh - reading that Citations document more, it uses a local bibliography (`.bib`) file to find its citations, so I will have to remember to export my Zotero bibliography before building the site.

Having done that, I think I'm ready to try building the site...

...Which is throwing an error:

```
Failed to process html `content/Personal/Letters to the Web/2017-01-01, Public Posts Implicitly Endorse the Framework They Discuss.md`: Cannot read non valid bibliography URL in node env.        
    at trace (../util/trace.ts:37:11)  
    at ../processors/parse.ts:137:9  
```

Checking the file which triggers the failure, I don't actually see any links at all, or even a `@`...

So I'm thinking perhaps which file it failed to process is irrelevant, and what matters is that the "bibliography URL" is invalid. I'm assuming that means the path to the bibliography file - let me double-check where documentation says it should be.

Ahh, "`./bibliography.bib` relative to the git source of the vault," but I think it might mean "relative to the git source of the Quartz instance," so I'm going to move the bibliography up a level, from the `./content/` directory where the Obsidian vault is, to `./` where Quartz is.

That seems to have done it! The site at least builds, and, if I look at this babble, yes! We get citations.

That was so much easier than I hoped.