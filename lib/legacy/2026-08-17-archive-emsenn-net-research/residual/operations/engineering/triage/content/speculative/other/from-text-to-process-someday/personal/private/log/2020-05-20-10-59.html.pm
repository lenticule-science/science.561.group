#lang pollen

◊(define entry-date "2020-05-20-10-59")


After much futzing I'm back to thinking that Pollen, with its attitude that "the book is the program," is the right choice of tool for handling my needs, when it comes to computers.

My immediate need is for an easy loose inventory system, so I can record what I intake as donations each day, and what goes back out.

On its face this requires three functions: one for receiving donations, one for giving them out, and one for checking the inventory status.

It seems like it'd be easiest to write those "backward" from that order: write a function that checks the inventory status, then write a function that adds to it, then write one that removes from it.

(Additional functions, like resetting or allowing specific queries, can come after I've got something more basic.)

Unfortunately it's too close to time to picking up the donation from the local bakery today to get these functions written in time, so I'll write a bit about how I'm planning on organizing things:

I think it'll probably work fine to have a fairly linear set of log entries which are loaded in chronological sequence by Pollen.

Log entries will contain procedures, like give or receive, but also the use of those procedures - events.

Events should not just update the data "behind" the log entries, but add meaningful text to the log entries.

for example, while calling (give #:recipient "Tom" #:item (get-item-from-location #:name "wheat bread" #:location brick-box-community-room)) might, behind-the-scenes, remove an item matching the name "wheat bread" from the brick-box-community-room location and to Tom, it would return the string "I transferred a wheat bread from the Brick Box Community Room to Tom," so that's a part of the log entry at the appropriate time.

In such a way, eventually I could come to write entries in more and more Racket, and less English - that just being the language that events render out their results to.
