#!/bin/sh

[ $# -ne 1 ] && exit 1

title=$(scripts/post_title.sh $1)

# since $title will have a closing HTML tag, we need to use a different
# seperator to '/' for sed
sed "s|TITLE|$title|" includes/head.html
cat includes/projects_header.html
markdown $1
