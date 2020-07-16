# static website generation with githooks and markdown

## why?
previously my website was hosted on GitHub pages using Jekyll. I found this to
be really cumbersome to use, hated relying on themes and hated the slew of
dependencies needed to get it working.

I'm using [discount](https://github.com/Orc/discount) to generate the markdown
for the pages, until I roll my own markdown implementation. I don't like using
that either, but it beats Jekyll

### dependencies
* [discount](https://github.com/Orc/discount)

### posts/
location of the posts on the website

### scripts/
collection of scripts called by the server-side git hooks
