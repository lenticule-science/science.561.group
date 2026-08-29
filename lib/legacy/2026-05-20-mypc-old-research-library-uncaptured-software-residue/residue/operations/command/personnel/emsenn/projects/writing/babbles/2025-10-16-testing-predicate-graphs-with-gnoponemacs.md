---
title: Testing predicate graphs with GnoponEmacs
date-created: 2025-01-01
type: babble
authors: [emsenn]
keywords:
  - GnoponEmacs
  - Fregean predicates
---

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

#+RESULTS:
: gpe/ritm/render-list-of-matches

```elisp
(gpe/ritm/filter-predicates-by (gpe/ritm/build-predicate-graph)     "bee496e1-139b-4a7f-8a24-d4c14e6084c6" "d542e8d2-3512-47a0-adbb-4a393e161ecb")
```

#+RESULTS:
| 442470fd-62e2-4378-903f-6ed3ba005d10 | 1abdc5ad-2bb7-448d-af49-3e257c915685 |


```elisp
(gpe/ritm/render-list-of-matches '(("bee496e1-139b-4a7f-8a24-d4c14e6084c6" . "d542e8d2-3512-47a0-adbb-4a393e161ecb")))
```

#+RESULTS:
- Testing predicate graphs with GnoponEmacs
- Planning March 28th, 2025

