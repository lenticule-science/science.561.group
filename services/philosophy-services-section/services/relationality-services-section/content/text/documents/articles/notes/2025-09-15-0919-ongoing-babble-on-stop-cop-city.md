---
title: Babble, 2025-09-15 09:19 – Properly installing Fennel on my Omnibook
author: emsenn
date-created: 2025-09-15
type: babble
status: draft
keywords:
  - babble
  - fennel
  - tooling
publish_to:
  - emsenn-net
---

The last time I "installed Fennel", it was just by "installing" TAB. This go around I'd like to more properly get it set up as accessible from my user's shell, so I can use it like a proper interpreter across GnoponEmacs.

So I don't forget, there's this [wonderful post](https://andreyor.st/posts/2024-12-20-extending-emacs-with-fennel/) from Andrey Listopadov about using Fennel in Emacs. I'll be using that, [the Fennel docs](https://fennel-lang.org/setup), and the documentation for [fennel-mode](https://git.sr.ht/~technomancy/fennel-mode) to navigate through this process. My goal is to be able to use Fennel anywhere I might use another language with Org-babel, but skimming through Andrey's blog post, I suspect I can do more than that.

Following the install instructions for the Fennel script works great, so I can move on to integrating it into GnoponEmacs, starting with fennel-mode.

The following are the use-package declarations I'm starting with.

```elisp
(use-package lua-mode
  :straight t
  :mode ("\\.lua\\'" . lua-mode))

(use-package eglot
  :straight t
  :commands (eglot eglot-ensure))

(use-package fennel-mode
  :straight (:host sourcehut :repo "technomancy/fennel-mode")
  :mode ("\\.fnl\\'" . fennel-mode)
  :commands (fennel-mode fennel-repl)
  :init
  (setq inferior-lisp-program "fennel")
  (autoload 'fennel-proto-repl-minor-mode "fennel-proto-repl" nil t)
  (autoload 'antifennel-mode "antifennel" nil t)
  (with-eval-after-load 'org
    (require 'ob-fennel))
  :hook
  (fennel-mode . fennel-proto-repl-minor-mode)
  (fennel-mode . eglot-ensure)
  (lua-mode . antifennel-mode)
  :config
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
                 '(fennel-mode . ("fennel-ls")))))
```

Opening a new buffer in fennel-mode and running `(print "test')` asks me about starting up a Fennel proto-REPL, so I do, and it works fine. Lets see if it works for code blocks:

```fennel
(+ 2 2)
```

Results:

```text
4
```

From my end, that looks perfect, even if doesn't render right upon publishing.

Now, lets see... how things relate: does setting a variable in the fennel-mode buffer make it accessible here? Like... I don't know/understand the underlying tech stack here, but I'm curious because of MUD plans.

```fennel
foo
```

Results:

```text
unknown:2:0: Compile error: unknown identifier: foo

foo
# Try looking to see if there's a typo.
# Try using the _G table instead, eg. _G.foo if you really want a global.
# Try moving this code to somewhere that foo is in scope.
# Try binding foo as a local in the scope of this code.
```

So, no, it doesn't look like they share a REPL - that's fine and dandy, just good to know. What about within the same file?

```fennel
(local bing "baff!")
bing
```

Results:

```text
baff!
```

```fennel
bing
```

Results:

```text
baff!
```

Seems like yes.

With just that, it seems like I have access to enough of the Fennel REPL to be able to do some limited literate programming...

And this sets me up well to read through Andrey's blog post at a future point, and start considering how to do Fennel-encoding of the various entries in my research notes, as a means of moving toward a MUD engine/library.
