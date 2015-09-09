# Copyright (c) 2015 Swathi Venkatachala

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# ---------------------------END COPYRIGHT--------------------------------------

# Configure here
# Your blog URL goes here, without 'http://' and slashes!
# CHANGE ME!
BLOG_URL="femgeekz.github.io"

# Optional layout file name for tags. Defaults to "tag_index"
# CHANGE ME!, if you don't have `_layouts/tag_index.html`
TAG_LAYOUT_FILE_NAME="tag_index"

# Optional temporary file for output
TMP_DIR="/tmp"
OUT_TMP_FILE="$TMP_DIR/tags.txt"

#  http://femgeekz.github.io/tag
TAG_URL_RESOURCE="tag"

CUR_DIR=`pwd`
grep  -r "\<a href\=\"http:\/\/$BLOG_URL\/tag\/" _site/ | sed -n 's/.*href="\([^"]*\).*/\1/p' | awk -F/ '{print $NF}'| sort | uniq > $OUT_TMP_FILE


cat $OUT_TMP_FILE | while IFS= read -r line
do
	# Generate file with tag name and place index.html 
	# with some content in it.
	echo "$line and $CUR_DIR"
	
	mkdir -p $CUR_DIR/$TAG_URL_RESOURCE
	mkdir -p $CUR_DIR/$TAG_URL_RESOURCE/"${line}"

	echo -e "---
layout: $TAG_LAYOUT_FILE_NAME
tag: $line
---" > $CUR_DIR/$TAG_URL_RESOURCE/"${line}"/index.html
done
