BEGIN {
	#OFS=""
	#FS="[-.]"
	print "<div id=\"post-list\">"
}

{
	file = sprintf("%s-%s-%s-%s", $1, $2, $3, $4)
	name = gensub(/-/, " ", "g", $4)
	string = sprintf("%s/%s/%s - %s", $1, $2, $3, name)

	printf("\t<div id=\"post-list-item\"><a href=\"/posts/%s.html\">%s</a></div>\n", file, string)
}

END {
	print "</div>"
}
