# website migration

## Why?
Initially this website was hosted on GitHub pages, using [jekyll](https://jekyllrb.com)
and some theme. I'd needed a site up and running quickly so the domain I'd listed
on my CV actually existed.

### Big Tech
This seemed like a suitable solution at the time. It was quick to set up, didn't
require me to set up infrastructure of my own and looked alright.
What I didn't realise was how much control I was giving up, and to who. Since then I've
grown more wary of """big tech""" (Facebook, Amazon, Google, Microsoft, Apple, Netflix),
with good reason. I've started distancing myself from these companies as best I
can, lifted-and-shifted the static site generated by Jekyll to a non-AWS vps
(that I still have my reservations about, since I don't control the hardware).

### Regaining Control
In an attempt to regain more control over the software I use, I also shifted my
email onto there from the company that provided my DNS to the same box and set
up git on there, pushing updates to both """my""" instance, and GitHub.

All the dependencies on Jekyll, Ruby Gems and the theme I was using found
themselves in my sights too. There's nothing particularly complex about static
website generation, so why was there this entire ruby-based builder nonsense?
Why was I having to pull in gems with securty issues just to generate some HTML?
It seemed like this could be achieved with much simpler, mature, familiar unix
tools.

## How?
Since I was already hosting a number of my projects both on GitHub and this
instance, and I already had a webserver set up to serve the Jekyll guff it was
pretty easy to migrate away from Jekyll.

I set up a server-side git hook that parsed the Markdown files that were being
consumed by Jekyll. This did introduce a dependency on [discount](https://github.com/Orc/discount),
but it removed a lot of dependencies on ruby guff. If need be I'd be comfortable
writing my own Markdown implementation too.

You can view the source for the site, including the scripts that the server-side
git hook calls either through the [git](https://git.owens.tech) link here and
at the top of the page, or on [GitHub](https://github.com/MatthewOwens/website).

With discount generating the post HTML, it was trivial to throw together a few
header HTML files, a stylesheet and a few scripts to glue it all together.

### Gains
One of the big things this allowed me to do was to implement a remote staging
environment. This lets me view the site on this instance with pushed to the
'develop' branch before merging to 'master' and deploying to what you're seeing
now. This is pretty valuable since I'm running a different distro
(gawk vs mawk caught me out, didn't realise that gensub() was a gawk extension).

Deployments are considerably faster than using Jekyll too, since the site
generation is much faster.

### Losses
I had some tagging functionality with jekyll that I've not implemented, but with
the amount of posts that I had on the site it really wasn't necessary.
If I actually need tagging in the future then I'll implement it.

### Lessons
* Jekyll is bloat
* awk can be gawk, mawk, nawk or awk.
* Big Tech Bad
* "Those who don't understand unix are doomed to reinvent it, poorly"
* My paranoia won't be satiated until I'm running my own physical server with
a UPS

## What next?
* GUI git frontend using [stagit](https://git.codemadness.org/stagit/log.html)
* Possible implementation of Markdown
* Dedicated physical server at some point