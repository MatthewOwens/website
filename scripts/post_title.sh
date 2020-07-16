#!/bin/sh

if [ $# -ne 1 ]; then
	t="fallback title"
else
	t=$(sed -rn 's/^#([^#])/\1/p' $1)
	t=$(echo $t | sed 's/ //g')
fi

echo "<title>$t</title>"
