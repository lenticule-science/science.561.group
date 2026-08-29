---
dg-publish: true
type: "[[descriptive essay]]"
description: Looking at "All my relations" with LISP
---

In today's interconnected world, we often seek ways to understand the complex web of relationships that define our existence. One profound concept from the Lakota people encapsulates this interconnectedness: **Mitákuye Oyás’iŋ** (pronounced mee-tah-KOO-yay oh-YAH-seen), which translates to "All My Relations" or "We are all related." It is a phrase that speaks to the fundamental unity and interdependence of all life.

To illustrate this idea in a modern context, let's turn to an unlikely source: computer programming—specifically, a language called Clojure. Clojure is part of the LISP family of programming languages known for their elegant simplicity and powerful capabilities. Even if you're not familiar with coding, stick with me; this will be more about concepts than code itself.

Consider this snippet written in Clojure:

```clojure
(def universe (fn [universe] 
                (let [relate (fn [a b] 
                               (recur (into {} {a b, b a})))] 
                  (relate universe universe))))
```

At first glance, it might look like an arcane incantation, but it holds within it an analogy for understanding **Mitákuye Oyás’iŋ**.

Here’s what each part means:
- `def` defines something—in our case, 'universe'.
- `(fn [universe] ...)` declares a function named 'universe', suggesting that universing is an ongoing action.
- `let` allows us to introduce local bindings or definitions within our function.
- `[relate ...]` sets up another function called 'relate' inside our main one.
  
The magic happens when we see how 'relate' works. It takes two entities ('a' and 'b') and connects them together so that they point at each other—a mutual relationship.

Now here's where things get interesting: `(relate universe universe)`. The universe relates to itself! This self-referential act embodies **Mitákuye Oyás’iŋ**, showing us through code that everything in existence is fundamentally connected—not just once but continuously over time.

This recursive pattern, where the universe is in a constant state of relating to itself, mirrors the essence of **Mitákuye Oyás’iŋ**. It's not just about being connected; it's about recognizing that every element within existence is perpetually engaged in an active process of connection and reconnection.

In our Clojure code snippet:

```clojure
(def universe (fn [universe] 
                (let [relate (fn [a b] 
                               (recur (into {} {a b, b a})))] 
                  (relate universe universe))))
```

The `(recur ...)` function represents this ongoing cycle. It allows 'relate' to call itself over and over again—each time potentially with new insights or shifts in perspective. This reflects how relationships are dynamic and evolving rather than static.

By invoking `(relate universe universe)`, we're saying that everything within the cosmos—including the cosmos itself—is constantly interacting with each other. These interactions form a complex web that binds us all together: people, animals, plants, rocks, stars... everything!

Through this lens, **Mitákuye Oyás’iŋ** becomes more than just a philosophical concept; it emerges as an actionable truth that can guide our understanding of ecology, society, and even personal relationships.

Imagine if we approached life like this piece of code—seeing ourselves as part of an infinite loop of mutual relations where every action affects the whole system. We would recognize that caring for others is also caring for ourselves because we are fundamentally inseparable from them.

So while you might never write a line of Clojure code yourself—or any code at all—the idea here transcends programming languages or cultural boundaries. Whether expressed through ancient wisdom or modern technology, **Mitákuye Oyás’iŋ** reminds us that we are all part of something larger than ourselves—a universal network where each connection enriches us collectively.

As we navigate our lives amidst global challenges such as climate change and social inequality—issues deeply rooted in forgetting our interconnectedness—we could benefit from embracing this principle both philosophically and practically.

Let’s take inspiration from both Lakota wisdom and computational metaphors to remember: In every moment—with every choice—we have the power to reinforce this web by acknowledging "All My Relations" in thought and deed.
