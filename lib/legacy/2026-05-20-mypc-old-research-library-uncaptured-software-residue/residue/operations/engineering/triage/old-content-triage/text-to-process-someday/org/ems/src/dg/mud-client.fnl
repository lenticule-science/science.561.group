(local basic-thing (require :basic-thing))
(local util (require :util))

(lambda make-mud-client [server connection ?base]
  (let [client (or ?base (basic-thing.make-basic-thing))]
    (client:set-attributes
     {:name :Anonymouse
      :mud-connection connection :mud-server server
      :mud-output "" :mud-input "" :mud-commands {}})
    (lambda client.mud-parser [client input]
      (let [(command line) (input:match "([^ ]+) ?(.*)")]
        (var matched? nil)
        (each [key func (pairs client.mud-commands)]
          (when (= command key)
            (set matched? true)
            (func client line)))
        (when (not matched?)
          (client:append-mud-output
           (.. "Invalid command. Input `commands` and press ENTER to "
               "see your available commands.")))))
    (lambda client.append-mud-output [client message]
      (set client.mud-output (.. client.mud-output message "\n")))
    (lambda client.parse-mud-input [client input]
      (client:mud-parser input))
    (lambda client.mud-commands.commands [client input]
      (client:append-mud-output
       (.. "You have access to the following commands: "
           (util.quibble-strings
            (icollect [command func (pairs client.mud-commands)]
              command)
            true))))
    (lambda client.mud-commands.who [client input]
      (client:append-mud-output
       (.. "There are " (length client.mud-server.mud-clients)
           " clients currently connected.")))
    (lambda client.mud-commands.whoami [client input]
      (client:append-mud-output
       (.. "Your name is " (or client.name :unknown) ".")))
    client))

{: make-mud-client}
