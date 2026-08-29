(local socket (require :socket))

(local basic-thing (require :basic-thing))

(lambda make-timer [?base ?tick-rate]
  (let [timer (or ?base (basic-thing:make-basic-thing))]
    (timer:set-attributes
     {:tick-count 0 :tick-rate (or ?tick-rate 0.2) :events []})
    (lambda timer.run-time [timer]
      "Makes TIMER tick-time, then wait for its tick-rate, then re-calls this funciton."
      (timer:tick-time)
      (socket.select nil nil (or timer.tick-rate 0.2))
      (timer:run-time))
    (lambda timer.schedule-event [timer event]
      "Appends EVENT (function) to the end of TIMER's scheduled events."
      (table.insert timer.events event))
    (lambda timer.tick-time [timer]
      (set timer.tick-count (+ timer.tick-count 1))
      (let [current-events timer.events]
        (set timer.events [])
        (each [_ event (pairs current-events)] (event))))
    timer))

{: make-timer}
