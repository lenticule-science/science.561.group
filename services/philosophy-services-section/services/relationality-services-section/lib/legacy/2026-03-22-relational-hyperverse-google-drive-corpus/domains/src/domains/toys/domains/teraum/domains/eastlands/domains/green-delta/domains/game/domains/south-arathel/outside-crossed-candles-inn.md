---
id: teraum/eastlands/green-delta/game/south-arathel/outside-crossed-candles-inn
name: south Arathel Road, Greater Ack Metropolitan Enclave
type: area
base:
  - teraum/eastlands/green-delta/game/south-arathel/rural-road
description: "This is a southern length of Arathel Road, in the Greater Ack Metropolitan Enclave. On the west side of the road is the Crossed Candles Inn. The inn is a relatively simple wooden-slatted shack, with several shutter-covered windows facing the road. The road leads north, further into Arathel County, southeast toward the town of Bellybrush, and southwest toward the road to Ack."
exits:
  north: teraum/eastlands/green-delta/game/south-arathel/outside-golden-shield-inn
  southeast: teraum/eastlands/green-delta/game/south-arathel/bellybrush-road
  southwest: teraum/eastlands/green-delta/game/south-arathel/south-arathel-ack-road
  west: teraum/eastlands/green-delta/game/south-arathel/crossed-candles-inn
lookables:
  - name: Crossed Candles Inn
    description: "The Crossed Candles Inn is one of several inns on the roads between the city of Ack, to the south, and the town of Arathel, seat of Arathel County, to the north. The inn is a single-storey building, resembling a barn more than a home. There are two windows on each side of the door, closed with wooden shutters. Beside the inn's door is a rubbish bin."
    noises:
      - [3, "Lexandra Terr, the Inn's owner, steps out carrying a few empty bottles, which she puts in the rubbish bin by the door before heading back inside."]
      - [1, "A young man wearing a brown cotton jumpsuit hurries by, pushing a wheelbarrow. As he passes the rubbish bin, he quickly grabs it and empties it into his vehicle."]
  - name: shuttered windows
    description: "The facade of the inn has four windows, each closed by a pair of shutters."
    noises:
      - [3, "The wind blows the shutters in their frame."]
  - name: shutters
    description: "The shutters are closed, preventing people from seeing into the inn."
---
