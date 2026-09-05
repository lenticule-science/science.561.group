---
title: "2025-10-15, Reworking gnoponemacs as a ritm tool"
aliases:
  - "2025-10-15, Reworking gnoponemacs as a ritm tool"
  - "2025-10-15, reworking gnoponemacs as a ritm tool"
authors:
  - emsenn
date-created: 2025-10-15
type: babble
tags: []
---
# Reworking GnoponEmacs as a RITM tool

When considering GnoponEmacs as a research tool for Relational Infinity-Topos Modality, I want it to be what lets me, essentially, simulate coKleisli action on my research archive as a relational topology.

Starting at what's immutable and unique:  the :ID: [property](../../../sociology/terms/property.md) every Org-roam node has.

We're going to start with one node, called "node" representing what a node at its most general is in this modality, and so it will have a [property](../../../sociology/terms/property.md), :node-relations:, that works like the following:

Org-roam graph[node-a] has a node-relation [property](../../../sociology/terms/property.md) which records in an alist pairs of (graph[node-x] . graph[node-y]) where x and y serve domain and codomain Relational Exit-Infinity Topoi when node-a is used as a Relational Exit-Infinity Topos coKleisli Commandic Functor within a Relational Infinity-Topos Modality such as GnoponEmacs (my Emacs configuration).

From there, we can say any node in the graph has :node-relations: ((graph[instantiates] . graph[node])), at least, with graph[instantiates] having :node-relations: ((graph[function] . [Relational Exit-Infinity Topos coKleisli Commandic Functor]) (domain . Relational Exit-Infinity Topos) (codomain . Relational Exit-Infinity Topos))

We can use the sections from the treatise formalizing the RITM for the objects, and then that gives us those three predicates as essentially our "residual"

Which helps us see that our Treatise, on the way to defining a specific [functor](../../../mathematics/objects/categories/ordinary-categories/terms/functor.md), woudl obviously need to define function and [functor](../../../mathematics/objects/categories/ordinary-categories/terms/functor.md). We'd clean up residual until every concept in the Treatise is properly integrated into that modality built from :node-relations:

So, our "normal" Org-roam links, just inserting links with ~[[id:foo][node]]~, those essentially become one part of this graph, where the domain is always "identifies"

```elisp
(defun gpe/get-id-from-org-mode-link (link)
  (when (string-match "\\[\\[id:\\([[:alnum:]-]+\\)\\]\\[.*?\\]\\]" link)
    (match-string 1 link)))
```

```elisp
(defun gpe/get-node-relations (propval)
  "Convert :node-relations: property string to list of (source predicate target) triples."
  (let* ((pairs (read propval)))
    (cl-loop for (pred . targ) in pairs
             for pid = (ritm--parse-id-link (format "%s" pred))
             for tid = (ritm--parse-id-link (format "%s" targ))
             when (and pid tid)
             collect (list pid tid))))
```

