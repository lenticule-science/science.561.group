(setq teraum-data
      '((caliper-street
         (name . "Caliper Street")
         (description . "This is Caliper Street.")
         (nav
          (114 . twisted-alembic)))
        (twisted-alembic
         (name . "Twisted Alembic")
         (description . "This is the Twisted Alembic.")
         (nav
          (south . caliper-street)))))

(push
 '(green-delta
   (name . "Green Delta")
   (description . "The Green Delta is a fertile region, dense
   with farms and small villages.")
   (nav
    (east . central-plains)
    (southeast . gloaming)
    (south . widewoods)
    (west . optic-ocean)))
 teraum-data)
