:PROPERTIES:
:ID:       50dedd6e-8a0c-4f72-96d4-f921b29d8e32
:ROAM_ALIASES: "emsenn's essays" "my essays"
:public:   true
:form:     [[id:24e57e89-efa6-4102-8cce-d6b8559c3a00][text catalog]]
:END:
#+title: My Essays
#+index: essay!my essays
#+date [2025-08-07 Thu 22:43]

#+begin_src elisp :results value raw :exports results :eval yes
  (let* ((nodes
          (org-roam-db-query
           [:select [*]
            :from nodes
            :where (and
                    (like properties '"%form%text catalog%")
                    (like properties '"%public%true%"))]))
         (sorted-nodes
          (sort nodes
                (lambda (a b)
                  (string-lessp (nth 8 a) (nth 8 b))))))
    (mapconcat
     (lambda (node)
       (format "- [[id:%s][%s]]" (car node) (nth 8 node)))
     sorted-nodes
     "\n"))
#+end_src

#+RESULTS:
