# ensuring that at least that the post md file is passed in
[ $# -eq 1 ] || exit 1

HTMLPATH=$(echo $1 | sed 's/\.md$/.html/')
TITLE=$(scripts/post_title.sh $1)
BODY=$(markdown $1 | sed -e 's/&rsquo;/'/g -e 's/&lsquo;//g')
DATE=$(echo $1 | awk -F[/-] '{ printf "%s %s %s", $2, $3, $4 }' | date -Ru)

echo "<item>"
echo "	<title>$TITLE</title>"
echo "	<guid>https://owens.tech/posts/$HTMLPATH</guid>"
echo "	<pubDate>$DATE</pubDate>"
echo "	<description>$BODY</description>" 
echo "</item>" 
