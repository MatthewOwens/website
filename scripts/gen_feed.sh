#!/bin/sh
printf '<!--  <?xml-stylesheet type="text/css" href="rss.css" ?>  -->\n'
printf '<!--  <?xml-stylesheet href="rss.xsl" type="text/xsl" media="screen"?>  -->\n'
printf '<rss xmlns:atom="http://www.w3.org/2005/Atom" version="2.0" data-minimalscrollbar="yes">\n'
printf '<channel>\n'

printf '\t<title>Matthew Owens</title>\n'
printf '\t<description>Updates from Matthew Owens</description>\n'
printf '\t<language>en-gb</language>\n'
printf '\t<link>https://owens.tech/rss.xml</link>\n'
printf '\t<atom:link href="https://owens.tech/rss.xml" rel="self" type="application/rss+xml"/>\n'

# generate

printf '\n\n'
find posts/ -type f -exec sh -c "scripts/gen_feed_item.sh {}" \;
printf '\n\n'

printf '</channel>\n'
printf '</rss>\n'
