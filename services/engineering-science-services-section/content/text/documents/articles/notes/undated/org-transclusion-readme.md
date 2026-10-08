---
email: me@nobiot.com
title: README – Org-transclusion
description: Org-transclusion lets you insert a copy of text content via a file link or ID link within an Org file.
---

<a href="https://www.gnu.org/software/emacs/"><img alt="GNU Emacs" src="https://img.shields.io/static/v1?logo=gnuemacs&logoColor=fafafa&label=Made%20for&message=GNU%20Emacs&color=7F5AB6&style=flat"/></a>
<a href="http://elpa.gnu.org/packages/org-transclusion.html"><img alt="GNU ELPA" src="https://elpa.gnu.org/packages/org-transclusion.svg"/></a>
<a href="http://elpa.gnu.org/devel/org-transclusion.html"><img alt="GNU-devel ELPA" src="https://elpa.gnu.org/devel/org-transclusion.svg"/></a>
<img alt="GPLv3" src="https://img.shields.io/badge/License-GPLv3-blue.svg">

Org-transclusion lets you insert a copy of text content via a file link or ID link within an Org file. It lets you have the same content present in different buffers at the same time without copy-and-pasting it. Edit the source of the content, and you can refresh the transcluded copies to the up-to-date state. Org-transclusion keeps your files clear of the transcluded copies, leaving only the links to the original content.<span id="whatis"></span>

A complete user manual is available [online](https://nobiot.github.io/org-transclusion/) or Emacs in-system as an Info node \`(org-transclusion)': (`C-h i` and find the `Org-transclusion`{.verbatim} node).

For installation and minimum configuration, refer to [Installation](#installation) below or the user manual: [online](https://nobiot.github.io/org-transclusion/#Installation) or Info node \`(org-transclusion)Installation'

Getting Started in the user manual will get you started in 5 minutes: [online](https://nobiot.github.io/org-transclusion/#Getting-Started) or Info node \`(org-transclusion)Getting Started'.

For customization, refer to the customization group \`org-transclusion' or user manual: [online](https://nobiot.github.io/org-transclusion/#Customizing) or Info node \`(org-transclusion)Customizing'.

# Example Use Cases & Main Features {#use-cases}

Here are some real use cases that users have shared with the author, including his own.

Book writing  
You have a collection of notes. You can quickly transclude paragraphs and sections from your notes and put together a draft. As transclusions are links, it's easy to re-organize them into different sequences to see which way works the best.

Academic writing  
You have a collection of quotes and notes from your research and literature review. Transclude relevant elements of quotes and notes into different papers. You can keep your collection as the central repository of your research.

Technical writing  
You write technical documents for software. Transclude relevant lines of code into the document. As the code is only transcluded, you can keep the document up-to-date as the code evolves.

Project status reports  
You work on multiple projects at the same time and need to report to different project managers. Transclude relevant parts of your work notes and logs into respective project reports. You can keep a single collection of your work notes and logs.

Main Features:

- Insert a copy of text content via a file link or ID link into an Org file

- Work with any text file such as program source code, plain text, Markdown, or other Org files

- With version 1.4, transclude content over network protocols like `http://` (with [org-transclusion-http](https://git.sr.ht/~ushin/org-transclusion-http)) and `hyper://` (with [hyperdrive-org-transclusion](https://git.sr.ht/~ushin/hyperdrive-org-transclusion)). Splitting `org-transclusion-add` into two parts enables functions in `org-transclusion-add-functions` to be asynchronous.

- Keep the file system clear of the copies of text content – Org-transclusion tries hard to save only the links to the file system

- For Org files, use different headline levels from the source Org file

- For Org files, use filters to include only relevant elements (e.g. filter out properties in the transclusions)

- For program source and plain text files, transclude a certain lines or dynamically specify the from/to lines to keep the transclusion always up-to-date with the evolving source files

- For program source files, transclude parts or whole code directly into Org's source block to leverage the rich Org features including noweb style syntax

- Extend Org-transclusion with its extension framework

# Installation

This package is available on:

- [GNU ELPA](https://elpa.gnu.org/packages/org-transclusion.html) (releases only; equivalent to MELPA-Stable)
- [GNU-devel ELPA](https://elpa.gnu.org/devel/org-transclusion.html) (unreleased development branch; equivalent to MELPA)

GNU ELPA should be already set up in your Emacs by default. If you wish to add GNU-devel ELPA, simply add its URL to `package-archives` like this:

``` elisp
(add-to-list 'package-archives
             '("gnu-devel" . "https://elpa.gnu.org/devel/") :append)
```

Refresh the archive with `M-x package-refresh-contents RET` and you can do `M-x package-install RET org-transclusion` to install it. Alternatively, you can use `package-list-packages`.

After installation, you can start using Org-transclusion with no additional configuration. Below are some example keybindings that can be put into your Emacs configuration.

``` elisp
(define-key global-map (kbd "<f12>") #'org-transclusion-add)
(define-key global-map (kbd "C-n t") #'org-transclusion-mode)
```

For Doom users, you would need to do something like this below to install the package and configure the keybindings.

``` elisp
;; ~/.doom.d/package.el
(package! org-transclusion)
```

``` elisp
;; ~/.doom.d/config.el
(use-package! org-transclusion
  :after org
  :init
  (map!
   :map global-map "<f12>" #'org-transclusion-add
   :leader
   :prefix "n"
   :desc "Org Transclusion Mode" "t" #'org-transclusion-mode))
```

# Contributing

- Get involved in a discussion in [Org-roam forum](https://org-roam.discourse.group/t/prototype-transclusion-block-reference-with-emacs-org-mode/830) (the package is originally aimed for its users, the author included)

- Create issues, discussion, and/or pull requests. All welcome.

Org-transclusion is part of GNU ELPA and thus copyrighted by the [Free Software Foundation](http://fsf.org) (FSF). This means that anyone who is making a substantive code contribution will need to "assign the copyright for your contributions to the FSF so that they can be included in GNU Emacs" ([Org Mode website](https://orgmode.org/contribute.html#copyright)).

Thank you.

# License

Org-transclusion is licensed under a GPLv3 license. For a full copy of the license, refer to [LICENSE](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/emacs/references/packages/org-transclusion/LICENSE).
