---
title: Reworking GnoponEmacs as a RITM tool
type: doc
status: draft
author: emsenn
date: 2025-10-15
keywords:
  - systems
  - ritm
  - gnoponemacs
  - tooling
publish_to:
  - emsenn-net
date-created: 2025-10-15
description: When considering GnoponEmacs as a research tool for Relational Infinity-Topos Modality, I want it to be…
aliases:
  - 2025-10-15, Reworking gnoponemacs as a ritm tool
  - 2025-10-15, reworking gnoponemacs as a ritm tool
  - 2025-10-15-reworking-gnoponemacs-as-a-ritm-tool
specialization: babble
tags: []
publish-to:
  - emsenn-net
---

When considering [GnoponEmacs](../../../../../../../../../../../engineering-science-services-section/content/text/documents/articles/notes/2025/08/08/2025-08-08-gnoponemacs.md) as a [research tool](../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/glossary/terms/research-tool.md) for [Relational Infinity-Topos Modality](../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/github-internal-theory.md), I want it to be what lets me, essentially, simulate coKleisli action on my research archive as a relational topology.

When considering [[id:edc48bf0-336b-4b63-8505-a3730b328c9d][GnoponEmacs]] as a [[id:0f795c39-f0fc-423f-a0f8-ca370a5750ce][research tool]] for [[id:e12123c1-2796-4058-affd-b786753be972][Relational Infinity-Topos Modality]], I want it to be what lets me, essentially, simulate coKleisli action on my research archive as a relational topology.

Starting at what's immutable and unique:  the :ID: property every Org-roam node has.

We're going to start with one node, called "node" representing what a node at its most general is in this modality, and so it will have a property, :node-relations:, that works like the following:

Org-roam graph[node-a] has a node-relation property which records in an alist pairs of (graph[node-x] . graph[node-y]) where x and y serve domain and codomain Relational Exit-Infinity Topoi when node-a is used as a Relational Exit-Infinity Topos coKleisli Commandic Functor within a Relational Infinity-Topos Modality such as GnoponEmacs (my Emacs configuration).

From there, we can say any node in the graph has :node-relations: ((graph[instantiates] . graph[node])), at least, with graph[instantiates] having :node-relations: ((graph[function] . [Relational Exit-Infinity Topos coKleisli Commandic Functor]) (domain . Relational Exit-Infinity Topos) (codomain . Relational Exit-Infinity Topos))

We can use the sections from the treatise formalizing the RITM for the objects, and then that gives us those three predicates as essentially our "residual"

Which helps us see that our Treatise, on the way to defining a specific functor, woudl obviously need to define function and functor. We'd clean up residual until every concept in the Treatise is properly integrated into that modality built from :node-relations:

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

## Working implementation: querying the predicate graph across the whole archive

The two functions above parse a single node's `:node-relations:` property. The following, tested against the live org-roam database (results shown), builds the whole-archive predicate graph and queries it: collect every node carrying a `:node-relations:`/`:NODE-RELATIONS:` property, index it, then filter and render matches for a given (predicate, object) pair.

```elisp
(defun gpe/ritm/collect-predicates-from-node (node)
  (let* ((raw-rd (alist-get "NODE-RELATIONS"
			    (org-roam-node-properties node) nil nil #'string=))
	 (alist (when raw-rd (ignore-errors (read raw-rd)))))
    (when alist
      (cl-loop
       for (pred . obj) in alist
       collect
       (let* ((parse-link
	       (lambda (s)
		 (when (string-match "\\[\\[id:\\([^]]+\\)\\]\\[\\([^]]+\\)\\]\\]" s)
		   (list :id (match-string 1 s)
			 :sign (match-string 2 s)))))
	      (pred-str
	       (replace-regexp-in-string "] \\[" "]["
					 (format "%s" pred)))
	     (obj-str
	      (replace-regexp-in-string "] \\[" "]["
					(format "%s" obj)))
	     (pred-link (funcall parse-link pred-str))
	     (obj-link  (funcall parse-link obj-str)))
	(list
         :subject-id id
         :subject-sign title
         :predicate-id (plist-get pred-link :id)
         :predicate-sign (plist-get pred-link :sign)
         :object-id (plist-get obj-link :id)
         :object-sign (plist-get obj-link :sign)))))))

(defun gpe/ritm/build-predicate-graph ()
  (cl-loop
   for (id file level pos todo priority scheduled deadline title props)
   in (org-roam-db-query
       [:select [id file level pos todo priority scheduled deadline title properties]
		:from nodes
		:where (or (like properties '"%NODE-RELATIONS%")
			   (like properties '"%node-relations%"))])
   for node = (org-roam-node-from-id id)
   collect (gpe/ritm/collect-predicates-from-node node)))

(defun gpe/ritm/filter-predicates-by (predicates predicate-id object-id)
  (cl-loop for entry in predicates
	   when (and (string= (plist-get (car entry) :predicate-id)
			      predicate-id)
		     (string= (plist-get (car entry) :object-id)
			      object-id))
	   collect (plist-get (car entry) :subject-id)))

(defun gpe/ritm/render-list-of-matches (pairs)
  (let ((graph (gpe/ritm/build-predicate-graph)))
    (mapconcat
     (lambda (pair)
       (let* ((predicate-id (car pair))
	      (object-id (cdr pair))
	      (ids
	       (gpe/ritm/filter-predicates-by
		graph predicate-id object-id))
	      (nodes (mapcar #'org-roam-node-from-id ids))
	      (output
	       (mapconcat
		(lambda (node)
		  (format "- [[id:%s][%s]]"
			  (org-roam-node-id node)
			  (org-roam-node-title node)))
		nodes
		"\n")))
	      output))
     pairs
     "\n\n")))
```

Tested query — every node whose `:node-relations:` names the pair (`instantiates`, `babble`) — returns exactly the nodes that instantiate the `babble` kind, rendered as org links:

```elisp
(gpe/ritm/render-list-of-matches '(("bee496e1-139b-4a7f-8a24-d4c14e6084c6" . "d542e8d2-3512-47a0-adbb-4a393e161ecb")))
```
```
- [Testing predicate graphs with GnoponEmacs](../../../undated/testing-predicate-graphs-with-gnoponemacs.md)
- [Planning March 28th, 2025](../../../../../../../../../../../engineering-science-services-section/content/text/documents/articles/notes/2025/03/28/2025-03-28-babble-20250328080000-0500.md)
```
