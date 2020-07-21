BEGIN {
	#OFS=""
	#FS="[-.]"
	print "<div id=\"post-list\">"
}

{
	file = sprintf("%s-%s-%s-%s", $1, $2, $3, $4)
	string = sprintf("%s/%s/%s - %s", $1, $2, $3, $4)

	printf("\t<div id=\"post-list-item\"> <p><a href=\"/posts/%s.html\">%s</a></p></div>\n", file, string)
}

END {
	print "</div>"
}
