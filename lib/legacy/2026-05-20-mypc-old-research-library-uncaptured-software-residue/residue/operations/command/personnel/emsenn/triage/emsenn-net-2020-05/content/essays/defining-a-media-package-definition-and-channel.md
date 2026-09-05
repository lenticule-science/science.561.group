+++
title = "Defining a Media Package Definition and Channel"
author = ["emsenn"]
tags = ["software", "technology"]
draft = false
+++

Earlier today I wrote about creating a "personal media storefront," a place where I could maintain a listing of all the things I've made, where they're available, and in what formats.

I spent some time prototyping out a collection of _Hugo_ templates for that purpose, and realized that basically what I'm building is a package reposistory, but for media, not software. Since then I've tried to think of things in that way - tricky, as I don't know that much about how software package managers work. Luckily, I've been learning to use _Guix_ recently, and that gave me an exposure to its package definitions, and gave me some vocabulary to use moving forward.

What I was calling a "storefront" - a bad metaphor since I had no intention of charging for access to content - I'll now call a "channel." I'll have my channel, and you, another content creator, would have yours.

I'm picturing a shell script based on `curl` that can do something like `mepach download --channel "https://mepach.emsenn.net/" shaggy-dog-tale`.

This would `GET` a `json` file at, say `https://mepach.emsenn.net/get/shaggy-dog-tale`, which would have a package definition.

"Mepach" here is a potential name for this project, short for MEdia PAckage CHannel. I've just searched online and it doesn't seem to be an existing term in computing.

At `https://mepach.emsenn.net/shaggy-dog-tale` there would be an HTML representation of the project, and that's what I've been working on most recently.

A thought - in my previous devlog and prototyping, I used different _Hugo content types_ to categorize content. I don't think I should do that, so it is easier to make assumptions about a package's location.

Here's the example package definition I made earlier:

```toml
+++
title = "A Shaggy Dog Tale"
description = """This is a story that doesn't go anwhere."""

[v."1.0.1"."github"]
location = "https://github.com/emsenn/master/"
formats = ["org", "html"]
[v."1.0.1"."local"]
location = "/store/"
formats = ["org", "html"]

[v."1.0.0"."local"]
location = "/store/"
formats = ["org"]
+++
```

```markdown
This story is about a dog that does a lot of things, but never
 really gets anything done.
```

I've split it into two sections because it uses two languages - _TOML_ for the _Hugo front matter_ and _Markdown_ for the content.

The first parameters are general facts about the document the package is representing - for now, its `title` and a `description`. Neither needs to be required; a working title can be inferred from the package definition's file name, which is required to be the package's "slug," or identifier. The example here is saved at `./content/shaggy-dog-tale.md`.

The `description` is wrapped in three `"` instead of one so it can use linebreaks - though I might be doing that wrong; I'm not familiar with the finer points of _TOML_ yet.

Below those general parameters is information about different
versions.

Each _dictionary_ representing a version of the document needs to start with `v`. The dot in-between separates that from the version number itself, and the version origin - more on that shortly. So that the version number's dots don't get parsed, it's wrapped inside quotes. The origin is also wrapped in quotes, since it might contain special characters.

The origin is where the document can be found - whether it's available locally, or through a _Git forge_, or some other website or protocol.

In the example above, version `1.0.0` is available through the `local` origin, and version `1.0.1` is available through the `local` and `github` origin.

Each _dictionary_, then, specifies a version and origin. I don't have a term for this dictionary, perhaps "source dictionary"?

For now, I'll go with that. So each source dictionary contains two keys, the `location` and the `formats`.

The `location` says where the files are. The `formats` say which formats are available at that location.

I should be clear, this is the internal format that's used to generate the actual package formats - I need to develop a better grasp of terms here so I can be more clear. This _TOML_ + _Markdown_ package definition is used on the backend, and will be turned into an actual useful package definition by the so-called media package channel generator I'm working on.

I've already built a badly-executed _Hugo layout_ for turning this into an _HTML_ page, here's an example of how the above looks. **Links will be broken.**


## A Shaggy Dog Tale {#a-shaggy-dog-tale}

-   **1.0.1**:
    -   github:
        -   [html](https://github.com/emsenn/shaggy-dog-tale/blob/master/shaggy-dog-tale.html)
        -   [org](https://github.com/emsenn/shaggy-dog-tale/blob/master/shaggy-dog-tale.org)
    -   local:
        -   [html](https://mepach.emsenn.net/store/shaggy-dog-tale/1.0.1/shaggy-dog-tale.html)
        -   [org](https://mepach.emsenn.net/store/shaggy-dog-tale/1.0.1/shaggy-dog-tale.org)
-   **1.0.0**
    -   [org](https://mepach.emsenn.net/store/shaggy-dog-tale/1.0.0/shaggy-dog-tale.org)

So to spell it out:

-   I'll write a package "definition" in _TOML_ and _Markdown_. I don't
    like calling this the definition, but don't know what else to call
    it.
-   Then, _Hugo_ will turn that into an _HTML_ and a _JSON_ file.
-   Those get made available somewhere on the Web.
-   Someone can use them as a package definition to download their
    version and format of the document of choice.

The main use here is still, I think, that I'll have a website where I'll be able to look up any mirror and old version of my documents.

But the packaging stuff is cool to look at, too.