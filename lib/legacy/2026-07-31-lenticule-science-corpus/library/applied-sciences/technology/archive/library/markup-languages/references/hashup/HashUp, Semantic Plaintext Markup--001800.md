---
created: 2025-06-29T11:34:46
modified: 2025-07-12T02:41:18
---
Hey folks! I hope everyone's week has been going well. I've enjoyed the little conversations some of us have been having through the week.

Today I'd like to announce a small little project I'm working on: [HashUp](https://code.cyberearth.systems/emsenn/hashup).

[

![](https://substackcdn.com/image/fetch/$s_!kHtR!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2F4b0087e7-44f8-4a56-bbe8-9e64e49424f0_351x171.png)



](https://substackcdn.com/image/fetch/$s_!kHtR!,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2F4b0087e7-44f8-4a56-bbe8-9e64e49424f0_351x171.png)

I've always been dissastisfied with the physical act of writing: with pen and paper it's slow and requires a fair amount of concentration to write smoothly, and with computers... well, there's What-you-see-is-what-you-get style editors like [[Microsoft Word]], which I dislike: I'm not trying to typeset a document to be printed, I'm trying to write! Unfortunately, most non-WYSIWYG editors and formatting languages like #Markdown are similar in the same fundamental way: they exist to facilitate visual formatting, not help an author encode semantic meaning.

I pretty much never want to, when I'm writing, record that a certain word is italicized. I want to, maybe, record that it's emphasized: modern HTML has at least come that far, letting [[CSS]] handle the styling past that semantic. But more likely, as a writer, I want to say, "this is a foreign term," or "this is a character's internal monologue," or, "this is emotional." All of those are usually conveyed by adding emphasis through italics, that's not guaranteed, and beside, emphasis isn't nearly as precise.

When I was using [[Org-mode]], I got in the habit of using its macros to wrap text that might otherwise be emboldened or emphasized, so that it could also be, say, if the document was being exported as [[HTML]], changed to link directly to my website.

But that was clunky, and by now I've drifted rather far from Org-mode, and I'm not even using [[Emacs]], the only text-editor Org-mode works in, right now! HashUp is my solution to my current problem, of "I don't know how to format the text I write in a way that makes it useful to me, later."

It's influenced by a lot: what I talked about above, but also using social media and other programming languages.

At its most basic, it's simple: start using [[hashtag|hashtags]] in your writing, and the HashUp processor will replace them with whatever string you've configured. If you want to do something special with that hashtag, throw a pair of {} after

the word, and fill them in with the arguments to the relevant processor function. (If there's no relevant function, the text is untouched.)

It has a bunch of limitations: there's no nesting or scope-awareness, so any opened block needs to be closed, for example. And it requires either writing your own processor functions, or me writing a standard set and publishing that.

But! It's definitely a lot closer to what I want than Markdown, even after just an afternoon tinkering.

Has anyone else tried their hand at a custom markup format? If so, I'd love to see what you came up with!