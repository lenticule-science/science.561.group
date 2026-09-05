(lambda make-rpg-mud-client [client]
  "Return CLIENT after having the attributes of an RPG-MUD client added."
  (lambda client.mud-commands.look [client input]
    (client:append-mud-output "Look command coming soon-ish!"))
  client)
    
