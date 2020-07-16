---
layout: post
title:  "cecse deliberations"
tags:
  - cecse
  - cecs
  - clogs
  - c
  - programming
hero:  https://owens.tech/uploads/programming-hero.jpg
overlay: purple
published: true

---
# Deliberations on cecse, the sexy game engine.
{: .lead}
<!–-break-–>
Over the past few months, I've been working on [cecse][cecse-gh], a game engine
built on [cecs][cecs-gh].
<!–-break-–>
Overall architecture for this has gone from having seperate git submodules for
cecs and cecse, to bringing cecs in as part of the cecse repo, to seperating out
cecse into a GitHub organisation as I restarted with the intention of a complete
rewrite. This post is to help me lay out my thoughts on the matter, and to set
a concrete direction to take the engine in.

## System Scheduling
[Cecs][cecs-gh] was intented to be used as part of a wider game engine, so once
I thought it was feature-complete, I spun up a private repo for cecse and
started hacking away with it. However, one of the things that I realised pretty
quickly was that cecse's job manager (which schedules [cecs][cecs-gh] systems).
I went through a few iterations, designing _how_ system declarations would be
scheduled.

Initially I declared what a system Reads and Writes, trying to parse
the system dependency graphs from that, by ensuring that the systems that write
to a component are executed before the systems that read from a component.
However, it quickly became clear that this wasn't enough information to
determine the order that systems should fire in, and what systems can fire
concurrently.
For example, a collision response system might write straight to a Position
component, but so might Gravity and Movement systems.
It wasn't possible to determine which system should be exectured first.

From this I decided to try declaring directly what systems depend on. This
seemed reasonable until I realised _why_ I'd decided on the read/write
declarations in the first place. Since I was generating macros from the system's
YAML declaration. This would have let me determine if a system was writing to
components that it shouldn't.

At this point I was quite frustrated, since testing these ideas meant I needed
to touch:

* The Systems YAML declaration itself
* The YAML parser
	* YAML parser unit tests
* cecs's systems
	* cecs's system unit tests
* cecse's job manager
	* the job manager unit tests

This was a _lot_ of overhead to change 2-3 lines in the yaml declaration. Very
frustrating.

## Restart & GitHub Organisation
So I decided sod it, I'll start from scratch - focussing on the lower level
stuff to at least cut out the YAML & old cruft code, taking what I'd learned
forward. This lead to me spinning up the [cecse][cecse-gh] GitHub organisation
to keep everything cecse-releated or cecse-adjacent contained. Since I'd been
frustrated with how long it was taking for me to get stuff done, I started out
with a number of workflow improvements. Creating template repos for engine
modules and unit tests to stop me from losing momentum when I shifted gears.
With a lot of reluctance, I set up GitHub projects for each of the modules in
there to keep track of everything.

Since I had seperate repos for the modules and their tests, these had to be
created at the organisation level to pull both repos in. This did have the
benefit of allowing me to create an 'overview' project to keep track of the
wider project though. Most of the pain of this is automated with a project bot
and issues, but can be improved further with template issues with baked in
project assignments etc.

Once all _that_ was done, and I'd re-wrote my dynamic array utility to be a bit
less painful to use, started re-writing the ecs, and added some more
functionality into [clogs][clogs-gh]. I hit another bit of a snag. While I was
now working a _lot_ faster, when it came time to parse work on the ecs' systems,
I realised that I by completely removing the front-end YAML I'd lost the ability
to push compuitations back to compile-time.

## Data-Desk
Tired of looking at my yaml parser, I looked into [data-desk][dd-web]
([github][dd-github]). The demo looked _really_ nice, so I played with it for a
a few days before I realsed that to achieve what I wanted, I was going to have
to write a whole new parser. While it does look really nice, I think I'll stay
with the devil I know.

## Final Thoughts
I feel like I've been hampered by three main things:

* lack of direction
* slow iteration
* forgetting _why_ I made the decisions I did.

I feel like I've cut enough of the cruft from _how_ I work while letting me keep
track of this massive project to be able to cross off the second. I'm planning
on sticking with the new organisation approach and dumping the yaml parser &
pre-rewrite code in there to keep both my progress and the new workflow.

To address the other two points, I plan to make more use of this site to note
down my thoughts as I go.

[cecs-gh]:		https://github.com/MatthewOwens/cecs
[cecse-gh]:		https://github.com/cecse
[clogs-gh]:		https://github.com/cecse/clogs
[dd-gh]:		https://github.com/ryanfleury/data_desk
[dd-web]:		https://data-desk.net
