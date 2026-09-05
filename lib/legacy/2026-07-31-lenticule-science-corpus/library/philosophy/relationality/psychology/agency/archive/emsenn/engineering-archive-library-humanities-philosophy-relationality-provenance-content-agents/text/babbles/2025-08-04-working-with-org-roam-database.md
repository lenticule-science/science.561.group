---

name: 2025-08-04-working-with-org-roam-database
author: emsenn
date-created: 2025-08-04
keywords:
  - babble
  - gnoponemacs
  - org-roam
publish-to:
  - emsenn-net
---

In this babble I'm going to be looking at how to work with the Org-roam database, toward the goal of being able to produce something like Obsidian Dataview queries within my Org-roam files, when they're published to emsenn.net.

In looking online, there's folk who use `org-roam-db-query` to load up the database and search through it with Elisp. But this is wildly inefficient, when there's a `where` argument that can be set to use the database's search algorithms.

```elisp
(org-roam-db-query
 [:select [*]
  :from nodes
  :where (like properties '"%DATE%")])
```

The issue is that properties set via... whatever they're called, notation like this: `#+form: babble`, at the top of a file, these properties aren't accessible when using `org-roam-db-query`. So, I need a way to set Org-mode properties, within the same Org-mode property drawer as is used for the ID that Org-roam's database *can* see.

I tinkered with a few different approaches to this and the following seems to be the simplest and least fragile.

Org-mode capture templates can have arbitrary properties added to them, for example, in addition to a property like `:unnarrowed t`, I can set a homebrew property like `:form "babble"`.

This makes the form available within the variable `org-capture-current-plist`, once I've started the capture process. If I add a function that's triggered when a new capture template is started (by adding it to the `org-capture-mode-hook` trigger, which is fired when the `org-capture-mode` minor mode is activated (which should only be when a capture is created), then I can take these custom properties from the capture template and apply them to the capture itself:

```elisp
(defun gpe/apply-capture-properties ()
  (let* ((properties '(:author :form)))
    (dolist (property properties)
      (let ((value (plist-get org-capture-current-plist property)))
        (when value
          (org-set-property property value))))))

(add-hook 'org-capture-mode-hook #'gpe/apply-capture-properties)
```

