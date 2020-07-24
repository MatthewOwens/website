# ensuring that at least that the post md file is passed in
[ $# -eq 0 ] && exit 1

HTMLPATH=$(echo $1 | sed 's/\.md$/.html/')
TITLE=$(scripts/post_title.sh $1)
BODY=$(markdown $1 | sed -e "s/&[rl]squo;/\'"/g -e 's/&[rl]dquo;/\"/g')
DATE=$(git log -1 --pretty="format:%ad" $1)

echo "<item>"
echo "	<title>$TITLE</title>"
echo "	<guid>https://owens.tech/posts/$HTMLPATH</guid>"
echo "	<pubDate>$DATE</pubDate>"
echo "	<description>$BODY</description>" 
echo "</item>" 
