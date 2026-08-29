+++
title = "Listing My Projects on My Personal Website"
author = ["emsenn"]
tags = ["web-development", "programming"]
draft = false
+++

I've been implementing my website as a series of static webpages, and today I'd like to build out the page listing my personal projects.

Last week I was giving some thought to how I'd like to handle this, and I decided for now, that I'm going to put a _JSON_ file in the root of my repositories, that'll have some information about the project. Then, I can use _Hugo_ to pull in that file from the repo, and turn it into a section on a page.

This means that by keeping a project's package definition up to date, my site's content will stay up to date as well - I think automatically if I can use POST webhooks to trigger a netlify build if a certain file in a git repo is changed. That's for another time.

The immediate problem will require me to work on three projects:

-   My `emsenn-website` project, where I keep my _personal website_.
-   My `hugo-personal-website-theme` project, which provides the theme
    to _Hugo_, that's used by `emsenn-website`.
-   Some third project that generates a _media package_. I could probably use the `media-package.json` from one of the other two projects, but I'd rather not risk stumbling into a recursion error if I can help it, or spend too much time mucking about fixing relative paths or something. I think I'll use my `brutstrap-css` project because it's relatively simple.

I want to take a step back, because programmers might be wondering about my language here if they haven't read my previous posts, and to be honest, I'm a bit muddy on it myself. Combining language from publishing and software development, along with my own ignorance, has left my language fairly imprecise. Hopefully, posts like this will help me clarify it.

I write all my stuff, whether it's an essay or source code for a web service, as documents, implemented in _Org-mode_. They're one big long text, with whatever code blocks or lists or tables are necessary embedded in them.

Each document is treated like a project - that's _Org-mode's_ term for it. Each project contains, beyond the document itself, a few rendered versions of the document (such as nice looking HTML), the extracted version of the source code from the project, and a few, uh, I don't have a term for them but... communicative files?

For example, a `README.md`, that's shown on the project homepage on most _Git forges_, or things like a `CODE_OF_CONDUCT`, or the `media-package.json` that I mentioned. Files that exist to communicate information about the project to folk, outside the context of the project itself. (The source file, its renderings, and its extracted source are Watsonian components of the project, while the readme, code of conduct, media package, and other such files are Doylian components.

Here's what the `brutstrap-css` directory looks like:

{{< highlight text "linenos=table, linenostart=0" >}}
./
 | brutstrap-css.html
 | brutstrap-css.org
 | brutstrap-css.tex
 | brutstrap-css.txt
 | brutstrap.css
 | README.md
 | media-package.json
 | src/
      | index.org
{{< /highlight >}}

The first four files are renderings, the fifth is the Brutstrap stylesheet itself, the sixth the project readme, the seventh its media package definition, and then in the `src/` directory is the source file itself - what I actually edit to work with the project.

The specifics of the Brutstrap package don't matter, but let's look at its `media-package.json`. This is the file I'll be pulling into _Hugo_, to turn into the project listing.

Why do I call it a media package? Because it's not intended to for linking to the extracted code, or source file, but the various rendered documents: pieces of text media.

Anyway, here's `brutstrap-css/media-package.json`

```json
{"brutstrap-css": {
    "name": "Brutstrap CSS",
    "creator": "emsenn",
    "license": "CC0",
    "description": "a cascading stylesheet for representing HTML content as it is constructed",
    "versions": {
      "current": {
	  "sourcehut": {
	      "location": "https://git.sr.ht/~emsenn/brutstrap/tree/refs/heads/master/",
	      "formats": ["html","md","pdf","tex","txt"]
	  }
      }
   }
}}
```

This is pretty simple, so hopefully kind of self-explanatory.

The next thing I want to do is write out is how I'll record the listing in my `emsenn-website` project, and then I'll change the `hugo-personal-website-theme` project so it's capable of making the two communicate.

For now I'll keep it fairly simple; here's what I'm thinking should work:

```markdown
  +++
  title = "Projects"
  layout = "media-package-list"
  mediaPackages = [
    "https://git.sr.ht/~emsenn/brutstrap-css/blob/master/media-package.json"
  ]
  +++
This page is a listing of my projects.
```

I'll add more URLs to the mediaPackages list once I have them, but for now, that should work.

Well, will work, once I make the match `media-package-list` _Hugo layout_.

That looks like this:

```html
{{ define "main" }}
  {{ with .Content }}{{ . }}{{ end }}
  {{ partial "media-package-listing" . }}
{{ end }}
```

Fairly simple - but that's because it relies on a _partial layout_, `media-package-listing`, which is a bit more complex.

```html
{{ with .Params.mediaPackages }}
  <ul>
    {{ range . }}
      {{ with getJSON . }}
	{{ range $packageID, $packageDetails := . }}
	  <li>
	    {{ $packageDetails.name }} - Created by
	    {{ $packageDetails.creator }}, {{ $packageDetails.name }} is
	    {{ $packageDetails.description }} released under the
	    {{ $packageDetails.license }}.
	    {{ if $packageDetails.versions.current }}
	      The current version is available through the following
	      locations and formats:
	      {{ with $packageDetails.versions.current }}
		<ul>
		  {{ range $originName, $originDetails := . }}
		    <li>
		      <strong>{{ $originName | title }}</strong>:
		      {{ range $originDetails.formats }}
			<a href="{{ $originDetails.location }}{{ $packageID }}.{{ . }}">
			  {{ . }}
			</a>
		      {{ end }}
		    </li>
		  {{ end }}
		</ul>
	      {{ end }}
	    {{ end }}
	</li>
      {{ end }}
      {{ end }}
    {{ end }}
  </ul>
{{ end }}
```

I'm not going to bother explaining how that works, exactly, but here's the relevant HTML from the "Projects" page:

```html
<main>
  <p>
    This page lists my projects.
  </p>
  <ul>
    <li>Brutstrap CSS - Created by emsenn, Brutstrap CSS is a
      cascading stylesheet for representing HTML content as it is
      constructed, released under CC0. The current version is
      available through the following locations and formats:
      <ul><li><strong>Sourcehut</strong>:
	<a href="...brutstrap-css.html">html</a>
	<a href="...brutstrap-css.md">md</a>
	<a href="...brutstrap-css.pdf">pdf</a>
	<a href="...brutstrap-css.tex">tex</a>
	<a href="...brutstrap-css.txt">txt</a>
      </li></ul>
  </li></ul>
</main>
```

I'll probably end up changing the styling and layout a fair bit, but honestly I'm pleased with this as a first draft - I can put a `media-package.json` following that format anywhere online, and then all I need to do to add that package as a project on that list is add it to the appropriate list.

It's the start of a homegrown package management system I've written about before, where it's focused entirely on the distribution of media content, no real toolkit or accomodation for a build chain.

The next step from here will be implementing the media package in some more projects and seeing if it actually all works in production.