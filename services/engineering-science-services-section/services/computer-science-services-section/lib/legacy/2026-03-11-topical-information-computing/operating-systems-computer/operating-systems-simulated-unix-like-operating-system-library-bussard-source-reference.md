# Bussard

<img src="https://p.hagelb.org/bussard.png" alt="screenshot" />

A multiplayer spaceflight programmable world.

This repository contains the server.
It is still in the progress of being rewritten from a single player game, so many features haven't yet been adapted to the multiplayer model.

Requires the [LÖVE](https://love2d.org) game framework version 11.

Run `make` to start a server on the Tana system as a demo.

Run `love . --name $USER` to connect to that server as a player.

## Design

Each server represents a single star system.
Clients connect to a server and fly around to interact with the planets, stations, and other ships in the system, and can use portals to travel to other systems, which involves disconnecting from the current server and connecting to the next.

Planets and stations in the system have port computers that players can log into; these computers mostly run Orb, which is a faux-unix multi-user operating system.
(see `os/orb`)

Players can deploy rovers onto the surface of a planet or inside a station.

Communication with port computers and rovers is done over an RPC mechanism where the simulated environment is run in a sandbox that's completely isolated from the rest of the codebase and runs in separate OS threads.

When players disconnect in a way that isn't exiting a portal, their ship is taken over by an AI autopilot which simply attempts to stabilize its orbit.

## Growth

The in-game world can grow in two ways: players can engage in construction on existing planets and stations, or by standing up a new server representing a new star system where a portal has been built.

The construction system is ...
[TBD]

In order to stand up a new server, it's necessary to find an existing server that is willing to add a portal to your server.
Considerations include:

* How many portals does the system already have?
* How close are the two systems in terms of galactic coordinates?
  Portals that attempt to reach across too many parsecs are unreliable.
* Are there in-game resources necessary to construct a portal?

## Lore

* TBD

## Todo

* UI for comm system
* fix HUD trajectory
* portal jumps
* move autopilot functionality to separate threads
* SSH into port computers
* rovers

## Licenses

Original code, prose, and images copyright © 2015-2020 Phil Hagelberg and contributors

Distributed under the GNU General Public License version 3 or later; see file COPYING.

See [credits](credits.md) for licensing of other materials.
