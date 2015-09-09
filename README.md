# jekyll-tag-gen
A simple shell script which generates the directories and file in the following structure.
`tag/${TAG_NAME}/index.html`
in your `${REPOSITORY_HOME}`. It will add the necessary content in each of those `index.html`
file.


## How to execute?
- Make changes to script by editing it with the name of your `$REPO` ie. `domain.name.com`.
  This is one-time effort.
```
BLOG_URL="femgeekz.github.io"
```
- Please check if you have `_layouts/tag_index.html`. If you don't have one, you may copy
  from `jekyll-tag-gen/_layouts/tag_index.html`. If you would like to keep your own version of
  tag layout, please change the name of tag layout here in the script
```
TAG_LAYOUT_FILE_NAME="tag_index"
```
- Now, execute it with the command `./generate_tag.sh`


## How to verifiy?
- You should now be able to see `tag` directory and tag named directories in it.
- Inside each of those tags, you can see index.html with the content as below.
  For `jekyll` tag,
```
---
layout: tag_index
tag: jekyll
---
```
## How does it look?
- Execute `jekyll serve --watch`
- Open the Browser, hit the URL [Blog](http://localhost:4000/tag/jekyll) , to see all `jekyll` tags
 
## Contributing
This script was written when I was about fall :sleeping: , so if you get to catch any bug or see any issue, please feel
free to raise an issue!
