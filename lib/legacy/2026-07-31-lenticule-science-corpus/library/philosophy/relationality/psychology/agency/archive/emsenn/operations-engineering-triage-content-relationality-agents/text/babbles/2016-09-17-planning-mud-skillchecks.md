---

title: Babble, 2016-09-17 – Planning MUD skillchecks
author: emsenn
date-created: 2016-09-17
status: draft
tags:
  - babble
  - mud
  - game-design---

So, y'all might've seen that I'm putting together my own text-based MMO. Being real time and multiplayer, there's some issues with just applying most traditional skillcheck systems - they assume the opponent is just a number, not an interactive player, and when it is a player, things progress as slow as needed to let each competently respond. In a multiplayer game, that'd be hella immersion breaking - you swing your sword at Billy, who is away refilling his coffee, so your sword swing just sits there idle until Billy gets back and responds, while NPCs around y'all just act as normal.

Of course, MMO systems have their own flaws, most of which can be boiled down to "they're secret so players' ignorance protects against too stark of imbalance." Gross - if your dicerolling needs to be secret to be balanced, it's not balanced.

So, here's what I'm thinking (based roughly off Discworld MUD):

Adam is our Attacker, and he attacks Matt with, say, a sword.

Adam has a few qualities that make him a proficient swordsman, and these qualities manifest as being able to do things like "slash," "stab." (From a code standpoint, Adam has an associative array of attacks, `{ 'slash' : adam.swordsmanship, 'stab' : adam.swordsmanship }`, and swordsmanship is a number representing his skill with a sword. To make things more complicated, let's say stab actually has two skills affecting it - general swordsmanship, but also fencing.)

Matt is also armed with a sword - he can slash and stab as well, but more important for defense, he can parry, riposte, etc. He has an associative array of defenses, `{ 'parry' : matt.swordsmanship, ... }`.

Adam and Matt both also have a pool of Action Points, or whatever, which are required to do any of these things, stab or parry etc. Action Points recharge over time based on other skills, let's say endurance for now, it's not important.

So Adam attacks Matt, and because his Action Points are full, he slashes at Matt. Because Adam's swordmanship skill is 6, 6 dice are added to the pool. Matt also has full action points, and so is able to parry. Matt's swordsmanship is 4, so 4 dice are subtracted from the pool.

So Adam's attack has two dice in the pool, and then it basically works like a modified FUDGE - 1 & 2 mean -1, 3 & 4 are neutral, and 5 & 6 are positive. Let's say he rolls a 4 and 6, so walks away with +1.

The attack is successful, so the damage rating (or whatever) of Adam's sword is weighed against Matt's armor. Matt, dumbass, forgot to put on armour when he left for work, so the attack does damage - how much is based on the quality of the sword and whatever else.

A few ticks go by while Adam and Matt build up their Action Points pool, and before long, Adam takes a stab at Matt. This time Adam rolls two 1's - -2. What this failure means depends on the action taken - in this case, let's say it means Adam stumbles, and he doesn't gain the next 2 action points he should have.

Now Matt has the advantage, and stabs. Remember, he only has 4 dice, while Adam would still have 6. Matt's attack would have -2, meaning no roll - game output to Matt might be "You go to stab, but can't find an opening." No action point cost there, though.

Huh, looks like Matt can't get an attack in, no matter what. So Adam attacks, hits again - but oh no! Now Adam doesn't have enough action points to defend against any attack from Matt!

Do you know what this means? Matt goes to attack, and because Adam doesn't have the action points, Matt's 4 dice have nothing weighing against them. He rolls 4 6s, and Adam's head gets cut clean off.

I forgot to do anything with the fencing skill I mentioned, but my plan was to highlight that there would be multiple skills involved with each action, making the dice rolls too complex for a player to figure out on the fly, but NOT too complex for a player to sit down and do some numbercrunching on.

The system could be further complicated down the line in a few ways:

1. Letting players set tactics: aggressive, defensive, mixed. This would determine how the AI handles the player's action points. If only Adam hadn't been on aggressive tactics, he never would have given Matt the opportunity to roll unchallenged.
2. Letting players queue their next action. While by default I'll probably have the next action be randomly chosen from a list of affordable actions, if a player selects a specific next action, they will use that one.

