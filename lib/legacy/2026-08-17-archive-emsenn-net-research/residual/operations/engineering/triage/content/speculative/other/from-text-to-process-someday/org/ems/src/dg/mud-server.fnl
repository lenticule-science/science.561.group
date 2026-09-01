(local socket (require :socket))

(local basic-thing (require :basic-thing))
(local mud-client (require :mud-client))
(local util (require :util))

(lambda make-mud-server [?port ?base]
  (let [server (or ?base (basic-thing.make-basic-thing))]
    (server:set-attributes
     {:mudsocket-port (or ?port 4242)
      :mudsocket-timeout 0.001
      :mud-clients []
      :mud-client-models []})
    (lambda server.accept-mud-server-connection [server connection]
      (connection:settimeout server.mudsocket-timeout)
      (let [client (if server.dimension
                       (server.dimension:make-thing)
                       (basic-thing:make-basic-thing))]
        (mud-client.make-mud-client server connection client)
        (each [_ model (pairs server.mud-client-models)]
          (model client))
        (table.insert server.mud-clients client)
        (server:send-mud-server-new-client-message client)))
    (lambda server.disconnect-mud-server-client [server client]
      (each [key value (pairs server.mud-clients)]
        (when (= value client.mud-connection)
          (table.remove server.mud-clients key))))
    (lambda server.send-mud-server-new-client-message [server client]
      (let [A (util.make-string-appender "\n")]
        (A [(.. "You have connected to "
                (if server.name
                    server.name
                    (if (and server.dimension
                             server.dimension.name)
                        server.dimension.name
                        "a server.")))
            "Interact by inputting commands and pressing ENTER. Use `commands` to see a list of your available commands."])
        (client:append-mud-output (A))))
    (lambda server.start-mud-server [server]
      (set server.mudsocket
           (assert (socket.bind "0.0.0.0"
                                        (or server.mudsocket-port 4242))))
      (server.mudsocket:settimeout (or server.mudsocket-timeout 0.001))
      (when (and server.dimension server.dimension.schedule-event)
        (server.dimension:schedule-event
         (partial server.tick-mud-server server true))))
    (lambda server.tick-mud-server [server ?repeat]
      (let [new-connection (server.mudsocket:accept)]
        (when new-connection (server:accept-mud-server-connection new-connection)))
      (each [_ client (pairs server.mud-clients)]
      (match (client.mud-connection:receive)
        (nil msg) (server:disconnect-mud-server-client client)
        input (client:parse-mud-input input))
      (when (not (= client.mud-output ""))
        (client.mud-connection:send client.mud-output)
        (set client.mud-output "")))
      (when ?repeat
        (server.dimension:schedule-event
         (partial server.tick-mud-server server ?repeat))))
    server))

{: make-mud-server}
