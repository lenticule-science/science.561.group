---
title: "emsenn's Records"
---

This file contains my personal records. This includes a list of what I do and how I do it ("Operations"), my "Ledger" (including inventory), and my "Writing" (including computer code).

# Information

## Calendar

### Annivesaries

#### October

##### October 5th

- In 1813, Tecumseh joined his ancestors during the Battle of the Thames <span id="sec:org0956919" label="sec:org0956919"></span> The Battle of the Thames during the War of 1812 marked a turning point in the war, for afterward the Tecumseh Confederacy dissolved.

- In 2015, Grace Lee Boggs joined her ancestors <span id="sec:orgc87eed3" label="sec:orgc87eed3"></span> <http://www.kzoo.edu/praxis/thinking-dialectically/>

- In 1923, Philip Berrigan was born <span id="sec:orgf62f7b6" label="sec:orgf62f7b6"></span> Berrigan was a radical Christian who was excommunicated by the Catholic Church for his acts of civil disobedience against the U.S. occupation of Vietnam.

##### October 6th

- In 1885, Joseph "Smiling Joe" Ettor was born <span id="sec:org76052c5" label="sec:org76052c5"></span> Ettor was one of the leading faces of the Industrial Workers of the World when it was being created in the mid-1910s.

- In 1917, Fannie Lou Hamer was born <span id="sec:org9e549da" label="sec:org9e549da"></span> Hamer co-founded and chaired the Freedom Democratic Party, which she represented at the 1964 Democratic National Convention, after rising to prominence fighting against the eugenicist hysterectomies being performed on Black women in the southeastern United States during her life. "Nobody’s free until everybody’s free."

## Contacts

### Arndorfer, Raymond "Books"

### Davis, Esther

### Gentry, Skylar

### Kitsinger, Markus

- Aliases

  Government name  
  Joseph Merrill-White

### Landlord, Andrew

### Wharton, Charles "Jay"

## Ledger

    option "title" "emsenn's ledger"
    option "operating_currency" "USD"
    option "name_income" "Revenue"
    option "booking_method" "FIFO"

### Activity

#### Computers

##### Recordkeeping

##### Programming

- Emacsen <span id="sec:org5dfc0db" label="sec:org5dfc0db"></span>

#### Writing

##### Ledgering

##### Journaling

#### Projects

##### Teraum

#### Housestuff

##### Dishes

### 2021

#### 2021-10 October

##### 2021-10-05 Tuesday

    2021-10-05 open Equity:OpeningBalance
    2021-10-05 open Expenses:Garden:PestControl
    2021-10-05 open Expenses:Purchase:Material:Ammo
    2021-10-05 open Assets:Inventory:Ammo
    2021-10-05 commodity BB177
      name: ".177 BB"
    2021-10-05 * "Add existing BBs to inventory"
      Assets:Inventory:Ammo                 6000 BB177 {{14.99 USD}}
      Expenses:Purchase:Material:Ammo

    2021-10-05 * "Shot deterrent BBs at squirrels"
      Assets:Inventory:Ammo    -8 BB177 {}
      Expenses:Garden:PestControl

    2021-10-05 commodity WH
      name: "watt hour"

##### 2021-10-06 Wednesday

    2021-10-06 * "Shot deterrent BBs at squirrels"
      Assets:Inventory:Ammo    -3 BB177 {}
      Expenses:Garden:PestControl

## Projects

### Emacsen

#### Capture templates

##### Journal entry

#### Ledger-keeping

##### Tracking electric use?

##### Tracking ammo use

- $B$ gun use <span id="sec:org233584b" label="sec:org233584b"></span>

# Writing

## Journal

### 2012

#### 2012-02 February

##### 2012-02-14 Tuesday

- Gun control stats are wrong <span id="sec:orgc21d5cf" label="sec:orgc21d5cf"></span> *In the short essay "Gun control stats are wrong," I argue that statistics regarding firearm regulation are always "wrong" because of endogeneity.*

  *It was originally on my Facebook, responding to someone asking me to verify or disprove a meme claiming that women in America are 40x more likely to be killed by a gun. I took the opportunity to explain how the statistics both sides rely on are flawed, and can’t really be improved.*

  Okay first I don’t know where they got this number. According to <http://www.washingtonpost.com/%E2%80%A6/chart-the-u-s-has-far>…, the US has 20x the average murder-by-gun rate (let’s say MbGR to save time). They link to the UN Office of Drug & Crime’s website, <http://www.unodc.org/gsh/en/data.html>, but none of the research there has any information specifically pertaining to firearms.

  But that’s okay, I’ve had this argument before, so I know that they’re getting their numbers from the Small Arms Survey, <http://www.smallarmssurvey.org/>, a group that does research into gun ownership.

  Your basic argument is that more guns corresponds to a high MbGR. Before we look into that claim, I’d like to point out a few concerns I have with the Small Arms Survey. First, they have low numbers for countries like Switzerland and Israel, where military members may own guns while not actively serving. The Survey doesn’t count these guns at all, meaning that certain countries have unrealistically low ownership rates.

  Additionally, certain other countries have been accused of modifying their numbers by filing crimes as non-homicides that in other nations would have been. In Argentina, unless it is known to be a malicious act, a murder by gun is not counted as a homicide. And in the UK, homicides don’t get counted unless there is an associated conviction. This reduces the overall homicide rate by 15%, but reduces the firearm homicide rate further, because those deaths are often associated with unsolved gang crimes. (In example, the 2012 U.S. homicide rate was 4.7 in every 100,00. Using the U.K.’s system, that would drop to 2.6.) Further, the Survey measures the number of guns per 100 people, and I feel this is a rather useless metric. Far more useful would be to measure the percentage of the population carrying guns. The issue, from both sides, is whether or not a person has access to a gun, not whether they have access to more than one gun.

  If you limit yourself to “developed” or “high-income” countries, you can paint the argument that fewer guns means fewer deaths. But that’s a juvenile flaw of stats, to artificially limit your scope to support your argument. The issue here is that “developed” and “high-income” aren’t being explicitly defined.

  If we explicitly define them, say, by following the Organization for Economic Cooperation and Development definition of “developed”, the picture suddenly changes. By including all developed nations, instead of just those in western Europe, the correlation changes. A higher rate of gun ownership goes hand-in-hand with fewer murders. (I want ot point out, this is without looking at different stats that more accurately reflect the issue, as explained in paragraphs 3-5.)

  If you eliminate the U.S. as an outlier, which it matches the conditions for, causes the regression line to eliminate any relation. In non-U.S. developed nations, gun ownership and homicide have no apparent correlation.

  If you count the actual numbers of gun ownership in countries like Switzerland, the correlation comes back, that more guns means fewer homicides. If you count the percentage of population who own guns, instead of the number of guns per capita, this correlation grows stronger.

  There’s the problem of endogeniety, which arises from using this kind of cross-sectional data. Imagine high-crime countries are the ones that adopt the most stringent gun control laws. What if gun control lowered crime rates, but not by enough to reduce rates to the same levels in countries that did not adopt the law? Looking across the countries, it would falsely appear that gun control led to higher crime. In actuality, crime rates in both countries have declined. To resolve the endogeniety problem, one must examine how the high-crime areas who adopt controls change over time, not just to themselves, but to other areas who did not institute controls.

  In short, statistics are complicated, but make emotionally charged image macros like yours easy. If you take a more broad look at statistics, actual available information correlates more guns with fewer homicides. But this is flawed because of the endogenious nature of gun control policy and related statistics. Hope this explains things adequately.

### 2015

#### 2015-01 January

##### 2015-01-28 Wednesday

- An honest acknowledgement of the Grey Zone <span id="sec:org8fc3cb1" label="sec:org8fc3cb1"></span> ISIS has made it clear they intend to go after those Muslims they consider “false.” According to ISIS, these “gray zone” Muslims are more harmful to their goals than Westerners. The refugees approaching the United States from Syria are not fleeing Syria, they are fleeing ISIS, and ISIS has said they will follow those refugees.

  Ignoring the stated goals of ISIS to claim there is no risk to accepting these refugees into our country is not honest.

  Acknowledging that you are willing to take in the sheep from the wolf, and acknowledging the threat the wolf poses to you, is honest and brave.

  I hope the United States accepts more refugees. I hope it doesn’t bring us harm, but I acknowledge that risk.

### 2016

#### 2016-04 April

##### 2016-04-26 Tuesday

- Bernie Sanders is a bad hire <span id="sec:orgd433562" label="sec:orgd433562"></span> (This was written as a letter in response to someone’s question about Bernie Sanders’ candidacy in the 2016 U.S. Presidential Election.)

  In your letter, you commended Sanders for working with the Democrat party, rather than running independently. I would like to highlight how that is perceived by Democrats: this is based on my personal conversations with people in the party, from aides in the House to local treasurers:

  Imagine I came into your office and was like “Oh, wow, y’all are doing \[software development\] all wrong!” and then tried to convince you to do it my way. You don’t agree, so I start badmouthing your company to the press. That doesn’t work, so I start badmouthing YOU. That doesn’t work, so I start threatening you – run your private company the way I, an outsider, say, or I will go invest in your competitors, THAT’LL show you.

  While not true of all of his supporters, in many ways its like they showed up two days before the product release and went NO DO IT MY WAY OR NO WAY. They’re willing to give the election to Trump rather than support Democrats – but want us to give them the same respect we would long-term members of the party. They’re willing to harass employees – but want us to treat them as though they’re simply trying to make sure we hear them.

  Honestly, it seems absurd to me that anyone who still is a die-hard Berner thinks they should be treated with kindness. They’ve made it clear that they would rather hand the country to the GOP than vote Clinton. And I can kind of understand that – the Breaking Bad mentality of no half-measures. But it’s gone beyond that. You have Berners, prominent ones, who are loudly disagreeing with Bernie about his own platform.

  It’s gotten to the point where even if Bernie says “I’ll support Clinton if she gets the nomination,” they’ll still write his name in. It’s childish, short-sighted, and yet comes to the table under the impression that they have just as valid a say as the people who have been at the table for years. I could keep incoherently ranting about how silly the entire thing is, but it isn’t voters like you I have a problem with.

  You saw an opportunity to reform the Dems, see that it might fail, and so will take your reformation efforts to the next most likely buyer. That’s smart. That’s political. It’s respectable.

  Saying that you’ll kick over the table and throw the gameboard in the fire isn’t.

##### 2016-04-28 Thursday

- Bernie Sanders still can’t win <span id="sec:orgab6df3e" label="sec:orgab6df3e"></span> (This was written as a letter in response to someone’s question about Bernie Sanders’ candidacy in the 2016 U.S. Presidential Election.)

  In your original letter, you stated:

  I keep hearing that Bernie can still win, and that he’s the only one who can beat Trump in a general election. What’s your take on that?

  Bernie’s “lead” in the general comes only from the \#BernieorBust movement, which based on demographics aren’t incredibly likely to vote in the general anyway.

  Your argument for why your candidate is more likely to win is because your candidate has supporters who would throw the election to Trump if he doesn’t get the nomination.

  That’s like me saying “Jonathan, I want you to decide whether we’re having fish or steak for dinner – but if you pick steak, I’m going to force you to eat gravel instead.” It might get you to pick steak, or you may stick with your choice of fish and see if you’re really the sort of person who will force folks to eat gravel – and if you are, well, I’m sure glad I didn’t pick you to make my dinner.

  Regarding his tendency to poll better against Republicans than Clinton… that’s true, but if you account for the amount of press coverage toward each, and past elections and how press there has worked, it seems as though Sander’s strength comes from the fact he hasn’t been attacked by Republicans yet.

  Further complicating things, the Right’s internal math says Clinton is more likely to win – and has their own \#nevertrump movement that says they’ll vote for clinton over trump (not sanders though.)

  So you’ve got Sanders predicted to win by some democrats, but only because he hasn’t been slammed by republicans AND because his supporters are willing to throw the election if he doesn’t get the nomination, and Clinton predicted to win by most democrats and most republicans, and there’s no more dirt to throw on her – the odds there’s some hidden scandal around her is real slim, while from a moderate/independent perspective, the amount of untouched scandal around Sanders is absurd.

  On top of all of that, you’re saying that Sanders will wait to pitch superdelegates until the convention is closer, which may be true for him and his campaign… but isn’t true for many of his supporters. I’m, as you may know, tight with lots of political folk on both side of the aisle – I actually had dinner with an ex officio delegate a few nights ago, and he’s actually disconnected his home phone because of the steady stream of threats he gets to vote for Sanders. Same for the other delegates I know in this state (bar one, who’s known for being more to the left.)

  So you’re counting on Sanders’ campaign being able to go up to people who have been harassed for months and going “If you don’t vote for me, the harassment won’t stop, and we’ll let Republicans take control of the country.”

  And do you know what tends not to work very well on public officials? Vaguely threatening coercion when it’s happening under incredible public scrutiny.

  Put simply, the only strength Sanders can put forward to secure the nomination is the ability of his supporters to rally together and threaten low-level public officials.

  You’re relying on people who, at this point, personally dislike him for what they have done to the party they have worked to grow and strengthen for years, if not decades, to suddenly cave into the same threats they’ve been hearing for months now. It’s not going to happen.

#### 2016-10 October

##### 2021-10-06 Wednesday

- Don’t check in at Standing Rock <span id="sec:org288f0be" label="sec:org288f0be"></span> I woke up to a bunch of messages asking me if the checking in at Standing Rock on Facebook actually is helpful, so figured I’d answer everyone at once with a post:

  No, not really, and it in fact enables Internet surveillance.

  How it works:

  - Morton Co. claims to use FB check-ins to locate protesters.

  - Some scriptkiddy (or straightup a Morton County Sheriff employee) makes a viral post telling people from around the globe to check in.

  - This makes a subpoena of FB’s data more necessary, so Morton Co has less hurdles to jump through to get a judge to get them the data.

  - Now Morton County, instead of a list of people who voluntarily check in at the protest, has a list of EVERYONE who is there with a telecom device – which is, in fact, the thing step \#2 was trying to prevent.

  The first time this mass check-in was used was in 2009 when a bunch of people set their FB profile pics to green and checked in Tehran. The check-in was curated by Sedazad (that’s my free speech group) and ultimately backfired horribly, as many of the people who were checking in illegitimately had some tie to the protesters which the local state exploited – usually by threatening to hold remittances. There’s also a suspected instance where a young woman who was unaffiliated with the GR88 was killed by security forces, because she matched the name and description of one of the fake check-ins.

  The biggest use of the fake check-in in America was a couple days before Occupy Wall St. got shut down, and about the same thing happened – the fake check-ins, while fake, were a good way of getting a list of people tangentially associated with the protest, and became a good operating list of donors.

  Since then it’s been done several times, usually to very little effect beyond speeding up court hearings related to the event.

  Not to be too personal about it, but like I said, when me and my team did this the first time, it led to someone’s death. While that’s unlikely to be the consequence this time, since these events are occurring within the States, seeing the multitudes of check-ins was a heartbreaking reminder of the consequences that ignorance can have, no matter how helpful you’re trying to be. FAQ

  - Should I delete my check-in?

    - No, the damage was done as soon as the check-ins started to go viral, if not before. (If the check-ins were a LEO operation, they would plan it, then justify the subpoenas with “fake check-ins,” simultaneous to the check-ins going viral.) May as well leave them up as a sign of solidarity.

  - Isn’t it worth the risks, since even the Sacred Stone Camp FB Page has said the media coverage has increased?

    - There’s no evidence yet that there’s more media coverage today than there would have been without the checkin campaign. If you want more media coverage, I would suggest a more direct route. Cll into your local broadcast stations and request they syndicate coverage of this topic.

  - Are there other resources to learn about the up-to-date protest methods.

    - Generally, organizations which work against state intelligence operations tend to keep their information as close to the vest as the people they’re fighting. I reference it in the comments of the post you share, but essentially the activists and state are engaged in a multi-faceted arms race, and it is to the activists’ benefit to slow that race as much as possible. Widely educating people who don’t need to know these tactics does the opposite, accelerating the state to move up the escalation of force.

#### 2016-11 November

##### 2016-11-14 Thursday

- A brief chemical history of gold <span id="sec:orgc4d97cb" label="sec:orgc4d97cb"></span> In the short essay "A brief chemical history of gold", I look at why did humans use gold as currency for so long?

  - No Gas, No liquid <span id="sec:org07710a9" label="sec:org07710a9"></span>

    Gold is a pure element, and its purity is easy to test. Assuming an early currency-alike would need to be elemental (which it does, because making any sort of stable alloy is complex and took us several hundred years to sort out, at our best), let’s look at the periodic table: There’s a bunch of gases, so nope. Then we have some things that are liquid at room temperature, like mercury and bromine, and both of those are toxic. We’ve got some other toxic things like arsenic.

  - Nothing Explosive <span id="sec:orga9853b1" label="sec:orga9853b1"></span>

    Almost everything on the left half of the table is too reactive – a currency that explodes when it gets wet isn’t much use. At the bottom we have radioactive chemicals, and while we didn’t know why we didn’t want to hold them on our person for years, we seemingly figured it out, plus their scarcity make them unfeasible unless paired with another, more stable element (and then why not just ditch the radioactive bit?) You’ve got your “rare earth” elements, but most of those are nearly indistinguishable without modern technology, so they don’t work. So now, we’ve got the center of the periodic table left – transition and post-transition metals.

  - Nothing That Melts Too Easy, or Too With Too Much Difficulty <span id="sec:org58afaac" label="sec:org58afaac"></span>

    There are 49 of these: iron, titanium, copper, lead, aluminium, so on. Some, like titanium and zirconium, are very difficult to smelt, requiring modern techniques to produce. Others, like iron and copper, aren’t stable and readily oxidize. A currency that melts itself away is hardly useful! Of the 118 elements, we’ve got… platinum, rhodium, iridium, osmium, palladium… a couple I’m forgetting, and gold and silver, that aren’t ruled out for being gaseous, liquid, unstable, or requiring modern science to create and verify. These are the “noble” metals, because they barely react with the other elements.

  - Nothing Too Rare <span id="sec:org30ed7e6" label="sec:org30ed7e6"></span>

    All of these except gold and silver are VERY VERY rare, and most require, again, modern metallurgy in order to process… all of them except gold and silver. Silver reacts with sulphur in the air, so isn’t ideal as a currency, leaving… gold, which works because it is literally the most boring element (which, fun fact, is also why it’s so shiny, but that’s a different thing.)

  - Our Only Choice <span id="sec:org8cc0958" label="sec:org8cc0958"></span>

    It’s also sufficiently rare, yet common enough globally that multiple societies independently arrived at it as a currency. Also, it’s… golden, whereas all the other metals are silvery, or green once they begin to degrade. So it’s exceedingly easy to recognize, and very hard to mimick (in fact, we don’t know if anyone prior to the modern era made strictly “fake” gold coins; counterfeit gold coins would have been alloys of lower purity than the normal currency, not a different metal entirely.)

    So yeah. We used gold for currency for so long because it was literally the only option, because science.

### 2017

#### 2017-02 February

##### 2017-02-18 Saturday

- Goodbye, Sam Jones <span id="sec:org3626463" label="sec:org3626463"></span> To be brief: I’m shutting down Sam Jones Media.

  In the early spring of 2014, I moved into a ranch house outside of town. Bigger than I needed, the house gave me room to host friends’ band rehearsals, house shows, and perhaps most importantly, meetings.

  The house was on Sam Jones Road, and so quickly became the Sam Jones House. I became known for always having an open door, with fresh biscuits & coffee available for those who stopped by. It was, I think, a good combination of what I’d learned about anarcho-syndicalism from my time at Occupy with true Southern hospitality.

  And it was immediately successful. Despite being quite a drive for many of them, there was usually at least someone at the Sam Jones House, taking advantage of the environment to help produce their art. It was, looking back, far more successful of a project than I’d expected it to be.

  Then, that summer, I was in a severe auto accident. It led to me needing a wheelchair for about a year, which meant living at the Sam Jones House wasn’t going to be feasible. (Older house meant my wheelchair couldn’t get through the doorways.)

  Things the Sam Jones House helped enable continued, but with me in recovery, the scope changed, and by the time I able to get around on crutches, I’d found that the local scene had largely moved on. This, with other factors, soured my working & personal relationship with a lot of the local musicians and artists.

  I wasn’t finished, though. Lacking the house, I re-branded to Sam Jones Media, and released a new mission statement: I wanted to help artists publish, distribute, and monetize their original content without giving up ownership rights. I stopped focusing local and started focusing on folk who were also outsiders in their own artistic community.

  Since that refocus in early 2015, I’ve been able to help more than a dozen writers get self-published, enabled the release of countless albums, and helped several visual artists prepare themselves for gallery showings. Like the Sam Jones House, Sam Jones Media was far more successful of a project than I expected it to be.

  Now, it’s time to shut down Sam Jones Media. Things have changed since I got started. Revenue for artists in my local area continues to drop thanks to the efforts of former colleagues like the Three Corners Collective. Tax codes have changed so I can’t as easily write off Sam Jones Media expenses. And perhaps most importantly:

  There are smarter people working harder to accomplish the same thing. With the recent innovations in decentralized publishing, distribution, and monetization, the kind of services Sam Jones provided just aren’t as necessary. While once it might’ve taken me walking someone through the steps to prepare a book for Kindle publication, there are an abundance of free tools. And if you need more information, there are professionals more able to help you than I would be.

  Most of Sam Jones Media is just being reworked to be a part of my personal brand. Release systems like Stantia and Aperte will become available again soon, and the day-to-day management of these funnels will be integrated with my other professional services.

  The values that led me to create Sam Jones, haven’t changed. I still think artists should own what they make, and I still think that by working together they can repair their economic market.

  The only thing that’s changed is that it is me saying all this directly, instead of a brand.

#### 2017-04 April

##### 2017-04-22 Saturday

- Mastodon is a bake fair <span id="sec:org54f73fc" label="sec:org54f73fc"></span> Also – and this is important – I don’t really mean Mastodon. I mean the Fediverse: the federation of online information sharing platforms which communicate in some meaningful way with each other.

  But I’ll get to that later, perhaps.

  This essay you’re reading is in response to the discourse I saw today in the Fediverse, in response to "Mastodon is Crumbling," an article by Ana Valens for the Daily Dot in which she gives her perspective on the Fediverse, and conducts an interview with Eugen Rochko, the primary develop of Mastodon.

  It – this essay – is written for people who are already in the Fediverse, but who might not be familiar with today’s discourse or the mentioned article. It’s where I’m going to share my perspective on the sorts of dicussions that happen about Mastodon and the Fediverse, in the Fediverse, and how I try to think about things myself. In truth, it’s a rant sparked by reading one too many posts about the topic, and feeling like I have to give my two cents. So fair warning, I wrote this in one-go and did very little editing.

  - Mastodon, the Fediverse, and ActivityPub, Oh My! <span id="sec:org95712cf" label="sec:org95712cf"></span>

    (I bet that’s been used as a header before.)

    Mastodon is a piece of software for running a server which provides a frontend for creating and managing an account that lets you make posts that are seen by other people on that server, but also (depending on the post’s settings) to people on other servers, with whom their server federates.

    I have an account at @emsenn@ecosteader.com – my username is @emsenn and the server (or in Fediverse lingo, instance) is @ecosteader.com.

    If I make a public post from that account, everyone on the @ecosteader.com instance can see it – but so can everyone on the @mastodon.social instance, because my account at @emsenn@mastodon.social follows it. (Or any other account could follow any other account at the respective instances.)

    That’s federation. Mastodon is just one software that federates. There are others for microblogging, I know of Pleroma and glitch-soc, and Pixelfed for image-sharing. There’s Write Freely for long-form blogging.

    For the sake of the headline, ActivityPub is the protocol these services use to federate – it’s how they communicate between each other, so they can make sense of the others’ data. Now, moving on.

  - The Fediverse is Big <span id="sec:orgcc8b047" label="sec:orgcc8b047"></span>

    The important take-away here is that a lot of the time – most of the time, in my experience – when people talk about Mastodon culture, they’re actually speaking of the Fediverse.

    Which means a lot of critiques, like “there’s one developer!” or “it’s a White space” just don’t hold up.

    Certain instances are White. Mastodon has just one developer. Neither of those things is the Fediverse.

    A lot of the discourse about the “Mastodon is Crumbling” article involved mention of crumbles, the baked goods, which got me to thinking.

  - Explaining the Metaphor in the Headline <span id="sec:org62b6778" label="sec:org62b6778"></span>

    The Fediverse is sort of like a bake fair. There’s a lot of different booths (instances). A lot. Each booth has their own styles of pie (the platform they use, whether it’s Mastodon or Pixelfed), but also, their own local culture that makes it their pie.

    Sometimes, a style of pie goes out of favor – I mean, when was the last time you had a green tomato pie? Usually because of wider trends in the consumer culture, that exposes some failing in the pie that was probably there the whole time.

    Or maybe it was only when the recipe was made at scale and explored by a bunch of different booths that it became clear that it was a culinary dead-end – marshmallow creme pies aren’t couture these days.

    But there will be a number of new styles that arise as a fusion of the failed, or as I see it, outgrown, styles. And some that manage to stick around, always begging for a little more perfection – lemon curd.

  - My Opinion <span id="sec:orgea01cfc" label="sec:orgea01cfc"></span>

    I dont’ think Mr. Rochko is the right developer to maintain a lemon curd. but I also don’t think we’re quite done savoring the marshmallow creme he’s presented with us.

    But – one closing thought. I’ve participated, in some way or another, in a lot of online communities in my 28-year-long life. I think a lot of the conversations that are being had are being had with much too narrow a lens, and have very little to do with Mastodon, the Fediverse, or even the Internet.

    Communication is communication, and I think if conducting it successfully is truly important to you, it’s a more worthwhile to develop your personal best-practices, and bend the tools you use to best-fit that.

#### 2017-05 May

##### 2017-05-02 Tuesdady

- Cultural onboarding for Fediverse newcomers <span id="sec:orgb46ceea" label="sec:orgb46ceea"></span> Hey y’all, my name is emsenn, and I’ve had an account in the Fediverse for about a year now. I’ve been interested in online networking for most of my life, though, so even though I haven’t been in this network for that long, I have some thoughts I would like to share, especially for people who are just now going the Fediverse, or looking to become a bit more a part of its culture.

  In short, this is a "onboarding" guide for Fediverse culture.

  (The “Fediverse” is a federation of networked communication platforms – Wikipedia has an article on the Fediverse.)

  - You Can Bring It With You; Don’t <span id="sec:org07c4123" label="sec:org07c4123"></span>

    A lot of people come to the Fediverse because they’ve become untenably frustrated with their experience on legacy social media, like Twitter or Facebook.

    Moving to the Fediverse is a really great solution to that frustration! Some platforms, like Osada, are similar to Facebook. Others, like Mastodon, are like Twitter.

    But be careful that you don’t bring over more than you need to from those legacy platforms! It’s easy to, because you’re from Tumblr, boost every post you like in your Mastodon feed, but maybe that sort of signalling is what led to the culture in Tumblr you didn’t like?

    When using computers, it’s easy to look for ways to preserve your older habits, but when communicating with people, it’s important to drop those habits if they no longer serve your interests.

    So before you post, or boost, think about the problems you remember from the platforms you came from, and give some thought to if you might be recreating the culture that led to those problems here.

  - There Isn’t A Single Culture <span id="sec:org1787d9b" label="sec:org1787d9b"></span>

    Of course, despite your best or worst efforts, you wouldn’t be able to do more than skew the culture of your part of the Fediverse: there’s no unified culture to the Fediverse, due to the distributed way in which instances network.

    You’ll hear people bring this up to brush off criticism and musing about the Fediverse’s (multitude of) culture(s), and while they’re technically correct, it’s usually an irrelevant point. Sure, there isn’t a single culture to the whole Fediverse, but from every single user’s perspective, there is.

    So talking about “Fediverse culture,” is always talking about the shapeless and shifting culture that the speaker is exposed to on the Fediverse, and while it’s a bit sloppy to use that shorthand, it’s not going to change.

    If people are talking about Fediverse culture, and you see it, on the Fediverse, they’re talking (at least in part) about the culture you’re a part of, and you shouldn’t just brush that off.

  - Everything is New <span id="sec:org91035cf" label="sec:org91035cf"></span>

    Throughout this post I’ve been calling Facebook and Tumblr and such “legacy” social media, which is a ridiculous phrase because they’re also incredibly new.

    Everything to do with online communication is incredibly new, and it’s important to remember that, because it means that no one is provably right. There are a lot of people with a lot of experience, whose voice is worth consideration, but we still have no real notion of how this sort of communication affects us, either individually or as a society.

    So every take is a hot-take, because nothing has had time to cool off.

  - Focus on Your Self <span id="sec:orgff700b7" label="sec:orgff700b7"></span>

    The culture that will have the strongest effect on your sense of identity is the one you build inside your head, and that’s determined mostly by what you’re exposed to.

    Make the culture of the Fediverse something you want to be exposed to – follow people who will bring you to that goal, boost and write posts that fulfill that goal, and disregard the rest.

  - Practical Tips <span id="sec:org38b0903" label="sec:org38b0903"></span>

    - \#UseCapsInYourHashtags so people who have their screen-text read to them hear it sensibly.

#### 2017-12 December

##### 2017-12-17 Sunday

- Dr. Allan Spreen is conducting fraud <span id="sec:org7144b96" label="sec:org7144b96"></span> A doctor is misrepresenting himself and his research to popularize a theory that Hillary Clinton has conspired to hide cancer cures for decades. This is an explanation of his actions, which I believe to be a criminal scam.

  Today, across the conservative web, there has been a video being shared as a banner ad, embed, or whatever. (I’ve since lost the video, unfortunately.) So, since I doubt any of you want to take the time to watch it, the video claims to be a Dr. Allan Spreen, explaining how “Crooked Hillary” is in bed with the hospital cartels to encourage cancer so she could have dead people vote for her in the election. Again, the theory is, Clinton has been working with medical companies for two decades, to encourage cancer, so there would be dead people she could have vote for her.

  At its face, the theory is a hybrid of some modern anti-pharmaceutical rhetoric with some of the old-school anti-Clinton jabs from back in the Cattlegate days.

  Well, the video actually is someone reading an abbreviated version of an article written by someone who claims to have spoken to Dr. Allan Spreen. Now wait – the video said it was Dr. Spreen, and this “article” says they spoke with Dr. Spreen? Why would Dr. Spreen read, nearly verbatim, something written by someone else? The video I link is Dr. Spreen, you can compare his voice with other videos he has on YouTube. Therefore, it seems likely the article was written by Dr. Spreen, and he misrepresented himself to avoid violating medical laws. (Doctors aren’t allowed to just make claims about products as doctors, because that’s reckless.)

  Anyway, let’s move past that and look at Mr. Not-Dr-Spreen’s blog post.

  Interesting, Dr. Spreen, the scientist who has done all of the not-peer-reviewed research on EG-M’s efficacy as a treatment for the various illnesses Mr. Not-Dr-Spreen shares with us, owns a company which sells a variety of products which claim to contain EG-M! Boy, it sure would be suspicious if Mr. Not-Dr-Spreen and Dr. Spreen knew each other, because it would really make a lot of this written seem bias!

  Reading the full article, it’s… it’s long. And rambling. But is actually a fucking sales letter, once you get to the end. For “EG-M”, which the sales letter says “holds mega amounts of Collagen, plus more then \[sic\] a dozen amino acids, essential proteins, and healing minerals…”

  Anyway, they don’t, clearly, so let’s look at EG-M, and see if we can’t suss out the truth to these claims ourselves. Not that I don’t believe Dr. Spreen & Mr. Not-Dr-Spreen, but, you know, I want to do my own research.

  EG-M… EG-M… hmm, you know, no where in either of their writing do these two highlight what EG-M is.

  But, there is this thing, endothelial growth medium, which is abbreviated as EG-M, and it is for cultivating cells that would grow on the inside of blood vessels… which would be mostly collagen, plus about a dozen amino acids, some proteins, and mine- oh.

  Oh, I… I see what’s happening. A doctor is lying about his identity online to popularize a belief that Hillary Clinton has been working with pharmaceutical companies to suppress a cancer treatment that he directly profits from.

### 2018

#### 2018-01 January

##### 2018-01-20 Saturday

- Facebook learned nothing <span id="sec:org3345d3a" label="sec:org3345d3a"></span> After facing criticism from users, politicians, bureaucrats, and shareholders, Facebook’s CEO Mark Zuckerberg announced his personal 2018 New Year’s Resolution, to “fix Facebook.”[^1] In previous years, Zuckerberg has publicly announced his resolutions, and his followthrough. He’s visited every U.S. state, built an artificial intelligence for his home, ran 365 miles, and learned Mandarin. So I had some hope that he’d be able to complete this one – after all, as CEO, “fixing Facebook” should be a core part of his job.

  About a week and a half into 2018, Zuckerberg announced the first change,[^2] which would be to reduce the priority of public content in our newsfeeds. The goal was to reduce branded posts from 5% to 4% of the content – which doesn’t sound like a big difference, mostly because it isn’t. The problem posts on Facebook weren’t advertisements for Audible and fabric softener.

  Yesterday, January 19th, he announced the second big change: “to make sure the news you see, while less overall, is high quality.”[^3]

  Academics, journalists, and armchair pundits are all still trying to make sense of what happened to “the news” over the past few years, and there are a lot of different schools of thought. Some explanations are simple (more literacy, more written stupidity), and others are incredibly complex (we’re living out the result of a 1960s Soviet intelligence operation.) But they all rely on the same premise:

  People are truly terrible at figuring out the truth.

  And we are. We don’t know what we don’t know, we think we know more about the things we know a little about, and we’re almost unable to follow a logical flow if we have even the slightest emotional connection to the subject.

  However, Zuckerberg has faith that people can do it, this time… with the help of surveys. From his announcement:

  We decided that having the community determine which sources are broadly trusted would be most objective. Here’s how this will work. As part of our ongoing quality surveys, we will now ask people whether they’re familiar with a news source and, if so, whether they trust that source. The idea is that some news organizations are only trusted by their readers or watchers, and others are broadly trusted across society even by those who don’t follow them directly.

  Now, there’s some problems off-the-bat with this sort of data collection: self-selection bias, aware observer bias, and so on. But there’s also a more specific problem: Gallup (and others) already did a study on this, and the results weren’t good. Here’s some of their key findings:

  While 54% of Democrats view the media favorably, 68% of Republicans do not. Republicans have less trust in the media to provide accurate & politically balanced news. Four in ten Republicans think accurate news reports which cast a politician or political group in a negative light are always “fake news.” 67% of Republicans view there as a “great deal” of political bias in the news, versus 26% of Democrats. When asked to name an objective news source, 60% of Republicans said Fox News. Those with annual household incomes of \>\$100,000 rank the media’s trustworthiness at 32/100, versus a mean 38.5/100 among lower income Only 55% of Republicans view choosing news sources that align with your own politics as problematic, versus 61% of Democrats (and 67% of Independents). (Interestingly, it is very liberal people who are the most likely to only consume news from agreeable sources.)

  And so on. My point here is not to pick on Republicans, but to highlight that not only do different political demographics have vastly different definitions of things like objectivity and truth, but that different demographics have differing opinions on whether or not media bias is even important.

  Facebook won’t be able to resolve these differences through user surveys any more than they were able to do it with algorithms. I actually don’t think Facebook can do anything about it – the solutions need to come from news outlets.

  There’s optimism to be found in that Gallup study. Americans are getting more and more critical of existing news sources, while simultaneously consuming more news. Basic economics indicates that with this increased demand for good news sources, we should see a supply to match.

  But getting there will take some time – and will take each of us doing our part to be good consumers of media… like maybe not saying that Fox News is an objective news source, or discounting anything disagreeable to our politics as fake.

#### 2018-04 April

##### 2017-04-11 Wednesday

- Facebook did not accidentally fail <span id="sec:orgd76da9f" label="sec:orgd76da9f"></span> In 2009, as the world was going through a recession, Russian social-media mogul Yuri Milner invested \$200m in Facebook, with a valuation of \$10b, without requesting a seat on the board or voting rights.

  The investment was financed by Alisher B. Usmanov, who provided funds from Gazprom, a Russian natural gas-and-more conglomerate. It’s likely the investment is what pushed out Facebook’s early CFO Gideon Yu.

  The investments were facilitated by Ryan Williams, a friend and former classmate of Jared Kushner. At a similar time, Yuri Milner also invested in Cadre, a company founded by Williams, Kushner, and Kushner’s brother, Josh Kushner. However, Jared Kushner failed to disclose his ownership of the company.

  Shortly after, Milner & Zuckerberg became close associates, meeting monthly, even speaking together at events. In 2012, Milner attended Zuckerberg’s wedding, and in 2014, paid 100% above value for a home in California.

  Alisher B. Usmanov spent 6 years (1980-1986) in a Soviet prison for fraud and embezzlement, before becoming a manager of Gazprom-owned steel mills. In 2008/2009, he fired the editor at one of Russia’s most-respected newspapers for an article detailing Russian electoral fraud. The article said, “\[Usmanov’s\] ties to the Kremlin and Facebook have stirred concerns that he might influence the company’s policies in subtle ways to appease governments in markets where Facebook is also an important tool of political dissent, such as Russia.”

  Usmanov is known to be a close friend of Roman Abramovich, whose wife during this period was in turn close friends with Ivanka Trump, thanks to Wendi Deng. This led to Ivanka attending a lunch hosted by Lev Leviev, an associate of Abramovich’s, where Deng introduced her to Jared Kushner. (Concurrently, Leviev was hosting the bris for the grandson of Tamir Sapir, who’s daughter Zina Sapir married Africa-Israel CEO Roten Rosen. Trump, a few months earlier,, had hosted the wedding of Sapir and Rosen.

  The Sapir Organization, with the Trump Organization, built Trump SoHo. (Which was an absolute scandalous mess, not going to get into that here.) They attempted to mimic the process with Trump Tower Moscow, as well.

  Gazprom – the conglomerate which both Abramovich and Usmanov have been senior executive at, and which provided the funds for Milner’s investment in Facebook – may be familiar to you because of their recent mentions in the news. They are the financiers of the spy ring which, in 2013, tried to recruit Trump advisor Carter Page.

  When Facebook was first confronted about the “fake news” epidemic and its influence on our election, Zuckerberg said it was “crazy.” In April 2017 when they put out a report on the issue, they left out any mention of Russia.

  Political ads were paid for in rubles. Facebook had “embeds” working directly with the Trump campaign.

  “\[People from Facebook, Google, and YouTube\] were helping us… they were basically our hands-on partners… …Without Facebook, we wouldn’t have won.” – Theresa Wong, Trump campaign.

  “We found that Facebook and digital targeting were the most effective ways to reach the audiences. After the primary, we started ramping up because we knew that doing a national campaign is different than doing a primary campaign. That was when we formalized the system because we had to ramp up for digital fundraising. We brought in Cambridge Analytica. I called some of my friends from Silicon Valley who were some of the best digital marketers in the world. And I asked them how to scale this stuff.” – Jaren Kushner.

  Cambridge Analytica is the firm who coordinated with Julian Assange about Hillary Clinton and the DNC’s stolen emails. Michael Flynn, who has pleaded guilty to lying to the FBI, was an advisor at Cambridge Analytica.

  Facebook has early investment ties to Russian financiers and openly worked with them for years. The Trump family has ties to those same people. Facebook then worked directly with the Trump family to implement the methodology of those people.

  It was not an accidental failure of a novel invention.

  \[<https://www.cnet.com/news/facebooks-valuation-the-cheat-sheet/> \[<https://techcrunch.com/2009/05/26/mark-zuckerberg-and-yuri-milner-talk-about-facebooks-new-investment-video/> \[<https://www.nytimes.com/2012/05/16/technology/a-russian-facebook-bet-pays-off-big.html> \[<http://www.dailymail.co.uk/news/article-3784716/Ivanka-Trump-Karlie-Kloss-Wendi-Deng-Murdoch-watch-Open.html> \[<https://www.wired.co.uk/article/what-is-the-paradise-papers-leak-facebook-yuri-milner-facebook-twitter-russia> \[<https://finance.yahoo.com/news/zuckerberg-got-early-business-advice-194957335.html> \[<http://time.com/5011000/paradise-papers-tax-havens-leak/> \[<https://foreignpolicy.com/2017/04/04/russian-spy-met-trump-adviser-carter-page-and-thought-he-was-an-idiot/> \[<https://techcrunch.com/2009/03/31/confirmed-facebook-loses-cfo-gideon-yu/> \[<https://www.ft.com/content/281a8420-a46e-11e1-a701-00144feabdc0> \[<http://www.latimes.com/opinion/topoftheticket/la-na-tt-zuckerberg-russians-20170929-story.html> \[<https://arstechnica.com/tech-policy/2017/10/report-facebook-cut-russia-references-from-report-on-disinformation/> \[<http://thehill.com/policy/technology/358102-franken-blasts-facebook-for-accepting-rubles-for-us-election-ads> \[<https://mashable.com/2017/10/10/facebook-responds-embeds-trump-campaign-60-minutes/#tDxG85vXHGqr> \[<https://www.bbc.com/news/av/magazine-40852227/the-digital-guru-who-helped-donald-trump-to-the-presidency> \[<https://www.theguardian.com/us-news/2017/aug/04/michael-flynn-cambridge-analytica-disclosure> \[<http://www.techheadlines.us/facebook-says-it-found-an-insignificant-overlap-between-russia-ads-and-president-trumps-campaign/> \[<https://www.cnbc.com/2018/01/25/facebook-tells-senate-its-software-recommended-russian-propaganda.html> \[<https://www.buzzfeednews.com/article/kevincollier/a-former-manager-at-the-russian-troll-factory-is-now-living> \[<https://twitter.com/JuliaDavisNews/status/967559297516425217/photo/1> \[<https://www.newsweek.com/jared-kushner-ivanka-trump-white-house-forms-omissions-cadre-millions-679231> \[<https://www.theverge.com/2016/11/10/13594558/mark-zuckerberg-election-fake-news-trump> \[<https://www.theguardian.com/media/2013/jun/13/rupert-murdoch-divorce-wendi-deng> \[<http://www.zimbio.com/photos/Yuri+Milner/2016+Time+100+Gala+Time+Most+Influential+People/quud6cf3as>– \[<https://www.telegraph.co.uk/fashion/events/time-100-gala-best-dressed-celebrities/model-karlie-kloss-with-wife-of-russian-entrepreneur-yuri-milner/> \[<https://www.vogue.com/article/businesswoman-wendi-murdoch-career-profile> \[<http://www.dailymail.co.uk/news/article-3514484/Wendi-Deng-takes-break-St-Barts-billionaire-friend-Roman-Abramovich-s-yacht-three-weeks-ex-husband-Rupert-Murdoch-tied-knot-Jerry-Hall.html> \[<http://nymag.com/daily/intelligencer/2008/05/highprofile_bris_on_sunday_you.html> \[<https://therealdeal.com/2013/11/12/the-donald-sapir-execs-mull-bringing-trump-soho-to-moscow/> \[<https://www.theguardian.com/business/2003/jul/06/russia.football> \[<https://www.independent.co.uk/news/business/analysis-and-features/whats-a-nice-russian-oligarch-like-you-doing-in-a-steelworks-like-this-65258.html>

#### 2018-07 July

##### 2018-07-14 Saturday

- CSS themes should be better <span id="sec:orgb2c5ca3" label="sec:orgb2c5ca3"></span> I’ve just begun teaching myself about Web design, but I’m already beginning to form opinions:

  If you’re going to release your CSS stylesheet(s) as a theme, intended for use on more than a single website, you should prioritize following industry standards and guidelines. I understand, for a single site that might get a hundred visitors, make things pretty however works.

  But if you intend to distribute the theme, or use it on a site of any popularity, you need to think about how that amplifies any shortcut or oversight you’ve made.

  I started thinking about this when learning to use the \[Gutenberg static site generator\](<https://getgutenberg.io>) and looking at the themes available for it. (And later, for Hugo and Jekyll.)

  A lot of them are really bad in this regard. Many don’t use semantic tags like \<header\> and \<section\>

  Frankly, I don’t see the excuse. It’s trivial to type id=”{{page.slug}}” or add in conditionals for ograph data. Just… do it. I’m a novice, and I am.

  I’m on a rant now so just ignore me if you want, but for real, no one with their priorities straight gives a shit if your website builds in 200ms or 2 seconds. They don’t even really know what “build” means. They’ll give you the inch of agreeing to use markdown to write their pages. They’ll even learn to do weird {{ shortcodes }}. But then you have to make sure their images and descriptions show up right on Facebook shares, and they can drop in their SaaSy widgets.

  This is why I’m so in love with Netlify at the moment – I haven’t been using them long enough and I’m too ignorant to know about the tech, but their marketing really does a good job of hitting the market’s pain points and resolving them. And what they’re offering isn’t much different than what a bunch of other folk offer. But it’s different enough that they just fit into the market better.

### 2019

#### 2019-01 January

##### 2019-01-27 Saturday

- Letter to the Web, January 27, 2019 <span id="sec:org41da43e" label="sec:org41da43e"></span> I’ve created this mailing list as a place for me to carry on a conversation with the Web on whatever topic seems of interest. It’s an alternative to carrying discussions through my microblog.

  A current problem I’ve been perceiving with my microblog is that despite the Fediverse’s platforms’ potential for a curated experience, the overall culture of the Fediverse around me seems to swing toward a more… average… online culture. Put another way, as the Fediverse grows its membership from those who come from legacy social media, I see them bringing their culture and it spreading to those parts of the Fediverse older than those “immigrants.”

  My hope is that by using e-mail for the same sorts of discussions, I can increase the distance in culture between conversations around me, and, as I said, the average online culture.

  There’s a concept I was taught as a child, that I cannot find any information on in searching online today. Basically, the sharing of opinions should escalate from private discussions with family, to more open discussions with friends and associates, and finally presenting the ideas publicly. First the bedroom, then the family room, then the parlour, then the tavern, then town hall. (I also personally relate the idea to the four boxes of liberty, as a way of splitting up the “soap box”)

  There were a few reasons for this, as I was taught. The main reason was that it kept you from looking like a fool: trivial flaws in your thinking could be pointed out by a loving spouse or compassionate friend, before you went sharing them with folk at the deli.

  Another reason was so that when you said your ideas to someone who would brusquely disagree – more likely the more public the conversation – you would be more experienced in thinking-through and discussing the ideas, so better able to defend the notions, or see that it’s not worth the debate at all.

  I’ve been thinking about how to apply a similar thought to communicating online – I’ve already taken some steps toward that, in working with Org-mode and Emacs I’ve made it easier to privately share drafts and then share them more publicly as I choose, before eventually publishing them on my blog.

  This list is one of those steps – somewhere between “sharing with acquaintances,” and “sharing publicly .” Yes the list is public, but my hope is the oddity of a mailing list – and the more bespoke culture I hope we cultivate – will make it clear this is a conversation among friends, though we’ll hear what guests have to say.

  I would ask that if you’ve made it this far in reading this, you take a moment to consider replying to let me know what you think of this notion. I haven’t laid it out before – was there any part of the above explanation that was exceptionally unclear or disagreeable? I’d like to present these ideas more wildly but – as I’ve just explained – I want to suss them out with friends and like-minded strangers first.

#### 2019-04 April

##### 2019-04-24 Wednesday

- I updated my Website <span id="sec:org6cca72a" label="sec:org6cca72a"></span> It’s been a while since I sent my last message to this mailing list. My apologies – my new job as a property manager took up more time than expected, and I tinkered too much with my computer so was unable to easily draft something new to write.

  Yesterday I worked out those kinks and updated my personal website for the first time since late-January. (There’s still a lot to update, but it’s progress.) In this letter I’m going to just talk about the site for a bit – how it’s laid out, and how it’s made.

  I received a lot of feedback about my homepage as soon as I started sharing it. In case it changes, at the moment it is a brief paragraph introducing myself, followed by a list of pages and subdirectories (and subpages), followed by an index.

  It’s funny how an index, like what books have, looks so out of place on a website’s index page. Of course, part of why my index looks exceptionally silly is that it also includes all the indexed terms and entries from my fantasy canon, so has entries about the fictional region of the Farsteppes listed right next to entries about the real company Facebook. But, consequence of the site being made for myself, first.

  This index page, and all the documents, are generated by Org-mode’s publishing features, from my org directory that looks something like this:

      ~/org/
           |src/
           .   |index.org
           .   |theindex.org
           .   |theindex.inc
           .   |sitemap.org
           .   |...
           .   |dear-parlour-i-updated-my-website.org
           |templates/
           .         |setupfile0.org
           .         |setupfile-base.org
           .         |setupfile-css-simple.org
           | pub/                                   |
           | index.html                             |
           | theindex.html                          |
           | sitemap.html                           |
           | ...                                    |
           | dear-parlour-i-updated-my-website.html |

### 2020

#### 2020-10 October

##### 2020-10-16 Friday

- Planning the next phase of my computing <span id="sec:org16b7e63" label="sec:org16b7e63"></span> I’m fortunate enough to get to correspond with Phil Hagelberg, a developer whose sensibilities match my own, but whose knowledge and experience far exceeds mine, and it’s been really helpful in helping me plan this next phase of computing I seem to be entering.

  (This next part of this newsletter took me quite a few drafts)

  Viewed abstractly, a great deal of my computer use has been a struggle to record human-generated data (text “strings” and numbers) and re-present it to other humans, using computers. (Or, sometimes, a printer.)

  A few years ago, I was using Markdown and a static site generator. But that was rather limiting. Since then, I have…

  …Well, being honest with myself, I haven’t actually done much of anything, in terms of actions that effect the outside world. I have certainly attempted a great number of things, and have learned even more, but, I don’t have some collection of software I can point to and go “that’s what I’ve done.”

  Instead, I have a bunch of half-implemented, journal entries explaining concepts, and, importantly: a much clearer idea of where I plan to go with my computing from here. A lot of this thinking was influenced by Phil, like I said, but also other conversations in the Fediverse, and discussions with my partner, who is in library science.

  While my thinking is relatively clear, I haven’t actually written out this thinking yet, so if this is unclear or you’ve got more questions, please write back and ask them!

  This might sound self-evident, but computer-programming is writing data structures and procedures to handle them. Often, the data structure is coupled with the procedures, as part of a software, but usually the data structure is its own useful resource! So, moving forward, my first step with making a software will be to define the schema for its necessary data structures. And, since almost everything I do is human-generated data, I’m going to define those as XML schema.

  Why XML? Well, it’s ubiquitous, and its syntax, while ugly, basically allows for the encoding of S-expressions, which I’ve come to favour as a way of composing statements. No one *needs* a library to make use of XML, and it is fairly explicit, meaning that if I give you the XML sheet for something, you’ll probably be able to suss out what sort of “something” it is - even if the schema is unavailable.

  I’m also going to move away from Racket as my primary programming language. Racket is really wonderful for exploring “what happens when modern programming paradigms are enabled so folk can do them easily?” and I think in the hands of someone who’s programming is centered around choosing paradigms and stuff, it’s wonderful.

  But I found myself ignoring 99% of the language, really just liking it because it was a LISP that had namespaces, which ELISP doesn’t. (And that was my first LISP.)

  I had considered moving to SBCL, a pretty straight-forward LISP, and then considered Rust, and a few other languages. I might use one or more of those in future projects.

  But for now? I’m going to be using Lua. This might seem like an odd choice, or it may seem obvious, depending on how closely you’ve been following my computer tinkering so far.

  I’m going to explain why I chose Lua: these reasons are mostly arbitrary. If you have another language you think might be better, or recommendations on Lua libraries I should check out, let me know.

  1.  I like Lua’s history. A programming language built because of a nation’s pursuit of self-determination is nicely in-line with me wanting to write all this software because of my own desires for self-determination.

  2.  I like Lua’s ubiquity. So many things can interpret Lua scripting, that knowing how to use it proficiently seems really useful. It has a small footprint, I’m not really worried about being able to run it on any computer at-hand, the way I am with Racket.

  3.  Lua is pretty simple. “Everything is a table” is nice and clear, and makes it easy to grapple with other parts of the language, like modules.

  4.  Phil made Fennel, which provides a LISP-y syntax for Lua.

  There are other reasons, some more important than what I’ve listed here, but these are the ones that came up when I was writing this email.

  I’m still planning on opening up the Teraum MUD to playtesters on March 23rd, even with these massively shifted plans for how to program it. But my first order of business is drafting a schema for my seed catalog, and then writing corresponding functions for creating XML documents adhering to those schema based on inputs.

  Which might not sound like much, but I’m not that familiar with XML, and I am completely unfamiliar with Lua or Fennel, so it should keep me busy for a little while! But, I have something like 200 varieties of seeds already: I really need some sort of means of organizing them, and I was disastisfied with available solutions. (That’ll likely be in a future newsletter.)

##### 2020-10-20 Tuesday

- Picking apart the blood cult’s litany <span id="sec:org0239d73" label="sec:org0239d73"></span> (Heads up: this piece is pretty US-centered, but everywhere has real estate so just replace the names with whoever your local kyriarchists are.)

  So because I do building maintenance for a “commercial” building, I try and keep up with the wider trends in that market. Which brought me to read this Politico piece, forecasting commercial real estate as the next economic crisis. Great. But what I want to highlight is the hyper-focused zealotry presented through the article’s quotes:

  “Sometimes people forget the depth and breadth of what commercial real estate is…What’s at risk here is both the ability for people to stay in their apartments and the ability for people to go to their jobs. So unless there’s a stimulus, there’s a lot less to go back to once we get back to normal times.”

  That’s Mike Flood, some sort of high priest for the death cult. What gets me is the implicit threat here. The “risk” Mike mentions isn’t something natural, like heavy winds or slipping in the shower. It’s a threat from real estate investors: if they aren’t given their blood - excuse me, money - then they will kick people out of their apartments and change the locks on businesses. It isn’t that the “ability” of people to have housing and businesses will be lost: it will be actively taken away, by people like Mike. More from Flood:

  “The worst-case scenario is you take the shining asset in all of commercial real estate and potentially create a liquidity crisis, and quite frankly, a situation where people are put out on the street… \[The unfunded eviction ban\] transfers the risk to the borrower and the lender.”

  Now, wait a moment. The risk \[of the loan\] will be between the borrower and lender?

  I’m pretty sure that’s how loans are supposed to work! The risk isn’t supposed to be put on some abstract relation (in this case, “customer,” what a gross way to talk about “resident,”) to the borrower!

  Mike’s “put out on the street” is stereotypically passive language for a politician, playing into the same deflection his earlier discussion of “risk” did. But this last part, but where the risk is… I think it’s important we all sit and recognize that the person in charge of mortgages for commercial and apartment buildings thinks that the risk of those mortgages should be on tenants.

  The people who created the house of cards already blame us for it being unstable. And, speaking for my employer: their blame-game is working.

  There’s one more thing from the article I’d like to look at:

  Eighty-seven percent of public pension funds and 73 percent of private pension funds hold real estate investments.

  That’s the article’s author, who seems to be using this source. I tried digging a little deeper to find out what amount of each of those funds was invested in real estate: of the 87% of public pension funds invested in real estate, what percent of their portfolio was in real estate?

  It seems like the answer might be about 11.5%. Something worth considering: I know a fair portion of folk reading this have savings or investments. What percent of your own investments are invested in sheer naked colonialism and the exploitation of, as real estate folk call you, “human capital stock?”

  Here in the US, some of us are on the brink of what’s going to be the greatest number of evictions in our national history, during a pandemic. And in a supreme irony, it’ll be our neighbors, sitting safe in isolation, remote-working and living off savings, sharing Instagram posts about the inequalities of capitalism, motivating it, in an act of open colonialism.

  (Already in this apartment building, half of the units have emptied because people were unable to pay rent and wanted to avoid eviction during the moritorium window, and of those, half were turned into airbnbs.)

  I have concrete plans for how to get involved in my community when the blood cultists come to squeeze these bricks for more money: I strongly encourage y’all to do the same.

##### 2020-10-23 Friday

- HashUp: Semantic plaintext markup <span id="sec:orga59dda4" label="sec:orga59dda4"></span> Hey folks! I hope everyone’s week has been going well. I’ve enjoyed the little conversations some of us have been having through the week.

  Today I’d like to announce a small little project I’m working on: HashUp.

  I’ve always been dissastisfied with the physical act of writing: with pen and paper it’s slow and requires a fair amount of concentration to write smoothly, and with computers… well, there’s What-you-see-is-what-you-get style editors like \#Word, which I dislike: I’m not trying to typeset a document to be printed, I’m trying to write! Unfortunately, most non-WYSIWYG editors and formatting languages like \#Markdown are similar in the same fundamental way: they exist to facilitate visual formatting, not help an author encode semantic meaning.

  I pretty much never want to, when I’m writing, record that a certain word is italicized. I want to, maybe, record that it’s emphasized: modern HTML has at least come that far, letting \#CSS handle the styling past that semantic.But more likely, as a writer, I want to say, "this is a foreign term," or "this is a character’s internal monologue," or, "this is emotional." All of those are usually conveyed by adding emphasis through italics, that’s not guaranteed, and beside, emphasis isn’t nearly as precise.

  When I was using \#Org-mode, I got in the habit of using its macros to wrap text that might otherwise be emboldened or emphasized, so that it could also be, say, if the document was being exported as \#HTML, changed to link directly to my website.

  But that was clunky, and by now I’ve drifted rather far from Org-mode, and I’m not even using \#Emacs, the only text-editor Org-mode works in, right now! HashUp is my solution to my current problem, of "I don’t know how to format the text I write in a way that makes it useful to me, later."

  It’s influenced by a lot: what I talked about above, but also using social media and other programming languages.

  At its most basic, it’s simple: start using hashtags in your writing, and the HashUp processor will replace them with whatever string you’ve configured. If you want to do something special with that hashtag, throw a pair of {} after

  the word, and fill them in with the arguments to the relevant processor function. (If there’s no relevant function, the text is untouched.)

  It has a bunch of limitations: there’s no nesting or scope-awareness, so any opened block needs to be closed, for example. And it requires either writing your own processor functions, or me writing a standard set and publishing that.

  But! It’s definitely a lot closer to what I want than Markdown, even after just an afternoon tinkering.

  Has anyone else tried their hand at a custom markup format? If so, I’d love to see what you came up with!

##### 2020-10-24 Saturday

- Settlerday, October 24th, 2020 <span id="sec:orgffb39a3" label="sec:orgffb39a3"></span> Normally when I talk about what I broadly categorize as "settler nonsense," I do it through short posts, usually right after I’ve digested whatever the nonsense was. As I said earlier this week in a newsletter, I’m planning to stop doing that, and instead put together a weekly look at what settler nonsense I saw through the week. This week I wasn’t on the computer too much, and still ended up with around twenty-five instances of nonsense.

  A thug with a gun walks around in front of land defenders.

  But before I even get into any of that, I want to talk about this excellent opinion shared by Pax Santos on Medium.

  Through it, Santos led me to reason that all settlerism is terrorism. There are a few conclusions that can be drawn from this, but most relevant is: I’m going to try and transition away from the calling it "settler nonsense," and start calling it "settler terrorism." As someone exposed to this sort of terrorism with sad frequency, there’s a comfort in calling it "nonsense:" it makes it sound like teens breaking windows, not an international eugenics project.

  So, with that in mind, here’s a selection of acts of terrorism I saw in the news this week, that y’all may have missed. Again, this is my first time putting together something like this; it’ll probably be clunky and disjointed. Even if it were well-written, it’d probably be difficult to read given the potential emotional weight of the content.

  Oh - sorry, one more thing: please watch this video on intergenerational trauma first. As you learn about these contemporary events, try to remember that they will last far past these headlines, into all future human generations. (Then maybe watch this short video, with some headline coverage of events and cool music.)

  The US court system continues to drop its pretense as anything but a theocratic club, as a federal judge basically overrules the Supreme Court, approving the continued development of the “Keystone” oil pipeline on the belief that permanent harm is unlikely, even though the pipeline has leaked multiple times and allegedly inhibits animal migration.

  A bit north, settler privilege erases the disproportionate affect of COVID on Indigenous populations. Coming not-long after colonial medicineworkers let an Indigenous women die after mocking her, the news paints a dim future for colonial and Indigenous relations as COVID progresses.

  Back here in the United States, a tradition of "broken promises" continues, as Native nations get ignored in favor of supporting settler-colonies. But even as they ignore us, they imitate us.

  COVID has hurt lots of Indigenous populations, especially in South America. And settlers don’t want to hear it.

  “But if Native folk are separate from colonial folk, they shouldn’t get support!” Disagree, but also could y’all at least stop breaking our shit?

  Medicine isn’t the only mechanism of terror against Indigenous peoples: in Canada, Indigenous people are 10 times more likely to be shot by police than white folk. (I recall here in the US it’s about 8x)

  Colonial infrastructure threatens humans and salmons in California.

  In out-right acts of “Western” magic, Canada says laws should be enforced, like that wasn’t… already the case. Seriously, imagine if someone shot at you with a flare gun, the police never showed up when you called, so you went straight to the courts, and the courts said “yea, that isn’t cool!” and then told you to go home. The whole Mik’maqi “Lobster Dispute,” is a cluster-fuck only Canada could manage.

  And, as an interesting counterpoint to the formality of that kind of magic, here’s law enforcement openly taunting land defenders after they expanded their defense

  So far these have all been from around Turtle Island, but of course that’s just where the closest issues are, not the most, if you’ll excuse it, nonsensical. Here’s a documentary about how Indonesia is “secretly” at war with West Papua.

  Hawai’ian colonists are always terrorising their Indigenous neighbors. Recently, they used their thugs to cage people defending their ancestral burial grounds. Here on Turtle Island, folk have to argue for the return of stolen ancestors.

  At a protest against the wall the US is building on its border with Mexico, which divides the land of Native nations, tear gas and rubber bullets were used. But like, it’s late 2020: if you haven’t been tear-gassed and hit by composite rounds yet, you’re probably just lucky.

  A lot of the Karuk people won’t be able to rebuild after the Slater fire destroyed their homes.

  No specific event, but a new report says climate change (settler terrorism at an uncontrolled rate) enables food apartheid.

  I’d also like to share this piece from an uncle of Angela McConnell, one of the many murdered (or missing) Indigenous women, girls, and two-spirits. While most of the other links are fine un-clicked, I’d ask that everyone reading this take the time to read what Albert Bender took the time to write and share.

  Thanks for taking the time to read, everyone. I know it wasn’t a fun read, but I hope it helped share my perspective on what’s happening around the world.

##### 2020-10-25 Sunday

- The RIAA isn’t our biggest threat <span id="sec:org4d67746" label="sec:org4d67746"></span> A couple days ago, people who follow certain events all woke up to headlines about a DMCA takedown that GitHub received for hosting copies of Youtube-DL, a command-line script that lets you download videos off Youtube. (The DMCA, or Digital Millenium Copyright Act, is a U.S. law that says folk can’t host material that infringes on copyright or is primarily for infringing copyright.)

  The notice came from the RIAA, Recording Industry Association of America, because they feel that by hosting Youtube-DL, Github is hosting material that is primarily for infringing on copryight.

  There are a lot of good arguments about why that claim is bullshit, even assuming the legitimacy of “intellectual property,” made by people with state-granted privilege to issue opinions. So, I’m not going to talk about that.

  Instead, I’m going to repeat a point I’ve made often to people elsewhere, but not yet through this newsletter:

  Those who operate computers for commercial organizations in exchange for funding (“developers,” in a word) fill a role similar to religious officials in our society, going far beyond the concrete actions of their role: due to computer operations being incorporated into nearly all forms of labor, this developer class has authority over nearly all facets of human life, at a very individualized level.

  This social position lets “developers” have a massively disproportionate effect on our popular culture: their values are mimicked throughout the world, in big and small ways.

  It’s those developers I’m talking to.

  What in the fuck are y’all doing? Look at my newsletter from yesterday. Your society is on a genocidal rampage right now. Let’s take a breath together, and consider: is the RIAA sending Microsoft a letter really that important?

  (Spoiler: my answer is actually, “yes, kind of.”)

  So, from my perspective, the RIAA and Microsoft are both basically denominations of the same death cult, and what they’ve done is they’ve exchanged a magic letter that adds to the Litany of the latter denomination, giving it just cause to excommunicate certain members and burn their contributions to the community.

  Put another way: the Church in Spain has some nascent anarchists in some rural parishes, so the Pope signs a letter clarifying that “yes, that’s not good,” and so now those rural parishes stop letting in the anarchists, and burn down the anarchist’s patch of tomatoes growing next to the cemetary.

  Put that way, to me, this seems really important. Whether it’s viewed as economic, political, or spiritual, it is destruction with the intent to repress. And I honestly can’t think of many things more harmful to our ability to survive than repressing our ability to create new solutions to problems we encounter.

  But, put this way, it begs the question: are there other ways we’re repressing our ability to create that are more urgently harmful?

  A photograph of some field peas growing out of milk crates, also some lemon balm and a few varieties of succulent.

  The majority of our food comes from, or is fed by food that comes from, proprietary seed: vast libraries of magic scrolls chain together to bind your wrists against replanting the seed you buy routinely at the grocery store: bean, corn, tomato, squash, pepper. You probably have at least one seed of one of those somewhere in your kitchen. You might have hundreds, or thousands.

  And if you were to plant them, and the Church find out, you would be asked to pay your Indulgences, and the plants you grew would be destroyed.

  It doesn’t stop at the illegal gardening (or piracy), though. Most of y’all probably stream your TV and movies and music, but was that a choice you made or a consequence of the abundances and scarcities within you culture? Most of y’all probably don’t save seed: is that a choice you made or a consequence of culture?

  What I’m trying to say is, even ignoring the direct repression, we have had our ability to create repressed for so long that most of us don’t even feel the ability. The “real world” that most people live in is one that’s interacted with via magic scrolls like laws and currency, not one of life, air, and water.

  …Which is probably why people love to get interested in dramas like the RIAA/Github thing: if they live entirely within the constructs of kyriarchal society, of *course* the machinations of kyriarchal society are the most interesting thing in the world.

  And it is interesting. I agree. But… as an analogy for the massive harms we’ve already let happen to us, when we let our ability to create in the material world get repressed. It is such a valuable story, in that way.

  But, on its own, the only repression at hand is our ability to create within kyriarchal society, and if the threat of that repression greatly threatens you: again, breathe. And recognize you’re saying you need the kyriarchy to be creative, and start exploring how you can change that.

- Regarding Settlerday <span id="sec:orgb72a7b6" label="sec:orgb72a7b6"></span> I received a few replies to my “Settlerday” newsletter. To generalize, people wanted to express something in response, but felt uncomfortable saying “thank you.”

  I replied to one person individually but now that I’ve gotten a few emails, I’ll just share the message widely:

  I think gratitude is usually the right emotion for most situations.

  It’s just important to be particular in what one is grateful about!

  In this case, being grateful I put in the labor to compile it seems appropriate to me, to which I think I’d respond, "And I’m grateful to the people who shared these experiences first- or second-hand so I could do so easily."

  I imagine those folk are grateful to the others fighting with them that gave them the security to share their part of the story, and those folk are grateful to the storytellers, who are also grateful to the audience, and then I’m grateful to you for reading, in a big loop of reciprocal gratitude.

  This notion of perpetual gift-giving is actually the concept bastardized by “Indian giving:” we are, whether we recognize it or not, engaged in a system of mutual reciprocity. So, lean into it.

  In that spirit, thanks for reading!

##### 2020-10-27 Tuesday

- Y’all’ve a week <span id="sec:orgec0f963" label="sec:orgec0f963"></span> This email is for folk who, so far, have experienced most of this year through headlines and social media discussions.

  Things are worse than it’s easy to believe. Unemployment is worse. Death tolls are higher. Anecdotally, there are four new homeless camps within a half mile of me, all bigger than the one that existed before COVID, and more than a dozen people have died in these camps. (Reminder, I live in a very prosperous neoliberal university town.) I distribute now a couple hundred pounds of food a day, and it still isn’t enough to make a meaningful dent.

  If you don’t feel, acutely, the rapid slide into poverty that has occurred for most of our nation: congratulations, you have more time to prepare. Please, I’m begging you: take advantage of it to by listening to your impoverished neighbors and community, and taking steps to work with them directly. Regardless of who wins the election, there are many million new Americans existing in a state of subjugation. If you aren’t one of them, you’re the subjugator, and I implore you to do everything you can to change that relationship.

  You all have a week to figure out how you’re going to react to the various possible outcomes of the U.S. elections. You’re probably waking up to news about a new Supreme Court Justice, and that the Senate went on recess before passing additional relief. Social media discussion about how this threatens reproductive rights, and puts people on the precipice of eviction.

  Please try and understand: most of my friends weren’t able to access reproducive healthcare, before COVID. Even before Trump. It’s never been available for them. (I am the healthcare available to many of my peers.) Most of my friends can’t qualify for leases because they’ve been evicted too often. I don’t have healthcare, or the means to qualify for a lease, and haven’t for almost a decade. (It’s only in the past five years that I’ve had any sort of stable housing, and at the moment it isn’t stable at all; my landlord/boss is actively trying to convince the sheriff to ignore the eviction moritorium because they dislike that I distribute free food.)

  The things you’re scared of, the risks you’re facing, have been here for years for some of us: and not distant abstract “other Americans,” but like, me and my friends. People you know. People whose efforts you benefit from: not just in that we keep providing the services that maintain your society, but we keep providing words like this, that help alleviate the ignorances y’all hold around your privilege.

  These consequences you’re waiting on, to motivate you to action, have already come for the majority of your fellow citizens, and it is your continued support of our oppression that inhibits our ability to organize.

  I’m not going to spend much time guilting you for relaxing into the stability that Collaboration provided so far. There’s enough of that in my other writings, and from other people. What I’m going to challenge you to do is make clear plans about how you’re going to make this world better, regardless of how the election goes. Come Wednesday morning, are you going to fight your HOA to allow gardens to be set up? Are you going to go talk to a restaurant about donating waste food? Reach out to local mutualists and ask if they need help?

  Do real things that directly challenge the many mechanisms of oppression which you’re currently cooperating with. “Releasing an open source blog engine” or “boosting some non-white social media posts” shouldn’t count. This is real shit, and it requires real action.

##### 2020-10-28 Wednesday

- I touched a nerve <span id="sec:org5f4c8b3" label="sec:org5f4c8b3"></span> So yesterday’s newsletter about planning for the future upset a sizeable portion of my small readership, enough that I got multiple complaints. I was told that it, and my newsletter so far, have been “unnecessarily antagonistic” by multiple people.

  To everyone who felt the same flurry of emotions but didn’t encourage me to talk about something else: thank you. But the response makes me think, maybe I should explain what this newsletter is. After all, some of you got subscribed automatically from Patreon, and others might not have read the about page.

  That page encourages a development of knowledge about certain topics, among them decolonization, both through this newsletter, conversations we have, and external resources. To help y’all with that, I’m going to share some items tagged decolonization from my reading list. Some of these will be academic, some casual; some very broad and some specific.

  Decolonize: Resources  
  <https://docs.google.com/document/u/0/d/1xXhHallb7HDdaiK5MrV3U9VzwUuoD4-VPe-0qyf_JzM/mobilebasic#heading=h.royrjgolhjpi>

  Indigenous decolonization, on Wikipedia  
  <https://en.m.wikipedia.org/wiki/Indigenous_decolonization>

  Decolonization and Indigenization, Section 1: Understanding Decolonization, Indigenization, and Reconciliation; Pulling Together: A guide for Indigenization of post-secondary institutions. A professional learning series  
  <https://opentextbc.ca/indigenizationfrontlineworkers/chapter/decolonization-and-indigenization/#navigation>

  A Brief Definition of Decolonization and Indigenization, from Indigenous Corporate Training  
  <https://www.ictinc.ca/blog/a-brief-definition-of-decolonization-and-indigenization>

  Native Minds, Hearts, Spirits, Beings, Knowings: Journey to Liberation, Decolonization, Reawakening  
  <https://media.proquest.com/media/pq/classic/doc/4324440763/fmt/ai/rep/NPDF?_s=dsVKQuJV9PSl%2F40MonhO%2BtLvlpU%3D>

  What Decolonization Is, and What It Means to Me  
  <https://www.teenvogue.com/story/what-decolonization-is-and-what-it-means-to-me>

  White Allies, Let’s Be Honest About Decolonization, Kyle Powys Whyte  
  <https://www.yesmagazine.org/issue/decolonize/2018/04/03/white-allies-lets-be-honest-about-decolonization/>

  Decolonization through Indigenous Inquiry: A Mo’olelo  
  <https://scholarspace.manoa.hawaii.edu/bitstream/10125/101136/Sato_Brandy_r.pdf>

  Decolonization: The fundamental struggle for liberation  
  <https://rabble.ca/news/2013/06/decolonization-fundamental-struggle-liberation>

  What does decolonization mean? Our panel debates the buzzword  
  <https://www.cbc.ca/amp/1.4609263>

  Excerpt: Decolonizing Museums  
  <https://uncpressblog.com/2012/11/14/excerpt-decolonizing-museums-by-amy-lonetree/>

  DECOLONIZING OUR MINDS AND ACTIONS, by Waziyatawin and Michael Yellow Bird  
  <https://sarweb.org/media/files/sar_press_for_indigenous_minds_only_chapter_1.pdf>

  What It Means to Decolonize Your Diet  
  <https://www.kqed.org/bayareabites/135518/what-it-means-to-decolonize-your-diet>

  What is decolonization and why does it matter?, BY ERIC RITSKES  
  <https://intercontinentalcry.org/what-is-decolonization-and-why-does-it-matter/amp/>

  What does it mean to decolonize a museum?, by Elisa Shoenberger, University of Pennsylvania Museum of Archaeology and Anthropology  
  <https://www.museumnext.com/article/what-does-it-mean-to-decolonize-a-museum/>

  Film: How Can You Decolonise Museums?  
  <https://www.museumnext.com/article/decolonising-museums/>

  Decolonizing Means Many Things to Many People”—Four Practitioners Discuss Decolonizing Design  
  <https://eyeondesign.aiga.org/decolonizing-means-many-things-to-many-people-four-practitioners-discuss-decolonizing-design/amp/>

  Coyote is not a metaphor: On decolonizing, (re)claiming and (re)naming “Coyote”  
  <https://jps.library.utoronto.ca/index.php/des/article/view/22155>

  Decolonization and the pedagogy of solidarity  
  <https://jps.library.utoronto.ca/index.php/des/article/view/18633>

  Re-envisioning resurgence: Indigenous pathways to decolonization and sustainable self-determination  
  <https://jps.library.utoronto.ca/index.php/des/article/view/18627>

  Decolonial goals and pedagogies for Indigenous studies  
  <https://jps.library.utoronto.ca/index.php/des/article/view/18628>

  Spirituality as Decolonizing: Elders Albert Desjarlais, George McDermott, and Tom McCallum Share Understandings of Life in Healing Practices  
  <https://jps.library.utoronto.ca/index.php/des/article/view/19142>

  What do We Mean by Decolonizing Research Strategies? Lessons from Decolonizing, Indigenous Research Projects in New Zealand and Latin America  
  <https://jps.library.utoronto.ca/index.php/des/article/view/19113>

  Decolonizing cultural heritage of Indigenous people and their knowledge from images in global films  
  <https://jps.library.utoronto.ca/index.php/des/article/view/19585>

  The Fundamental Laws: Codification for decolonization?  
  <https://jps.library.utoronto.ca/index.php/des/article/view/19265>

  Decolonization is a global project: From Palestine to the Americas  
  <https://jps.library.utoronto.ca/index.php/des/article/view/28899>

  IN FOCUS: Decolonizing Media Studies Decolonize Media: Tactics, Manifestos, Histories, by Nicholas Mirzoeff and Jack Halberstam, editors for the Decolonizing Media Collective  
  <https://cdn.ymaws.com/www.cmstudies.org/resource/resmgr/in_focus_archive/InFocus_57-4.pdf>

  Decolonizing Hydrosocial Relations The River as a Site of Ethical Encounter in Alan Michelson’s TwoRow $I$  
  <https://jps.library.utoronto.ca/index.php/des/article/view/30399>

  Putting feathers on our words: Kaona as a decolonial aesthetic practice in Hawaiian literature  
  <https://jps.library.utoronto.ca/index.php/des/article/view/20646>

  Mapurbe: Spiritual Decolonization and the Word in the Chilean Mierdópolis  
  <https://jps.library.utoronto.ca/index.php/des/article/view/20642>

  Learning from the land: Indigenous land based pedagogy and decolonization  
  <https://jps.library.utoronto.ca/index.php/des/article/view/22248>

  Paper Rocket Productions: A decolonizing epistemology of young Indigenous filmmakers  
  <https://jps.library.utoronto.ca/index.php/des/article/view/22248>

  contentious art: disruption and decolonial aesthetics  
  <https://jps.library.utoronto.ca/index.php/des/article/view/20631>

  Decolonial options and artistic/aestheSic entanglements: An interview with Walter Mignolo  
  <https://jps.library.utoronto.ca/index.php/des/article/view/21310>

  Mapping interpretations of decolonization in the context of higher education  
  <https://jps.library.utoronto.ca/index.php/des/article/view/22168>

  Hip hop and nueva canción as decolonial pedagogies of epistemic justice  
  <https://jps.library.utoronto.ca/index.php/des/article/view/22167>

  Artist’s statement: What decolonization means to me  
  <https://jps.library.utoronto.ca/index.php/des/article/view/26206>

  Tensional decolonization and public order in Western Nigeria, 1957-1960  
  <https://jps.library.utoronto.ca/index.php/des/article/view/22497>

  “The land is talking to me”: An interview with Jamal Juma’ on meanings of land, decolonization, resistance and solidarity from Palestine  
  <https://jps.library.utoronto.ca/index.php/des/article/view/28908>

  Towards the ‘tangible unknown’: Decolonization and the Indigenous future  
  <https://jps.library.utoronto.ca/index.php/des/article/download/18638/15564/>

  Decolonizing Physics: Learning from the Periphery  
  <https://link.springer.com/article/10.1007/s00016-019-00240-1>

  Strategies for Settler Decolonization: Decolonial Pedagogies in a Popular Music Analysis Course  
  <https://www.erudit.org/en/journals/cjhe/2019-v49-n1-cjhe04663/1060827ar.pdf>

  Decolonization 101, from Unsettling America  
  <https://unsettlingamerica.wordpress.com/2011/01/17/decolonization-101/amp/>

  Want to understand the decolonisation debate? Here’s your reading list  
  <https://theconversation.com/amp/want-to-understand-the-decolonisation-debate-heres-your-reading-list-51279>

  Decolonization Not Inclusion: Indigenous Resistance to American Settler Colonialism  
  <http://convention.myacpa.org/houston2018/wp-content/uploads/2017/11/Decolonization-not-inclusion.pdf>

  Decolonizing Ethnomusicology  
  <https://cdn.ymaws.com/ethnomusicology.site-ym.com/resource/group/dc75b7e7-47d7-4d59-a660-19c3e0f7c83e/publications/SEMSN12.2.pdf>

  The Political Economy of Imperialism, Decolonization and Development  
  <https://www.researchgate.net/publication/231980715_The_Political_Economy_of_Imperialism_Decolonization_and_Development>

  Ecological Effects of Decolonisation Strategies in Intensive Care (RGNOSIS)  
  <https://clinicaltrials.gov/ct2/show/NCT02208154>

  What Does It Mean to Decolonize Design?  
  <https://eyeondesign.aiga.org/what-does-it-mean-to-decolonize-design/amp/>

  Now, that might seem like one hell of a reading list. But before you get too tense about the number of resources (nevermind the length,) I want you to mull over a few questions:

  - How many resources have you read that present an uncritically colonial view of our world in the past year? Nearly every political, economic, tech, social report, it’s all written with the assumptions that colonial society is better, without ever even acknowledging what it’s better than.

  - Is there really something more important to do with your time than emancipate yourself from your dependence on the contemporary kyriarchy; colonialism?

  - Do you know of a better framework for conducting that emancipation?

  Too many, probably not, and probably not, are the likely answers. So click around, find some sub-topics that interest you enough to give a foothold, and happy learning!

  (And as you read know: even decolonization is now being criticized by Indigenous land defenders for having become a colonized philosophy: this is an active process of education and exploration of our world, not a static thing you can memorize, enact, and move on from. Like Tuck and Yang famously said, decolonization is not a metaphor.)

##### 2020-10-29 Thursday

- On decolonizing my Web use <span id="sec:org0e711c6" label="sec:org0e711c6"></span> In this email I’m going to, superficially, talk about Barnabus, a piece of software I’m working on. But mostly it’s going to be, as a lot of writing is, about culture, philosophy, and how those intersect with our ways of living.

  (Note: this email is also the first piece of writing I’m drafting while using HashUp, and hopefully will be the first rendered through Barnabus. There might be issues with how it renders, especially since I’ll end up having to copy-paste it into Substack to send it to y’all.)

  As I’ve said before, recently I’ve been talking a fair bit with Phil Hagelberg about technology, and more recently Jess Mahler has been in those conversations as well: their input definitely helped shape this thinking.

  One more thing before I get started: I’m tweaking how I handle my online presence: that’s part of what the move to Substack is. I’m also winding down my Patreon, in favor of Ko-fi, which now lets me accept monthly donations, and also lets me operate a store. If you’re a Patreon patron, please go ahead and cancel that subscription (and set up a similar one through Ko-fi, please.)

  Right, on with the actual discussion: Barnabus.

  Well… after a bit of exposition.

  I live in this weird position of privilege, that I bet a fair number of folk reading this do.

  I am online, clearly, and I have a computer, but my most recently piece of hardware is a ~6 year old smartphone.

  And it feels like every day, another part of the Web increases how much power it requires to use, and effectively says "either buy new tools or be excluded." Fred Hebert, in "You Reap What You Code", relays parts of Ivan Illich’s "Energy and Equity": highlighting the concept of an "oppressive monopoly."

  To rephrase the rephrasing, Illich looks at a society that has developed for pedestrian transit, and later bicycles. In it, all people have pretty much equal access to the spaces the society exists in.

  It’s easy to view cars as a way to increase access in this society: you could go further, it was easier to maintain than a horse, and less tiring than a bicycle. Viewed this way, the society would embrace cars into their infrastructure. As Hebert puts it:

  Rather than having a merchant bring goods to the town square, the milkman drop milk on the porch, and markets smaller and distributed closer to where they’d be convenient, it is now everyone’s job to drive for each of these things while stores go to where land is cheap rather than where people are. And when society develops with a car in mind, you now need a car to be functional.

  In short the cost of participating in society has gone up, and that’s what an oppressive monopoly is.

  Hebert goes into a discussion of software development, and I’ll come back around to his piece in a bit, but for now I’m going to look at this from a social perspective.

  I feel, more and more, like a person who has a bicycle, in a world that is rapidly transitioning to cars. However, unlike the world of roads, which fill the physical space between so many parts of our lives, the places of the Web where one is not are largely invisible: if you don’t make the effort to get onto a part of the Dark Web, you’re probably quite unaware what is happening there. If you aren’t on the Fediverse, you probably aren’t aware what people are talking about there. And, if you are there, you probably aren’t aware of the conversations being conducted in formats your front-end doesn’t accommodate, or in languages you don’t speak.

  But in real life, if there were a community of people in your neighborhood that you didn’t associate with, you’d still see them: their house is physically visible from your front porch, right?

  But the Internet, if it is a "space", is non-Euclidean, and in this space, your neighbors house doesn’t exist. Your neighbor who uninstalled Instagram because it started draining their battery? The neighborhood doesn’t now include them and wherever they’re now sharing photos, if they have anyplace they can do that.

  It… warps and wraps to bury and erase the existence of the neighbor, perfectly stitching over where it was with a neighborhood that is less than it was.

  This has implications in a society living under physical isolation, like we’re now doing because of COVID, that horrify me.

  If the Web is our community, then our community has no space for people who are not Collaborators, because it is only Collaborators who can secure the technological privilege to participate.

  And unlike city centers which have to struggle to obfuscate their homeless populations, the Internet has no such struggle: people are replaced by a 404 and that’s that.

  People working in city centers have, in my experience, a hard time remembering they’re living with homeless people. People I talked to about these concepts in preparing to write this newsletter admitted to having a hard time remembering they’re no longer living with people who don’t have the privilege to maintain an active Web presence.

  I think it’s worth pausing here, to ruminate on a question: how much work would you, personally, have to do to form a friendship with someone who doesn’t have Internet access, today, given COVID.

  Now, consider: it requires financial privilege to secure technological privilege (e.g. Internet access). In effect, we’re saying that people need financial privilege in order to be able to socialize in a society living under physical isolation.

  That is, in a word, assimilation: it is using the threat of loneliness to coerce people into securing enough income to purchase technology that enables the socializing that prevents loneliness.

  "Loneliness" here glosses over all the implications of social isolation: how do you get a job if you don’t have a way to say "Hey, I’d like to apply!" to a businesss?

  And "securing income" glosses over what I earlier stated, that the only way to get such an income is to be a Collaborator.

  The effect of all this is that by using the Web, by continuing to socialize on the Web, through COVID, we are coercing people to become more active Collaborators with the contemporary kyriarchy, creating more Web users, coercing more people…

  Not to understate things, but: bummer! This all paints a pretty dire view of our immediate future, one where COVID continues to affect our ability to live in physical spaces for a couple years. And it undermines a lot of thinking I’ve heard put forward about how to make society better during that period, which all rely on Web technologies.

  Now, I might be wrong about all of the above: it’s based on shoddy logic, to say the least, but I’ve come to believe that these situations are complex enough that some leaps of reason are necessary to progress. We live on, as far as we can tell, the edge of our temporal existence, after all.

  But since it’s a path I don’t see many other people pursuing with their explorations and leaps, it’s where I’m going to head, and that all brings us back to the topic of this newsletter: my Web presence.

  One big step I’m taking is: I’m trying to decouple my communication - and other peoples’ - from the Web, even if it is carried over the Web, and in fact decouple it from computers as much as I can: move syntax over to semantics. To decolonize computers, decenter them.

  For example, rather than drafting this email in Substack’s editor, it’s saved as a file on my local computer. True to the term "Web presence," the emailed newsletter is just one presentation of the writing, which exists, off-line, here, as a file that I can use and reuse.

  There’s some difficulty in actually doing this: Substack’s editor is only HTML, for example, and I’m writing this as plain text. I could use a different editor that produces HTML, but then I’d be left without as basic of a data resource to work with later.

  Let’s go back to Hebert talking about Illich’s oppressive monopoly:

  What are the things we do that we perceive increase our ability to do things, but turn out to actually end up costing us a lot more to just participate?

  We kind of see it with our ability to use all the bandwidth a user may have; trying to use old dial-up connections is flat out unworkable these days. But do we have the same with our cognitive cost? The tooling, the documentation, the procedures?

  Hebert is talking about the software development side of things, but I think this stuff is true of almost all computer use: navigating the world of Facebook apps is stunningly complicated compared to the limited pitfalls of email’s From, $C$, and BCC. (Not that plenty of issues were’t caused by a misused carbon-copy.)

  So, the software we use is created to make it easier to do things, but ends up creating difficulties.

  Back to Hebert:

  The key point is that the software and practices that we choose to use is not just something we do in a vacuum, but part of an ecosystem; whatever we add to it changes and shifts expectations in ways that are out of our control, and impacts us back again. The software isn’t trapped with us, we’re trapped with the software.

  Hebert then points to the ironies of automation, which argues the point from a specifically computer-oriented perspective: the automation of tasks. (In the context of this newsletter, we’re looking at the automation of social communication, which is a broad phrasing of what "social media" does)

  Automation shifts the conductor to the role of monitor, who is now not doing anything but must still be aware of the task, in case something anomalous happens, so the monitor can become the conductor again.

  This introduces two problems: it’s hard to pay attention if you aren’t doing anything, and if you only handle emergencies, you might not be well-practiced to handle them when they arise.

  Bringing this to contemporary social communications on the Web: we’ve heavily automated huge chunks of the task, so it’s hard to pay attention to many things: the gradual absence of a neighbor who hasn’t upgraded their phone in a while, or the humanity of those people you are able to talk to.

  Looking at my own interactions with computers: right now, almost none of it is automated, so it’s important I automate correctly.

  Here’s where Hebert’s article really picks up steam, in both providing criticism that can be applied to how we use the Web, and how I could do things better, at least for myself.

  First, it highlights that our model for viewing computers is flawed, and then emphasizes the importance of correctly building and maintaining models. Our contemporary model is that “humans are better at detection, perception, judgment, induction, improvisation, and machines are better at speed, power, computation, replication, and parallelism.”

  But that isn’t an accurate view of our relationship with computers. Instead, “computers have low context awareness, which humans align. Computers have low change sensitivity, which humans stabilize. Computers have limited adaptability, which humans repair.” And, in reciprocity, humans give attention to the information computers provide, recognize anomalies in that information, and change based on it.

  In short, humans and computers are a team working together.

  What’s the team of a human and their social media look like? To me, a lot like the first model, where the computer desperately tries to automate away your control, putting you in the position of monitor, who only steps in when it’s something the computer can’t handle.

  Complicating things is that what we monitor is largely out of our control, influenced by push notifications and feeds organized by profit-oriented heuristics, and so the very problems we seek to solve change, and our conceptions of possible solutions change to match. We change our mental model to match the capabilities of our tools, and right now, our tools are ones that take our input, strip it of context, and frankly, do whatever they want with it: that they show it to “friends” is largely incidental, something to fill in the space between ads.

  And for those on the Fediverse, it isn’t much better there: boosting allows posts to fill a similar role, especially with the heavily clique-oriented communities of most of the English-speaking Fediverse. You can turn it off, and then you’re just oblivious to the commentary inspiring the shitposts from people you follow who aren’t seeing it.

  Popular discourse much like the election: as much as folk might want to avoid it, its prevalence causes a kind of reverse herd-immunity, where it’s impossible to avoid someone who is transmitting it.

  And that’s, I believe, largely a consequence of the models that social media follows - whether it’s marketized or not. For example, I think the Web’s unquestioning love of “public-first” communications makes it nearly impossible for conversations on the Web to not boil down to whatever the topic du jour is. And our love of real-time chatter is going to make chatting with our relatives living off Earth real difficult, assuming such a thing happens.

  Hebert gives some advice:

  One simple step, outside of all technical components, is to challenge and help each other to sync and build better mental models. We can’t easily transfer our own models to each other, and in fact it’s pretty much impossible to control them. What we can do is challenge them to make sure they haven’t eroded too much, and try things to make sure they’re still accurate, because things change with time.

  This is exactly the sort of thinking that has led me to strip down to just Email, to move from Emacs to nano (no joking!), and otherwise really break down my use of computers to the basics. The mental models I was having to work with to do things on computers were incredibly complex: concepts like “SEO” were intrinsically linked with “writing an essay” because of the latter’s dependence on the model of “blogging.”

  And it’s what has led me toward looking toward information sciences, not just computer sciences, in building my own models for how to think about, and thus do, computing, and all the tasks that encorporates. (Remember how this essay started: ultimately making my computer information accessible to people without computers is a goal.)

  Hebert then goes on to talk about what technical stuff individuals can do. I’ve made “doing computers better” my business, so I figure it’s worth it to go through their suggestions and see how I have, or can, incorporate them into my own models of computers and user habits.

  Hebert says that users “can’t just open a so-called glass pane and see everything at once. That’s too much noise, too much information, too little structure,\[… So t\]o aid model formation, we should structure observability to tell a story.”

  Even Smalltalk users would agree, a structure to one’s observation is important to one’s ability to understand a system. Hebert says, clearly, “There has to be a connection between the things that the users are doing and the impact it has in or on the system, and you will want to establish that.”

  Hebert advocates for logs as being a tool for establishing this, and has some guidelines for accomplishing this. If I understood correctly, removing a lot of nuance, «log the facts of interactions between components, rather than focusing on logging interpretations or the internal mechanisms.»

  I think Hebert here is echoing a lot of the sentiment of computer communications’ wisest elders and most ambitious youth, which I’ll paraphrase as “model systems as an exchange of messages between entities.” But I’ve always heard the advice directed at models of computer systems, not models of computers and their users. Implementing the advice through logging seems… almost magic in its simplicity, at least to me.

  Thinking more generally, I can see how my own recent efforts have been, in part, an attempt to more explicitly recognize the human user’s place in any computer system. I’ve recently started acknowledging that almost all computer systems start with a human defining a schema for the data records that the system will operate on, and that is a resource that exists between humans: the computer, despite doing all the operation beyond “interpretation,” doesn’t actually understand what the schema represents. This has, cognitively, helped liberate data from the computer systems which handle it: they’re simply a convenience, a way to automate their handling.

  Hebert also cautions that these systems, even made observable, are unlikely to be able to control for all conditions that might rise up from their use. They say:

  And here we fall into the old idea that if you are as clever as you can to write something, you’re in trouble because you need to be doubly as clever to debug it.

  That’s because to debug a system that is misbehaving under automation, you need to understand the system, and then understand the automation, then understand what the automation thinks of the system, and then take action.

  If the “system” is translating information and its model to other people, then most of the computer part of it is the “automation.” And gosh, are we ever in trouble, because, speaking for myself, I am not nearly as clever as all the writing that went into making even the most basic parts of my computer, let alone everything that makes up the modern Web!

  \[E\]ssentially, brittle automation forces you to know more than if you had no automation in order to make things work in difficult times.

  I don’t think anyone would argue that the Web’s existence forces people to know a lot of things they’d never have to learn in order to be able to do relatively simple tasks like “send a letter.” Hebert advises that in order to be able to avoid this, the system needs to be written with the assumption that its automation will encounter conditions it cannot control, and control will be given to a human operator.

  \[M\]ake it possible for the human to understand what the state of automation was at a given point in time so you can figure out what it was doing and how to work around it. Make it possible to guide the automation into doing the right thing.

  Hebert, in the next section, suggests we look to accessibility for ways to enable these hand-offs, which are where a system’s new capabilities emerge, as doing so can help avoid “nasty surprises.” A lot of the systems I’m planning and developing for my own computer use are centered around text and its manipulation, which provides many interesting routes for providing access to information, but I’ve also been trying to look toward the forms of access I see needed by people around me: for example in my design of a user-account system for my MUD, I’ve been orienting it around plural, not individual, identities.

  “Complexity as to live somewhere,” Hebert repeats, as so many system engineers have: “if the code is to remain simple, the difficult concepts you abstracted away still need to be understood and present in the world that surrounds the code.”

  I think that intentionally partitioning the data schema into the realm of human complexity, as well as (as Hebert seems to suggest,) pushing the interactions between systems into that realm as well, leaves the internal mechanisms of the system within the code’s complexity.

  Given what information has to be handed off to the other users of the system, I think that’s appropriate: whether the data structure’s complexity live in the code or in the documentation, it’s going to have to be understood by some users. The question is just, how esoteric is that knowledge? By putting it in the documentation, by modeling it as data schema, it’s made accessible even to people who don’t automate computer systems. Put in the phrasing of Hebert’s last section: segmenting the information part of computer systems away from computer science and constructing it as a part of information science “diffuses” the work of understanding a system across its users.

  So, with all this in mind, what am I building?

  Right now, I’m building a corpus of data, currently living in flat-files. Different pieces of information correspond to different documented schema: some pieces of information are newsletters like this one, others are lists of books I can lend out, others are about seeds that I’m storing.

  My immediate next project is Barnabus, which will take take in those one or more pieces of data and render them as HTML.

  In essence, a static website generator, though I plan on using it to generate single long documents that I then upload to Ko-fi as pay-what-you-want downloadable content.

  Barnabus itself relies on Hashup, a subsystem that takes my bespoke text markup, so there’s a lot of messages passing around here.

#### 2020-11 November

##### 2020-11-03 Tuesday

- "Captains go down with the ship… but there’s no captains here." <span id="sec:org87ed6f4" label="sec:org87ed6f4"></span>

  > There’s no petition we can sign to end poverty, or to make ’no’ a word with teeth. I know there’s not enough windows to break us a free, but maybe one would be just enough for some dignity."[^4]

  There were once three people who, through their patronage of the same salon, became friends. Two worked within the city’s university, and one lived just outside it.

  These three friends had similar goals. One of the students wanted to share stories kept inside the university’s walls with everyone in the city. The other student wanted to help people in the city share their stories with the university. And the third wanted to leave the city, and see who was telling stories that no one knew about.

  So that is what they all did.

  The university and the city did not like any of this. They went to the friend who was sharing the university’s information, and threatened to imprison him unless he helped them capture the other two friends.

  The friend was distraught. Either way, they could no longer share information with the people of the city, and either way, the city would probably capture their friend. Maybe if they agreed to cooperate, they could warn their friend.

  The next time the other student came into the university, bringing stories from the city, their friend was waiting for him. They tried to warn them, but the whole thing was a trap, and both were captured.

  Both were threatened with imprisonment unless they helped the city find the third friend, who had left the city many months ago. They could not help, even if they wanted to: they didn’t know where their friend had gone.

  While waiting for their trial, the friend who shared information from the university killed themself. This drove the other captured friend into a rage, and doctors from the city gave him a treatment which permanently calmed him.

  Without their friends and anger, the friend was let back into the city, and they never tried to share stories again. A few years later they also committed suicide.

  The third friend, hearing all this, vowed to never go back to the city, and stayed in distant lands forever.

  **I’m excited for the relative silence of the next few months.** The city is a metaphor, and in its reality, it doesn’t have a boundary you can step past, at least not right now. And I am so tired of having to listen to the din of “cityfolk” living their “city” lives, despite wearing my rejection of their ways on my sleeve. (Literally, if you look close at the symbols on my bracelets.)

  Nearly everyone around me put a hold on their community work to refocus around the election, and I am excited for a few months without having to deal with folk like that while they keep to themselves, distraught about the election results.

  They’ll come back next spring, talking about how All Cops Are Bastards and smashing the state again, “organize” of the local mutualist actions, and things will be very supportive of the status quo again.

  But for these next few months after the election, all the faux radicals who burnt themselves out on reform are going to be asleep, and I’ll actually get to see who’s still around packing up boxes of food and medicine for the community.

  As soon as Bernie started campaigning, people wearing anarchy patches on their thrift store coats stopped showing up to meal distributions because they wanted to support that campaign. People come when I’m distributing food to hawk their favorite candidate, and get pissy with me when I tell them they’re voting over stolen land and I don’t want to hear about it.

  There are so many many people out here working toward a better world, with no shits given toward petitioning the US state, and I haven’t been able to hear them all year over the cacophony of election fever.

  ‘Round here voters got pepper-sprayed standing in line for the polls a few days ago, we’ve had conservative judges for decades removing folks’ right to vote and establishing gerrymandering, we’ve repeatedly had our voter rolls purged.

  If a "legitimate" election is one where all the folk who are promised the right to vote can vote and those votes are counted proportionally…

  We haven’t ever had a legitimate election, and I really don’t know what could change by the end of today that will somehow make that clear.

  If decades of disenfranchisement, gerrymandering, and physical violence, after decades of Jim Crow, after decades of other voter suppression, didn’t make you honestly consider that voting might be a poor use of your time compared to almost any other community action you could take, then I really doubt whatever today brings will.

  To folk who will continue to pitch reform: have fun posting petitions for Congress to do some white-people magic to try and give Biden the presidency or whatever it is y’all end up doing: I for one will be thankful you’ve accepted your role as a Collaborator and hope you can join me in accepting that as your chosen role, because it apparently is the defining aspect of your political identity, and it is very tiresome that you speak through leftist metaphor.

  And, to the people who are planning on radicalizing tonight, after the election passes your "red line" for "illegitimate:"

  Ew, gross. You’re willing to fight cops to secure the right to pick the military commander of an imperial state existing on stolen land, but not to keep your Black neighbors from being murdered by that same state?

  What the fuck is wrong with you. I don’t want you in my Bloc, y’know, if you’re only here to re-secure your privilege.

  That might sound like I’m telling people not to radicalize if they haven’t already.

  No! Please, please, stop Collaborating with the kyriarchy! But do it in a way that recognizes you’re joining a complex confederacy of intersecting radicalism that stretches back literally my entire peoples’ history.

  I welcome anyone to stop Collaborating, at any point. But I also welcome them into the wider community of those who have, and those who never started, and those who never had the opportunity.

  I think maybe Christian imagery encourages folk to envision themselves, if they are leaving their status quo, to envision themselves as a lonely individual, walking into the desert, maybe a staff in hand, maybe wearing robes.

  That’s not accurate. There are vibrant and thriving communities on nearly every inch of space outside the metaphorical city of Civilization. You won’t be alone, unless you work to make yourself that way.

  You’re radicalizing, and it’s important to recognize that starts with your own thinking. It starts with recognizing your own cultural myths, and how they help or hinder what you actually want to accomplish.

  And as those bougie jetsetters will tell us, exposure to other cultures is a great way to develop a clarity toward one’s own culture. So learn to see the cultures that already exist around you, that your Collaborationist habits have so far excluded you from.

  And, welcome to the community. I know it might seem contradictory to welcome you while also saying you’re gross for just now radicalizing, but I think it makes sense:

  Part of radicalizing, in a way that recognizes you’re joining a community, means really grappling with the fact that yes, it is ew, gross, that you didn’t radicalize earlier, and figuring out why that is.

  Was it due to misinformation? Then you need to be developing methods to prevent such ignorance in the future.

  Was it due to financial stress? Then you… have a good excuse, but please radicalize quick because in my experience mutualists can meet one’s survival needs (excepting shelter) a lot better than capitalism, so it’s a fiscal savings to be mutualist.

  Was it due to a commitment to career? Then you’ll have to reckon with that before really getting involved.

  And so on. How you got here is very important in defining who you are, and where to go from here. We’re all, y’know, unique and dealing with unique situations.

  A few months ago I heard people now casting ballots repeating the words of Assata Shakur. It seems that they’ve been forgotten by a lot of folk, so let me bring them forward again:

  > “It is our duty to fight for our freedom. It is our duty to win. We must love each other and support each other. We have nothing to lose but our chains.”

  Photo above is of some of the plants I gave out to neighbors this summer, hinting at the next email, where I plan on giving some advice on how to get started actually engaging in self-emancipation: consider this a delayed Settlerday post, because really, what’s more Settler than the election?

##### 2020-11-04 Wednesday

- Into our future, step-by-step <span id="sec:orge5ec523" label="sec:orge5ec523"></span>

  > Land back. Water back. Medicine back. Ceremony back.

  1.  ***Land back.*** Return control of the material world to all those existing in it. No more rulers, no more prioritization of human needs. Mitakuye oyasin: we’re all relatives, all of us on this Earth, and it’s only by establishing that as our explicit relationship that we’ll be able to adapt.

  2.  ***Water back.*** Once we’ve taken control of our material world, we have the freedom to shape it in ways that benefit us all. The ecological projects of Indigenous peoples dwarf the engineering of colonial cultures in longevity and scale: let’s get back to actually developing our planet as a home.

  3.  ***Medicine back.*** With control of our material world and the ability to change it, we can finally start working to build up “medicine:” for our physical bodily health, but also all things we might need medicine for. In some implementations of Lakota belief, all things are medicine: they help or hurt our health, as a person and as people. This doesn’t clash with many colonial philosophies, which say that all that happens in a world, and all the actions a person takes, helps shape that person’s identity. But unless we’re in control of our world and actions, we can’t really start to shape our own identities. Without land and water back, we can’t really make good medicine.

  4.  ***Ceremony back.*** Sometimes when talking to despondent colonists I’ll highlight that in some ways, it’s never been easier to be a human person: with the human-caused collapsed of our climate, the “meaning of life” is self-evident: mitigate that disaster. Even the most anti-human humans are motivated to act against it, enough to prevent the extinction of all life on Earth, and most of us are motivated to act against it because we think human life is worth continuing into the future, for various reasons. But this “meaning of life” is hopefully, temporary: it can be fulfilled by the return of indigenous ways of handling land, water, and medicine. With its fulfillment, we’ll again have a terrifying freedom to seek out our purposes, as individuals, community-members, and a species: to develop our own ceremonies that impart meaning into our lives, based on our lives, not (once again) the needs put on us by either an exploitive group or their emergencies.

  ***Listen to your elders.*** Before I go further into the above, I want to pause and offer some words of caution, for those who are preparing to start performing some form of one of the four actions above. That is, if you’re, today, starting to change your relationship with the kyriarchy: listen up: ***listen to your elders.***

  There are a lot of people in the same position as you, who are going to reach that same conclusion, today or sometime this week. And with the exact some confidence as they endorsed things like electoralism and reform, they will now endorse radicalism. They won’t stop and talk about how they’ve changed their mind, because they probably don’t see it as a change of mind: they see it as the external world having changed.

  I’m afraid that wasn’t expressed clearly, and it’s an important notion for me to convey here, so let me try again: People who are radicalizing this week believe that the world has changed, this week, in some way that means reform is impossible and radical action is what can work. This implies that all existing radicals are still wrong, because they radicalized “too soon,” and it doesn’t consider what’s far more likely: we all have different knowledge and experience that informs how we view the world, and there’s no real “too soon” or “too late” to radicalize.

  Unfortunately, these new radical folk are going to be very enthusiastic, the same way almost everyone who’s discovered a new trendy hobby is. Their approach to discussing this issues is likely going to treat everything as new and surprising, and will erase the perspectives of others, that these are just continuations of systems that have been in development for centuries.

  Try… not to give them too much of your attention, as loud as they are. Listen to the folk who have been rejecting reform and working toward radicalism for decades: they’ve got experience and knowledge that y’all, no matter how enthusiastic, aren’t going to have. I don’t necessarily even mean stuff like how to treat tear-gas; that stuff can be learned from a pamphlet.

  I mean how they choose to frame the contemporary events in their town; how they talk about the new buildings, how they talk about TV shows, all of it is going to be fundamentally scoped by their experience that means it will all be… different than what new radicals are saying, which is, despite their sudden shift in opinion, still coming from a person informed by years of active Collaboration.

  And beside: these new radicals who were advocating to vote yesterday… were wrong. They were consistently wrong about many fundamental claims about our world, down to the legitimacy of the U.S. as a government. And now they want you to listen to them like they weren’t loudly wrong just yesterday.

  Anyway: I’ve been an on-the-ground radical for like, three presidents, and I see this every time there’s some push into fascism that even the most patriot American can’t help but feel funny about. Folk who were so adamant that they were right about reform are now going to be very adamant they’re right about shit like y’all getting mass-arrested, or some other nonsense. They’ve made their persona or career around being loud, not right: tune out and pay attention to who’s been calling this shit the longest. (Hint: it ain’t me, I can just type fast and turn a phrase. Seek out and listen to Indigenous Elders, especially women: they’ve been actively tasked with keeping their heads on straight no matter how wonk our society gets.)

  Now, back to the topic-at-hand: a step-by-step guide for going into our future.

  I know it might seem silly to say that there’s a four-step plan we can follow to fix the world, but… I don’t think it is: the world is… if not simple, it is finite. In truth it’s actually just two steps: fix the Earth and fix our relationship with it.

  And thanks to the anthropogenic dissolution of our climate, fixing the Earth is… if not easy, it’s hard to do wrong, and we have a convenient step-by-step for getting started there, too: 1) Reduce, 2) Reuse, 3) Recycle.

  But that’s only half the picture: to *reduce* material use, we have to *innovate* new ways of using what we have; to *reuse* waste we have to *innovate* new ways of repurposing scrap, and to *recycle* we have to innovate new ways of deconstructing materials, which might mean *innovating* new ways of constructing things. *(And I’m looking at genuine reuse here: using produce crates to hold dirt in place, , not taking an old hubcap and turning it into a clock that requires a new little plastic and metal timekeeping mechanism.)*

  So, let’s bring it all back together:

  How can you work to take or return control of the material world to its peoples?

  > If you’ve got land, give it back. If you’ve got money, gift it back. If you’ve got hoarded wealth, relinquish control. It is time y’all reckon with that shit. I know white queers looking to buy land; Looking to buy more homes. Y’all better be turning around and giving y’all’s other homes back to the folx whose land you’re occupying. If not, you’re trying to make a profit and keeping access to housing away from those who can’t afford housing. If not, you’re keeping land and housing away from Black and Indigenous people. And y’all have excess money. Y’all have excess land and homes. Excess is capitalism. Hoarding resources is colonialism. Take the financial hit and gift land and homes to community. We know y’all will be fine without that money. And even if you’re not, you’ll be fine long-term becuase you still have acess to jobs, land, housing, healthcare, and resources that we (the queer BI people) would never have. So y’all better re-think putting that house for sale. Y’all better rethink buying that other house on stolen land. Y’all better rethink buying stolen land. Y’all better rethink that savings account.[^5]

  And to cut off the people who read that and immediately go “I won’t put myself in poverty for social justice,” here’s an anonymous quote:

  > "This is about reparations and understanding that the comfortability afforded to you by your savings account is not about you pulling yourself up by your bootstraps and then donating to "marginalized communities" (as if we depend on you to donate to us to keep us afloat) - but that your ability to save and hoard wealth, while not the same as the ultra-rich, is still part of a settler colonial framework that is built on stolen land and labour and ultimately protected by violent forces such as the police, borders and military. If you can’t understand that your hoarding of wealth is not benign but rather a part of an overall project, then I’m not sure where to begin. No one, I assure you, is asking folks to enter willingly into poverty. What is asked is simple - to examine the ways that you are able to build wealth on the backs of others & recognize that if you are truly in this for change and not just talk, then that comes with relinquishing of comforts that you may take for granted."

  Now, I recognize, a lot of people reading this probably don’t have much, if any, hoarded wealth. But some of y’all do, and a lot of y’all are living lives that are set up to protect you from poverty only by participating in a system that lets others hoard your wealth.

  But to the rest, “give up your excess” borders on a rude suggestion, I think, so thank you for bearing with me while I got it out of the way. *(If you do have some excess, I’ll happily take it.)*

  A lot of y’all are trying to figure out how to build wealth, not just without choosing to build it through the exploitation of others, but because you cannot access those opportunities. I’m in a similar position, but I’ve been in it for, well, two presidents, so I think I can help. I think I know a lot of things y’all should be learning to do, if you want to take control of the material world around you, regardless of what control others give you. Learn to make fires, clean water, save seed, make dirt, cook a meal for a hundred people, tell stories, keep a child company while others look for their guardian. I’m working to create resources that will encourage the development of that knowledge.

  But, I’ve been in this position for two presidents: I’ve lost a lot of that novice perspective, and I’m not sure what else folk might need to know that I’m forgetting. So, I’m asking all of you who have the energy: think about what you reckon I might know, that y’all might want to know to improve your future. And let me know what you come up with.

##### 2020-11-05 Thursday

- The things we live for <span id="sec:orgc6a2361" label="sec:orgc6a2361"></span> I was asked two questions, from different folk, that have ended up tying together:

  1.  “Would you please define ‘indigenous,’ as you use it?”

  2.  “Is it really fair for you to keep referring to colonial society as though it’s not your society?”

  But first I’d like to thank everyone who has been reading this newsletter so far, and has offered feedback. I especially appreciate y’all bothering to read because, so far, I haven’t taken tremendous pains to edit what I’ve been posting, and that ability to write fairly spontaneously has really helped this feel like communication, not broadcasting.

  Before I get started, here’s a photo from my garden.

  (A bundle of raspberries ripen against a ground covered by chickweed, wild onion, and marigold leaves. A few raspberry leaves are close to the camera, and two spinach plants flank the far side of the shot.)

  So… “Indian.” Or “Native American?” “Lakota” or “Indigenous?” What about “indigenous?” Most folk have a really complex set of vocabulary they use to describe themselves, in my experience, and the more they deal with a type of identity, the more they develop their language around it. I’ve dealt with my Indigenous identity a lot the past few years, and so I’ve come to develop a lexicon around it. I’d like to define, as best I can, how I use these terms, when I’m talking about myself and other people. It’s important to note that none of these terms exist in a vacuum: I might choose or be forced to change my language in a situation depending on a variety of reasons. But when I’m speaking under my own terms, this is how I tend to define them. It’s also important to note that capitalization matters: Indigenous is different than indigenous.

  I’ll try and work from least to most specific, and least to most offensive, I guess?

  So first, ***native*** with no capitalization is a thing that people (plants and animals) can be, and it means that they’re from a place. Colloquially, a cactus can be native to a desert, a white person native to Oklahoma, or code native to an organization. However, in scientific writing, using “native” in this way has fallen out of favour.

  Now, people prefer ***indigenous*** with no capitalization, which means the same thing as native if you’re talking about anything except human people, and most folk use it synonymously with *Indigenous* if they’re talking about human people. I don’t: I can’t tell which wider subculture it is that shares my precision here: I reckon it’s either Indigenous people that share my age, “political” views, or have also lived in urban environments, but of course I have no data.

  To me, *indigenous* is something anyone can be. I’ll encourage y’all to read Braiding Sweetgrass, where the author talks about becoming “indigenous to place,” and I think that really hints at what indigenous can and should mean: someone who lives in a *system of reciprocity with their environment*.

  Hmm… let me get back to that; it’s beginning to get clumsy to not explain ***Indigenous***, with a capital “I.” There are Indigenous cultures: those which live in that “system of reciprocity,” and so there are Indigenous people, but not every Indigenous (capital I) person is indigenous (lower-case i). It isn’t a political designation like some of the terms I’ll talk about shortly, but a… recognition of the cultures long-standing relationship with the world around them, and the knowledge and experience that relationship has imbued over the centuries.

  So what is this “system of reciprocity with an environment?” Certainly too complex of a thing for me to explain off-the-cuff here. But… alright, let me give some sort of explanation of something here a try.

  Maybe this is a hold-over of being raising under a Catholic backdrop, but it seems natural to me to view the human world right now as split between two different intentions, that I contrast in many different ways; if you’ve read past newsletters or writing of mine you’ve picked up on it.

  There’s one side: the contemporary kyriarchy. (Not “the kyriarchy,” because there can be many, in the past, and in the future, it’s just the contemporary one.) And on the other side, there are emancipators. Colonials, and Indigenous.

  These are the “habits” cultures fall into, though some walk the line for long stretches of their history. Cultures are active, not just philosophical, and these habits have mechanisms. The kyriarchists seem unable to view the world except as resources to be manipulated. And indigenous peoples seem unable to view the world except as a web of relationship.

  *(A tangent: I don’t think contemporary kyriarchists actually view the world this way; this model was lost with the aging-out of the architects of Modernism. I think contemporary kyriarchists exist within a simulation of a reality in which they can emulate their God.)*

  So, *indigenous* people are people who don’t view the world as a set of resources to be manipulated, but those who view it as a set of relationships between everything in the environment, and things are constantly giving gifts to each other: dirt gives energy to the plants give leaves to bunnies give poop to vines give squash to humans give work to the dirt which gives energy to the plants. Obviously it’s not a clean and simple loop like that: the humans work the dirt and catch seeds on their trousers and carry them to new locations, a gift of sorts.

  (Above is a photo of Rama Tulsi growing next to the train tracks here in town, where they intersect with the main street going through town. The seeds almost certainly fell off my clothes, because I have two Rama Tulsi I pass as I leave my home. I took this photo today. I’ve done a lot of work this year to spread medicine in my community: active labor to get it done. This is… something else: it’s medicine I spread just by living my life the way I do. I only noticed the plant growing today, as I was carrying lettuce back from the grocery to the free market.)

  Like I said: it’s not a loop, but a web of reciprocity. It can seem very complex when you first start looking at it, but once you develop it into a more holistic perspective, it becomes quite simple. Things like all things being relatives, in the sense of kin, become easy to believe when you can perceive how even the clay under the soil has its role in this web: receiving a gift of water from the soil and gifting it it on to the aquifer.

  Some people encourage an active development of their relationships within this web, these are the ones I call *indigenous*. Some cultures have encouraged that development for generations, and developed into the fabric of their way of living: these are the ones I call *Indigenous*.

  In the last newsletter I included a photo of a cross-stitch which read, “It is only indigenous ways of living that can save us,” or something close to that. I want to really emphasize something here, that’s become… seemingly very imporant to emphasize, especially in my community-building.

  Being indigenous is a way of life that requires believing in the indigenous perspective as a truth. It’s not an action or set of actions that can be taken, the way one way can garden: being indigenous is not a hobby.

  If I tell you to think of some indigenous action, you probably thought of something, well, ecological: maybe gardening (I did just mention that,) or foraging, or maybe making a fire. But indigenous action doesn’t look like any specific thing: it’s a way of perceiving the meaning in any action: be it an act of emancipation or an act of coerced Collaboration.

  Like I said, I’ve been asked if it’s fair for me to keep referring to “colonial society,” when I live in a colonial settlement: aren’t I a part of colonial society? I honestly reckon… no, I’m not. I could list a bunch of things I do in my day that are unlike the things colonial kyriarchists do, but even the things I’m coerced into doing that are things they do, I do with, it seems, a very different worldview. At the end of the day I’m not looking to live for personal prosperity or any of the other kyriarchal values, but to develop the strength of my relatives, and the best way I know to do that is by receiving and giving gifts between them.

  There’s a lot of nuance I would prefer to get into here, about how almost everyone has been contaminated by colonial ways of thinking and living, so I’m not “fully” indigenous is this sense of viewing life as, and participating in, a web of reciprocity. I mean, right now I’m typing this on a computer that’s powered by coal. But, I’ve already rambled for quite a bit on this concept of indigenous, and I’d like to get back to defining terms. I’m sure I’ll come back to all these topics. There’s one thing I want to make clear before I move on though: you don’t have to be Indigenous to be indigenous. Anyone can develop a way of life that isn’t based in kyriarchism and resource extraction. A lot of people have; I’ll argue against anyone who says those of the African diaspora haven’t become indigenous to America. But, I want to wrap this up sometime soon, so on with defining terms:

  CNN coined a new one on election night: “\*/something else/\*.”

  I think this kinda forces a new question: stop asking me if I consider myself a colonial. Ask yourselves why your society won’t let me, and needs to literally go beyond referring to me as an Other and call me, outright, “Something Else.”

  There’s a common wisdom among contemporary Indigenous activists from Turtle Island: “erasure is the mechanism of our genocide.” Presentation of the diverse set of cultures that make up the Indigenous peoples living within U.S. territories as “something else” is erasure; that simple.

  (A political cartoon by Ricardo Cate. Pilgrims arrive on a beach and point at three Native-looking folk, and say “These people are something else!” The scene is captioned “Meanwhile, somewhere else at some other time…”)

  Back to “normal” terms, with ***Native American***. I generally see it as a “respectful” way to refer to anyone who is Indigenous to a territory claimed, at least in part, by the United States. There’s some issues with the term: for example, people may be members of tribes the U.S. government doesn’t acknowledge, yet also are encouraged to state they are Native American on the census. Like Indian, the term has been heavily intertwined with our politics, so can be complicated by that.

  So ***Indian***. As a general rule, this one is for people who are *Native American* from the “mainland” U.S. states to refer to themselves. Or, for other people to use if they’re referencing U.S. law where the term is used - but then it refers to a more specific group than above: what group might change depending on context; whichever treaties are relevant. A rough “exception” to whether or not colonists “can say it” exists for ***Indian Country***, which can be used by anyone to refer to a contemporary geocultural region, but if you’re not in or from the region you’re probably not well-versed enough to be talking about it as one so don’t.

  ***Lakota*** is a Native and Indigenous culture, one that I consider myself a part of, but it’s also a political tribe, which I’m not a member of. It’s also the name of the language, to further confuse things.

  But, hopefully this newsletter as a whole didn’t add to your confusion. Feel free to ask questions if you have them; I know this one was more rambling than usual.

##### 2020-11-11 Wednesday

- Decentering computers, whether I like it or not <span id="sec:orgfad98f5" label="sec:orgfad98f5"></span> Hey folks, sorry for the delay in sending out an email. First, my laptop’s harddrive died, then the operating system I installed on the replacement drive was very very hard to use (laggy, glitchy,) and it’s only yesterday I got that replaced (with Debian 10, for the curious, and Fedora 33 was laggy and glitchy. Running KDE Plasma and first Gnome then LXDE on Fedora.)

  Since I had a few days without a computer around, I actually have written up the next couple letters I plan to send y’all by hand - expect them probably over the course of the day.

  Last night I finally got back around to the Internet and my Fediverse instance was still down, so I got straight to restoring my system. I was preparing to move my backed-up data off the external harddrive I keep it on, and had just begun the process… when I heard a sound I’d just heard last week: the spinning clicks of a harddrive head failing to read its drum. Oh.

  My external harddrive has died, and it was the sole back-up location of most of my portfolio - about 14,000,000 words, thousands of photos, days of audio recordings. (Judge me if you want for only having one backup, but in my defense I went from 3 copies to 1 in a couple days and was in the process of creating a duplicate when the 1 crashed.)

  I went to bed not too long after the drive crashed, and I don’t think I’ve quite reckoned with just how much got deleted, so my opinion and perspective is sure to change as I come to terms with the situation, but for now, I’m trying to construct it as an opportunity: I now have the perfect excuse to de-center the Web even further, since I’ve lost my draft Website.

  I’m going to mull it over through the day, but I’m more-and-more inclined to set up Ko-Fi as my primary website, and beside it just handle my email account. Ideally this would mean moving of Substack too (as nice as the platform is, I don’t trust them not to monetize in ways I’m uncomfortable with later), but I know my email host wouldn’t want me sending out a newsletter, even to ~50 people, from their service.

  I think my next computer step then is… finding some hard-drives to keep backups on, and then I might work to convert one of the raspberry pis I got back from a local closed business into an email server.

  If I can use the Internet by interacting with my email and managing my Ko-fi profile, I think that’d be really useful in decentering computers without giving up too much capability.

  In other news, my boss is working to replace me, and my compensation for my labour is reduced rent on this tiny studio apartment, so sometime in the next month or so I’ll be moving, which will be stressful and I’ll either send out way too many newsletters or not any at all, as I cope with that. (At the moment, that rent-reduction and y’all’s contributions are the income for my household, so finding a new place to live and the new income to secure it are both going to be difficult, given my lack of magic kyriarchist scrolls and the speed at which my partner and I have to find a solution.)

  Anyway, just a quick update, mostly for folk who are wondering why I’ve been so quiet the past few days: my laptop was laggy, my Fediverse instance is down, and then my computer crashed and I haven’t gotten logged back in and checked all the various notifications on the seemingly thousand accounts I’ve got scattered around. On top of that, I’m having to look for new housing and work.

  For y’all, the most apparent consequence of this will probably be that I won’t send out emails every couple days, but send out several emails in a row as I transcribe them from paper. And - I’d be remiss if I didn’t specify - if anyone has any recommendations for housing around Chapel Hill or Durham, in North Carolina, or any remote work you’d like to hire me for, please reach out. I, uh, don’t have a resume or portfolio to provide at the moment, I’ll probably get to that tomorrow, sigh.

##### 2020-11-12 Thursday

- Decenter whiteness <span id="sec:orga4bbe96" label="sec:orga4bbe96"></span> For some of us, it has been a frustrating week, and I am tremendously grateful to those who sought and developed community these past few days, cautiooning against celebration and rest. For many, Biden’s victory has relieved an anxiety present since Trump’s inauguration.

  But - and I know I am repeating a refrain - those fears existed before Trump. What changed was that Trump marred the petina covering the kyirarchy in a brilliant neoliberal verdigris, and even those not directly harmed by its violence had to reckon with it in ways new to them.

  While people of color were empirically the reason Biden won, and while many might currently be calling for that to be recognized, I don’t believe our social institutions have ways to center the views of those peoples, even in a limited scope… without assimilation.

  Centuries of intentional distancing will not be easy for wašíčula to remedy, and it is the responsibility of those within our kyriarchal society to find the remedy.

  No other way of living can be centered, until whiteness is decentered. Any attempt at "centering" marginalized voices before making space is, conscious or not, an attempt to incorporate them into the existing system.

  This is reflected in the language of some "allies," who ask their peers to "make room at the table." What the "table" is remains unquestioned, as though meeting around it is immutable.

  This naturally excludes a great number of voices. There are many people who cannot approach the table, for many sitting at it would harm them if they’re able. Others choose not to approach it. Some are scared of what it would do to them, others simply think it has nothing to offer them.

  And a fair few would rather see the table chopped apart, and everyone at it given a stern talking-to.

  As long as the future is seen as "progressing" when everyone has a seat at the table, and "regressing" when fewer people do, we limit our society’s capabilities to whatever the table is capable of.

  Which is long enough to rely on a metaphor without defining it. What is "the table?" I’ll address that in one of my next letters.

  P.S. I’ve set up my Itch profile to serve information I publish - right now there’s two little short stories on there, and the script I used to generate their HTML renderings. I’d earlier talked about using Ko-fi for such things; I think Itch is better suited to it, though I’ll continue to use Ko-fi for accepting financial donations and, soon, offering physical goods.

##### 2020-11-16 Monday

- Of ducks and illusions <span id="sec:org95f6e9d" label="sec:org95f6e9d"></span>

  - Introduction <span id="sec:org7902caf" label="sec:org7902caf"></span>

    > "Hail, hail, what’s the matter with your head? Yeah, hail, hail, what’s the matter with your mind? And your sign?"[^6]

    I slept well last night, though with many meaningful dream to unweave this morning. But my spirits feel high, and I’m excited to be writing to y’all, though I’m not yet certain what I’ll say.

    I live far from Hé Sápa, my chosen center of the universe. In fact, I’ve only seen them once, driving by in the backseat of my mom’s adoptive father’s Buick car, while his wife read Reader’s Digest in the passenger seat. I would’ve been 10, and my dad had gifted me a Palm m100 – a PDA; precursors to smartphones. I used it to meticulously write out dialog for a simple role-playing game whose source my dad had shown me how to edit and compile. All that to say, I’ve never really been there.

    Yet sometimes there are little bits of serendipity that let me feel like that place, and the people of that place, are “home.” Now, I don’t reckon it’s anything mystical. Spend half a decade reading texts about a philosophy, with the intent of culturally, if not physically, immigrating, and you’ll probably develop a bit of a cultural “accent.”

    The week before last I drafted a poem, that I’ve lost since my data was lost, but it went something like this.

    The things we owe to each other The things we say to each other The things we do to each other These are what give unity, not our forms of government, not our acts of labor, not our faith in ourselves. Our relationship to each other is interminable, and that can be a source of strength.

    A bit clunky but it hints to a few intertwined ideas. Regardless of philosophy, we are here together – human, animal, plant, stone, and nebula. This morning I was sent a link to Ruth H. Hopkins’s essay, "The Ties That Bind,"[^7] released on the Web last week. (I’d suggest putting on the song "All Nations Rise" by Lyla June,[^8] read Hopkin’s piece, then return here.)

    Reading it, I was unsurprised to see Ruth and I appeared to be thinking about the same sorts of concepts. As they explain, Indigenous peoples have a lot of experience with their way of life: it seems inevitable this would lead to multiple people reaching similar conclusion in response to similar information.

    - The question of decolonizing <span id="sec:orge776a6c" label="sec:orge776a6c"></span>

      Decolonizing, indigenizing. What do they mean, and how do we do them? I feel like sometimes I am writing sheet after sheet just chewing on these questions, and I never give an answer, I just look at the question in a different way. From another perspective, though, I think looking at the question in a different way might be a form of answer.

      In Western tradition, divination is often a way of re-imagining a problem through metaphor, and storytelling fills a similar role in many Indigenous cultures. While these aren’t answers to the questions-at-hand themselves, they’re tools for getting to answers, making them answers to the question, “How do I answer questions?”

      And it may be that making space for alternative answers to that question is decolonization. It may be that a certain sort of answer is indigenizing.

      I get asked in different ways questions about what I think the future will look like, and these questions often ask what we can do to get there. I don’t know if those questions can be related. What I do now, gardening, composting, so on, is what I need to do for today, so there is a home here for future generations. But what I do today is not what I expect those future generations will be doing. Had my ancestors insisted on giving me tools for their time period, I’d be a crack shot with a bow, perhaps, if I lived where one could shoot a bow.

      Instead, they worked to pass on tools for dealing with my world of today: tools for building culture and love, not hatchets and tipis.

      “What does ‘\#LandBack,’ at a global scale, look like?”

      “What should I do to practice ‘#LandBack?’”

      These questions don’t recognize a knowledge the askers hold:

      “I know what global kyriarchism looks like” and “I know how to practice it.”

      What is kyriarchal practice? Answering questions with kyriarchal complicity.

      What is anti-kyriarchal practice? Looking for different answers.

      What is Indigenous praxis? Using answers based in truth.

      So what’s truth? Taking a break now, but when I return I’ve got a story about ducks.

  - Iktomi and the lake of ducks <span id="sec:orgb32cfa2" label="sec:orgb32cfa2"></span> Iktomi woke up and he was hungry. Those of y’all who know Iktomi know, this is how he always woke up: hungry. So, Iktomi went to work, looking for a way to sate his hunger. But Iktomi didn’t “work” the way most folk did. His work was to talk and trick, that’s how he got what he wanted.

    So when Iktomi woke up, he looked round at the sky, at the crows. “What is there to eat?” Iktomi asked. “Not much!” the crows replied, and it was true. None of the berries were ripe yet, and though Iktomi’s stomach hurt from hunger, he could also remember how it hurt from eating green berries. “Thanks for nothing,” Iktomi murmured to himself, and started walking, looking for food. While wandering, he heard laughter.

    “Where folk are happy enough to laugh, they’re fed enough to share,” Iktomi reasoned to himself, and set off looking for the source of the laughter. After a while, Iktomi was close to the laughter. He was at the top of the hill, looking down on a lake, where a big group of ducks were playing. Iktomi thought for a bit, then got to work.

    Some time later, Iktomi began walking down the hill, carrying a dense bundle of branches on his back. As he came down, the ducks playing on the lake took notice of him. They were familiar with Iktomi and called out, “Iktomi is coming, run!” Many of the ducks immediately took flight. But Iktomi kept walking past the lake. That wasn’t like Iktomi, thought the ducks, and they came back to the lake. Iktomi was now nearly past the lake, slowly moving under the weight of his branches, and the ducks were real curious. “Iktomi, what are you doing?” they called out at him.

    “Hmm?” Iktomi slowly turned around, shifting the branches on his back. “Where are you going?” the ducks asked. “What are those sticks?”

    “Hmm?” Iktomi repeated. By now some of the ducks were gathering near Iktomi, but still a safe distance away. “What are you up to, Iktomi? Where are you going with those branches?” the ducks asked.

    “Oh. These aren’t branches. They’re sacred songs,” Iktomi said, and turned to continue walking. “Songs? Where are you taking them? We want to hear the songs!” the ducks called out, growing excited. Iktomi looked at the branches on his back and at the group of chattering ducks.

    “I don’t think so. These are sacred songs. They’re very powerful. In fact, I was told to sing them with my eyes shut tight, or else something awful might happen,” Iktomi explained.

    “Please!” the ducks asked again. “We want to dance to the songs!” By now, all the ducks around the lake were waiting to see what happened with Iktomi and his songs.

    “Well… I don’t know… maybe one… but you’d have to keep your eyes shut tight, too!” Iktomi said. Immediately the ducks were overjoyed, and quickly promised they would keep their eyes closed. Iktomi deliberated out-loud, musing the sacredness of the songs against the pleading of the ducks, until he finally agreed: “One song.”

    Iktomi took the bundle of branches off his back and laid them out, carefully. He lifted up one branch, examining it while humming. He set it down and picked up another, giving it a look and humming a different tune. He did this with every branch, while the ducks patiently waited. Eventually, Iktomi narrowed his choice down to two branches, and then, one. “Alright, ducks. Gather around and get ready to dance – but remember: keep your eyes closed, or else something awful will happen!”

    When all the ducks were ready and their eyes shut, Iktomi began to sing. Iktomi has a lovely singing voice, and the ducks were eager to dance to it. Soon the ducks were dancing all around the muck, laughing and splashing. Iktomi began singing louder and louder, holding the branch as he began to pace back and forth on the shore. He paced rapidly, turning his head as he sang, until his voice seemed to be coming from all across the lake, a loud song mingling with the sounds of the dancing ducks, all with their eyes closed tight.

    As the song continued, Iktomi quickly swung his branch out across the shore, knocking dead a duck, who began to float on the water. But with their eyes shut tightly, no duck noticed. Iktomi bashed another, and another, and another, as he continued singing across the lake. Soon, nearly half the ducks were dead. One duck noticed the lake was a little quieter, and opened their eyes.

    “Iktomi is killing us!” the duck shouted, and at once the rest took to the sky. But Iktomi didn’t care. He took those he’d killed, roasted them, ate them, and went to sleep.

  - Illusion and truth <span id="sec:orgc952817" label="sec:orgc952817"></span>

    I learned this story from Joseph M Marshall III, where he relates the story to the Lakota concept of “truth,” though I felt Marshall’s explanation did more to explain “illusion,” the concept Marshall contrasts to truth, more than truth itself.

    I can see the story as a metaphor for the relationship between wasicu and wasicula, the ducks and Iktomi. White folk, the ducks, kyrichists, colonials, dance along to the beat of their society, one that I’ve come to learn that not only do many of its philosophers believe is an illusion, but many outsiders through history have seen it that way too.

    Marshall says the truth is death: that which lives will die; all things. All else is either illusion, as in falsehood, or it is a metaphor for that truth. This doesn’t just apply to “living” things, Marshall implies, and I’ll explain: even our universe will encounter its end, which in colloquial English is called its “heat death.” The Lakota truth hints to an understanding of balance poorly captured by “for every action, an equal and opposite reaction,” and “energy cannot be created or destroyed.”

    While this appreciation of balance might show up on the fringes of kyriarchist culture, it doesn’t seem to have a place in the wider culture, and what places it exists seem to be shrinking. Esther, my partner, recently was provided reading material from a kyriarchal institution intended to teach the fundamentals of corporate accounting. However, the fundaments involved understanding shareholder dividends as a liability, made no mention of depreciation, and didn’t directly touch on concepts like balancing a ledger or understanding equity. That is to say, where once a concept of balance existed, in the culture of accounting, now its been replaced by bureaucratic concepts. Instead of using their senses, the ducks just follow the tune of Iktomi’s song. I can imagine a more sinister ending to the story of Iktomi and the ducks on the lake.

  - A darker story <span id="sec:org6899512" label="sec:org6899512"></span>

    After dancing for a while, and many ducks getting bashed, a few ducks began to get hungry. But they knew to keep their eyes shut. “Iktomi, we’re hungry!” the ducks whined. Iktomi said he would help, and told several ducks to sing along with him. “While you sing, I’ll cook us a feast,” Iktomi declared excitedly. The ducks were too busy dancing and singing, and too tired and hungry, to remember whether they’d seen Iktomi carrying food with his branches, down the hill. And when they smelled a savory thing cooking over a fire Iktomi had built, they stopped worrying about it.

    “Keep your eyes shut, and I’ll feed you. After our feast, I’ll play more songs, as long as you keep your eyes shut!” Iktomi waded among the ducks, carefully feeding each a delicious morsel. As he went, he gobbled up bits of food himself, for it was the ducks he’d killed earlier, roasted over the branches Iktomi had claimed were his songs… except the one he was using to kill ducks. After the feast, Iktomi started a new song. This song, the words told the ducks to hunt for little worms and fish in the mud and banks of the lake, but to keep their eyes shut tight. And so there the ducks were, singing to each other and hunting for worms, tripping over roots and bonking into each other. Iktomi made his way through the ducks, singing things like, “this is pretty nice, isn’t it. You’re happy and comfortable. This would be a nice way to raise a family, wouldn’t it?”

    As Iktomi sang, he killed more ducks, gobbling some whole and others, roasting and feeding to the other ducks as they lived their new lives, eyes shut tight. And so the ducks went on to have ducklings. Naturally the ducklings, when they got to a certain age, opened their eyes. They saw the lake, and the worms, and Iktomi roasting ducks, but they didn’t understand any of it, for they’d never seen any of it before. And before they could imagine what it might be they were seeing, their parents would shout, “Quick! Shut your eyes! Join the dance!”

    The ducklings did what they were told, though some were curious and asked “why?” They were told about Iktomi and the feasts, but it was only some ducklings that asked, and the parents were far too busy with their inefficient blind hunting to explain very well, anyway. So the ducklings grew up, keeping their eyes shut, dancing to the songs of the elder ducks, pecking around at dirt, hoping for a feast. Meanwhile, Iktomi was still going around, filling his belly. Soon, generations of ducks had lived this way, and other ways of living were forgotten. Ducks would disappear, even siblings, but to these ducks, now, that was nothing unusual.

    Every so often, another flock of ducks would fly by and notice their kin, bumbling around, singing a cacophony about how to hunt in all the wrong ways. “What are you doing? Open your eyes! Iktomi is eating you!” these ducks would call. But the ducks on the ground were tired – hunting with your eyes shut is tough! They didn’t have the energy to listen, and the few that did listen, and did try and open their eyes, found the world painfully bright, so they’d shut their eyes again.

    “Sometimes it’s bright, like when there’s lots of snow on the ground. You’ll get used to it!” the other ducks would encourage. But it’d been so long since they’d seen the snow, with their eyes closed like that, they didn’t know what the other ducks meant. And their songs said their way of life was very comfortable, they didn’t have to get used to anything. So the ducks kept their eyes shut, and in between naps, Iktomi gobbled up as many as he wanted.

  - The Collaborator’s dance <span id="sec:orge6da9e7" label="sec:orge6da9e7"></span>

    A lot of my writing touches on the question of how can a duck open its eyes, without a close encounter with, or losing a family member to, Iktomi. I think an answer might be that the duck needs to ask itself if there is a different way to do what they’re doing. And that has to start with a recognition of what they’re doing. When they peck at dirt with their eyes closed, they aren’t “hunting,” they’re not feeding themselves: they’re dancing to the song Iktomi gave them, and feeding themselves is just a consequence.

    This is reflected in the speech of Collaborators, and their dance move is “money.” Collaborators don’t need food. They need money. They don’t need shelter. They need money. “Money just buys those things!” is how it’s commonly sung, but attempt to raise shelter without paying money for land access, and your shelter will be destroyed. Look at the endemic destruction of “homeless camps” across Turtle Island. And there are more mechanisms for enforcing food apartheid against those without money than I could ever document.

    The world of Collaborators is an illusion, maintained by songs like “rights” and “rule of law,” and its up to each person to “open their eyes” and look for the true world, where shelter is shelter regardless of magic scrolls.

    This inability to live outside an illusion doesn’t end at a term of phrase. I was reading a report compiled by a coalition of academic scientists and engineers, recently. It stated that the active sequestering of atmosopheric carbon needed to occur, or several mechanisms of climate dissolution would be unavoidable.

    While I think “sequester” is too precise of a verb for the issue, I agree that carbon must be transferred from certain parts of our environment. That’s a truth. However, the report went on to endorse a specific and immediate set of actions which I think indicate how completely these folk live within an illusion, here implemented in part through academic specialization. The report suggested the establishment of oceanic kelp farms, which they say would sequester carbon while solving world hunger, as the kelp is edible. But if the kelp is distribtued as food, the carbon in it is not sequestered; it’s just trapped in small ways: in the kelp, in our gut, in the soil. Each time, carbon comes back into the environment from which it was removed.

    As they explain it, their plan violates their fundamental physical laws, yet it is their recommendation. The numbers balance for the climate scientists, who see carbon leave the atmosphere and get trapped in kelp. And the numbers balance for the engineers, who see carbon enter the kelp farms and leave as a market commodity. But it so clearly doesn’t work if you focus on reality: pin your focus on one carbon atom you want to sequester, and walk through this plan. Your carbon atom will ungracefully end back where it started, after being offgassed through some organic function. But the lyrics of the song have no place for that, and the singers are too tired to find it, and those that do find it, find it painful.

    There’s a paper, infamous among a certain group, produced in the 1960s, that looked at the intersection of computers and society. It cautioned that integrating computers into the workplace could have a consequence that was going to be negative: a cooling of imagination. As workplaces digitized, that which was unable to be quantified would become less and less important, until it wasn’t cared about at all. The application of such limits, coupled with an explicit drive for short-term profits, would leave these corporations unable to perceive and adapt to anything not captured within the quantified data they were already tracking.

    More recently there have been similar claims made about the digitization of personal life, coupled with surveillance. They’re the same story as Iktomi and the duck pond, just from different perspectives. I apologise if I overstate my case, but I want to be clear, we live in a world in which most people know nothing but Iktomi’s song. I apologise if I understate it, I could go on about semiotics and Simulation, but I am writing by hand and that is less fun than stories about ducks.

  - Those free ducks <span id="sec:org36f866d" label="sec:org36f866d"></span>

    > "Nothing’s the matter with your head. Baby, find it, come on and find it."

    At this point I feel it has been well-established that Collaborators are the ducks of the story, and their culture is Iktomi. This raises questions about who are those who are indigenous to the truth, and who are those indigenizing to it? I like Marshall’s telling here, because it shows indigenous as a natural culture of humans, and kyriarchism as something temporary, just a trick. This speaks past the illusion: Indigenous or not, we all have the capacity to live human lives. But that is outside of our time, and our time requests strong work toward clear answers.

    Those indigenous to truth are those Indigenous to place, and so those decolonizing are those indigenizing to truth. The ducks who fly by and call out, in my version, are the Indigenous, and those who force open their eyes are the Decolonial. The Indigenous person’s role, then, is to live life, and this is reflected in our world: the resilience of Indigenous peoples across the globe is proof of their commitment to their way of life. They live within truth, and so their relationship to illusion is one of vigilant disbelief. And the Collaborators live within illusion, so their relationship is one of vigilant belief.

    I hope y’all don’t mind the language, but I assume my readership consider themselves, in some language, decolonial. Decolonialism, while radical, is different from radicalism because it implies a specific set of beliefs about radicalism. And so I have the question: what is our relationship to illusion, us decolonials? What is our relationship to Iktomi? And how much control do we have in this relationship?

    As far as I know, the folk I’m sending this letter to, you all, were raised like me, by people themselves raised generations deep inside kyriarchism, and our relationship to the illusion is near-total dependence. When I speak to dependence here, I don’t limit it to dependence for material needs like food and shelter, though that’s definitely a consequence of our dependence. But we didn’t stumble into relying on Iktomi for food. First came the belief in his songs.

  - The words that bind us <span id="sec:org5f44325" label="sec:org5f44325"></span>

    > "Cause you’re fine, and you’re mine, and you’re so divine."

    There’s a series of essays being written online by someone whose name I don’t have on hand, dealing with, in a sense, programming languages as linguistics. The first essay, the only released as I write this, includes in its introduction a statement similar to the following: “Perhaps programming is akin to writing in Ancient Egypt: known only by a few, yet enabling culture at-large to flourish.”

    An interesting perspective, but one that relies on a belief in at least a few illusions. We have a really subjective opinion of when a culture can be said to flourish, and a lot of ignorance about every culture, contemporary or historic. It’s a big claim to say writing allowed for civilization to get going, but its one a lot of folk are taught and even if they don’t actively believe it, its reinforced throughout our perspective.

    We won’t know what the culture was before writing, nor do we know much about the cultures of the time that didn’t write. Maybe the oral histories were regarded by all, even the literate, as far more civilized. I have heard myself compelling stories about the risks writing can put on a culture’s ability to create. If comptuers limit the abilities of the workplace, over time, to what can be digitally encoded, does writing limit the abilities of a culture to what can be encoded in literature? And going futher, can the same be said for linguistics generally?

    > "What’s the matter with you; feel right! Don’t you feel right baby? Hail, yeah, get it from the main vine, all right. I said find it, find it, go on and love it if you like it.”

    A certain perspective argues these, each, are a layer of illusion over the truth of a culture, and its this perspective that says writing marks a death of a relatinship between a people and their culture, replacing it with a relationship to illusion. The ducks, by putting their way of life in song, stopped having relationships with the worms, and started a relationship with the verses of their song. After many generations, the ducks have no relationship with any of their true relatives. They relate only to their song, which might have some perspective on the world-that-is, but often exists only within itself.

    So the illusion doesn’t just provide food, it defines it, as something you get with money, from stores and restaurants. And while a rose by any other name would smell just as sweet, with no name at all, a rose becomes a confusion, reference possible only through common metaphor.

    This highlights the totality of our dependence. We need the kyriarchy for food, to understand the concept of food, and to relate that concept to others. If, somehow, we remove any of those dependencies, broader cultural frameworks like our metaphors fill the gap with illusory references.

    So enclaved within a culture, that disallows relationship without itself as intermediary, how much control do we have over our relationship with Iktomi?

  - Our pond <span id="sec:org939bff9" label="sec:org939bff9"></span>

    > "It’s your business if you want some, take some. Get it together baby."

    Culture is an environment, and how much control I have over an environment is largely a matter of perspective. Magic wasicu scrolls say I have no control over the land near me, the trees I’ve plant say something else. There are limits obviously, and an unfortunate truth is so many folk are singing with the illusion that they can inhibit all control in a place for a time. But another truth is that all power diminishes, and that doesn’t have to be our problem. We need to know the mechanisms of the power, but an intimacy with its illusions is mental baggage I think we can safely let go of.

    Instead, lets get back to developing control over our relationship with our culture. Until now, culture has mostly been a metaphorical song, but allow me to replace or mix the metaphor with the other I’ve used: culture is a place.

    I had the fortune to receive SERE training and in my own words in order to control a physical environment you need to be familiar, engaged, and imaginative. Those first ducks who saw Iktomi coming down the hillside were familiar with him enough to know to be careful, but the many-generations-later ducks were totally unfamiliar with Iktomi, let alone the rest of the natural world. We lack the necessary familiarity with our culture, outside itself, to control it. We can learn it, though, from those who have maintained a knowledge of their culture as it relates to the natural world, not its own songs. That sort of familiarity can be powerful, such as when it lets us see ourselves as playful ducks.

    But the peoples with that familiarity live their own lives, and they cannot be intimate with every consequence of every cultural habit. So we must supplement their experience with an active engagement in our reality. We must look, as carefully and as honestly as we can, at what is really in this world, and what is a song we’ve made up along the way. For many of us, living in physical environments entirely constructed by kyriarchists, that can be really tricky. So we need to look to at what truths we can trust. Like mathematicians trying to build a proof, let us start with an axiom:

    Life leads to death; there is a balance to everything.

    To make our proof, we have one tool, our first tool, though many have put it down to focus on singing the song. To build a culture of truth, we need to imagine new relationships between things. Reimagine your relationship to food, work, land, language. Be so imaginative that you lose concepts, past the bounds of language, to answer simple question: where does today’s food come from. Be so imaginative you ask the question in a hundred ways. Imagine how other things might see and solve your problems. Stone was crushed and burnted, turned to gasses that will kill us, to bring these words to you. Imagine breathing noxious fumes, and imagine using that breath to explain to the uncrushed stone why they’re next.

    I don’t know what the future will look like. I don’t know what \#LandBack looks like. My imagination is more than full with today, trying to imagine things like what this settler means, really, when they say they “need a new car,” or what this bird means with its screams. I can, and will, share the illusions and truths as I see them, and the actions I take, but I don’t know if I can imagine the future, the way some of you all have asked.

    And this against the grain of many contemporary futurists, with whom I’m sometimes grouped. It might even seem to place me with the Luddities, especially as I write this by hand feet away from a working computer and complain that maybe learning to speak killed culture. But I think that would be a mischaracterization. While I don’t imagine “the future,” I do keep in my mind my relatives, and that includes those related to me across time.

  - My song <span id="sec:org7ae15d6" label="sec:org7ae15d6"></span>

    All the people that will come after me now will be affected by my actions and inactions, forming our relationship. And their choices, of interaction or not, with the effects of my life, change that relationship. As example, my relationship with my ancestors changes by me learning, or not, Lakota. They risked beating and worse to speak their language, so it would be available to me. Our relationship changes when I accept that gift, just as if it were a sweater from a cousin.

    I say this to highlight the extent to which imagination, with real-world utility, can be pushed. It is one thing to imagine a source of income that isn’t your dayjob. It’s another to imagine the relationship between you, your food, and humans that’ll be around seven generations from now. And I think its that sort of imagination that’ll be what lets us change our relationship with our culture. And until we can change our relationship to culture, changing the culture, we can’t choose our relationship with that culture. And until we have that choice, we can’t change how we’ll move into the future, as individuals or as people.

    We need that choice, that imagination, to be able to adapt to the opportunities and limits of our relationships, with the world and each other. A friend, one of us, asked if it was illusory to view the work of decolonization as a “megaproject.”

    I can’t think of any project given more labor than our many cultures. The hours spent hacking at English dwarf the Pyramids or the Apollo Program, and that’s one facet of one culture. In this way I think the work of building culture is certainly a megaproject. However it is also certainly too large to centrally manage. Instead, we can look at it like another type of megaproject humans have experience conducting in a decentralized manner: terraforming.

    It might be there’s almost no continental land which hasn’t been terraformed. What hasn’t been intentionally developed has had its waterways changed, to say nothing of discrete projects like the Mounds or the Amazon. These projects were enabled not by bureaucratic quantification but cultures. Cultures which encouraged their people to develop a familiarity, engagement, and imagination toward their relationship with the world, centered on the land around them, not self-referential cultural illusions.

    And so that’s our Land Back megaproject: to center the land and our relationship to it, as a global conglomerate of cultures. How that looks will vary by time and place, like any project of that scale, but it will all be a transition to a culture that centers truth.

    > "Come and get your love, come and get your love, come and get your love, now."

    This letter has taken a while to draft, and while its quite long, I feel like, perhaps for the first time, I have vocalized why I am resistant to answering certain questions. And hopefully I have established a good framework for future letters. I would prefer to spend more time talking about ethnopedology and the plants I see in my day, but I was – and am – concerned that without providing a thorough introduction, I will be misunderstood, however unintentionally.

    Thank you all for taking the time to read this. I know many of you are actively interested in performing this sort of work with me. Hopefully this will give us the necessary footing for me to do more than agree that its a nice idea.

##### 2020-11-23 Monday

- Thanksgiving <span id="sec:orgced9813" label="sec:orgced9813"></span> I’ve been asked about Thanksgiving a lot these past few weeks. A lot. I lost count in the upper-30s, but I think I’m just shy of 50 now. Always white people, and their questions range in respectfulness, but all came with a lot of presumptions about what my answer should cover.

  Even with that many prompts, I’ve found it really hard to give anyone an answer. And so I’m drafting this letter. I spent two days thinking about what I’d say here, but I haven’t really thought of much. I talked it over with my partner, and they had some good things to say. But me? I’m still not sure.

  I guess I can look at the trends in the questions, since I got so many of them. I didn’t write them all down, unfortunately, but upon remembering, I think there is a trend to ask: "How can I focus on Indigenous issues this Thanksgiving?" And I have a lot of problems with that. Thanksgiving is not an Indigenous holiday. Lots of nations have holidays around this time of year, and there are two wider holidays, a Day of Mourning recognized by lots of tribes that occurs on the same day as Thanksgiving, and an Unthanksgiving, which occurs at the same time on Alcatraz Island, in celebration of that occupation. (On that note, the visitor logbook from that occupation has been digitized and is online. This is not the place to speak at length at that, but it has made for a very celebratory timbre the past few days, since its release. Many people I know are looking through it, looking for the names of their relatives.)

  And I encourage y’all to learn more about those. But… not right now. Trying to learn about Indigenous issues right now seems a bit like cramming for a test, only there’s no test, just an uncomfortable guilt. Write it down though, maybe come around mid-January? (Hey, be ambitious: consider creating a curriculum to educate yourself on Indigenous issues.)

  Oh, and that’s the last time I’m saying "Indigenous issues" because that is a ridiculous euphemism for "Native history," which is most of the questions were really looking to get information on. Please, please, settler-folk, be careful in your language: when you attempt to speak of a thing, center that thing. Only center your relationship to the thing if it’s your relationship you’re speaking of. That is to say, "Indigenous issues," casts the existence of a society as it for white people: a problem. I understand the intention is usually to acknowledge those problems as existing, but that’s accomplished by, well, directly acknowledging them.

  "Native history" isn’t too much better. It… is ridiculous to frame Thanksgiving as a part of Native culture, and it is ridiculous to frame Native culture as historic; playing into a long myth of the “disappearing Indian.” I am a living Native person with a pulse about to live through Thanksgiving. That’s not “history.” (I’m doing my best to be polite and respectful toward the intention of the people asking questions, and not as a matter of etiquette: I *do* respect the people asking questions for asking them, even if I find a lot of fault with the actual expressed question. At least they’re engaging with these topics.)

  So: don’t focus on Indigenous issues or Native history this Thanksgiving. Don’t focus on contemporary Native events either, not *because* of Thanksgiving. Thanksgiving is a settler holiday, centered on settler history. If you are the organizer of a community’s holidays, like a family patriarch or matriarch, and you do not feel comfortable centering the intentional violent extermination of Native Americans, I encourage you to not recognize Thanksgiving, at all. If you aren’t tightly associated with a community, I give you the same advice.

  Which will probably feel uncomfortable. And I’m not going to focus on "that discomfort is nothing compared to the violence wrought on Natives." I’m going to focus on the future and say, a lot is going to change as we go through it. Regardless of the choices we make, the world is always changing, and the collapsing climate has expanded that window of change signficantly. There is a wide variety of discomfort available in this future, and much of it will be unavoidable. My advice is to develop a palette as discerning of discomfort as of fancy coffee. Some discomforts are just bad, like lumpy couches. But others are useful, like stretching in physical therapy, or moving away from colonial fantasies.

  If you are motivated to participate in a Thanksgiving celebration because of membership in a community that requires you participate: participate. Please don’t hijack your community’s ceremonies to try and end them.

  But then work to get the community to move away from Thanksgiving by the next year. You have nearly a year make your case and get the change to happen. If you don’t feel ready to make your case, well, you’ve got plenty of time to learn more. Learn how different Native folk tell the story of Thanksgiving.

  So, in short: stop celebrating Thanksgiving.

  A lot of questions came from people that already have, and they wanted to know what they should do, instead. I was bothered by this because I’m pretty clear that I think there is a linear (and circular, of course, but linear for settler-folk) task-list to follow to fix their shit, and it’s 1) Land back, 2) Water back, 3) Medicine back, 4) Ceremony back.

  I think there’s a lot of settler-folk who jump straight to \#4, and to me it seems to come from folk who don’t have a sense of ceremony, they have a sense of guilt. Ceremony becomes an enactment of Indulgence: by recognizing the existence of, ahem, "Indigenous issues," through some constructed set of actions, they can relieve their sense of guilt, quite viscerally.

  There’s also an irony here, in that these settler-folk, well-intentioned though they are, are asking how to construct something that many Native folk got as gift, and would never consider "creating" the way these settler-folk are.

  I… hate writing this, because I keep saying "I’ll get to talking to how to indigenize, concrete advice, next newsletter, I promise!" but circumstance keeps demanding I center encouraging white folk to, in the words of an inspirational friend, "deorbit whiteness." I don’t like saying "Don’t celebrate it, don’t talk about it, don’t celebrate anything." That feels like I’m just being a big bummer.

  But… the people asking about it? That’s really the only advice I have. What to do instead? Decenter your whiteness. What does that look like? That’s what my other letters are for.

#### 2020-12 December

##### 2020-12-05 Saturday

- False Profits <span id="sec:org956e196" label="sec:org956e196"></span> This post has to do with computer technology, and the intersection of that technology with other contemporary technologies, like mechanisms of settler-colonialism.

  In this post, I’m going to name names. These problems are social and cultural, but both of those things are made by people. Despite all the things I’m about to say about the people I’m about to talk about, I want to make it clear, I have a lot of respect for them. They are, all of them, willing to do hard and often thankless work, based on nothing more than a promise they made to themselves about their role in life. Brought up with a different set of knowledge and experience, these people might have grown up to become an inspiration for me. And as people, their knowledge and experience isn’t set in stone: any of these people might go on to become inspirational.

  Also in this post, I’m going to say a slur that is used against people with disabilities. It was used against me, and it is simply awkward to try and explain that part of things without mentioning it. There is also mention of genocide and state-conducted massacres.

  Also in this post, I’m going to make a lot of claims which will likely contradict what a lot of you believe, and I’m going to do it without citation. A lot of these claims are based in philosophy, and trying to cite philosophical ideas can get really complicated, really quickly. (Deleuze? Foucault? Hegel? All, and none.) I believe a round-about way to acquire the relevant knowledge would be to read the various texts on decolonization I have linked throughout my posts. (I have a long list in one post, but it’s not comprehensive.)

  But first, allow me to share a poem by [Joy Harjo](https://www.joyharjo.com/). It’s been floating around the various Native American forums I’m in these past few months, mostly to relate it to COVID-19.

  > In a world long before this one, there was enough for everyone, Until somebody got out of line. We heard it was Rabbit, fooling around with clay and the wind. Everybody was tired of his tricks and no one would play with him; He was lonely in this world. So Rabbit thought to make a person. And when he blew into the mouth of that crude figure to see What would happen, The clay man stood up. Rabbit showed the clay man how to steal a chicken. The clay man obeyed. Then Rabbit showed him how to steal corn. The clay man obeyed. Then he showed him how to steal someone else’s wife. The clay man obeyed. Rabbit felt important and powerful. The clay man felt important and powerful. And once that clay man started he could not stop. Once he took that chicken he wanted all the chickens. And once he took that corn he wanted all the corn. And once he took that wife, he wanted all the wives. He was insatiable. Then he had a taste of gold and he wanted all the gold. Then it was land and anything else he saw. His wanting only made him want more. Soon it was countries, and then it was trade. The wanting infected the earth. We lost track of the purpose and reason for life. We began to forget our songs. We forgot our stories. We could no longer see or hear our ancestors, Or talk with each other across the kitchen table. Forests were being mowed down all over the world. And Rabbit had no place to play. Rabbit’s trick had backfired. Rabbit tried to call the clay man back, But when the clay man wouldn’t listen Rabbit realized he’d made a clay man with no ears.

  On this Earth, there are many worlds, living alongside and mixed-with each other. There is the Lakota world, the Ojibwe world, the Maori world, and a thousand thousand more. Among all these many worlds, there is one particular one. Within this one world, just one of many, there are a number of people who recognize something about the world they live in is failing, and a fair number of those want to fix it. Some of those people are taking actions to fix it, and a few of those people are taking action by working with their world’s computer technologies, especially those related to their world’s remote communications.

  It’s those people I’m talking about now, and it’s the people who care about those efforts that I’m talking to.

  If you only live in one world, and if your role in that world specializes you within that world’s remote communications infrastructure and ancillary industries, it can be easy to mistake it for “the world.”

  I think that is what has happened, and rather than working to correct their over-precision, those who have made the mistake are insisting that reality bend to their world – or else they will damage reality.

  Let me provide some backstory here. A couple years ago, there was a discussion being had on the Fediverse about the GNU Image Manipulation Program, whose abbreviation forms a slur used against people with disabilities. People suggested changing the name, and later forking the source code and re-naming it. The admin and one of the main moderators of the FOSStodon Mastodon instance, Kev Quirk, took a stance in favor of the slur-name, calling anyone who objected a “snowflake” and demanding to know if there was actually anyone with a disability who was offended.

  I have a disability, and have been called a gimp, unkindly, a few times. I nominated myself as the token disabled person that was offended by the name – and critical of people’s choice to defend the status quo, for the sake of it, rather than alleviate an potential inaccessibility caused by that status quo. Put another way: Kev was insistent that his world was the only valid one, and anyone who wasn’t willing to bend themselves to that, was a “snowflake.”

  As the token for the issue, my domain was quickly swamped by a distributed denial-of-service attack, and my communications systems filled up with messages using just about every slur people thought might apply to me.

  Eventually, Kev issued a general apology which I felt failed to apologise for the right things, so I made it public that I was declining it.

  The general effect of the events was that I gained a small reputation for being critical of FOSS, which was enough to get me followed by advocates of FOSS.

  I forget the specifics, but this led to Drew DeVault, some time later, commenting on a post of mine, or responding to a reply I send to someone else’s post. My commentary had, and I forget the context that caused me to say this, been about the massacre at Wounded Knee. Drew’s response was to say that anyone who died at Wounded Knee deserved it for not listening to the military. I asked Drew to clarify – was he saying that the unarmed women and children deserved to be shot? He confirmed, yes, if others weren’t listening to the military. (I apologise for the imprecision and forgetfulness here; Drew’s comments were emotionally disturbing and I did not think that he would go on to be a favored voiced by so many of my acquaintances, so I didn’t take better notes at the time.)

  This was a rough thing to be told. Here was someone who had engaged me in previous conversations about using tech for emancipation, saying that my relatives deserved to be murdered for not handing over guns they didn’t have. The conversation continued until Drew said that anyone disobeying any cop has forfeited their right to life. Weirdly reminiscent of the image-editor name problem: “The rules of my little colonial world matter more than reality, and if reality doesn’t change itself, I will shoot it.”

  (I’m not sure I’m conveying how silly it is to support shooting people for not handing over guns they didn’t have, but it’d be like me shooting you for not handling me your childhood innocence, wrapped in wax paper, and the judge coming to your hospital bed and saying “what did you expect, should’ve given em what they wanted!”)

  I let the people close to me know. At this point, very few of them used Sourcehut, Drew’s software, so it was a relatively simple matter: they blocked him.

  Now it’s been a couple years since then, and Sourcehut is very popular and increasingly popular. And I have continued to inform people I know who affiliate with Drew about his comments. Except for one person, everyone responded to say that the technical merits of the software were more valuable to them.

  Read that again. I went around telling people “Hey this burger shop said my relatives deserved to be massacred,” and they went “yea, but they’re the only shop with crinkle-cut fries.” This isn’t even really hyperbolic: I had “it has a lexer for my favorite programming language!” said to me with a straight-face by Phil Hagelberg, a person who I think makes some of the best choices a colonizer can for actually enabling people outside colonialism. (Lexer, if you don’t know, is the thing that adds colorful highlighting to source code when it’s render, say as HTML.)

  And I had to accept that answer, because otherwise, I would lose access to people who were helping me to try and use computers for emancipation. There are so many people who prioritize the convenience of their computer use over not supporting genocide-supporters, that I cannot distance myself from them without leaving the Internet entirely.

  I want folk who are reading about this for the first time to really thing about this. I’m talking about the folk who are building out tools for ActivityPub, building things like Gemini servers, posting “ACAB” shitposts for months… all these people who happily ran “Black Lives Matter banners” on their sites, use the software of someone who says “Cops Orders Matter More.”

  A lot of folk said that they were using Sourcehut because they moved there from Github, which they left because Microsoft collaborates with ICE. But… Drew says folk need to collaborate or they’re liable for their own death. That doesn’t really seem better to me. In fact, it seems a lot worse: every person at Github might hate their association with ICE, but cannot choose otherwise because of the rules of the organization, what with shareholders and all. But Drew expressed an explicit fondness for that sort of boot-licking.

  I honestly shouldn’t have to take the time to spell it out like this for folk. Cut out racists and bootlickers from your tech stack, and if you can’t replace them without using other racists and bootlickers, then guess what: you just don’t get to use a computer that way for now. Go support non-Collaborators attempting to enable that use and wait. Do some gardening, knit some hats, do data entry or community relations for a mutualist group while you wait, if you want.

  Nothing you’re gonna share on this colonial-ass construction called the Web is so important as all that, as to warrant conceding things like “shooting unarmed children is good sometimes,” just to share your source code through a specific user interface.

  I’m going to keep going, but as I do I want y’all to think ahead: what effect does it have on things for things to be this way, and for it to be an open secret the way it is?

  In a weird Groundhog Day, this summer saw another contention between open-source developers. Instead of over the name of an image-editing software, this time it was about the naming conventions of Git, a version control software. Way back when, Git had one “branch” of code that was the primary branch, and then every other branch was seen as subordinate to that branch. This was reflected in the documentation as the “master” branch and “slave” branches.

  There’s been a push for a couple years to switch from “master” to “main,” and it gained steam this summer when Github started using “main” as their default branch name. Just like before, this caused a lot of pushback. Just like before, with the image-editor and Drew’s support for Wounded Knee, people prioritized their world over even considering that other worlds might exist. This one is interesting, too, because there has now been an effort to purge mailing list archives, to remove evidence that “slave” was ever used as a term, and many people will say that it never was. It is open gaslighting.

  Drew DeVault, when this conversation was at its most prevalent in the Fediverse, objected to folk distancing their language from slavery, saying, “I have still never seen even one first-hand take from a PoC.”

  …Gee, I wonder why someone who says people of color deserve to be killed by cops for failing to comply with impossible instructions doesn’t see many first-hand accounts from people of color. What’s absolutely wild is that Drew refers to himself as a part of “the left” in a preceding post, which should give everyone who is white and identifies as a leftist some serious pause. His presence in a community, even through having his writing discussed within that community, makes it feel unsafe for me: here is someone who thinks it is okay to kill people like me if we don’t listen to people like him. I doubt he’s going to have the cavalry come kill my family for using a different Git naming convention than him, but I also doubt he’ll do anything but some appropriately scaled-down version of that violence. Once again, it is the establishment of “assimilate or be exterminated” as the acceptable standard of cultural exchange between whites and others, and it is only y’all white folk who can stop it.

  I said something to the above effect in the Fediverse at the time, which led to another white colonizer coming to talk to me, this time to say that Sourcehut is bad not because its creator supports military violence against unarmed civilians, but because it has opinions about email formatting. Even in attempt to support, colonizers still cannot help but center their own colonialism, and prioritize adhering to its rules above all else. If that happens to accomplish some good, all the better. This colonizer even went so far as to say I was lying about how ActivityPub worked, because I was asking him to incorporate common sociocultural mechanisms into his use of the Fediverse, alongside technical ones. (If folk say “don’t reply to my posts if you meet these criteria,” it isn’t their fault if you ignore that.)

  Is the trend clear now? Colonizers will defend colonialism above all else, even as they engage in actions they say are intended to liberate people from colonialism!

  Five days ago, it came to my attention that a bunch of people who are making technology to improve the Web apparently just found out that Google services don’t allow many browsers, except Firefox/Chrome, among them Chris Webber.

  That’s been policy for *months*. I have been complaining loudly for *three months* now about how that fucked me over. I even have a post explaining the vast social harms of it, that was shared and talked about by some of the folk expressing surprise at the Google change this past week!

  Y’all, please recognize that the ignorance to these events is demonstrative of the focus of these people building a better Web – they’re able to go three months without realizing that the Web’s largest service provider has cut off all but the largest browsers. Who are they talking to, or not talking to, that lets them maintain that sort of ignorance for so long? (I can tell you they aren’t talking to me – Chris distanced eirself from me nearly a year ago, when I was critical of their pursuit and use of land ownership privilege.)

  In my circles the move to exclude everyone but Chrome and Firefox users was devastating *overnight*, as we all suddenly found ourselves needing to install Firefox on very old/weak computers, to check out texts and voicemails!

  “The web as an open standards platform is rapidly falling apart. :$\backslash$”

  It fell apart *years* ago, literally more than a decade, as service providers acquiesced to state communication monitoring services.

  Once again. Once again, the problem is the same: people mistake the part of their one world for the entirety of reality. How do you expect to build a better Web if you are so ignorant as to the broad strokes of its history, outside the bubble of commercialized English Web use, and its little subculture of “commercialized FOSS English Web use”?

  Who are you building a Web for? What will be done on it?

  I have been shouting as loud as I know that y’all are gravely underestimating the scope of the problem you are looking at. I’ve been shouting it in poetic language, and in pseudocode.

  What is it going to take for folk to realize that in order to build a better Web, they’re going to have to learn what the Web is, and in order to do that, they’re going to have to learn what the culture of the Web is, and to do that, they’re going to have to learn a lot more about cultural identity, at all.

  And I hope it’s clear, the problem is not a simple ignorance, but an active decision to maintain ignorance. All the people I’m talking about actively declined invitations to consider that there might be opinions formed by a worldview different than theirs. And that decision to decline is often defended by people around them. They argue these developers who protect their ignorance need to do so, to be able to focus on the problems they’re dealing with.

  Imagine being a deer trying to live in the woods, trying to avoid being tracked by hunters. And… actively ignoring the hunters. Imagine being a Kurdish insurgent and ignoring what Daesh newsletters are saying. Absolutely wild. These “harmful effects” are not passive natural laws but intentional human action and they have more labour-hours; choosing to ignore them is a risk you can’t take. I can be as concerned about climate change as I want, if my definition of climate change ignores anthropogenic origins, all my concern is predicated on bullshit.

  And in a very concrete way, the domain of things they choose to ignore makes it impossible for them to ever identify, let alone solve, any of the problems they want to grapple with. They say they’re interested in enabling communication between human people, but choose to live only interacting with one of the many many human worlds. So they say the problem is capitalist corporations and focus all their energy on that, because they can’t see that capitalist corporations is just how their world looks to them from the inside. They condemn reliance on one kind of monopoly, corporate monopoly, while violently defending a cultural monopoly.

  They’ll be against the abuse of a monopoly when it infringes on their ability to act freely (within their world,) but use another abusive monopoly to fulfill the needs that give them the quality-of-life to pursue such freedoms. It is only because of their compliance with one monopolistic agency that they have the security in life to worry about the influence of some tiny-ass monopoly!

  I just can’t imagine anyone would say “It’s okay emsenn gave a bunch of people COVID, e was so focused on mutual aid work that e didn’t know about the pandemic!” But that’s what people say about open-source developers. “It’s okay they’re not up-to-date on relevant tech issues, they’re so focused on solving those issues!” I can only hope it’s because folk are uncertain what these people are a vector for.

  Let me make it clear: by advocating folk distance their dependency on one colonial mechanism, while being aggressively defensive of their collaboration with other mechanisms and colonialism at-large, many colonizers are either convergently inventing or appropriating indigenous ways of living and incorporating them into the colonial system, strengthening its ability to assimilate.

  If you wanna tell me to stop using Google or Facebook services, you damn well better be willing to answer why you’re still using colonial services. “I have to so I can have enough privilege to fuck about inside colonialism” is not good enough; it’s ignorantly evil at best.

  And to bring back earlier threads, they often don’t even see that they are complying with a monopoly. They mistake individual cultural expression for “human nature” and emergent mass cultural expression as “social science.” So it’s understandable they don’t view it as a threat; they don’t see it. But… again, it’s not like the means of learning to see it aren’t there. They’re able to be provided through intuition through just, not being an asshole that distances yourself from anyone whose culture isn’t identical to yours, and through reason by reading any number of philosophers.

  So, folk justify the harm of the monopolies they live within, to secure the privilege, to… ignore smaller monopolies that do directly harm them… while trying to replace them? Meanwhile I’m here excluded from land ownership AND Google use, neither by choice, and I’m supposed to trust that this person with one toe kinda dipped into the water is going to build something useful to me?

  People fighting for independence in India didn’t sit around buying clothes and food from the British while condemning the East India Tea Company as the worst thing ever. They condemned it all, and the EITC was simply a symbol. I do not have the privilege to be concerned about Google’s monopoly of the Web as a monopoly, I’m forced to care about it because it is a threat, but if I weren’t forced into caring about it? It wouldn’t even be on my radar.

  There have been some horrible test-cases used in the development of open-source communication software recently. There was a “joke” service that was themed as an e-dictatorship oriented around doxxing and harassing transgender people, to stress-test its moderation capabilities, and ability to circumvent others’ moderation capabilities.

  Which sounds awful, right? But we can say something worse about almost every colonial software developer:

  They run their entire life themed around a real kyriarchy that doxxes and kills literally everyone except the most privileged of Collaborators, as the test environment for their software capabilities.

  Does that environment benefit the creation of software which is not a part of the kyriarchy? I don’t think so: by analogy look at the feeble attempts by California to mimic Indigenous land management. Whole state went up in flames and they’re no closer to a solution. These solutions are built as solutions within a very narrow cultural perspective, and that isn’t much use in helping actual humans live life.

  Beyond the incongruence between the lives of these developers and the lives of the people they think they’re helping, are we saying that the things open-source developers are doing are so important as to excuse continued Collaboration? Is there something special about these people that means they are entitled to lives of comfort to work on computer technogies, while I face a risk of displacement for feeding people? There’s an implication that these developers *need* to be Collaborators, they *need* the privilege to do the work… but that’s largely just because we don’t support non-Collaborators, as my current life is demonstrating. I bet if I had the past two years to not worry about money or food, for myself or anyone else, I’d probably be a lot further along with a lot of my software projects, and I’m coming at this from a background of homelessness, not college and white-collar roles.

  Frankly, it is… annoyingly narrow-minded and superior for all these colonizers to come along and say “I’m going to create X that’ll enable Y” without considering if Y is already happening, and if anyone doing Y has anything to say about it. I mean, come on. If a white land-owner is on the vanguard of your approach to decolonization… that should be a bit of a red flag that something isn’t reasonable, somewhere in your thinking.

  First, again, colonialism is currently relying on mutualists to get by, see United Healthcare shunting COVID patients to me for resources. To say developers need to rely on colonialism to survive is to spit in the face of every labor I’ve performed to keep this colonial settlement safe, because I care more about keeping humans alive than sticking it to colonialism.

  Second, ignoring the faulty logic of Collaboration given the evidence available, it’s just a callous thing to do, justify the oppression and genocide of others so you can eat well enough to worry about the big problems, like whether to call a datatype “petnames” or “nicknames.” Are you fucking kidding me? Folk can ask that question when they aren’t feeding themselves with grant money from the an organization’s funded by one that just that launched an airstrike against my friends in Pakistan, *yesterday*.

  I really don’t know why “don’t trust the opinions of people who would kill you to have the time to form those opinions” is a point I have to argue but here we are. Don’t trust their opinions; even if they seem really good, they were developed in this incredibly convoluted space, that can only exist through perpetuating great harms. Don’t trust their opinions; even if they seem really good, they were developed by people who care more about the rules than keeping people alive. Don’t trust their opinions; even if they seem really good, they were developed by people who care more about meeting standards than creating them.

  (I bet that last one will anger a few readers who are the sort of Collaborator I am criticizing here. They *do* define standards, right? Well… standards that help automate the ceremony of colonial communication mechanisms, themselves a “standard.” But again, they live so tightly in their world that they don’t see these things as decided standards, they’re just the way things are, “human nature.”)

  It’d be nice to have a day where I can read about the future of the Internet and not have to hear it from people that cheer on my extermination. One day? Can you folk who I follow and who follow me try that, can we go one day without elevating the voices of people who have pledged allegiance to a genocidal world-killing institution?

  (I bet we can’t, because there’s not even an active consideration for folks’ allegiance in that way, because it raises uncomfortable questions about your own allegiance.)

  It just sucks to see, “/Headline That I Agree With/,” by *Some fuckwit that actively argues email formatting is more important than addressing contemporary genocides*. …Every. Single. Day.

  It’s like how I see “/Headline about Indigenous Rights/,” by: *Some fuckwit that can only argue for Indigenous existence because it is a material resource to the colonial system, by serving as a cultural and literal seedbank for diversity*.

  All day and just have to… deal with it. All day, people violently defend the borders of colonialism, the borders of their thinking, their personal culture, and have the audacity to proclaim themselves actors of multiculturalism, open-mindedness, and change.

  I’ve focused on technology as my example for discussing these issues, but as I hint at above, it’s prevalent through-out colonial society: reality is as big as their world, and no bigger. Anything that contradicts is fair game for violence, either active or a passive “we’ll just ignore you until you starve because we made food apartheid a reality so we could solve hunger in our world.”

  I also want to explicitly relate that I think this infatuation that open-source has with self-proclaimed kings who fundrais to build their own fiefdoms is reflective of a reliance across colonial society on Great Leaders for innovation. This is prevalent in colonial society, from environmentalism to technical innovation. It’s often perceived by colonials who can see other people believing in the notion, in another part of colonial life. Everyone I’ve mentioned by name here is publicly critical of people like Jeff Bezos and Elon Musk. And they’re critical of those who expect people like Bezos and Musk to save us.

  But… insist that the only way to perform actual good is by selecting other privileged people and elevating them. Just like Musk, there’s something about these people that makes them worth supporting, even if it means forsaking investment in actual assets. They see among themselves prophets, who express the promise of something better, so that is who they choose to support.

  Each of these prophets promises liberation through the development of institutions of subjugation, and achieve the illusion of liberation by increasing the capabilities of individuals anointed by the institutions of subjugation. They promise that through the development of themselves, as assets, and the maintenance of the society which they depend on, they will provide develop tools of liberation.

  A wonderful asset to be developed, tools of liberation. But you cannot develop something by investing more heavily in that which diminishes it. The only profit in this means of investment is the growth of the anointed individuals. False profits, for false prophets.

  No matter how hard they work to make computers a tool of emancipation, if they depend on subjugation for food, water, shelter, medicine, transportation, communication, art, and family, they will never provide a tool of liberation to anyone that does enough good to outweigh the harm that just living life as they do, depending on the oppression of others, does.

  There is no ethical consumption within the kyriarchy, but there is also no ethical production.

  The resolution for both is simple: leave the kyriarchy.

  Ironically, this is what so many of these people think they’re offering, when they offer “freedom” from corporate Web services, but they’re simply building a new frontier, propagandizing a new generation of pioneers, and resettling… all within the scope of the kyriarchy. There is a rigid belief that their cultural way of being is the only one possible, a rigid belief that expresses itself as intimidation, harassment, and outright violence. It is, without being metaphorical, just another form of white supremacy. And if people want non-colonials to trust them to help us, then they need to stop predicating that help upon a reliance on white supremacy.

##### 2020-12-07 Monday

- Adapted to Isolation <span id="sec:org2ea10b3" label="sec:org2ea10b3"></span> When the COVID-19 pandemic came to my part of the country, there were a lot of people who were scared of the virus. Now, there’s a lot of people who are scared of other people, because of their (lack of) response to the virus. And I feel like there’s a small minority of us who were scared of other people as soon as the virus came and tried to cultivate that caution but were dismissed as alarmists.

  I used to talk about how I thought people needed to change to adapt to this virus; enclave themselves, form small tight communities with designated couriers, etc. Folk got mad and said I was role-playing at an apocalypse out of some misguided adoration of suffering.

  But I look at how those folk live and they’re… living about how I suggest, except in absolute isolation. Instead of working with neighbors to get by, they outsource it to apps on their phones. If they’re lucky, they can work from home. Otherwise, they take massive risks to earn an income, to not take any risks at other times, in some weird pursuit of a safe “balance.” (Imagine trying to balance how on-fire you are?)

  A lot of people around me are very angry at their neighbors because of how bad this winter is going to be, but I’m not sure they understand that they could’ve done more than sought personal safety to outweigh their neighbors’ actions.

### 2021

#### 2021-01 January

##### 2021-01-27 Wednesday

- The apparent contradiction of autoethnographical unontologizing <span id="sec:org1cc9841" label="sec:org1cc9841"></span> In a conversation I had with a friend, I referred to the act that my note-taking system enables as autoethnographical unontologizing.

  Autoethnographical unontologizing is autoethnography focused on the writer’s own unontologizing.

  This might seem like a term that is invalid:

  Autoethnography is ethnography performed by the person or community who it relates to.

  Unontologizing is unlearning ontology.

  How can writing about one’s own experience through a lens of logical study be for the purpose of unlearning that which was constructed through the framework of logical study?

  I’d like to quote from the English translation of "Ai ferri corti con l’esistente, i suoi difensori e i suoi falsi critici" ("At Daggers Drawn with the Existent, its Defenders and its False Critics") an anonymous essay published in 1998.

  > In order to discuss freely one must snatch time and space from social obligations. After all, dialogue is inseparable from struggle. It is inseparable materially (in order to talk to each other it is necessary for us to take time and seize the necessary space) and psychologically (individuals like talking about what they do because that is how words transform reality).

  > The critique of direct democracy (to stick to the same example) must be concrete. Only then is it possible to go beyond and think that the social foundations of individual autonomy really exist. Only then is it possible for this going beyond to become a method of struggle, here and now. Subversives need to criticise other people’s ideas and define them more precisely than those who swear by them.

  That is to say: I "must snatch time and space," because "dialogue is inseperable from struggle," and my "critique\[s…\] must be concrete."

  But… why critique, at all?

  I’ll share the quote that is the epigraph to the last section of "Ai ferri":

  > "Don’t ask for the formula for opening up worlds to you in some syllable like a bent dry branch. Today, we can only tell you what we are not, what we don’t want." - Eugenio Montale

- Are hedge funds retirement funds? <span id="sec:org3202243" label="sec:org3202243"></span> I’ve seen a few people ask. Generally, no. While you can invest in a hedge fund as part of your retirement planning, a "retirement fund," like an IRA, is not a hedge fund, and its assets are protected in numerous ways.

  While the shorting of a stock can cause volatility in an IRA’s holdings, they are significantly more diversified than hedge funds, even in equivalent risk margins.

  —

  All that said, all investment relies on interest-bearing debt and so is super-duper evil so like Iunno what people are doing relying on abject evil for their survival when there are people willing to practice mutualism around them, but hey? If you wanna frown at some people expressing class consciousness because you like to ignore your role in class warfare? You do you, ducky!

- Gamestonks <span id="sec:org6657270" label="sec:org6657270"></span> Today, the American hegemony basically told a lot of its most loyal Collaborators:[^9]

  > Sorry, money is just for spending.
  >
  > You don’t get to earn any.

  As a result, I’m seeing people who own MAGA hats talk about the "power of the proletariat." The rhetoric is close enough to what I heard at Occupy Wall Street to give me deja vu.

  And the leftists around me…

  …I haven’t heard most of them even acknowledge these events yet.

  There’s a concept Marx put forth, that I can’t recall well enough to quote, but, it says that the proletariat do not need the language of Marxism, because they live the experience.

  As I see it, a bunch of traditionally non-Marxist proletariat are using Marxist language to voice themselves, while criticizing the capitalist investor class and taking what could be argued as the most powerful form of direct action available to a population that lives in townhouses and condos doing white collar work; e.g. without any accessible praxis except financial activity.

  And the Leftists who are normally very keen to engage in The Discourse are… discussing the hypocrisy of Marjorie Taylor Green?[^10] If they have the energy for that, they have the energy to reach out to those with awakening class-consciousness and relate stock manipulation back to leftism.

  Good praxis is taking advantage of opportunites. As as example, if my racist uncle starts calling himself the proletariat at holiday dinner, I’m not going to ignore that to talk about the clam dip with my aunt. My uncle has provided me with an opportunity for communication.

  Most legacy social media platforms are currently full of folk saying "We are the 99%," but the leftist presence in those places is acting like today is any other day.

  And most of the Leftists who are acknowledging these events are exclusively trying to gatekeep radical praxis to that which supports anarcho-communistic models of revolution. I think it’s a mix of fear, prejudice, and I’ll even speculate: a little jealousy.[^11]

  Fear? I’ve seen a lot of misinformation about how hedge funds and the stock market work, that could be fixed with some self-teaching. Instead, working class folk are accusing other working class people of trying to steal their retirement. First off, you should ask why they’re feel the need to steal from you, and see if you can’t address that. The alternative is preventing the theft with regulation and that’s literally policing. Second, retirement funds are bad, too, just like hedge funds. They’re all based in interest-bearing debt, which is evil.

  Prejudice? White guys in white collars are racist, there’s no doubt about that, but remove the power system and the white collar, and suddenly they’re just bigoted. That might not sound like it, but that’s a big step toward equality, and a lot of these folk trying to game the stock market are doing it to break the power system. Folk have to make room for these people as accomplices, not reject them simply because yesterday they were Collaborators. We all are, in our own way.

  And as for jealousy? As I was writing this, I heard that today the White House was discussing stimulus checks, something which previously wasn’t immediately on the table. (The executive actions so far have been to prepare for the establishment of work programs, the Green New Deal). But as of today, apparently, there’s an urgent interest in distributing, what I heard, \$2,000 a month.

  And the only reason a hedge fund didn’t go bankrupt is because two other funds gave them the money they needed.

  That’s more harm to Wall Street than Occupy Wall Street ever did, and even before last week I’ve seen a couple dozen people talking about using their "meme stock" profits to pay off loans, help with family medical bills, etc. Compared to setting up GoFundMes and paying into bail funds, it’s really hard to argue that the meme stock stuff is radical.

  The question is simply whether it’s accelerationist, revolutionary, or insurrectionary. And that’s a question that our actions help dictate the answer to.

  > No \[one\] but the struggling, oppressed class itself is the \[vessel\] of historical knowledge.[^12]

- Looking at positionality <span id="sec:org6198e72" label="sec:org6198e72"></span> So my partner asked for help writing a positionality statement, which I hadn’t heard of before, and now I’m taking a look at what that’s about. Searching the Web got "Researcher Positionality - A Consideration of Its Influence and Place in Qualitative Research - A New Researcher Guide,"[^13] which seems to be a pretty comprehensive look at the entire topic, and begins by relating them back to reflexivity statements, which I am (recently) familiar with. It definitely focuses on ethnography, but its look at emic and etic ontology is what makes me think it’s a useful piece.

##### 2021-01-28 Thursday

- Can we decide to give up? <span id="sec:org08d08f6" label="sec:org08d08f6"></span> The world is ending. If we’re convinced it’s too late for action, can we decide to give up and just wait it out, sip our tea and tell stories, or must we keep on offering resistance to what is certainly inevitable?

- I was at Occupy Wall Street and I love what is happening <span id="sec:org30af8bb" label="sec:org30af8bb"></span>

- Overheard Gamestonks chatter at the Cottenboro GAZ <span id="sec:org02269bb" label="sec:org02269bb"></span> I can hear two bougie people at dropping off fresh apples at the free market here expressing concern that a "bunch of trolls" are going to "ruin their retirement."

  And last night I heard an anarcho-mutualist asking "how do we… can we buy a stock?"

  If any of you make oodles of money speculating the stock market, btw, I would like about \$2.5k for dental work, \$2k to get a big nice loom from where it is to me, and like \$4k to set up a 1acre farm for a local coalition of local Afro-Indigenous wannabe-land stewards.

  Near as I can tell, money is getting so fake that ~\$9k is no longer a reasonable amount to just… ask for, so, there you go.

  As I was writing this, the two bougie people went on to say, "If we just gave out stimulus checks every month this wouldn’t happen."

  Apparently the White House is talking about this, too, as of yesterday, which is a pivot from the 100 day plan.

  Congratulations, US Leftists, a bunch of people who self-identify with their lack of knowledge and wit brought universal basic income to the table faster than y’all ever managed.

- Knowing the basics of the market isn’t class treason <span id="sec:org01af6b8" label="sec:org01af6b8"></span> This week is proving a point that a lot of leftists call me a class-traitor for making:

  Everyone who lives in a place where the things around them are run by publicly-offered corporations needs to have a basic understanding of this sort of market economies. Not so that they can earn money from it, but so that they too can know which businesses are going to be sunk, so that they’re not, y’know, working at them.

- Winter note-taking is practice for summer note-taking <span id="sec:org88f1be2" label="sec:org88f1be2"></span> A position that maybe gets lost in my talking about note-taking is that all this note-taking about like anthropology and ontology is p much just me killing time until the last frost has passed and I can get to gardening for real.

  Then, hopefully, I’ll be able to take as "beautiful" of notes about like, my experiences gardening, and relate them easily back to this framework I’m documenting now!

  Because, tbh, I care much more about "here’s how to grow peas in your windowsill with a 20oz soda bottle" than "here’s the appropriate language for discussing a perspective you’re projecting onto another person’s worldview"

  But… the latter is also important in the former because it’s important you know why I care about growing peas.

##### 2021-01-29 Friday

- Stonks as praxis <span id="sec:org5529336" label="sec:org5529336"></span> "You can’t play the stock market as praxis" scream the same people that contribute to a 401k and bail funds with the same paycheck.

##### 2021-01-30 Saturday

- Deontology isn’t universal <span id="sec:org70f8f5c" label="sec:org70f8f5c"></span> I wish I had my old commentary on it so I could demonstrate that I’ve been saying this for a while, but I want to re-emphasize something I believe, while so many people are talking about the 2021 Hedge Fund Contraction:

  Deontology is not universal.

  This means: *"Too many of you think the rules of your moral system matter more than the effect of acts taken in the material world."*

  For example, if you think that paying your taxes while you offer a critical Leftist perspective is more moral than gambling against capitalists while thinking like a consumer.

##### 2021-01-05 Tuesday

- Welcome to the New Year <span id="sec:org4b60886" label="sec:org4b60886"></span> Howdy everyone! Welcome to 2021. I apologise for the delay of a few weeks in writing a good update, but I’ve been busy! As I wrote about a while back, I had a series of hardware failures that left me with, to look at this positively, a clean slate. No backlog of archived files that needed sorting, no half-finished code projects, just an empty computer.

  With that clean slate, I spent some time tinkering around, trying to re-determine my relationship with computers. I have, though it’s hard to express, a better idea of that relationship than I did, and I even have some notions of how to build a tool that accommodates that relationship in a way I’d like. But, I also spent a lot of time working on things like setting up a Wordpress that aren’t going to be relevant going forward. Oh well.

  One thing that a new beginning let me do was take a fresh look at the relationship between my writing and my "performing" on the Web: sharing that writing with a public audience, in exchange for support, either financial or otherwise. (Thank you to everyone who’s been donating! I don’t know if I posted about it but it helped me put on a few big meals for my community over the past couple months.)

  With the ability to start fresh, I decided to look at what I’d be able to make using Emacs and Org-mode, a text-editor and an information management application, respectively. Since I last used Org-mode, there’s been a new addition to its ecosystem: Org-roam.

  Org-roam uses a database to keep an eye on Org-mode text files in a directory, and provides features to make it easier to link between those features. Depending on how it’s used, this can make it easier to create a personal information management system out of Emacs and Org-mode, by implementing in-part or -whole systems like Zettelkasten or a Wiki model.

  Org-roam fills, almost, a missing piece of my Org-mode use from a while back. (I need it to also track inclusions, not just links, but it looks like that’s in development already so I just have to be patient.)

  Now, I’m able to pretty easily maintain a directory of Org-mode files that serves as a personal encyclopedia of terms, but also my daily records, all while holding chunks of the code that make the system work in the first place, letting me publish something that’s a bit blog, a bit Wiki, and a bit source code repository.

  You can look at the work-in-progress replacement for my Website over at <https://emsenn.github.io>(Why Github? I was teaching some people how to set up personal websites with the service, and haven’t moved myself off it yet.)

  Even already there’s a lot of changes planned for the Website that’s there, and there’s not much content… yet. Most pages are empty, or contain just a bit of boilerplate, as I work to map my conception of how I want to handle my personal information to Org-mode.

  With my Website able to fulfill a more desired place in my role on the Web, and that role itself still changing, that means my newsletter and other profiles on the Web are going to change.

  Newsletter. Available through <https://emsenn.substack.com>, I have an email newsletter. Before, these email letters were the equivalent of blog posts. Now, they’ll be the equivalent of postings from my daily record. So, my newsletter will be a manual "best of" from my public postings, useful for folk who want to just get the most polished of my writing.

  Ko-fi. Available through <https://ko-fi.com/emsenn>, Ko-fi is where I accept financial donations. I had planned on listing various notable works there as pay-what-you-want but I’m not sure if I’ll do that going forward.

  Itch. Available through <https://emsenn.itch.io/>, Itch is another place where I had planned on listing various things as pay-what-you-want. Also unsure if I’m going to do that!

  I do plan to set up an RSS feed (or several) for the new Website, but haven’t yet - there’s quite a few moving parts that go into it already, and I’m not in too much of a rush.

  In other news, it’s quite winter outside now, so I’m spending more time at my computer. Unfortunately, it’s rather disorganized use, so if you’re getting this email before a response to one you’ve sent to me: sorry! I’ve got them all flagged in my inbox, I just want to make sure I’m able to respond to each appropriately.

  It might be a bit before I have a piece of writing polished enough to send to y’all, given the current turbulence of my writing style, but I’ll try and send out another email explaining any important updates every couple weeks or so.

  Or, I’ll get things cleaned up real quick and suddenly be able to churn out good writing!

#### 2021-03 March

##### 2021-03-08 Monday

- Looking at my computer use through metaphor <span id="sec:org48adbfa" label="sec:org48adbfa"></span> I’ve recently been overhauling how I use Org-mode, trying to bring it past just writing and into some sort of project-management system. Through the winter I was working off the metaphor of a "digital garden," but found myself frustrated with it, until it clicked that I was letting other folks’ conception of "garden" influence mine.

  To lots of people, "gardens" are recreational aesthetic places, where a person labours on a sort of living sculpture. To me, a garden is… I don’t want to to say a garden is a factory, but it is certainly closer to a factory than a garden. It is a space of land that has been cultivated into being able to, in a way, take action, in its own way: actions like "produce corn" or "hold rainwater."

  If I view my digital garden as that sort of thing, a space where actions can be cultivated into capability, then I suddenly see the whole project as more worthwhile, outside of the potential benefits to heutagogy.

  I also hold in my head the metaphor of a starship: a machine and its inhabits working closely together to live their lives. The starship has no life outside of what the people who created it have given it, but it’s hard, in some ways, to argue that it doesn’t have a life: what the ship is capable of, what its day is full of, is quite different than the capabilities of its crew or their experiences.

  In a digital garden, I don’t exist as human. I exist as whatever vessel my interface creates around me. So, great thought has to be put into what that vessel is. In my digital garden, my vessel is my Emacs client. What capabilities does this vessel need to have? An interesting difference between my vessel and a starship, is that my vessel is the sole creator of its environment, while a starship is created from its environment!

  Like a starship, I need sensors, some way of taking data that exists outside my vessel and capture it in a way that the rest of the vessel’s systems can make sense of. I would prefer at this point to have those sensors be rather "manual:" I, the human observe something, and trigger a manual entry into whatever the sensor’s database is. (The alternative being "automatic" sensors like hooking my email client into Emacs.)

  I also need a database that stores that captured information, and a way of querying that database and generating some sort of report.

  But… there’s also the routine activity that I take that isn’t really an external input, like writing this essay, or claiming a blockchain token staking reward.

  Right now I have things organized with one file holding my plans and schedule, divided into their domains. It also has the configuration for my Emacs, since that’s the main point of my Emacs, so the boundary between configuring the client and planning projects is very blurry.

  The difficulty ahead of me is in expanding that configuration in such a way that it gets easier for me to track my work, and generate reports on it, and capture external information - the non-metaphor version of what I outlined above.

#### 2021-04 April

##### 2021-04-12 Monday

- Who might read these notes? <span id="sec:org72201bd" label="sec:org72201bd"></span> So much has changed since I’ve been good about taking notes. The Groundhog Autonomous Zone has really taken off. With the help of a friend from the Fediverse, KemoNine, there’s the beginning of infrastructure, and that means a real push for governance. It’s fascinating, trying to bootstrap a government for myself and people who opt into it, using a hodge-podge of FOSS software.

  There’s so much I want to document about the process, and I just don’t have the time to document it, do it - and do all the other work I’m normally doing, that the governance is there to wrap around. *(In fact recently, that work, of land stewardship, has been keeping me from getting to the GAZ stuff as much as I wanted.)*

  Now, there are people who might actually read these logs, and I have an inkling of why - which is interesting in its own way: I can’t remember the last time I was writing not to be directly informational, or to perform information in some way, but writing to help… well, essentially, a potential future investigator come to an understanding regarding whatever it is they’re investigating.

  Which might sound too vague to be useful, but it’s not: it means that I need to try, with my logs, to capture the *context* that my decisions and actions are happening under. Because the acts, and sometimes decisions, get captured and recorded.

##### 2021-04-13 Tuesday

- Planning the GAZ’s future <span id="sec:org5db6fa7" label="sec:org5db6fa7"></span> Today I announced to the bootstrapping domain that I was stepping back from land stewardship for now, because lack of assistance means it’s a losing battle. I’ll continue to cultivate what’s here as best I can, but I’m no longer going to try and organize folk toward it.

  It’s important that this is recognized as a tactical defeat: I am retreating from an act of anticolonialism because there is not enough resources to sustain it.

  But, the strategy continues. Essentially, I am going to maintain for myself a prolonged winter, where rather than focus on taking care of the land around me like I do during the year, I’ll focus on taking care of my community. That means working more on developing the GAZ Directives. To facilitate that, I’m going to also be working on my personal Emacs configuration.

  I’ve been thinking about the Directives a lot - not any specific one but the very… fact of their existence. It troubles me that I’m trying to write down how a community works, when how it works is always.. just how it worked, most recently. The trouble is, at a glance, a feeling of futility, but when I think on it, it’s a feeling of… anxiety, almost. I am anxious to adequately convey - and center, an awareness of the Directives limitations, throughout themselves.

  I think having more structure, so there’s places to put more verbose explanations of things, is a necessary first step. But I’m unsure exactly what structure I want.

  I went ahead the other day and added some `TODO` tags to the file. These are mostly for this bootstrapping phase, for now, I think.

  - `drafting` means the thing is still being written by me.

  - `reviewing` means I’ve thrown it to one or more gophers or groundhogs to revise

  - `ready` means it’s done being looked at is ready to go, for when we’re done bootstrapping.

  But I’m getting off-topic from what I’d like to work on: my own Emacs stuff.

##### 2021-04-14 Wednesday

- Groundhog Emacs as a starship <span id="sec:orga13def5" label="sec:orga13def5"></span> I’ve felt poorly from the weather and my nerves the past few days so slept a lot. I’m feeling awake and capable of writing a bit, so let me do that while I can.

  I have this notion of a "Groundhog Emacs," that’ll be the configuration for the computer tool people use to create and share resources related to the Groundhog Autonomous Zone. Stuff like encyclopedia entries, but also stuff like time clocks or whatever else.

  This would rely on using a shared Emacs configuration. I started to draft up such a configuration last fall, but there wasn’t anyone around to use it and collaborate on its development with, nor was there any need for the types of records it would create. But now that the GAZ is coming together more fully, something like Groundhog Emacs seems like a necessary thing.

  In my head, I often picture the GAZ operating as a starship, but rather than existing in a void of space, it exists in the turbulent flow of Earth. And the people who live "in" the GAZ are… our starship is not the *Enterprise*. It is the *Voyager*. We’re isolated, as a community, and also as individuals within that community. ("At Daggers Drawn" is a useful read.)

  Existing in a current, as a vessel, we exist with constraints. Propulsion is not absolute. Its ability is based on the media we flow through. Our greast control is to strike levers into the flow. Here the metaphor to a Starfleet vessel falls apart: I see our ship moving not just with manuveuring thrusters, but with rudders and ailerons.

  And in fact, this vessel doesn’t even have a unified hull. It is more like the generational ship Voyager encounters, or the cellular ships of the Suliban that Captain Archer fought against, "back" in the 22nd century. Parts of the GAZ vessel exist as "work-groups" tethered to each other. Here, I picture the tethers as thick cables running into the bridge of each work-group, where it can be let in and out with a hefty wench.

  Nearly even compartment of this conglomerate vessel has some sort of control surface: small rudders that are constantly flexing in the current closest to them, in coordination with the tethers, keeping the ship oriented wherever the collective effort decides. Other ships have bigger conrol surfaces, and others still have control of the tethers for compartments around them. Some compartments are covered with fishing nets, trawling materiel from the rushing space around the ship.

  The ship, as a whole, has no main bridge. What it has is an agreed upon process of communication and negotation, that lets the decisions and actions inside the ship flow in a stigmergic mimickry of the currents outside.

  That sort of communication is what the Groundhog Emacs configuration is meant to enable: letting people record the information that’ll let them communicate with their work groups, and letting work groups communicate that information between each other.

  Part of this choice is because it’ll be easy enough to move from Org-mode to another text system, and move from computer automation to a system without it. In fact, the choice to use Org-mode and Emacs isn’t so much to speed up the day-to-day operations of the GAZ, but to speed up their improvement during these early, quick-iterating days.

##### 2021-04-15 Thursday

- The taxonomy of my records <span id="sec:orgb642953" label="sec:orgb642953"></span> I wish I had my older logs on hand to easily copy some comments from. Today I’d like to structure my Emacs config to actually produce what I’ve been calling "records."

  There’s a lot of jargon here, informed by hands-on experience with lots of information that was meant to be handled in a specific way. A *record* is *information* that corresponds to a *schema*. *Schema* represent information type, by defining what *data* and *metadata* is tracked, and *schema implementations* are how that data is transcribed in a given format.

  Groundhog Emacs has (or should have) capture templates and other tools for creating and changing records, implemented in Org-mode. And, ideally, tools for sharing those records with other folk.

  Records corresponding to schema, information being data and metadata is all pretty standard stuff.

  Things get trickier when considering that Org-mode has two major ways of storing information: as a file or as a subtree, and the capabilities of both, within Org-mode and within the larger ecosystem, are slightly different.

  There’s different ways to break up what a record is, too. I haven’t figured out exactly the taxonomy I use, but I view most records as falling into one of a few categories:

  - There’s ***informational*** records that contain, well, information and its context. Personal profiles, dictionary definitions, these are informational records.

  - There’s ***operational*** records that have instructions for how to do things, and the data about how it was done.

  - There’s ***transactional*** records that have information about the transfer of something.

  These all used to be relatively explicitly defined within my records, that were made with my Emacs client, but over time I slowly drifted, since the information was largely unnecessary since the GAZ wasn’t established yet.

  Now, though, it’s important that sort of stuff be clean, and associated back with GAZ directives. So I’ll be cleaning up the configuration I have, and pulling back lots of the capture templates and project stuff, to be re-implemented once the associated directives and stuff are there.

#### 2021-06 June

##### 2021-06-22 Tuesday

- Looking at my Web presence <span id="sec:org27541d5" label="sec:org27541d5"></span> Since I was last able to look at how I conducted myself on the Web, a lot in my life has changed. Those changes mean I’m able to focus on my Web presence in a way I wasn’t before.

  My short-term plan is to, roughly:

  - Use Twitter and other blogs to broadcast links to other folks contents, and notifications of when I’m streaming.

  - Use Substack to maintain a newsletter/blog of "Letters to the Web," which are essays written for an audience of colonial and colonized peoples on the Web.

  - Stream on Twitch most days, usually showing me working on beadwork and playing audio from podcasts or other content, and talking about it.

  - Bring people into a Discord, the Duckpond:

    - The Duckpond is paid-access:

      - \$1 a week is the rate we’re currently using for read-only access to some of the channels.

      - \$4.50 a week is the rate we’re currently using for full access to the Duckpond.

    - Access to the full Duckpond includes download access to the Groundhog Anti-colonial Encyclopedia, a frequently-updated encyclopedia of knowledge related to anti-colonialism.

    - Members of the Duckpond are called Ducklings

    - The Duckpond is run by the Groundhog Autonomous Zone. Groundhogs are people who are trained (by other Groundhogs) in the work of transferring resources into decolonial praxis.

    - Each Duckling is assigned a Groundhog liaison. (Groundhogs pick their Ducklings)

      - Ducklings can request new Groundhogs.

    - The Duckpond has a gamified anti-colonial education program:

      - Completing presented challenges lets folk earn GAZ tokens

        - Gain access to topic-specific rooms in the Duckpond

        - Maintain membership in the Duckpond (X tokens = 1 week.

      - Challenges include responding to provided resources with your thoughts, questions, and epiphanies (TQEs), filling out petitions, transferring wealth to specific groups and people, etc.

        - TQE Challenges:

          - One resource a week will be provided to the Duckpond. Members can then write their TQEs in response to the resource, and send them to their Groundhog liaison.

          - Then, all the Groundhogs will have a chance to read the TQEs for that week, and each TQE will be read by at least one Groundhog. After the reading perios is over, The Duckling will be given an amount of GAZ tokens in reward, and potentially receive a written response from their liaison, summarizing the Groundhogs’ own TQEs written in response to the Ducklings’ TQEs.

          - (This is a fair bit of labour: organizing the resources, contextualizing them, reading the TQEs, commenting on them, collating and rewriting those comments, etc.)

  Obviously there is a lot involved in getting this all organized, but I have folk who’ve expressed a desire to help me, so I’m confident we can get something like this vision implemented.

##### 2021-06-23 Wednesday

##### 2021-06-24 Thursday

##### 2021-06-27 Sunday

##### 2021-06-30 Wednesday

#### 2021-07 July

##### 2021-07-01 Thursday

#### 2021-09 September

##### 2021-09-18 Saturday

- COVID broke America <span id="sec:org5842acd" label="sec:org5842acd"></span> Before I begin, let me start by saying thank you to everyone who maintained their paid subscription here or through my Ko-Fi. That money has been covering my groceries these past few months, which has been a tremendous burden off my back.

  In my last letter, I announced that spring was coming, and encouraged everyone to reckon with their own relationships with our contemporary kyriarchy, colonial white dominionism. That letter was sent out February 26th. Back then, lots of folk who read it probably felt that with a new president, things were going to get back on track. The pandemic already seemed to be waning, and with control of the executive and legislative branches of our federal government, the Democrats seemed likely to move toward economic reforms that would reduce the growing gray-zones between middle class and working class, and working class and the underclass. (Petite bourgeousise, proletariat, and lumpenproletariat, precisely, if perhaps misspelled.)

  Well, it is now the fall. In that time, my family, and hundreds of thousands (and soon millions of families) got kicked out of our homes. Luckily an accomplice stepped forward, and so while the displacment and dispossession was a substational disruption, I actually feel closer to the future I imagined than I expected to be this time of year, had things not gone badly. I have very good bad luck, I’ve often said.

  In addition to the evictions occurring across the country, the pandemic continues to move through our communities in waves. Only recently have I seen local folk acknowledge the Delta variant, but I hear comrades on the horizon crying out "Lambda!" and "Mu!" And through it all, environmental destruction continues to accelerate, despite the most authoritative experts in our world saying we are in a state of ’red alert’ and absolutely must stop behaving as we are, immediately.

  But I’ll stop there. Most people are aware that there are abnormal situations developing in our reality; and this letter is not the place, right now, to raise that awareness. Instead I want to take a brief moment and share my conclusion from this summer:

  COVID broke America. I don’t mean America as in the material infrastructure, but as in the concept of what America is. The disruptions to the infrastructure are, so far, very minor, yet they have solidified a real shift toward an extreme commitment toward manifesting various American ideologies. Against the backdrop of the egotistic isolation built to require consumerism, this has the effect of being an acceleration into late liberalism where this commitment is acted out only through aesthetic, further developing the marketization of the recuperation of the radical into the state’s ontology.

  That was a lot of jargon to say: Even though inflation, supply shortages, etc., have been pretty small, various groups have used those things to justify more firmly believing in an American ideology (be it American capitalism, American communism, American syndicalism, etc.), to the point where people are willing to take actions to try and move America toward that ideology. But because everyone is very isolated by and for consumerism, those actions will largely be aesthetic, existing within the infrastructure of America that already exists. Such aesthetic actions create a "discourse" that then can be commercialized and then you see Marx slogans for sale on tee-shirts at publicly-owned corporate retailers.

  There is a popular story about how when the Roman empire was collapsing, they made sure to provide their population with food and entertainment, so that they would be too complacent to revolt. This was not actually that effective, for many reasons, but for the sake of narrative I’m looking at one: the spaces where entertainment happens can be spaces for radicalization.

  If all your neighbors are gathered together to watch a show, all it takes is one neighbor saying "Hey so the way our mayor treats us is crap, right?" to start a conversation about the mayor. Sure, the mayor can hire guards to keep the conversation to a minimum, but, those guards are probably neighbors too.

  The social world served as a whispernet and sneakernet for information, that in the hands of the proletariat became class consciousness and fuel for radicalization and insurrection.

  Look at our contemporary circuses. They are electric screens. We each have our own, though some might share a large one for a couple hours. They flatten geographic boundaries, but at the same time, flatten everything else. The channels they carry are constructed with the capital interests of commercial agents as a primary concern, not their ability to facilitate community or communication. We know they closely monitor us, and everything we say through them, or possibly even around them, can be heard. We don’t know who all exactly can hear it, but we know they have more systemic power than us.

  The nature of these spaces makes it very difficult for them to be spaces for liberation, and perhaps impossible for them to be spaces for liberation outside of the capitalist gaze and a part of the market’s source for fresh cultural materials. (I do not want to diminish or erase the great amount of work that has been done despite this difficulty. There are many who have cultivated truly liberatory spaces through the Internet, and I respect and learn from them.)

  In effect, it is not really possible for a neighbor to say to their neighbors, "Hey, our mayor sucks," without it being carried through a network controlled by the mayor’s boss, and in sight of many many people who are not neighbors and yet might involve themselves anyway. While isolated as individuals, simultaneously, community has been removed as a buffer between the individual and their society: now the way to change your community is not through community effort, but changing the whole society. And the material reality enforces this: our municipalities do not have the means to implement a local Green New Deal, for example, without the funding of the federal government.

  And so you have individuals asking of their imagination, "How is this profitable in our society?" of… every thought they have, just about, because that is the only question that matters, when it comes to realizing that imagination in the world. It isn’t enough to grow a fig tree because you say, "I want to," you need to say, "Well, the fig tree will give me figs, I otherwise would’ve had to buy them," and you need to say, "Look, by the fifth year, I’ll have saved over one-hundred dollars on figs!" and you need to say, "Look, it is profitable to have a fig tree even if I pay myself for the time it takes me to cultivate it."

  You have to say, "I have to pay myself a wage to do the things I want to do, and if I cannot do that, I will try to change my desires. If I cannot do that, then my desire to have profitable desires is my desire, and I can buy books and many other things to fulfill this desire." You have to train your imagination to follow the logic of neoliberal market economics, rather than let it follow the opportunities presented to it by the world immediately around it.

  A space for a neighbor to ask their neighbors about the mayor is a requirement for liberatory insurrection, as it is needed to develop the prerequisite class consciousness.

  A space for a neighbor to grow a fig tree because they want to, is also a requirement for liberatory insurrection, as it is needed to development the material consciousness to see the world from outside a colonial perspective.

  Yesterday was the 10th anniversary of establishment of the Occupy Wall Street camp at Zuccoti Park. There have been a number of pieces reflecting on that; I bring it up to say, as someone who was there, and at many other Occupy camps across the United States during that time: what made Occupy a threat was that it provided a space for both of these things. It was a space where people could discuss things directly with their neighbors - and much like the Internet, there were established protocols for helping the conversation flow; I saw the rules of the General Assembly then and now as a kind of "analog TELNET". But it was also a space where people could experiment with different ways of meeting their material needs, so that their life had room to imagine things differently. They brought these ideas to the discourse being conducted in that same space, and suddenly the conversations were massively expanding in scope, from questioning the legitimacy of student loan interest rates to questioning the institutions that make up the American Empire, in just a few months.

  All of the above to say: I think the creation of these liberated spaces is critical to enacting liberation. But it is critical to center Black Liberation and Indigenous Sovereignty when moving this way, otherwise settlers, colonials, and colonized all will be engaging in a form of neopioneerism. By creating, disconnected from what I’ll refer to as LandBack, liberatory spaces, folk coming from colonialism are almost certain to create liminal spaces which form the frontier of cultural commodifiation.

  So this is not a call for you white readers to go strike ground on an unapproved garden in your bougie subdevelopment, so that you can all sit around and plan some NIMBY nonsense. This is a call for you to look for the BIPOC spaces that already exist around you, and figure out if and how they want your support. We need accomplices, not imitators.

  For those of yall already working on creating these spaces: thank you. For those of yall who are scared to get started: reach out and I’ll be your cheerleader and/or coach.

  "We have all we need to be free."

#### 2021-10 October

##### 2021-10-01 Friday

- Dusting off my Emacs configuration <span id="sec:org4fc27db" label="sec:org4fc27db"></span> Dusting off my Emacs configuration for the first time since the last winter ended. I’m planning on returning to cultivating an Org-mode formatted digital garden and publishing it to the Web, primarily as an HTML digital garden located at <https://emsenn.net>

##### 2021-10-02 Saturday

- Updating emsenn.net’s CSS <span id="sec:orge668225" label="sec:orge668225"></span> Today I’m hoping to update the CSS that gets produced for emsenn.net

##### 2021-10-05 Tuesday

<div class="itemize">

Walking around my digital spaces <span id="sec:orgb798e6d" label="sec:orgb798e6d"></span> This morning I’d like to take some time to metaphorically walk around my digital spaces, look at what I have, and how I might best bring it together to something sensible.

There’s really one thing I’m looking for from the Web, which is a source of resources and community that isn’t connected to my physical community, since society has proven its very capable of disrupting that sort of community if it wants. When that happened to me back in the spring, it was my Web connections that helped - and are helping - keep me going.

So, let’s get started with the walk-about. I’m going to build two lists: one for the services I have space on, and the other for capabilities and which services offer them. I think this’ll help me quickly get a feel for what should go where.[^14]

<div class="itemize">

Services

Discord  
Chat space

Ko-fi  
Mostly for accepting one-time or recurring donations.

- But, it also has a blog, image gallery, place for accepting commissions, and even an online store.

Github  
Mostly code hosting

- But also has microblogging, fundraising (I think?), and webhosting.

Substack  
Email newsletter

- But also has a blog

Twitter  
Microblogging

Ecosteader  
Microblogging

NearlyFreeSpeech  
Webhosting

Capabilities

<div class="description">

Ko-fi, Substack

Discord

Ko-fi

Fundraising

One-time  
Ko-fi

Recurring  
Github, Ko-fi

Ko-fi

Github, Ko-fi, Twitter, Ecosteader

Substack

Store

Digital  
Ko-fi

Physical  
Ko-fi

Github

</div>

</div>

So, just looking at this, it looks like I could use Discord, Ecosteader, Github, Ko-fi, Substack, and Twitter to get my message out onto… most of the Web, depending on what format that message takes.

I think at this point I need to… not think so much about it and just write and post, and should pivot to focusing on bringing back my Org-mode into shape for time- and inventory-tracking.

Thinking back on keeping a ledger with Org-mode <span id="sec:org103b89c" label="sec:org103b89c"></span> In the past - as recently as last winter - I was using Org-mode to help keep a ledger for myself. But I’ve lost all that configuration, as near as I can tell. What I can remember from it, I was using Org-mode capture templates, which aren’t too complicated to set up, but as with any sort of variable templating, they can be kind of finicky to get working properly.

A few beliefs intersect to motivate me toward keeping a ledger, these days. There’s so much evidence that Western lifestyles require significantly (exponentially) more energy and resources than would be sustainable, thanks to their dependence on oil. I think *Homo colossus* will go extinct, and I think the process toward that extinction started before I was born and is accelerating.

So it’s important to my sense of survival to try and personally move out of resource overshoot. But it’s hard to know how much resources I’m using if I don’t keep track of it. And in many ways, what we use is obfuscated.[^15]

One important part of liberatory praxis is making spaces that are liberated. In the heartland of the kyriarchy, with all its infrastructure, it is hard to make spaces that aren’t in some ways dependent on that infrastructure. We all use the roads. And these days, those roads run into the bones of our house, bringing in energy, connectivity, water, and hauling away waste.

But these spaces can be reclaimed, in part, by… I don’t want to say "going off-grid," but… Gloria Anzaldua talks about how the further you are from a border, the more clear and definitive the border looks. And things that are invisible, like our dependence on colonialism to have water come out of the faucet, seem very far away. So in the abstract, leaving colonialism, when you’re completely enclaved by it, seems very easy. But as you try to cross the border, it becomes clear that what is seen as the border from far away is a lot murkier up close.

My hope is that by keeping a ledger, not only can I keep an eye on my resource overshoot (and think about ways to change that), but also by keeping an eye on when those resources come from colonialism (and think about ways to change that.)

Questions for buying something <span id="sec:org5494746" label="sec:org5494746"></span> As the capacity of the society around me diminishes, I find myself asking new questions when I want to buy something, so I’ve made a new list for such questions.

Tracking my electric use with ledger <span id="sec:orgb2aa778" label="sec:orgb2aa778"></span> I’ve tried to really cut down how much electricity I’m using, since, given any current means of accessing it, it’s stolen resources: either powered by coal if I use an outlet here, or through stolen metals and labour if I use solar panels and batteries. And I’d love to know how much electricity I’m using, and for what, so that I can more specifically plan how that can change.

It makes sense that my unit for electricity in beancount will be a watt hour. I’ve been considering tracking the resources I take from colonialism as liabilities[^16]

</div>

##### 2021-10-06 Wednesday

- Ledgers and squirrels <span id="sec:orgea07eb2" label="sec:orgea07eb2"></span> Woke up this morning with a mind toward getting my ledger back in shape, and I figured I’d start with something that doesn’t require I figure out a big backlog of activity: shooting BBs toward the squirrels that roam into my garden from the western neighbor’s lawn. I swear, the squirrels treat it almost like a game - they know I’mma shoot at them, so try and sprint to the sugargum maple in the center of the garden before I can shoot toward them. I guess getting hit in the rump by a $B$ from 15m away isn’t *that* painful for the squirrels. Anyway, I think I might have the basic entry format done.

  One thing that is interesting about this ledger is that I really want to… not center financial activity, but resources, as it goes on. There’s also unanswered questions about how representing the reciprocity I see in the world around me is going to work within a traditional Western ledger. My inclination, for example, is to record resources secured through colonialism as liabilities, and the resources secured through land-based living as draws against equity. Then, labor I do for the land also counts as working against equity.

  There’s inherent problems with this: if I take 3 gallons from the faucet and put it in the garden, that’d look like this:

      2021-10-06 "water garden"
        Liabilities:Colonialism:Water   -3 GAL {0.003 USD}
        Equity:Garden:HSST

  This looks balanced enough, except it doesn’t appreciate that anything in colonialism, the real resource use is fantastically higher than whatever amount of resources I actually receive. In theory, that `{0.003 USD}`, the cost-per-gallon, exists to help balance that, but in practice, the cost of water is heavily subsidized by kyriarchist violence at so many points that the cost for consumers is more representative of politics than economics.

  But: the important thing for my immediate needs is to know that I needed to take 3 gallons of water from colonialism, and so regardless of how much water that actually is behind the scenes, 3 gallons of water is what I need to work to replace.

- Gutter being cleaned <span id="sec:orgd2c215b" label="sec:orgd2c215b"></span> I feel it’s important to note that the gutters here at home are getting cleaned today. I reported that they were in need of a cleaning to a housemate, who reported it to the landlord, and they scheduled the cleaning. I’m not sure how that sort of stuff will be tracked over time, but I wanted to make some kind of note about it here.[^17]

  Brings me to another thought, about where the line should be between my personal records, and records for the… household, or settlement, depending on how you want to look at it. I reckon down the line I will probalby end up separating the majority of records for the house out, so that Esther and other folk can contribute to them without needing access to my personal records, but that’ll probably go a lot more smoothly once I’ve gotten a good flow going again for my personal records.

  On that note, I’m always amazed at how prolifically I write when I have the appropriate tools set up for it on my computer. I’m still postponing writing any Org-mode capture templates, though, because the records are still being shuffled around quite a bit within this file.

- Sharing writing with the Web <span id="sec:org764fc79" label="sec:org764fc79"></span> Okay, so I’ve been thinking and it looks like it might be useful to export from my records to various folders that can contain HTML, PDF, and other format exports of the work at hand, and then make those folders available as repositories on Github. I can then also set up entries in the Ko-fi shop that are "pay-what-you-want" redirects to the repository.

  As for writing like this, I’m still not sure where to put it. I still have this idea of a bulletin that goes out every so often, containing notable entries from my journal, as well as events from history, solicitations from BIPOC folk, and so on.

  But I’m not sure how exactly that would work. I guess maybe… another Github repo? Probably not one for each bulletin but maybe like, `emsenn/bulletins/2021-10-05.md`?

  Anyway, records -\> Git -\> GitHub -\> Ko-fi sounds like a good flow for getting the important writing out there. Right now, there isn’t any of that, so I’m worrying before I need to.

  If I have capture templates for inputting records and projects for outputting them, then fairly strict formatting is import, which is another concern - I’ve seen before what happens when I try and automate notes like this too soon: they get useless and cluttered, and I end up simply not participating.

- Looking at Org-WC <span id="sec:org20b1f62" label="sec:org20b1f62"></span> ***Org-WC***[^18] is a script for Emacs that, as far as I can tell from some playing, adds a word-count to the end of each line declaring a subtree in an Org-mode file, showing how many words (roughly) are under that subtree. I installed it because I was curious - I suspect that each year, with more and more exaggeration each successive year, the amount I write relates to the season: the closer we are the deep winter, the more I’m likely to write.

## Notes

### "Unsettling the Past"

Summary  
***"Unsettling the Past: Radically Reimagining Archaeological Knowledge"*** is a webinar about critical archaeology from Black feminist and Indigenous perspectives.

Status  
I haven’t finished watching this.

Source  
<https://www.sapiens.org/archaeology/reimagining-archaeological-knowledge/>

#### Summary

Moderator Whitney Battle-Baptiste leads by asking the panel, "How have you reimagined the past through material culture?"

Cheryl White, who is the Senior Lecturer in Archaeology at the University of Suriname, answers first, saying that Suriname has been, in the past five to six years, reconstructing their government archaeological services, from very little previous instition. White has also been a participant observer in the development of Maroon heritage boundaries.

When doing their dissertation, White became fascinated with the ancestral settlements of Maroon people and the connection between those settlements and Maroon history.

Sven Haakanson uses material culture to work with his own Indigenous community, to "put it back into a living context, so they can start celebrating who they are." *(This phrasing/idea of "taking history and using it for a living context" seems important to Haakanson’s point.)*

Mateo Romero shares a piece he made that mimicks/mocks archaeologists’ historic role, where the Pueblo people have been the object in a subject-object relationship, which I take to demonstrate how useless the colonial approach to archaeology can be. (His piece also touches on concepts of satire, cultural appropriation, media literacy.)

> There were just these bizzare conversations that would come up. These non-Natives would show up and they would have this sort of authority, they’d talk about this stuff like it was canon, and it was actually all imagined.

<div class="aside">

Oh gosh… this piece is fascinating to me. I touches on so much of my feelings of the dangers of satire - why I’m not a satirist anymore - and adds a new gross cultural appropriation angle.

</div>

Sara Gonzalez says this "plays on a long tradition in archaeology of the archaeologist being the storytellers of an archaeological record that was not produced, by and large, by the community they’re a part of."

Gonzalez sees themselves as a "witness of a material record of belongings that are owned," that’s how she’s reimagined it; setting aside her relatoinship as a storyteller and trying to form a new relationship with communities.

"All of this work is dependent on the relationships with tribal communities I have built. The perspectives I have developed are a direct result of the knowledge they have shared with me and entrusted me with."

Battle-Baptiste talks about how archaeologists can remove the "painting" of subject-object then leads to the next question:

"What hand does archaeology by and for Black and Indigenous communities have in the creation of radically reimagined pasts? What impact does this work have on the present, and what do you think the work implies for the future?

Cheryl White answers first. Institutional and community-based archaeology are both new in Suriname, and so are growing together. There’s been an effort to explain the benefit of science to Indigenous and Maroon people, who are often placed into adversarial positions with colonial institutions.

They see a lot of decolonization discussion within archaeology as asking, "What does heritage mean, *legally*?"

In Suriname, Indigenous and Maroon inhabit 95% of the land, only coasts are colonized. They are "essentially gatekeepers to the forest… It’s akin to being in someone’s backyard and never knocking on their front door."

"Communities have gotten very savvy," and understand that whoever engages with the archaeologists needs to work to bring information and utility back to their community. White relates this back to the "rights-based approach" to decolonization.

Mateo Romero says that in the southwest USA, we’re seeing an emergence of "nontraditional roles in archaeology and curation." 30 years ago it was all White men, now it’s many people, including those outside traditional archaeology. "With younger Native students we’re seeing seeing a literal Indigenous voice, not some of proxy or imagined connection but this literal outpouring of voice from the community."

"Instead of the subject-object discourse… you get a more nuanced approach based in… language… gender perspectives… ideologies…"

"I love it, for 30 years I’ve been kicking around talking to the same people about pottery, and now I’m hearing alternative amazing things coming out, and I love that."

Gonzalez says, "reimagining the past requires reimagining the present that we occupy." They relate that to the representation of BIPOC youth in archaeology, and how that’s a direct consequence of the hard work of the previous generation of scholars.

Gonzalez points out that Haakanson was only the fifth Indigenous archaeologist with a PhD, and a recent list says there’s only 33, but we’re now seeing the fruits of their labor, with the latest generation, and so BIPOC perspectives might be mainstream soon in archaeology.

White asks if Gonzalez sees this as the "indigenization" of archaeology in the US as intentional or accidental, and shares some background of archaeology in Suriname, where it was traditionally a consequence of industry under Dutch control, but the recent institutionalization of Suriname has very much centered indigeneity.

Gonzalez reckons yes, saying there were a few central figures, e.g. schools that changed their graduate admission programs. Gonzalez highlights University of California, Berkeley as one of the earliest, and now their graduates are assuming roles in the faculty in other institutions. Gonzalez says clearly yes, the intention of the earlier archaeologists is evident. University of Massachusetts, Amherst, University of Washington also is a good one. (Hakaanson works at University of Washington.)

Haakanson adds that a lot of this changed after the Native American Graves Protection and Repatriation Act gave Indigenous people a voice, but also "showed us we could have a career in this." "We’re able to say ’this is who we are’ rather than have someone come in and say ’this is who you are,’… and that really does radically change how we see our past."

White wonders about their own role in Surinamese archaeology, as a "transplant" to the country. White says they’re not "here to borrow your watch to tell you the time." White asks if there’s a disconnect between the Indigenous community and archaeology, from Haakanson’s perspective? To the "people who are like, ’we live this, we don’t need to ossify it in the halls of some museum?’"

Haakanson says they live with their community, and tries to make sure their work is good within their work as a museum curator, and their work within their community. "It keeps us sharing the story but helps us push that same story of truth of who we are forward."

### *Pollution is Colonialism*

### *King of the Hill*

- Note taken on *\[2021-10-05 Tue 18:12\]*  
  Holds up better than I thought it would, considering its age!

## Document

### Recordkeeping

#### Ledger

### Web Operations

#### Discord

##### Channels

- Conversation <span id="sec:org9eb4e75" label="sec:org9eb4e75"></span>

  - One <span id="sec:orgbfc2211" label="sec:orgbfc2211"></span>

  - Two <span id="sec:orgf9fe4c6" label="sec:orgf9fe4c6"></span>

  - Modchat <span id="sec:orgab5085e" label="sec:orgab5085e"></span>

- Linkdumps <span id="sec:orge974c6c" label="sec:orge974c6c"></span>

  - Solicitations <span id="sec:org4cd2744" label="sec:org4cd2744"></span>

  - News <span id="sec:org0244ab4" label="sec:org0244ab4"></span>

  - References <span id="sec:orgbaf2c73" label="sec:orgbaf2c73"></span>

##### Roles

- Everyone <span id="sec:org5da7b49" label="sec:org5da7b49"></span>

  <div class="center">

  | Channel           | R   | W   |
  |:------------------|:----|:----|
  | `getting-started` | X   |     |

  </div>

- Newbie <span id="sec:org7f29fd1" label="sec:org7f29fd1"></span>

  <div class="center">

  | Channel           | R   | W   |
  |:------------------|:----|:----|
  | `getting-started` | X   |     |
  | `one`             | X   | X   |
  | `solicitiations`  | X   |     |

  </div>

- Oldbie <span id="sec:org8012aaa" label="sec:org8012aaa"></span>

  <div class="center">

  | Channel           | R   | W   |
  |:------------------|:----|:----|
  | `getting-started` | X   |     |
  | `one`             | X   | X   |
  | `two`             | X   | X   |
  | `solicitations`   | X   |     |
  | `news`            | X   |     |
  | `references`      | X   |     |

  </div>

- Moderators <span id="sec:org2eaf4e9" label="sec:org2eaf4e9"></span>

  <div class="center">

  | Channel           | R   | W   |
  |:------------------|:----|:----|
  | `getting-started` | X   |     |
  | `one`             | X   | X   |
  | `two`             | X   | X   |
  | `modtalk`         | X   | X   |
  | `solicitations`   | X   |     |
  | `news`            | X   |     |
  | `references`      | X   |     |

  </div>

## Code

### Emacsen

#### Plans

##### Soon

- Update emsenn-net CSS

##### Later

- Segregate the Teraum stuff better:

  - Don’t include Teraum stuff in the master index.

  - Different CSS?

##### Someday

#### Code

##### Package Management

    (defvar straight-install-script-path
      "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el")

    (defvar bootstrap-version)
    (let ((bootstrap-file
           (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
          (bootstrap-version 5))
      (unless (file-exists-p bootstrap-file)
        (with-current-buffer
        (url-retrieve-synchronously straight-install-script-path
         'silent 'inhibit-cookies)
          (goto-char (point-max))
          (eval-print-last-sexp)))
      (load bootstrap-file nil 'nomessage))

    (straight-use-package 'use-package)

##### Interface

- General <span id="sec:org23c1e42" label="sec:org23c1e42"></span>

      (setq inhibit-startup-message t)
      (setq visible-bell 1)
      (setq inhibit-startup-screen t)
      (setq initial-scratch-message ";; LANDBACK\n")
      (menu-bar-mode -1)
      (tool-bar-mode -1)
      (show-paren-mode 1)
      (setq line-number-mode t)
      (setq column-number-mode t)
      (setq-default truncate-lines t)
      (setq-default line-spacing 1)
      (setq sentence-end-double-space nil)
      (global-visual-line-mode t)
      (setq echo-keystrokes 0.1)
      (setq fill-column 68)
      (setq mouse-wheel-scroll-amount '(1 ((shift) .1)))

- Theme <span id="sec:org14f5f09" label="sec:org14f5f09"></span>

      (use-package darktooth-theme
        :straight t
        :config
        (load-theme 'darktooth t))

##### User

    (setq user-mail-address "emsenn@emsenn.net")
    (setq user-full-name "emsenn")

##### LISP Stuff

- Fennel <span id="sec:orgf5a15eb" label="sec:orgf5a15eb"></span>

      (use-package fennel-mode
        :straight t
        :mode "\\.fnl\\'"
        :interpreter "fennel"
        :custom
        (inferior-lisp-program "/home/emsenn/.luarocks/bin/fennel"))

##### Org Stuff

- Org-Config <span id="sec:org2bd6023" label="sec:org2bd6023"></span>

      (setq org-directory "~/org")
      (setq org-startup-folded 'fold)
      (setq org-hide-block-startup 'hideblocks)
      (setq org-catch-invisible-edits 'show-and-error)
      (setq org-agenda-files (list "~/org"))
      (setq org-export-with-section-numbers nil)
      (setq org-export-with-smart-quotes nil)
      (setq org-export-with-toc nil)
      (setq org-html-htmlize-output-type 'nil)
      (setq org-html-validation-link nil)
      (setq org-log-done 'time)
      (setq org-log-into-drawer 'LOGBOOK)
      (setq org-image-actual-width '(400))
      (setq org-latex-default-packages-alist
            '(("AUTO" "inputenc" t
           ("pdflatex"))
          ("T1" "fontenc" t
           ("pdflatex"))
          ("" "graphicx" t nil)
          ("" "grffile" t nil)
          ("" "longtable" nil nil)
          ("" "wrapfig" nil nil)
          ("" "rotating" nil nil)
          ("normalem" "ulem" t nil)
          ("" "amsmath" t nil)
          ("" "textcomp" t nil)
          ("" "amssymb" t nil)
          ("" "capt-of" nil nil)
          ("" "titletoc" nil nil)
          ("" "hyperref" nil nil)))

- Org Keybindings <span id="sec:orgda5ecc8" label="sec:orgda5ecc8"></span>

      ("C-c l" . org-store-link)
      ("C-c a" . org-agenda)
      ("C-c c" . org-capture)
      ("C-c t" . org-toggle-link-display)
      ("C-c C-q" . counsel-org-tag)
      ("<f8>" . emacsen-org-capture-capture-at-point)

- Org Babel <span id="sec:org7901672" label="sec:org7901672"></span>

      (org-babel-do-load-languages 'org-babel-load-languages
                       '((shell . t)))

- Org Export HTML <span id="sec:org5182399" label="sec:org5182399"></span>

  - Org Export HTML Drawer <span id="sec:org4e410e4" label="sec:org4e410e4"></span>

        (defun emacsen-org-html-format-drawer (name contents)
          (format "<section class=\"org-drawer\"> %s </section>" contents))

  - Org Export HTML Sitemap <span id="sec:org7d62895" label="sec:org7d62895"></span>

        ;; from https://www.john2x.com/blog/blogging-with-orgmode.html
        (defun emacsen-org-publish-format-sitemap (title sitemap)
          (let ((posts (cdr sitemap)))
            (concat
             (format "#+title: %s\n" title)
             "#+author: emsenn\n"
             "#+email: emsenn@emsenn.net\n"
             "#+options: timestamp:nil date:nil\n"
             (format "#+date: %s\n" (format-time-string "[%Y-%m-%d %a %H:%M:%S]" (current-time)))
             "#+roam_tags: meta\n"
             (org-list-to-org (cons (car sitemap) posts)))))

  - Org Export HTML RSS <span id="sec:org328fddf" label="sec:org328fddf"></span>

        (defun emacsen-org-rss-publish-to-rss (plist filename pub-dir)
          "Publish RSS with PLIST, only when FILENAME is 'rss.org'. PUB-DIR is when the output will be placed."
          (if (equal "rss.org" (file-name-nondirectory filename))
              (org-rss-publish-to-rss plist filename pub-dir)))

        (defun emacsen-format-rss-feed (title list)
          "Generate RSS feed, as a string. TITLE is the title of the RSS feed.  LIST is an internal representation for the files to include, as returned by `org-list-to-lisp'.  PROJECT is the current project."
          (concat "#+TITLE: " title "$\n$"
              (org-list-to-subtree list 1 '(:icount "" :istart ""))))
        (defun emacsen-format-rss-feed-entry (entry style project)
          "Format ENTRY for the RSS feed. ENTRY is a file name.  STYLE is either 'list' or 'tree'. PROJECT is the current project."
          (cond ((not (directory-name-p entry))
             (let* ((file (org-publish--expand-file-name entry project))
                (title (org-publish-find-title entry project))
                (date (format-time-string "%Y-%m-%d" (org-publish-find-date entry project)))
                (link (concat (file-name-sans-extension entry) ".html")))
               (with-temp-buffer
                 (insert (format "* [[file:%s][%s]]\n" file title))
                 (org-set-property "RSS_PERMALINK" link)
                 (org-set-property "PUBDATE" date)
                 (insert-file-contents file)
                 (buffer-string))))
            ((eq style 'tree)
             ;; Return only last subdir.
             (file-name-nondirectory (directory-file-name entry)))
            (t entry)))    

    :bind (

- Org Projects <span id="sec:org7a6680d" label="sec:org7a6680d"></span>

  - emsenn’s Records <span id="sec:orgfa42355" label="sec:orgfa42355"></span>

        ("emsenn" :components ("emsenn-html" "emsenn-pdf"))
        ("emsenn-html"
           :base-extension "org"
           :publishing-function org-html-publish-to-html
           :html-doctype "html5"
           :html-html5-fancy t
           :html-container "section"
           :headline-levels 10
           :html-divs ((preamble "section" "preamble")
                   (content "main" "content")
                   (postamble "section" "postamble"))
           :with-footnotes t
           :makeindex t
           :base-directory "~/org/"
           :publishing-directory "~/org/pub/emsenn")
        ("emsenn-pdf"
           :base-extension "org"
           :publishing-function org-latex-publish-to-pdf
           :with-footnotes t
           :makeindex t
           :base-directory "~/org/"
           :publishing-directory "~/org/pub/emsenn")

- Website Stuff <span id="sec:orgdce6730" label="sec:orgdce6730"></span>

  - emsenn.net Stuff <span id="sec:org63cf638" label="sec:org63cf638"></span>

    - emsenn.net Org Project Definitions <span id="sec:orga12c58c" label="sec:orga12c58c"></span>

          ("emsenn-website" :components ("emsenn-website-all" "emsenn-website-bul" "emsenn-website-com" "emsenn-website-def" "emsenn-website-ref" "emsenn-website-ter" "emsenn-website-ter-adv" "emsenn-website-ter-ref" "emsenn-website-static"))

          ("emsenn-website-all"
             :base-extension "org"
             :publishing-function org-html-publish-to-html
             :html-doctype "html5"
             :html-html5-fancy t
             :html-container "section"
             :headline-levels 6
             :recursive t
             :html-divs ((preamble "section" "preamble")
                     (content "main" "content")
                     (postamble "section" "postamble"))
             :publishing-function org-html-publish-to-html
             :html-head-include-scripts nil
             :html-head-include-default-style nil
             :html-head ,emsenn-net-org-html-head
             :exclude ,(regexp-opt '("README.org" "PRIVATE"))
             :with-footnotes t
             :with-date nil
             :with-timestamps nil
             :with-author nil
             :makeindex t
             :base-directory "~/org/ems"
             :publishing-directory "~/org/pub/emsenn-net")
          ("emsenn-website-bul"
           :base-extension "org"
           :publishing-function org-html-publish-to-html
           :html-doctype "html5"
           :html-html5-fancy t
           :html-container "section"
           :headline-levels 6
           :recursive t
           :html-divs ((preamble "section" "preamble")
                   (content "main" "content")
                   (postamble "section" "postamble"))
           :publishing-function org-html-publish-to-html
           :html-format-drawer-function emacsen-org-html-format-drawer
           :sitemap-function emacsen-org-publish-format-sitemap
           :html-head-include-scripts nil
           :html-head-include-default-style nil
           :html-head ,emsenn-net-org-html-head
           :exclude ,(regexp-opt '("README.org" "PRIVATE"))
           :auto-sitemap t
           :with-footnotes t
           :with-toc nil
           :with-drawers t
           :with-date nil
           :with-timestamps nil
           :with-author nil
           :base-directory "~/org/ems/bul/"
           :publishing-directory "~/org/pub/emsenn-net/bul"
           :html-preamble ,emacsen-org-html-subdir-preamble
           :sitemap-filename "index.org"
           :sitemap-sort-files chronologically
           :sitemap-title "Bulletins")
            ("emsenn-website-com"
             :base-extension "org"
             :publishing-function org-html-publish-to-html
             :html-doctype "html5"
            :html-html5-fancy t
          :html-container "section"
          :headline-levels 6
          :recursive t
          :html-divs ((preamble "section" "preamble")
                  (content "main" "content")
                  (postamble "section" "postamble"))
          :publishing-function org-html-publish-to-html
          :html-format-drawer-function emacsen-org-html-format-drawer
          :sitemap-function emacsen-org-publish-format-sitemap
          :html-head-include-scripts nil
          :html-head-include-default-style nil
          :html-head ,emsenn-net-org-html-head
          :exclude ,(regexp-opt '("README.org" "PRIVATE"))
          :auto-sitemap t
          :with-footnotes t
          :with-toc nil
          :with-drawers t
          :with-date nil
          :with-timestamps nil
          :with-author nil
          :base-directory "~/org/ems/com/"
          :publishing-directory "~/org/pub/emsenn-net/com"
          :html-preamble ,emacsen-org-html-subdir-preamble
          :sitemap-filename "index.org"
          :sitemap-sort-files chronologically
          :sitemap-title "Communications")

           ("emsenn-website-def"
          :base-extension "org"
          :publishing-function org-html-publish-to-html
          :html-doctype "html5"
          :html-html5-fancy t
          :html-container "section"
          :headline-levels 6
          :recursive t
          :html-divs ((preamble "section" "preamble")
                  (content "main" "content")
                  (postamble "section" "postamble"))
          :publishing-function org-html-publish-to-html
          :html-format-drawer-function emacsen-org-html-format-drawer
          :sitemap-function emacsen-org-publish-format-sitemap
          :html-head-include-scripts nil
          :html-head-include-default-style nil
          :html-head ,emsenn-net-org-html-head
          :exclude ,(regexp-opt '("README.org" "PRIVATE"))
          :auto-sitemap t
          :with-footnotes t
          :with-toc nil
          :with-drawers t
          :with-date nil
          :with-timestamps nil
          :with-author nil
          :base-directory "~/org/ems/def/"
          :publishing-directory "~/org/pub/emsenn-net/def"
          :html-preamble ,emacsen-org-html-subdir-preamble
          :sitemap-filename "index.org"
          :sitemap-sort-files alphabetically
          :sitemap-title "Definitions")

           ("emsenn-website-ref"
          :base-extension "org"
          :publishing-function org-html-publish-to-html
          :html-doctype "html5"
          :html-html5-fancy t
          :html-container "section"
          :headline-levels 6
          :recursive t
          :html-divs ((preamble "section" "preamble")
                  (content "main" "content")
                  (postamble "section" "postamble"))
          :publishing-function org-html-publish-to-html
          :html-format-drawer-function emacsen-org-html-format-drawer
          :sitemap-function emacsen-org-publish-format-sitemap
          :html-head-include-scripts nil
          :html-head-include-default-style nil
          :html-head ,emsenn-net-org-html-head
          :exclude ,(regexp-opt '("README.org" "PRIVATE"))
          :auto-sitemap t
          :with-footnotes t
          :with-toc nil
          :with-drawers t
          :with-date nil
          :with-timestamps nil
          :with-author nil
          :base-directory "~/org/ems/ref/"
          :publishing-directory "~/org/pub/emsenn-net/ref"
          :html-preamble ,emacsen-org-html-subdir-preamble
          :sitemap-filename "index.org"
          :sitemap-sort-files alphabetically
          :sitemap-title "References")
           ("emsenn-website-ter"
          :base-extension "org"
          :publishing-function org-html-publish-to-html
          :html-doctype "html5"
          :html-html5-fancy t
          :html-container "section"
          :headline-levels 6
          :recursive t
          :html-divs ((preamble "section" "preamble")
                  (content "main" "content")
                  (postamble "section" "postamble"))
          :publishing-function org-html-publish-to-html
          :html-format-drawer-function emacsen-org-html-format-drawer
          :sitemap-function emacsen-org-publish-format-sitemap
          :html-head-include-scripts nil
          :html-head-include-default-style nil
          :html-head ,emsenn-net-org-html-head
          :exclude ,(regexp-opt '("README.org" "PRIVATE"))
          :with-footnotes t
          :with-toc nil
          :with-drawers t
          :with-date nil
          :with-timestamps nil
          :with-author nil
          :makeindex t
          :base-directory "~/org/ems/ter/"
          :publishing-directory "~/org/pub/emsenn-net/ter"
          :html-preamble ,emacsen-org-html-subdir-preamble)
           ("emsenn-website-ter-adv"
          :base-extension "org"
          :publishing-function org-html-publish-to-html
          :html-doctype "html5"
          :html-html5-fancy t
          :html-container "section"
          :headline-levels 6
          :recursive t
          :html-divs ((preamble "section" "preamble")
                  (content "main" "content")
                  (postamble "section" "postamble"))
          :publishing-function org-html-publish-to-html
          :html-format-drawer-function emacsen-org-html-format-drawer
          :sitemap-function emacsen-org-publish-format-sitemap
          :html-head-include-scripts nil
          :html-head-include-default-style nil
          :html-head ,emsenn-net-org-html-head
          :exclude ,(regexp-opt '("README.org" "PRIVATE"))
          :auto-sitemap t
          :with-footnotes t
          :with-toc nil
          :with-drawers t
          :with-date nil
          :with-timestamps nil
          :with-author nil
          :base-directory "~/org/ems/ter/adv"
          :publishing-directory "~/org/pub/emsenn-net/ter/adv"
          :html-preamble ,emacsen-org-html-subsubdir-preamble
          :sitemap-filename "index.org"
          :sitemap-sort-files alphabetically
          :sitemap-title "References")
           ("emsenn-website-ter-ref"
          :base-extension "org"
          :publishing-function org-html-publish-to-html
          :html-doctype "html5"
          :html-html5-fancy t
          :html-container "section"
          :headline-levels 6
          :recursive t
          :html-divs ((preamble "section" "preamble")
                  (content "main" "content")
                  (postamble "section" "postamble"))
          :publishing-function org-html-publish-to-html
          :html-format-drawer-function emacsen-org-html-format-drawer
          :sitemap-function emacsen-org-publish-format-sitemap
          :html-head-include-scripts nil
          :html-head-include-default-style nil
          :html-head ,emsenn-net-org-html-head
          :exclude ,(regexp-opt '("README.org" "PRIVATE"))
          :auto-sitemap t
          :with-footnotes t
          :with-toc nil
          :with-drawers t
          :with-date nil
          :with-timestamps nil
          :with-author nil
          :base-directory "~/org/ems/ter/ref"
          :publishing-directory "~/org/pub/emsenn-net/ter/ref"
          :html-preamble ,emacsen-org-html-subsubdir-preamble
          :sitemap-filename "index.org"
          :sitemap-sort-files alphabetically
          :sitemap-title "References")
           ("emsenn-website-static"
          :base-directory "~/org/ems"
          :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
          :publishing-directory "~/org/pub/emsenn-net"
          :recursive t
          :publishing-function org-publish-attachment)

      - emsenn-net <span id="sec:orgfe74fe9" label="sec:orgfe74fe9"></span>

            ("emsenn-website" :components ("emsenn-website-all" "emsenn-website-bul" "emsenn-website-com" "emsenn-website-def" "emsenn-website-ref" "emsenn-website-ter" "emsenn-website-ter-adv" "emsenn-website-ter-ref" "emsenn-website-static"))

      - emsenn-net-all <span id="sec:org0587d48" label="sec:org0587d48"></span>

            ("emsenn-website-all"
               :base-extension "org"
               :publishing-function org-html-publish-to-html
               :html-doctype "html5"
               :html-html5-fancy t
               :html-container "section"
               :headline-levels 6
               :recursive t
               :html-divs ((preamble "section" "preamble")
                       (content "main" "content")
                       (postamble "section" "postamble"))
               :publishing-function org-html-publish-to-html
               :html-head-include-scripts nil
               :html-head-include-default-style nil
               :html-head ,emsenn-net-org-html-head
               :exclude ,(regexp-opt '("README.org" "PRIVATE"))
               :with-footnotes t
               :with-date nil
               :with-timestamps nil
               :with-author nil
               :makeindex t
               :base-directory "~/org/ems"
               :publishing-directory "~/org/pub/emsenn-net")

      - emsenn-net-bul <span id="sec:orgfc8ea74" label="sec:orgfc8ea74"></span>

            ("emsenn-website-bul"
             :base-extension "org"
             :publishing-function org-html-publish-to-html
             :html-doctype "html5"
             :html-html5-fancy t
             :html-container "section"
             :headline-levels 6
             :recursive t
             :html-divs ((preamble "section" "preamble")
                     (content "main" "content")
                     (postamble "section" "postamble"))
             :publishing-function org-html-publish-to-html
             :html-format-drawer-function emacsen-org-html-format-drawer
             :sitemap-function emacsen-org-publish-format-sitemap
             :html-head-include-scripts nil
             :html-head-include-default-style nil
             :html-head ,emsenn-net-org-html-head
             :exclude ,(regexp-opt '("README.org" "PRIVATE"))
             :auto-sitemap t
             :with-footnotes t
             :with-toc nil
             :with-drawers t
             :with-date nil
             :with-timestamps nil
             :with-author nil
             :base-directory "~/org/ems/bul/"
             :publishing-directory "~/org/pub/emsenn-net/bul"
             :html-preamble ,emacsen-org-html-subdir-preamble
             :sitemap-filename "index.org"
             :sitemap-sort-files chronologically
             :sitemap-title "Bulletins")

      - emsenn-net-com <span id="sec:org14a38a4" label="sec:org14a38a4"></span>

              ("emsenn-website-com"
               :base-extension "org"
               :publishing-function org-html-publish-to-html
               :html-doctype "html5"
              :html-html5-fancy t
            :html-container "section"
            :headline-levels 6
            :recursive t
            :html-divs ((preamble "section" "preamble")
                    (content "main" "content")
                    (postamble "section" "postamble"))
            :publishing-function org-html-publish-to-html
            :html-format-drawer-function emacsen-org-html-format-drawer
            :sitemap-function emacsen-org-publish-format-sitemap
            :html-head-include-scripts nil
            :html-head-include-default-style nil
            :html-head ,emsenn-net-org-html-head
            :exclude ,(regexp-opt '("README.org" "PRIVATE"))
            :auto-sitemap t
            :with-footnotes t
            :with-toc nil
            :with-drawers t
            :with-date nil
            :with-timestamps nil
            :with-author nil
            :base-directory "~/org/ems/com/"
            :publishing-directory "~/org/pub/emsenn-net/com"
            :html-preamble ,emacsen-org-html-subdir-preamble
            :sitemap-filename "index.org"
            :sitemap-sort-files chronologically
            :sitemap-title "Communications")

      - emsenn-net-def <span id="sec:orga186cad" label="sec:orga186cad"></span>

             ("emsenn-website-def"
            :base-extension "org"
            :publishing-function org-html-publish-to-html
            :html-doctype "html5"
            :html-html5-fancy t
            :html-container "section"
            :headline-levels 6
            :recursive t
            :html-divs ((preamble "section" "preamble")
                    (content "main" "content")
                    (postamble "section" "postamble"))
            :publishing-function org-html-publish-to-html
            :html-format-drawer-function emacsen-org-html-format-drawer
            :sitemap-function emacsen-org-publish-format-sitemap
            :html-head-include-scripts nil
            :html-head-include-default-style nil
            :html-head ,emsenn-net-org-html-head
            :exclude ,(regexp-opt '("README.org" "PRIVATE"))
            :auto-sitemap t
            :with-footnotes t
            :with-toc nil
            :with-drawers t
            :with-date nil
            :with-timestamps nil
            :with-author nil
            :base-directory "~/org/ems/def/"
            :publishing-directory "~/org/pub/emsenn-net/def"
            :html-preamble ,emacsen-org-html-subdir-preamble
            :sitemap-filename "index.org"
            :sitemap-sort-files alphabetically
            :sitemap-title "Definitions")

      - emsenn-net-ref <span id="sec:orgd40ac64" label="sec:orgd40ac64"></span>

             ("emsenn-website-ref"
            :base-extension "org"
            :publishing-function org-html-publish-to-html
            :html-doctype "html5"
            :html-html5-fancy t
            :html-container "section"
            :headline-levels 6
            :recursive t
            :html-divs ((preamble "section" "preamble")
                    (content "main" "content")
                    (postamble "section" "postamble"))
            :publishing-function org-html-publish-to-html
            :html-format-drawer-function emacsen-org-html-format-drawer
            :sitemap-function emacsen-org-publish-format-sitemap
            :html-head-include-scripts nil
            :html-head-include-default-style nil
            :html-head ,emsenn-net-org-html-head
            :exclude ,(regexp-opt '("README.org" "PRIVATE"))
            :auto-sitemap t
            :with-footnotes t
            :with-toc nil
            :with-drawers t
            :with-date nil
            :with-timestamps nil
            :with-author nil
            :base-directory "~/org/ems/ref/"
            :publishing-directory "~/org/pub/emsenn-net/ref"
            :html-preamble ,emacsen-org-html-subdir-preamble
            :sitemap-filename "index.org"
            :sitemap-sort-files alphabetically
            :sitemap-title "References")

      - emsenn-net-ter <span id="sec:org98cef65" label="sec:org98cef65"></span>

             ("emsenn-website-ter"
            :base-extension "org"
            :publishing-function org-html-publish-to-html
            :html-doctype "html5"
            :html-html5-fancy t
            :html-container "section"
            :headline-levels 6
            :recursive t
            :html-divs ((preamble "section" "preamble")
                    (content "main" "content")
                    (postamble "section" "postamble"))
            :publishing-function org-html-publish-to-html
            :html-format-drawer-function emacsen-org-html-format-drawer
            :sitemap-function emacsen-org-publish-format-sitemap
            :html-head-include-scripts nil
            :html-head-include-default-style nil
            :html-head ,emsenn-net-org-html-head
            :exclude ,(regexp-opt '("README.org" "PRIVATE"))
            :with-footnotes t
            :with-toc nil
            :with-drawers t
            :with-date nil
            :with-timestamps nil
            :with-author nil
            :makeindex t
            :base-directory "~/org/ems/ter/"
            :publishing-directory "~/org/pub/emsenn-net/ter"
            :html-preamble ,emacsen-org-html-subdir-preamble)

      - emsenn-net-ter-adv <span id="sec:org9c16a59" label="sec:org9c16a59"></span>

             ("emsenn-website-ter-adv"
            :base-extension "org"
            :publishing-function org-html-publish-to-html
            :html-doctype "html5"
            :html-html5-fancy t
            :html-container "section"
            :headline-levels 6
            :recursive t
            :html-divs ((preamble "section" "preamble")
                    (content "main" "content")
                    (postamble "section" "postamble"))
            :publishing-function org-html-publish-to-html
            :html-format-drawer-function emacsen-org-html-format-drawer
            :sitemap-function emacsen-org-publish-format-sitemap
            :html-head-include-scripts nil
            :html-head-include-default-style nil
            :html-head ,emsenn-net-org-html-head
            :exclude ,(regexp-opt '("README.org" "PRIVATE"))
            :auto-sitemap t
            :with-footnotes t
            :with-toc nil
            :with-drawers t
            :with-date nil
            :with-timestamps nil
            :with-author nil
            :base-directory "~/org/ems/ter/adv"
            :publishing-directory "~/org/pub/emsenn-net/ter/adv"
            :html-preamble ,emacsen-org-html-subsubdir-preamble
            :sitemap-filename "index.org"
            :sitemap-sort-files alphabetically
            :sitemap-title "References")

      - emsenn-net-ter-ref <span id="sec:org4e7fcf6" label="sec:org4e7fcf6"></span>

             ("emsenn-website-ter-ref"
            :base-extension "org"
            :publishing-function org-html-publish-to-html
            :html-doctype "html5"
            :html-html5-fancy t
            :html-container "section"
            :headline-levels 6
            :recursive t
            :html-divs ((preamble "section" "preamble")
                    (content "main" "content")
                    (postamble "section" "postamble"))
            :publishing-function org-html-publish-to-html
            :html-format-drawer-function emacsen-org-html-format-drawer
            :sitemap-function emacsen-org-publish-format-sitemap
            :html-head-include-scripts nil
            :html-head-include-default-style nil
            :html-head ,emsenn-net-org-html-head
            :exclude ,(regexp-opt '("README.org" "PRIVATE"))
            :auto-sitemap t
            :with-footnotes t
            :with-toc nil
            :with-drawers t
            :with-date nil
            :with-timestamps nil
            :with-author nil
            :base-directory "~/org/ems/ter/ref"
            :publishing-directory "~/org/pub/emsenn-net/ter/ref"
            :html-preamble ,emacsen-org-html-subsubdir-preamble
            :sitemap-filename "index.org"
            :sitemap-sort-files alphabetically
            :sitemap-title "References")

      - emsenn-net-static <span id="sec:orge07b5be" label="sec:orge07b5be"></span>

             ("emsenn-website-static"
            :base-directory "~/org/ems"
            :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
            :publishing-directory "~/org/pub/emsenn-net"
            :recursive t
            :publishing-function org-publish-attachment)

    - emsenn.net Copy <span id="sec:org95a80ea" label="sec:org95a80ea"></span>

      - emsenn.net Preamble Copy <span id="sec:orgda3c628" label="sec:orgda3c628"></span>

            "<p>This Website was cultivated as a public asset with <a href=\"https://ko-fi.com/emsenn\">support</a> from people like you. <strong><em>Thank you!</em></strong></p>
            <details>
              <summary>Click this sentence for information about my Website.</summary>
              <p>Click each sentence below for more info:</p>
                <ul>
                  <li><details>
                <summary>This website was created by Emacs and Org-mode</summary>
                <p>See <a href=\"https://emsenn.net/per/emacsen.html\">my Emacs configuration</a> to learn how.</p>
                  </details></li>
                  <li><details>
                <summary>It uses style to add information to the pages.</summary>
                <ul>
                  <li><details>
                  <summary>Click this sentence to see how links are styled:</summary>
                  <table>
                    <thead><tr>
                      <th scope=\"col\">Color</th>
                      <th scope=\"col\">Link type</th>
                    </tr></thead>
                    <tbody>
                      <tr><td class=\"link\">Sample</td>
                    <td>Unvisited local resource</td></tr>
                      <tr><td class=\"visited-link\">Sample</td>
                    <td>Visited local resource</td></tr>
                      <tr><td class=\"external-link\">Sample</td>
                    <td>Unvisited external resource</td></tr>
                      <tr><td class=\"visited-external-link\">Sample</td>
                    <td>Visited external resource</td></tr>
                    </tbody>
                  </table>
                </details></li>
                  </ul>
                </details></li>
              </ul>
            </details>
            "

    - emsenn.net HTML <span id="sec:org556b4f5" label="sec:org556b4f5"></span>

      - emsenn.net Subdir Preamble <span id="sec:org9346c4e" label="sec:org9346c4e"></span>

            (setq emacsen-org-html-subdir-preamble
                  (concat "<a href=\"#content\" class=\"skip-to-content\">skip to content</a>"
                      "<section class=\"nav\"><strong>emsenn.net:</strong> "
                      "<a href=\"../index.html\">"
                      "Homepage</a> | "
                      "<a href=\"../bul/index.html\">"
                      "Bulletins</a> | "
                      "<a href=\"../mainindex.html\">"
                      "Main Index</a>"
                      "<p>This Website was cultivated as a public asset with <a href=\"https://ko-fi.com/emsenn\">support</a> from people like you. <strong><em>Thank you!</em></strong></p>
                      <details>
                    <summary>Click this sentence for information about my Website.</summary>
                    <p>Click each sentence below for more info:</p>
                      <ul>
                        <li><details>
                    <summary>This website was created by Emacs and Org-mode</summary>
                    <p>See <a href=\"https://emsenn.net/per/emacsen.html\">my Emacs configuration</a> to learn how.</p>
                        </details></li>
                        <li><details>
                    <summary>It uses style to add information to the pages.</summary>
                    <ul>
                      <li><details>
                      <summary>Click this sentence to see how links are styled:</summary>
                      <table>
                        <thead><tr>
                          <th scope=\"col\">Color</th>
                          <th scope=\"col\">Link type</th>
                        </tr></thead>
                        <tbody>
                          <tr><td class=\"link\">Sample</td>
                        <td>Unvisited local resource</td></tr>
                          <tr><td class=\"visited-link\">Sample</td>
                        <td>Visited local resource</td></tr>
                          <tr><td class=\"external-link\">Sample</td>
                        <td>Unvisited external resource</td></tr>
                          <tr><td class=\"visited-external-link\">Sample</td>
                        <td>Visited external resource</td></tr>
                        </tbody>
                      </table>
                    </details></li>
                        </ul>
                      </details></li>
                    </ul>
                      </details>
                      "
                      "</section>"
                      ))

      - emsenn.net Subsubdir Preamble <span id="sec:org4a8aa93" label="sec:org4a8aa93"></span>

            (setq emacsen-org-html-subsubdir-preamble
                  (concat "<a href=\"#content\" class=\"skip-to-content\">skip to content</a>"
                      "<section class=\"nav\"><strong>emsenn.net:</strong> "
                      "<a href=\"../../index.html\">"
                      "Homepage</a> | "
                      "<a href=\"../../bul/index.html\">"
                      "Bulletins</a> | "
                      "<a href=\"../../mainindex.html\">"
                      "Main Index</a>"
                      "<p>This Website was cultivated as a public asset with <a href=\"https://ko-fi.com/emsenn\">support</a> from people like you. <strong><em>Thank you!</em></strong></p>
                      <details>
                    <summary>Click this sentence for information about my Website.</summary>
                    <p>Click each sentence below for more info:</p>
                      <ul>
                        <li><details>
                    <summary>This website was created by Emacs and Org-mode</summary>
                    <p>See <a href=\"https://emsenn.net/per/emacsen.html\">my Emacs configuration</a> to learn how.</p>
                        </details></li>
                        <li><details>
                    <summary>It uses style to add information to the pages.</summary>
                    <ul>
                      <li><details>
                      <summary>Click this sentence to see how links are styled:</summary>
                      <table>
                        <thead><tr>
                          <th scope=\"col\">Color</th>
                          <th scope=\"col\">Link type</th>
                        </tr></thead>
                        <tbody>
                          <tr><td class=\"link\">Sample</td>
                        <td>Unvisited local resource</td></tr>
                          <tr><td class=\"visited-link\">Sample</td>
                        <td>Visited local resource</td></tr>
                          <tr><td class=\"external-link\">Sample</td>
                        <td>Unvisited external resource</td></tr>
                          <tr><td class=\"visited-external-link\">Sample</td>
                        <td>Visited external resource</td></tr>
                        </tbody>
                      </table>
                    </details></li>
                        </ul>
                      </details></li>
                    </ul>
                      </details>
                      "
                      "</section>"
                      ))

    - emsenn.net CSS <span id="sec:orgfef83e9" label="sec:orgfef83e9"></span>

              (setq emsenn-net-org-html-head
                (concat "<style>
               @charset \"UTF-8\";

               :root {    
               --body-font: sans-serif;
                   --header-font: sans-serif;
                   --code-font: monospace;
                   --primary-color: #ffe;
                   --primary-dim-color: #eed;
                   --secondary-color: #312;
                   --secondary-dim-color: #756;
                   --link-color: #880;
                   --link-hover-color: #aa2;
                   --link-visited-color: #934;
                   --link-visited-hover-color: #b56;
                   --external-link-color: #008;
                   --external-link-hover-color: #60b;
                   --external-link-visited-color: #172;
                   --external-link-visited-hover-color: #394;
               }
               @media(prefers-color-scheme:dark){
                   :root {
                  --body-font: sans-serif;
                  --header-font: sans-serif;
                  --code-font: monospace;
                  --primary-color: #756;
                  --primary-dim-color: #312;
                  --secondary-color: #eed;
                  --secondary-dim-color: #ffe;
                  --link-color: #880;
                  --link-hover-color: #aa2;
                  --link-visited-color: #934;
                  --link-visited-hover-color: #b56;
                   }}
               body {
                   position: relative;
                   min-height: 100%;
                   background-color: var(--primary-color);
                   color: var(--secondary-color);
                   margin: 0 auto;
                   font-family: sans-serif;
               }
               main, #content {
                   background-color: var(--primary-dim-color);
                   border-left: 1.5em dotted var(--primary-color);
                   padding: 1em;
               }
               header {
                   border-bottom: 0.8em dotted var(--secondary-dim-color);
               }
               h1 { font-size: 2em; margin-bottom: 0; }
               h2 {
                   border-bottom: 0.3em dotted var(--secondary-dim-color);
               }
               h2, h3, h4, h5, h6, p, table, ul, ol, .org-src-container {
                   width: 60%;
               }
               aside {
                   float: right;
                   width: 35%;
               }
               aside p { width: 100%; }
               @media screen and (max-width:760px) {
                   h2, h3, h4, h5, h6, p, table, ul, ol, .org-src-container {
                  width: 90%;
                   }
                   aside {
                  float: inherit;
                  width: 90%;
                  border-top: 0.2em dotted var(--secondary-dim-color);
                  border-bottom: 0.2em dotted VAR(--secondary-dim-color);
                  font-size: 0.8em;
                    }
               }

               footer, #postamble, #preamble {
                   padding: 0.5em;
               }
               table {
                   border-collapse: collapse;
                   border-spacing: 0;
                   empty-cells: show;
                   border: 0.1em solid #444;
               }
               thead { font-family: sans-serif; }
               th, td {
                   padding: 0 0.3em;
                   border: 0.01em solid #444;
               }
               img {
                   max-width: 80vw;
                   vertical-align: middle;
               }
               pre, .src {
                   padding: 0.5em;
                   border: 0.1em solid #444;
                   white-space: pre-wrap;
                   overflow-x: scroll;
                   text-overflow: clip;
                   scrollbar-width: none;
               }
               pre::-webkit-scrollbar, .src::-webkit-scrollbar {
                   display: none;
               }


               dt {
                   font-weight: normal;
                   display: inline-block;
                   border-bottom: 0.1rem dotted #444;
               }
               #text-index dt { border-bottom: none; }
               h2, h3, h4, h5, h6, h7, h8, h9, h10 {
                   display: block;
                   font-family: sans-serif;
                   margin: 0.2em auto 0.5em 0;
               }
               a, .link {
                   text-decoration: none;
                   color: #880;
                   display: inline;
                   position: relative;
                   border-bottom: 0.1rem dotted;
                   line-height: 1.2;
                   transition: border 0.3s;
               }
               a:hover {
                   color: #aa2;
                   outline-style: none;
                   border-bottom: 0.1rem solid;
               }
               a:visited, .visited-link { color: #934; }
               a:visited:hover { color: #b56; }
               a:focus {
                   outline-style: none;
                   border-bottom: 0.1rem solid;
               }
               ::selection { background-color: #777; color: #eee; }
               a::selection { background-color: #ccc; }
               .org-todo {
                   background-color: #ddd;
                   color: #333;
                   font-size: .8rem;
                   float: right;
               }
               .org-src-container + .example {
                   margin-left: 8em;
               }
               a[href^=\"https://\"]:not([href*=\"emsenn.net\"]):after, a[href^=\"https://\"]:not([href*=\"emsenn.net\"]):visited:after, .external-link:after, .visited-external-link:after { 
                   content: \"^\";
                   font-size: 0.5em;
                   vertical-align: super;
               }
               a[href^=\"https://\"]:not([href*=\"emsenn.net\"]), .external-link {
                   color: var(--external-link-color);
               }
               a[href^=\"https://\"]:not([href*=\"emsenn.net\"]):hover{ 
                   color: var(--external-link-hover-color);
               }
               a[href^=\"https://\"]:not([href*=\"emsenn.net\"]):visited, .visited-external-link { 
                   color: var(--external-link-visited-color);
               }
               a[href^=\"https://\"]:not([href*=\"emsenn.net\"]):visited:hover{ 
                   color: var(--external-link-visited-hover-color);
               }
               blockquote {
                   border: 0.1em dashed var(--secondary-dim-color);
                   padding-left: 0.2em;
               }
               label.org-src-name {
                   margin: 0 0 0 3em;
                   font-family: sans-serif;
                   font-size: 1rem;
                   line-height: 0;
               }
               .skip-to-content {
                   opacity: 0;
                   position: absolute;
                   left: 0.2em;
               }
               .skip-to-content:focus{
                   opacity: 1;
                   background-color: var(--secondary-dim-color);
                   color: var(--primary-color);
               }
               ul { max-width: 85%; }
            .footpara { display: inline; font-size: 0.8rem; }
          </style>"))

##### Other Stuff

- Beancount mode <span id="sec:orga29d8b6" label="sec:orga29d8b6"></span>

      (straight-use-package '(beancount :type git :host github :repo "beancount/beancount-mode"))

- Org-WC <span id="sec:orgbe0a7f8" label="sec:orgbe0a7f8"></span>

      (straight-use-package '(org-wc :type git :host github :repo "tesujimath/org-wc"))

- TLS Bugfix <span id="sec:orgb0f3d1c" label="sec:orgb0f3d1c"></span>

      (if (and (version< emacs-version "26.3") (>= libgnutls-version 30600))
          (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

- Save Behavior <span id="sec:org8bb1a7c" label="sec:org8bb1a7c"></span>

      (setq make-backup-files nil)

- Executables Path <span id="sec:org2b1ab73" label="sec:org2b1ab73"></span>

      (add-to-list 'exec-path "~/bin")

- HTMLize <span id="sec:org9c8ebab" label="sec:org9c8ebab"></span>

      (use-package htmlize :straight t)

#### Full Source

    (if (and (version< emacs-version "26.3") (>= libgnutls-version 30600))
        (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))
    (defvar straight-install-script-path
      "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el")

    (defvar bootstrap-version)
    (let ((bootstrap-file
           (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
          (bootstrap-version 5))
      (unless (file-exists-p bootstrap-file)
        (with-current-buffer
        (url-retrieve-synchronously straight-install-script-path
         'silent 'inhibit-cookies)
          (goto-char (point-max))
          (eval-print-last-sexp)))
      (load bootstrap-file nil 'nomessage))

    (straight-use-package 'use-package)
    (setq inhibit-startup-message t)
    (setq visible-bell 1)
    (setq inhibit-startup-screen t)
    (setq initial-scratch-message ";; LANDBACK\n")
    (menu-bar-mode -1)
    (tool-bar-mode -1)
    (show-paren-mode 1)
    (setq line-number-mode t)
    (setq column-number-mode t)
    (setq-default truncate-lines t)
    (setq-default line-spacing 1)
    (setq sentence-end-double-space nil)
    (global-visual-line-mode t)
    (setq echo-keystrokes 0.1)
    (setq fill-column 68)
    (setq mouse-wheel-scroll-amount '(1 ((shift) .1)))
    (use-package darktooth-theme
      :straight t
      :config
      (load-theme 'darktooth t))
    (setq user-mail-address "emsenn@emsenn.net")
    (setq user-full-name "emsenn")

    (use-package fennel-mode
      :straight t
      :mode "\\.fnl\\'"
      :interpreter "fennel"
      :custom
      (inferior-lisp-program "/home/emsenn/.luarocks/bin/fennel"))


    (straight-use-package '(beancount :type git :host github :repo "beancount/beancount-mode"))

    (use-package
      org :straight t
      :config
      (setq org-directory "~/org")
      (setq org-startup-folded 'fold)
      (setq org-hide-block-startup 'hideblocks)
      (setq org-catch-invisible-edits 'show-and-error)
      (setq org-agenda-files (list "~/org"))
      (setq org-export-with-section-numbers nil)
      (setq org-export-with-smart-quotes nil)
      (setq org-export-with-toc nil)
      (setq org-html-htmlize-output-type 'nil)
      (setq org-html-validation-link nil)
      (setq org-log-done 'time)
      (setq org-log-into-drawer 'LOGBOOK)
      (setq org-image-actual-width '(400))
      (setq org-latex-default-packages-alist
        '(("AUTO" "inputenc" t
         ("pdflatex"))
        ("T1" "fontenc" t
         ("pdflatex"))
        ("" "graphicx" t nil)
        ("" "grffile" t nil)
        ("" "longtable" nil nil)
        ("" "wrapfig" nil nil)
        ("" "rotating" nil nil)
        ("normalem" "ulem" t nil)
        ("" "amsmath" t nil)
        ("" "textcomp" t nil)
        ("" "amssymb" t nil)
        ("" "capt-of" nil nil)
        ("" "titletoc" nil nil)
        ("" "hyperref" nil nil)))
      (org-babel-do-load-languages 'org-babel-load-languages
                     '((shell . t)))
      (defun emacsen-org-html-format-drawer (name contents)
        (format "<section class=\"org-drawer\"> %s </section>" contents))
      ;; from https://www.john2x.com/blog/blogging-with-orgmode.html
      (defun emacsen-org-publish-format-sitemap (title sitemap)
        (let ((posts (cdr sitemap)))
          (concat
           (format "#+title: %s\n" title)
           "#+author: emsenn\n"
           "#+email: emsenn@emsenn.net\n"
           "#+options: timestamp:nil date:nil\n"
           (format "#+date: %s\n" (format-time-string "[%Y-%m-%d %a %H:%M:%S]" (current-time)))
           "#+roam_tags: meta\n"
           (org-list-to-org (cons (car sitemap) posts)))))
      (setq emacsen-org-html-subdir-preamble
        (concat "<a href=\"#content\" class=\"skip-to-content\">skip to content</a>"
              "<section class=\"nav\"><strong>emsenn.net:</strong> "
              "<a href=\"../index.html\">"
              "Homepage</a> | "
              "<a href=\"../bul/index.html\">"
              "Bulletins</a> | "
              "<a href=\"../mainindex.html\">"
              "Main Index</a>"
              "<p>This Website was cultivated as a public asset with <a href=\"https://ko-fi.com/emsenn\">support</a> from people like you. <strong><em>Thank you!</em></strong></p>
              <details>
            <summary>Click this sentence for information about my Website.</summary>
            <p>Click each sentence below for more info:</p>
              <ul>
                <li><details>
            <summary>This website was created by Emacs and Org-mode</summary>
            <p>See <a href=\"https://emsenn.net/per/emacsen.html\">my Emacs configuration</a> to learn how.</p>
                </details></li>
                <li><details>
            <summary>It uses style to add information to the pages.</summary>
            <ul>
              <li><details>
              <summary>Click this sentence to see how links are styled:</summary>
              <table>
                <thead><tr>
                  <th scope=\"col\">Color</th>
                  <th scope=\"col\">Link type</th>
                </tr></thead>
                <tbody>
                  <tr><td class=\"link\">Sample</td>
                <td>Unvisited local resource</td></tr>
                  <tr><td class=\"visited-link\">Sample</td>
                <td>Visited local resource</td></tr>
                  <tr><td class=\"external-link\">Sample</td>
                <td>Unvisited external resource</td></tr>
                  <tr><td class=\"visited-external-link\">Sample</td>
                <td>Visited external resource</td></tr>
                </tbody>
              </table>
            </details></li>
                </ul>
              </details></li>
            </ul>
              </details>
              "
              "</section>"
              ))
      (setq emacsen-org-html-subsubdir-preamble
        (concat "<a href=\"#content\" class=\"skip-to-content\">skip to content</a>"
              "<section class=\"nav\"><strong>emsenn.net:</strong> "
              "<a href=\"../../index.html\">"
              "Homepage</a> | "
              "<a href=\"../../bul/index.html\">"
              "Bulletins</a> | "
              "<a href=\"../../mainindex.html\">"
              "Main Index</a>"
              "<p>This Website was cultivated as a public asset with <a href=\"https://ko-fi.com/emsenn\">support</a> from people like you. <strong><em>Thank you!</em></strong></p>
              <details>
            <summary>Click this sentence for information about my Website.</summary>
            <p>Click each sentence below for more info:</p>
              <ul>
                <li><details>
            <summary>This website was created by Emacs and Org-mode</summary>
            <p>See <a href=\"https://emsenn.net/per/emacsen.html\">my Emacs configuration</a> to learn how.</p>
                </details></li>
                <li><details>
            <summary>It uses style to add information to the pages.</summary>
            <ul>
              <li><details>
              <summary>Click this sentence to see how links are styled:</summary>
              <table>
                <thead><tr>
                  <th scope=\"col\">Color</th>
                  <th scope=\"col\">Link type</th>
                </tr></thead>
                <tbody>
                  <tr><td class=\"link\">Sample</td>
                <td>Unvisited local resource</td></tr>
                  <tr><td class=\"visited-link\">Sample</td>
                <td>Visited local resource</td></tr>
                  <tr><td class=\"external-link\">Sample</td>
                <td>Unvisited external resource</td></tr>
                  <tr><td class=\"visited-external-link\">Sample</td>
                <td>Visited external resource</td></tr>
                </tbody>
              </table>
            </details></li>
                </ul>
              </details></li>
            </ul>
              </details>
              "
              "</section>"
              ))
          (setq emsenn-net-org-html-head
          (concat "<style>
         @charset \"UTF-8\";

         :root {    
           --body-font: sans-serif;
             --header-font: sans-serif;
             --code-font: monospace;
             --primary-color: #ffe;
             --primary-dim-color: #eed;
             --secondary-color: #312;
             --secondary-dim-color: #756;
             --link-color: #880;
             --link-hover-color: #aa2;
             --link-visited-color: #934;
             --link-visited-hover-color: #b56;
             --external-link-color: #008;
             --external-link-hover-color: #60b;
             --external-link-visited-color: #172;
             --external-link-visited-hover-color: #394;
         }
         @media(prefers-color-scheme:dark){
             :root {
            --body-font: sans-serif;
            --header-font: sans-serif;
            --code-font: monospace;
            --primary-color: #756;
            --primary-dim-color: #312;
            --secondary-color: #eed;
            --secondary-dim-color: #ffe;
            --link-color: #880;
            --link-hover-color: #aa2;
            --link-visited-color: #934;
            --link-visited-hover-color: #b56;
             }}
         body {
             position: relative;
             min-height: 100%;
             background-color: var(--primary-color);
             color: var(--secondary-color);
             margin: 0 auto;
             font-family: sans-serif;
         }
         main, #content {
             background-color: var(--primary-dim-color);
             border-left: 1.5em dotted var(--primary-color);
             padding: 1em;
         }
         header {
             border-bottom: 0.8em dotted var(--secondary-dim-color);
         }
         h1 { font-size: 2em; margin-bottom: 0; }
         h2 {
             border-bottom: 0.3em dotted var(--secondary-dim-color);
         }
         h2, h3, h4, h5, h6, p, table, ul, ol, .org-src-container {
             width: 60%;
         }
         aside {
             float: right;
             width: 35%;
         }
         aside p { width: 100%; }
         @media screen and (max-width:760px) {
             h2, h3, h4, h5, h6, p, table, ul, ol, .org-src-container {
            width: 90%;
             }
             aside {
            float: inherit;
            width: 90%;
            border-top: 0.2em dotted var(--secondary-dim-color);
            border-bottom: 0.2em dotted VAR(--secondary-dim-color);
            font-size: 0.8em;
              }
         }

         footer, #postamble, #preamble {
             padding: 0.5em;
         }
         table {
             border-collapse: collapse;
             border-spacing: 0;
             empty-cells: show;
             border: 0.1em solid #444;
         }
         thead { font-family: sans-serif; }
         th, td {
             padding: 0 0.3em;
             border: 0.01em solid #444;
         }
         img {
             max-width: 80vw;
             vertical-align: middle;
         }
         pre, .src {
             padding: 0.5em;
             border: 0.1em solid #444;
             white-space: pre-wrap;
             overflow-x: scroll;
             text-overflow: clip;
             scrollbar-width: none;
         }
         pre::-webkit-scrollbar, .src::-webkit-scrollbar {
             display: none;
         }


         dt {
             font-weight: normal;
             display: inline-block;
             border-bottom: 0.1rem dotted #444;
         }
         #text-index dt { border-bottom: none; }
         h2, h3, h4, h5, h6, h7, h8, h9, h10 {
             display: block;
             font-family: sans-serif;
             margin: 0.2em auto 0.5em 0;
         }
         a, .link {
             text-decoration: none;
             color: #880;
             display: inline;
             position: relative;
             border-bottom: 0.1rem dotted;
             line-height: 1.2;
             transition: border 0.3s;
         }
         a:hover {
             color: #aa2;
             outline-style: none;
             border-bottom: 0.1rem solid;
         }
         a:visited, .visited-link { color: #934; }
         a:visited:hover { color: #b56; }
         a:focus {
             outline-style: none;
             border-bottom: 0.1rem solid;
         }
         ::selection { background-color: #777; color: #eee; }
         a::selection { background-color: #ccc; }
         .org-todo {
             background-color: #ddd;
             color: #333;
             font-size: .8rem;
             float: right;
         }
         .org-src-container + .example {
             margin-left: 8em;
         }
         a[href^=\"https://\"]:not([href*=\"emsenn.net\"]):after, a[href^=\"https://\"]:not([href*=\"emsenn.net\"]):visited:after, .external-link:after, .visited-external-link:after { 
             content: \"^\";
             font-size: 0.5em;
             vertical-align: super;
         }
         a[href^=\"https://\"]:not([href*=\"emsenn.net\"]), .external-link {
             color: var(--external-link-color);
         }
         a[href^=\"https://\"]:not([href*=\"emsenn.net\"]):hover{ 
             color: var(--external-link-hover-color);
         }
         a[href^=\"https://\"]:not([href*=\"emsenn.net\"]):visited, .visited-external-link { 
             color: var(--external-link-visited-color);
         }
         a[href^=\"https://\"]:not([href*=\"emsenn.net\"]):visited:hover{ 
             color: var(--external-link-visited-hover-color);
         }
         blockquote {
             border: 0.1em dashed var(--secondary-dim-color);
             padding-left: 0.2em;
         }
         label.org-src-name {
             margin: 0 0 0 3em;
             font-family: sans-serif;
             font-size: 1rem;
             line-height: 0;
         }
         .skip-to-content {
             opacity: 0;
             position: absolute;
             left: 0.2em;
         }
         .skip-to-content:focus{
             opacity: 1;
             background-color: var(--secondary-dim-color);
             color: var(--primary-color);
         }
         ul { max-width: 85%; }
        .footpara { display: inline; font-size: 0.8rem; }
      </style>"))

      (setq org-publish-project-alist
        `(
          ("emsenn" :components ("emsenn-html" "emsenn-pdf"))
          ("emsenn-html"
             :base-extension "org"
             :publishing-function org-html-publish-to-html
             :html-doctype "html5"
             :html-html5-fancy t
             :html-container "section"
             :headline-levels 10
             :html-divs ((preamble "section" "preamble")
                   (content "main" "content")
                   (postamble "section" "postamble"))
             :with-footnotes t
             :makeindex t
             :base-directory "~/org/"
             :publishing-directory "~/org/pub/emsenn")
          ("emsenn-pdf"
             :base-extension "org"
             :publishing-function org-latex-publish-to-pdf
             :with-footnotes t
             :makeindex t
             :base-directory "~/org/"
             :publishing-directory "~/org/pub/emsenn")
          ("emsenn-website" :components ("emsenn-website-all" "emsenn-website-bul" "emsenn-website-com" "emsenn-website-def" "emsenn-website-ref" "emsenn-website-ter" "emsenn-website-ter-adv" "emsenn-website-ter-ref" "emsenn-website-static"))

          ("emsenn-website-all"
             :base-extension "org"
             :publishing-function org-html-publish-to-html
             :html-doctype "html5"
             :html-html5-fancy t
             :html-container "section"
             :headline-levels 6
             :recursive t
             :html-divs ((preamble "section" "preamble")
                   (content "main" "content")
                   (postamble "section" "postamble"))
             :publishing-function org-html-publish-to-html
             :html-head-include-scripts nil
             :html-head-include-default-style nil
             :html-head ,emsenn-net-org-html-head
             :exclude ,(regexp-opt '("README.org" "PRIVATE"))
             :with-footnotes t
             :with-date nil
             :with-timestamps nil
             :with-author nil
             :makeindex t
             :base-directory "~/org/ems"
             :publishing-directory "~/org/pub/emsenn-net")
          ("emsenn-website-bul"
           :base-extension "org"
           :publishing-function org-html-publish-to-html
           :html-doctype "html5"
           :html-html5-fancy t
           :html-container "section"
           :headline-levels 6
           :recursive t
           :html-divs ((preamble "section" "preamble")
                 (content "main" "content")
                 (postamble "section" "postamble"))
           :publishing-function org-html-publish-to-html
           :html-format-drawer-function emacsen-org-html-format-drawer
           :sitemap-function emacsen-org-publish-format-sitemap
           :html-head-include-scripts nil
           :html-head-include-default-style nil
           :html-head ,emsenn-net-org-html-head
           :exclude ,(regexp-opt '("README.org" "PRIVATE"))
           :auto-sitemap t
           :with-footnotes t
           :with-toc nil
           :with-drawers t
           :with-date nil
           :with-timestamps nil
           :with-author nil
           :base-directory "~/org/ems/bul/"
           :publishing-directory "~/org/pub/emsenn-net/bul"
           :html-preamble ,emacsen-org-html-subdir-preamble
           :sitemap-filename "index.org"
           :sitemap-sort-files chronologically
           :sitemap-title "Bulletins")
            ("emsenn-website-com"
             :base-extension "org"
             :publishing-function org-html-publish-to-html
             :html-doctype "html5"
            :html-html5-fancy t
          :html-container "section"
          :headline-levels 6
          :recursive t
          :html-divs ((preamble "section" "preamble")
                (content "main" "content")
                (postamble "section" "postamble"))
          :publishing-function org-html-publish-to-html
          :html-format-drawer-function emacsen-org-html-format-drawer
          :sitemap-function emacsen-org-publish-format-sitemap
          :html-head-include-scripts nil
          :html-head-include-default-style nil
          :html-head ,emsenn-net-org-html-head
          :exclude ,(regexp-opt '("README.org" "PRIVATE"))
          :auto-sitemap t
          :with-footnotes t
          :with-toc nil
          :with-drawers t
          :with-date nil
          :with-timestamps nil
          :with-author nil
          :base-directory "~/org/ems/com/"
          :publishing-directory "~/org/pub/emsenn-net/com"
          :html-preamble ,emacsen-org-html-subdir-preamble
          :sitemap-filename "index.org"
          :sitemap-sort-files chronologically
          :sitemap-title "Communications")

           ("emsenn-website-def"
          :base-extension "org"
          :publishing-function org-html-publish-to-html
          :html-doctype "html5"
          :html-html5-fancy t
          :html-container "section"
          :headline-levels 6
          :recursive t
          :html-divs ((preamble "section" "preamble")
                (content "main" "content")
                (postamble "section" "postamble"))
          :publishing-function org-html-publish-to-html
          :html-format-drawer-function emacsen-org-html-format-drawer
          :sitemap-function emacsen-org-publish-format-sitemap
          :html-head-include-scripts nil
          :html-head-include-default-style nil
          :html-head ,emsenn-net-org-html-head
          :exclude ,(regexp-opt '("README.org" "PRIVATE"))
          :auto-sitemap t
          :with-footnotes t
          :with-toc nil
          :with-drawers t
          :with-date nil
          :with-timestamps nil
          :with-author nil
          :base-directory "~/org/ems/def/"
          :publishing-directory "~/org/pub/emsenn-net/def"
          :html-preamble ,emacsen-org-html-subdir-preamble
          :sitemap-filename "index.org"
          :sitemap-sort-files alphabetically
          :sitemap-title "Definitions")

           ("emsenn-website-ref"
          :base-extension "org"
          :publishing-function org-html-publish-to-html
          :html-doctype "html5"
          :html-html5-fancy t
          :html-container "section"
          :headline-levels 6
          :recursive t
          :html-divs ((preamble "section" "preamble")
                (content "main" "content")
                (postamble "section" "postamble"))
          :publishing-function org-html-publish-to-html
          :html-format-drawer-function emacsen-org-html-format-drawer
          :sitemap-function emacsen-org-publish-format-sitemap
          :html-head-include-scripts nil
          :html-head-include-default-style nil
          :html-head ,emsenn-net-org-html-head
          :exclude ,(regexp-opt '("README.org" "PRIVATE"))
          :auto-sitemap t
          :with-footnotes t
          :with-toc nil
          :with-drawers t
          :with-date nil
          :with-timestamps nil
          :with-author nil
          :base-directory "~/org/ems/ref/"
          :publishing-directory "~/org/pub/emsenn-net/ref"
          :html-preamble ,emacsen-org-html-subdir-preamble
          :sitemap-filename "index.org"
          :sitemap-sort-files alphabetically
          :sitemap-title "References")
           ("emsenn-website-ter"
          :base-extension "org"
          :publishing-function org-html-publish-to-html
          :html-doctype "html5"
          :html-html5-fancy t
          :html-container "section"
          :headline-levels 6
          :recursive t
          :html-divs ((preamble "section" "preamble")
                (content "main" "content")
                (postamble "section" "postamble"))
          :publishing-function org-html-publish-to-html
          :html-format-drawer-function emacsen-org-html-format-drawer
          :sitemap-function emacsen-org-publish-format-sitemap
          :html-head-include-scripts nil
          :html-head-include-default-style nil
          :html-head ,emsenn-net-org-html-head
          :exclude ,(regexp-opt '("README.org" "PRIVATE"))
          :with-footnotes t
          :with-toc nil
          :with-drawers t
          :with-date nil
          :with-timestamps nil
          :with-author nil
          :makeindex t
          :base-directory "~/org/ems/ter/"
          :publishing-directory "~/org/pub/emsenn-net/ter"
          :html-preamble ,emacsen-org-html-subdir-preamble)
           ("emsenn-website-ter-adv"
          :base-extension "org"
          :publishing-function org-html-publish-to-html
          :html-doctype "html5"
          :html-html5-fancy t
          :html-container "section"
          :headline-levels 6
          :recursive t
          :html-divs ((preamble "section" "preamble")
                (content "main" "content")
                (postamble "section" "postamble"))
          :publishing-function org-html-publish-to-html
          :html-format-drawer-function emacsen-org-html-format-drawer
          :sitemap-function emacsen-org-publish-format-sitemap
          :html-head-include-scripts nil
          :html-head-include-default-style nil
          :html-head ,emsenn-net-org-html-head
          :exclude ,(regexp-opt '("README.org" "PRIVATE"))
          :auto-sitemap t
          :with-footnotes t
          :with-toc nil
          :with-drawers t
          :with-date nil
          :with-timestamps nil
          :with-author nil
          :base-directory "~/org/ems/ter/adv"
          :publishing-directory "~/org/pub/emsenn-net/ter/adv"
          :html-preamble ,emacsen-org-html-subsubdir-preamble
          :sitemap-filename "index.org"
          :sitemap-sort-files alphabetically
          :sitemap-title "References")
           ("emsenn-website-ter-ref"
          :base-extension "org"
          :publishing-function org-html-publish-to-html
          :html-doctype "html5"
          :html-html5-fancy t
          :html-container "section"
          :headline-levels 6
          :recursive t
          :html-divs ((preamble "section" "preamble")
                (content "main" "content")
                (postamble "section" "postamble"))
          :publishing-function org-html-publish-to-html
          :html-format-drawer-function emacsen-org-html-format-drawer
          :sitemap-function emacsen-org-publish-format-sitemap
          :html-head-include-scripts nil
          :html-head-include-default-style nil
          :html-head ,emsenn-net-org-html-head
          :exclude ,(regexp-opt '("README.org" "PRIVATE"))
          :auto-sitemap t
          :with-footnotes t
          :with-toc nil
          :with-drawers t
          :with-date nil
          :with-timestamps nil
          :with-author nil
          :base-directory "~/org/ems/ter/ref"
          :publishing-directory "~/org/pub/emsenn-net/ter/ref"
          :html-preamble ,emacsen-org-html-subsubdir-preamble
          :sitemap-filename "index.org"
          :sitemap-sort-files alphabetically
          :sitemap-title "References")
           ("emsenn-website-static"
          :base-directory "~/org/ems"
          :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
          :publishing-directory "~/org/pub/emsenn-net"
          :recursive t
          :publishing-function org-publish-attachment)

          ))

      :bind (
         ("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c t" . org-toggle-link-display)
         ("C-c C-q" . counsel-org-tag)
         ("<f8>" . emacsen-org-capture-capture-at-point)
      ))

# Supplements

## Reports

### Clock Tables

| Headline       |     Time |      |      |      |      |
|:---------------|---------:|-----:|-----:|-----:|-----:|
| **Total time** | **4:17** |      |      |      |      |
| Operations     |     4:17 |      |      |      |      |
| Ledger         |          | 4:17 |      |      |      |
| Activity       |          |      | 4:17 |      |      |
| Computers      |          |      |      | 2:12 |      |
| Recordkeeping  |          |      |      |      | 2:12 |
| Writing        |          |      |      | 1:54 |      |
| Ledgering      |          |      |      |      | 0:29 |
| Journaling     |          |      |      |      | 1:25 |
| Projects       |          |      |      | 0:11 |      |
| Teraum         |          |      |      |      | 0:11 |

Clock summary at *\[2021-10-06 Wed 11:49\]*

## Lists

### Pre-Purchase Questions

These questions are designed to help me discern some information about something I might purchase that isn’t available from its market specification, like, "How likely is it I can purchase this when intercontinental shipping isn’t affordable?"

- Where did it come from?

  - How was it shipped here?

    - Air freight? Fuck that.

    - Transocean? Not in the future.

### Where-to-buy

#### Clothing

##### Graphic tees

- Johnnie Jae

  - Native sole proprietorship

  - <https://official-johnnie-jae.creator-spring.com/>

### Index

#### A

- accounting

  - anti-colonial accounting

    - [Journal, 2021-10-06, "Ledgers and squirrels"](emsenn.org)

#### C

- computers

  - software

    - accounting

      - Beancount

        - [Journal, 2021-10-06, "Ledgers and squirrels"](emsenn.org)

    - text editors

      - Emacs

        - Org-mode

          - Org-WC

            - [Journal, 2021-10-06, "Looking at Org-WC"](emsenn.org)

- CSS

  - [Log, 2021-10-03: "Updating emsenn.net’s CSS"](emsenn.org)

#### E

- Emacs

  - [Log, 2021-10-01: "Dusting off my Emacs configuration"](emsenn.org)

#### G

- guns

  - $B$ guns

    - [Journal, 2021-10-06, "Ledgers and squirrels"](emsenn.org)

#### H

- home

  - component

    - gutters

      - maintenance

        - [Journal, 2021-10-06, "Gutters being cleaned"](emsenn.org)

#### L

- labor

  - Web

    - [Journal, 2021-10-06, "Sharing writing with the Web"](emsenn.org)

[^1]: <https://www.facebook.com/zuck/posts/10104380170714571>

[^2]: <https://www.facebook.com/zuck/posts/10104413015393571>

[^3]: <https://www.facebook.com/zuck/posts/10104445245963251>

[^4]: Pat the Bunny, “A Glorious Shipwreck”

[^5]: @phaggotplanet on Instagram.com

[^6]: All quotes from "Come and Get Your Love," Redbone

[^7]: See <https://atmos.earth/western-science-indigenous-wisdom>

[^8]: <https://www.youtube.com/watch?v=nr2VLI8jKww>

[^9]: I’m referencing what might be known as Gamestonks, or the 2021 Hedge Fund Contraction, or some other name.

[^10]: 2 And I’ve seen a lot of white people swerving way out of their lane to talk about the distrust BIPOC have for the US medical industry.

[^11]: Someone online brought up that this prejudice might be partly Puritanical in origin; a belief that those who do financial speculation are worse than those who perform physical labor, even if both benefit the kyriarchy.

[^12]: "On the Concept of History," by Walter Benjamin; Section 12 paragraph 1

[^13]: See <https://eric.ed.gov/?id=EJ1268044>

[^14]: And it’s perhaps important to note that Emacs and Org-mode are run locally and provide text-editing capabilities and I tend to "live" in that software. This sometimes proves to be an issue when I’m looking to copy text into other service’s editors. Things that have a Markdown editor are really the best for my goals.

[^15]: An interesting piece of information that seems relevant: while FEMA recommends people keep 1 gallon of water around for each day they expect to be without water service, the average U.S. resident uses 80-100 gallons a day. That’s a big discrepancy.

[^16]: To be cheesy in my own way and quote the pilot episode of *Star Trek: Voyager*, "a debt that can never be repaid."

[^17]: In line with that, I’m curious how stuff like "home" and "housemate" should be handled. In the past, if I remember right, I used macros to refer to folk, so I might have a macro for `Bob` that gets replaced on export with "`$Housemate-1`", so I can refer to folk by name. I’ll think on that, but that might be what I do again.

[^18]: See <https://github.com/tesujimath/org-wc/blob/master/org-wc.el>
