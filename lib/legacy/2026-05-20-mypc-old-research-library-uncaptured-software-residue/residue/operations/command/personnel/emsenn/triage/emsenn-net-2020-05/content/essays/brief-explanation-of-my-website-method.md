+++
title = "Brief Explanation of My Website Method"
author = ["emsenn"]
date = 2019-07-09
tags = ["web-development"]
draft = false
+++

I was asked by a couple people how I'm making my website. This will be brief and colloquial, since I plan on documenting it properly within the projects' sources itself. It's mostly written to them, and has that tone.

First, you can view my website's source at <https://emsenn.net/computer-instructions/personal-website/> and <https://emsenn.net/computer-instructions/hugo-personal-website-theme/>.

Alright so, my website has two core pieces, that I've just linked to:

-   the personal website itself, which is the content of the website
-   the hugo personal website theme. I know it's confusing, I like naming things what they are and NORMALLY I'm not writing about the two at the same time.

For speed and clarity I'm gonna call them PW and HT - _personal website_ and _hugo theme_.

Let's look at it working backward from the public website at emsenn.net.

That's deployed by [Netlify](https://netlify.com), which reads it from a repository on [Gitlab.com](https://gitlab.com). That repository contains the HTML files and images and stuff that make up the website. To be clear: the public HTML files (PHF), the finished site, is in its own Git repository, wholly separate from the PW and HT repositories.

The files in the PHF repo are created by [Hugo](https://gohugo.io), which is a _static site generator_ that takes specially formatted _Markdown_ and turns it into a featureful website. (Though I'll highlight my website doesn't have many features at the moment. I'm always tinkering, though!)

Sorry for the tangents; as I said this'll be colloquial, and well, I live in the American South. Be happy I'm not relating all this back to what happened at the church market last month, comparing it to how Amy gets her jams ready.

Anyway: So, the website at emsenn.net is put there by Netlify, which is watching a repo on Gitlab.com, which I put HTML files into, which are created by Hugo by reading specially formatted Markdown files. Pretend there's a break for questions here. If you're confused, stop here and come message me. In the next section I'll talk about how I make those Markdown files.

---

So, how do I make the Markdown? By using [Ox-Hugo](https://ox-hugo.scripter.co/) to on [Org-mode](https://orgmode.org/) files (or just sections of one).

Org-mode is a way of marking up text that's kind of like Markdown, but has a lot more features. Those features are implemented in the Emacs text-editor, which is what I use: you'll have to use it too, if you want to follow my method. (I think you _should_, too, but that's irrelevant: you _have to_ if you want to follow these instructions.)

This part of the process is always tricky to explain, so let's look at this essay. it exists in its own Git repo, `words`, and in that repo there's a `source.org`. The top of that file looks like this:

```org
#+author: emsenn
#+hugo_base_dir: ~/src/personal-website/
```

This sets up the author and where the root of my personal website is, "root" from Hugo's perspective. In the `word`'s source file that we're looking at, there's a headline for `Essays`. That headline looks like this:

```org
* Essays
  :PROPERTIES:
  :export_hugo_section: essays
  :END:
```

This tells Hugo to put every subsection we export from this one into the `content/essays/` directory, relative to the base directory we set up earlier.

Finally, this essay's title and info looks like this:

```org
*** Brief Explanation of My Website Method
    :PROPERTIES:
    :export_file_name: brief-explanation-of-my-website-method
    :topics:   Hugo; Markdown; Netlify; Org-mode; Ox-Hugo; websites, personal; websites, development;
    :END:
I was asked by a couple people how I'm...
```

This doesn't mention Hugo at all, but the export file name is the filename to save this as, minus the extension. So when I export this subsection from the `words` source file, it'll go to `~/src/personal-website/contents/essays/brief-explanation-of-my-website-method`.

And when I use Hugo to rebuild the website, it'll make a file in the public HTML repository, `essays/brief-explanation-of-my-website-method/index.html`.

And when I use Git to push these changes to Gitlab.com, Netlify will grab them and put it at <https://emsenn.net/essays/brief-explanation-of-my-website-method/index.html> (which, to be clear, doesn't need the "index.html" to be visited, I'm just being explicit.)

In Emacs, exporting a subsection like that is easy with hotkeys: `Ctrl-c, Ctrl-e, H, H`.

The "Native Content" in my personal website's source file is exported to the hugo section ".", which means "none" in this context. And so, the "Support" subsection is exported to `content/support/`, and ends up at <https://emsenn.net/support>. I can export every file in the subtree with `Ctrl-c, Ctrl-e, H, A`.

For pages that represent entire files, like my website's source file at <https://emsenn.net/computer-instructions/personal-website/>, they have text like this at the start of their file:

```org
#+export_file_name: ./personal-website
#+hugo_base_dir: .
#+hugo_section: computer-instructions
```

The Hugo personal website theme is the part that lets Hugo know how to take the Markdown Ox-Hugo makes and turn it into HTML. You can use other themes, so I'll not really explain it here.

So, my flow:

-   Write Things as Org-mode: either entire files or just sections inside a file, using Emacs.
-   Add properties like `hugo_base_dir`, `hugo_section`, and `export_file_name` to the Thing.
-   Use Ox-Hugo to export the Org-mode to Hugo-compatible Markdown.
-   Use Hugo to export that to HTML.
-   Use Git to push that HTML to Gitlab.com
-   Use Netlify to watch that Gitlab.com repo and deploy the website.

A lot of this could be much more automated, but I change how I do my website frequently so I haven't seen fit to automate anything yet.

I think that's the best explanation I can do in a vacuum - if you have any questions, come ask them!