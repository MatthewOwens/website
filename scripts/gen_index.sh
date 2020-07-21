#!/bin/sh

#[ $# -ne 1 ] && exit 1

POSTS_DIR=posts
POSTS=$(ls $POSTS_DIR | sed 's/ /\r\n/')
MATCH="^([0-9]{1,4})-([0-9]{1,4})-([0-9]{1,4})-([^\.]+)(.*)"

sed "s|TITLE|<title>Matthew Owens</title>|" includes/head.html
cat includes/header.html
ls $POSTS_DIR | sed -Ee 's/ /\n/' -e "s/$MATCH/\1 \2 \3 \4/" | awk -f scripts/posts.awk
echo "<div id=\"about-section\">"
markdown about.md
echo "</div>"
