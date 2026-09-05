+++
title = "Using Elisp to Define a Media Package Channel"
author = ["emsenn"]
tags = ["elisp"]
draft = false
+++

In my last post I wrote about how I've come around to understand _functional programming_, without really setting off to.

In this post I'm going to go back and look at a concept I've been chewing on recently, of a _media package channel_. I have a lot of documents, that are available in different places, in different formats. I want a way to have a record of where they all are, that I can work with in a meaningful way to get the latest version of the rendered doc. Note that this is different than something like _Git_, which is for - usually - getting a whole source repository. I suppose the project could be written on top of _Git_, if each format were... tagged as its own release and the rest of the files were ignored for that tag?

It's not worth exploring because often, docs aren't in _Git_ repositories, and that's even more often true for other forms of media.

Anyway, my notion for the _media package_ stuff is similar to how _software packages_ work, where there's a _channel_ that has a list of _packages_, and a manifest for each package. In an earlier draft, I implemented the notion of such a _media package channel_ definition in _JSON_. Here's what that looked like:

<a id="code-snippet--json-package-channel"></a>
```json
{"brutstrap-css": {
    "name": "Brutstrap CSS",
    "creator": "emsenn",
    "license": "CC0",
    "description": "a cascading stylesheet for representing HTML content as it is constructed.",
    "versions": {
      "current": {
	  "sourcehut": {
	      "location": "https://git.sr.ht/~emsenn/brutstrap-css/blob/master/",
	      "formats": ["html","md","pdf","tex","txt"]
	  }
      }
   }
}}
```

<div class="src-block-caption">
  <span class="src-block-number"><a href="#code-snippet--json-package-channel">Code Snippet 1</a></span>:
  A block of <i>JSON</i>, <code>json-package-channel</code>
</div>

Last night after writing about my understanding of _functional programming_, I figured it was time to learn some _Elisp_ syntax, since, as an _Emacs_ user, that's a convenient language for me to write functions in.

Here's one way - probably the wrong way - of representing the _JSON_ above as _Elisp_:

<a id="code-snippet--elisp-package-channel"></a>
```elisp
'(("brutstrap-css"
   ("name" . "Brutstrap CSS")
   ("description" . "a cascading stylesheet for representing HTML content as it is constructed.")
   ("creator" . "emsenn")
   ("license" . "CC0")
   ("versions"
    ("current"
     ("sourcehut"
      ("location" . "https://git.sr.ht/~emsenn/brutstrap-css/blob/master/")
      ("formats" . ("html" "md" "pdf" "tex" "txt")))))))
```

<div class="src-block-caption">
  <span class="src-block-number"><a href="#code-snippet--elisp-package-channel">Code Snippet 2</a></span>:
  An Elisp list, <code>elisp-package-channel</code>.
</div>

Now, I should be able to write a function that takes some inputs, and gives me back a path to the package specified.

<a id="code-snippet--get-package-location"></a>
```elisp
(defun get-package-location
    (channel id version origin format)
  "Return the address of version VERSION of media package ID as
  defined by media package channel CHANNEL from source ORIGIN in
  format FORMAT."
  (concat
      (cdr (assoc "location" (cdr (assoc origin (cdr (assoc version (cdr (assoc "versions" (cdr (assoc id channel))))))))))
      id
      "."
      format
   ))
```

<div class="src-block-caption">
  <span class="src-block-number"><a href="#code-snippet--get-package-location">Code Snippet 3</a></span>:
  An Elisp function, <code>get-package-location</code>.
</div>

And now, I should be able to call that function, with a line like:

```org
#+CALL: get-package-location(channel=elisp-package-channel, id="brutstrap-css", version="current", origin="sourcehut", format="html")
```

Let's see what happens:

Hmm. That's not quite what I expected - it gave me the function name,
not the function itself...

Oh. I'm only defining the function there, not calling it.

```elisp
(get-package-location channel id version origin format)
```

Now let's call THAT, with

```org
#+CALL: call-get-package-location(channel=elisp-package-channel, id="brutstrap-css", version="current", origin="sourcehut", format="html")
```

Hey! That works! But there has to be a more straightforward way to do this, than writing a function and a separate call block...

I could do, instead, a source block that calls the function... but then I have to pass the variables to that source block, and then the function.

Could I... not have it in a function declaration, and still pass it variables?

Let's try:

<a id="code-snippet--get-package-location-2"></a>
```elisp
(concat
 (cdr
  (assoc "location"
       (cdr
	(assoc origin
	       (cdr
		(assoc version
		       (cdr
			(assoc "versions"
			       (cdr
				(assoc id channel))))))))))
 id
 "."
 format
 )
```

<div class="src-block-caption">
  <span class="src-block-number"><a href="#code-snippet--get-package-location-2">Code Snippet 4</a></span>:
  An <i>Elisp</i> statement, <code>get-package-location-2</code>
</div>

That's named `get-package-location-2`, so if I call it the same as I tried the first time...

Then it works! Wonderful!

But let's admit, `get-package-location-2` is a rubbish function name, and now, I'm not sure the best way to get it back into an elisp block, if I'd want to call it there - I suppose beyond passing it as a variable, explicitly?

Perhaps at this point it would be worthwhile to look at how something _literately programmed_ in _Elisp_ would look, but I'm not finished exploring the topic myself yet.

And I'm glad - I see the section of the reference manual that's relevant. I've used it before - and even written about using it before, but haven't really used it for several months: _Noweb_.

_Noweb_ is part of _Babel_, I think, the same featureset that lets you take the code blocks and put them into separate files. It lets you reference a code block by name, by putting it inside `<<>>`, so `<<get-package-location-2()>>`

Let's try that - but I'm going to, instead of using a source code block, try my hand at at some inline source: .

Well it has a bunch of weird escapes now... Let's try that in a source block

```elisp
'<<get-package-location-2(channel=elisp-package-channel,id="brutstrap-css",version="current",origin="sourcehut",format="html")>>
```

Interesting side effect! I don't... I don't want it, do I? Let me try another approach

```elisp
(prin1
 '<<get-package-location-2(channel=elisp-package-channel,id="brutstrap-css",version="current",origin="sourcehut",format="html")>>)
```

So the string that's given to the source block has the escapes.

```text
https://git.sr.ht/~emsenn/brutstrap-css/blob/master/brutstrap-css.html
```

But the string output by Elisp does not.

<a id="code-snippet--get-package-location-test-1"></a>
```elisp
(prin1 (get-package-location channel id version origin format))
```

Yup, definitely not, it's a noweb thing. Well, I'm not going to stress any more about it in the abstract. I think I've got a feel for how to at least start using source blocks and functional programming together. My next step will be outlining the document into which that code will go and be written about, and then, well, it'll be time to start planning the actual code.