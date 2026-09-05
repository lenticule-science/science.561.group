+++
title = "Implementing a Personal Website with Hugo, Netlify, Org-mode, and Ox-Hugo"
author = ["emsenn"]
tags = ["Hugo", "Netlify", "OrgMode", "OxHugo", "web-development"]
draft = false
+++

I've been reworking my online presence recently, and part of that has been to change how I handle the website at `emsenn.net`.

I've put a fair bit of thought into the generalities of how I want to handle it, but not the specifics. But first, let's look at the parts of my online identity I have set up right now, that I don't have any plans to change:

-   I conduct _email_ through [emsenn@emsenn.net](mailto:emsenn@emsenn.net).
-   I post publicly at [https://posts.emsenn.net](https://posts.emsenn.net). Those posts are also available through an _email list_, at [https://posts.emsenn.net/#subscribe](https://posts.emsenn.net/#subscribe). They're also available as an _RSS_ feed at [https://posts.emsenn.net/feed/](https://posts.emsenn.net/feed/) and through the _ActivityPub_ protocol at `@emsenn@posts.emsenn.net`.
-   I do two-way communication through _ActivityPub_ at `@emsenn@tenforward.social`. You can view the public posts associated with that account at [https://tenforward.social/@emsenn](https://tenforward.social/@emsenn).
-   My primary _Git forge_ is _Sourcehut_, at [https://git.sr.ht/~emsenn](https://git.sr.ht/~emsenn). I like its approach to using existing tools properly, rather than adding on new tools, when it comes to stuff like bug-tracking. (Even though I don't use those features.
    -   I use _Gitlab_ to mirror my projects on _Sourcehut_, at [https://gitlab.com/emsenn](https://gitlab.com/emsenn).
    -   I also mirror them on _Github_ at [https://github.com/emsenn](https://github.com/emsenn).

I'm not sure what the full scope of `emsenn.net` will be, but I don't plan on it being a _dynamic website_ - nothing I do happens so rapidly that I need to run something like that: I can serve up _static_ resources like HTML and JSON files, that are compiled well in advance of the request.

I like _Hugo_ as my _static site generator_ - it's powerful enough to meet my needs without being so powerful I get bogged down in different ways to do things.

So, I know that's one part of my _software stack_: the layers of software used to accomplish a task.

I also like _Netlify_ as a _webhost_ for _static websites_ - they have an incredible amount of features, that don't get in the way until you want them there. That's one end of the _stack_: publishing on _Netlify_.

Netlify can source its sites from three _Git forges_: _Gitlab_, _Github_, and _Bitbucket_. I prefer _Gitlab_ to _Github_, since _Gitlab_ is funded by users rather than owned by _Microsoft_, so I'll use _Gitlab_ as the source for _Netlify_. And since the _Gitlab_ repo is simply a mirror of the _Sourcehut_ _Git forge_, which is in turn just a presentation of my local _Git repository_, that gives me four sequenced tools in the _stack_: _Git_ to _Sourcehut_ to _Gitlab_ to _Netlify_.

That still leaves what is in the _Git repo_ unsorted, as well as how it gets built by _Hugo_. It's been a bit since I've worked with _Netlify_ and _Hugo_ and all this, and I was never that experienced with it when I was, so at this point, I'll need to start setting things up before fleshing out that part of the _stack_.

So let's look at instead what I'm working with as the _source code_ for the website. It's organized like any of my other projects, under the `~/org/projects/` directory on my server. Here's what the `emsenn-website` directory under that looks like:

```txt
./
 | README.md
 | emsenn-website.html
 | emsenn-website.org
 | emsenn-website.pdf
 | emsenn-website.tex
 | src/
      | emsenn-website.org
      | build/
	     | content/
	     |        | <site pages go here>
	     | data/
	     |     | <site data goes here>
	     | themes/
	     |       | hugo-personal-website-theme/
	     | config.toml
```

The only file I edit by-hand is `./src/emsenn-website.org` - the other files are _tangled_ from it - extracted from code blocks written into the text of `./src/emsenn-website.org`.

Here's an overview of that document's sections:

-   "Operations" has shell scripts and instructions for working with the source file or otherwise working with the personal site. Any of the shell scripts can be run from inside _Org-mode_, and the results included in any exported document, if that's useful.
-   "Hugo Configuration" has _Hugo configuration_. Pretty simple. It's extracted from this source file by using _Babel_ to _tangle_ (extract) the configuration.
-   "Content Pages" has sections for the website's pages. They're exported with _Ox-Hugo_, an _Emacs_ package for exporting _Org-mode_ to _Hugo_-compatible _Markdown_. These files end up in `./src/build/content/`.
-   "Site Data" has some _TOML_ files that have information about my recent activities and plans, for now. These files end up in `./src/build/data/`

The themes directory contains a directory, `hugo-personal-website-theme`, which is a _Hugo theme_ that I'm working on - I'll probably write about it elsewhere, but it's a _Git submodule_, so it gets updated by using the `git pull` command after using `git checkout master` in the `./src/build/themes/hugo-personal-website-theme/` directory.

So - that's one early part of the stack - update the themes with _Git_, and the commands for doing so are included in the "Operations" section.

The other early parts of the stack are exporting the content as _Hugo_-compatible _Markdown_, and the data as _TOML_ files.

The former I accomplish with _Ox-Hugo_ and _Org-mode's_ exporting features. The latter I accomplish with _Babel_, an _Org-mode_ package that enables the running and extraction of computer code inside _Org-mode_ files.

I think I've covered all of how I go from a single source file, `src/index.org`, to the directory I laid out above.

This whole directory is a _Git repository_, that as I said, I host on _Sourcehut_, _Gitlab_, and _Github_.

(Actually at the moment _Gitlab_ isn't working for me so I'm just using the other two.)

I've told _Netlify_ to look at the _Github_ version of the _repository_, and give it the build instructions `cd src/build && hugo` - apparently these days _Netlify_ knows enough to do things properly from there - I also told it the final website is in `./src/build/public/`, but beyond that, no other configuration was necessary.

So, to try and sum it up:

-   From within _Emacs_, looking at `./src/index.org`, I:
    -   Run the script to update the _Git submodule_ that is at
        `./src/build/themes/hugo-personal-website-theme/`.
    -   Export all subtrees using _Ox-Hugo_, which copies them into
        `./src/build/contents/`.
    -   Run _tangle_ on the file, which extracts things like my recent
        activities and plans to `./src/build/data/`, and the _Hugo_
        configuration to `./src/build/config.toml`.
-   Run the command `git add .` to record the updates.
-   Run `git commit` to explain the updates.
-   Run `git push` to send them to _Sourcehut_,
    -   which is mirrored by _Github_,
        -   which is watched by _Netlify_, which clones the _repository_
            and:
            -   runs `cd ./src/build && hugo` to build the site.
            -   uploads `./src/build/public` as the final site.