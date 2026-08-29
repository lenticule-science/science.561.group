(local log (require :log))
(local util (require :util))



(lambda make-changelog [?file-name ?name ?base]
  (let [name (or ?name :changelog)
        file-name (or ?file-name name)
        changelogger (log.make-log file-name name ?base)
        I (util.make-string-inserters name)]
    (changelogger:set-attributes
     {(I.I :make- :-entry)
      (lambda make-changelog-entry [logger author status element ?note]
        {:time (os.time)
         : author : status : element
         :note (or ?note nil)})
      (I.I :render- :-entry)
      (lambda render-changelog-entry [logger entry]
        (.. entry.status " " entry.element
            (if (. entry :note)
                (.. " (" entry.note ")")
                "")
            " [" entry.author " @ " (util.render-time entry.time) "]"))
      (I.P :render-)
      (lambda render-changelog [logger]
        (let [entries (: logger (I.P :load-))
              A (util.make-string-appender "\n")]
          (each [_ entry (pairs entries)]
            (A (: logger (I.I :render- :-entry) entry)))
          (A)))})
    changelogger))

{: make-changelog}
