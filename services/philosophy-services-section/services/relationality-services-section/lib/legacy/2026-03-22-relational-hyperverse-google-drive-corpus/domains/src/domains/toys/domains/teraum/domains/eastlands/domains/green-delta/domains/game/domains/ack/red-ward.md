---
id: teraum/eastlands/green-delta/game/ack/red-ward
name: Red Ward
type: area
base:
  - teraum/eastlands/green-delta/game/ack/area
description: "This is the Red Ward, one of Ack's oldest districts. Originally a keep constructed by one of Ack's first kings, the district's buildings are almost all constructed from the indigenous red clay. These days, the district is home to the eponymous Red Union, a conglomerate that has its hand in almost every contemporary human endeavor."
exits:
  north: teraum/eastlands/green-delta/game/ack/astar-ward
  south: teraum/eastlands/green-delta/game/ack/copper-ward
  west: teraum/eastlands/green-delta/game/ack/north-ward
trivia:
  - "Construction of the Red Ward began in 721bB."
lookables:
  - name: towers
    description: "Many of the buildings in the Red Ward are four or even six-storeys tall, but even they look small compared to the half dozen towers in the district, which each rise at least a dozen storeys."
  - name: buildings
    description: "The buildings here form a maze of alleys, which once served as a great defense against invaders. These days, it simply serves to confuse tourists and inhibit trade. There are a few towers which rise higher than any other building."
noises:
  - [2, "A group of pedestrians wearing the uniform robes of the Red Union hurry down one street and up another, from one red tower to another."]
contents:
  - name: clerk
    base: teraum/npc
    description: "This is a clerk from the Red Union; apparent by the red robe they're wearing, and the look of discontented alienation of their face."
    animations:
      - roam
    region-lock: teraum/eastlands/green-delta/game/ack
---
