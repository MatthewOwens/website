BEGIN {
	#OFS=""
	#FS="[-.]"
	print "<ul>"
}

{
	file = sprintf("%s-%s-%s-%s", $1, $2, $3, $4)
	string = sprintf("%s/%s/%s - %s", $1, $2, $3, $4)

	printf("\t<li> <a href=\"/posts/%s.html\">%s</a></li>\n", file, string)
}

END {
	print "</ul>"
}
