#!/bin/bash
[ -d $1/.thumbs ] || mkdir $1/.thumbs
for pic in `find $1/* -exec basename {} .jpg \;`; do
    [ -f $1/.thumbs/$pic.png ] || convert -quality 0 -resize 48 $1/$pic.jpg $1/.thumbs/$pic.png
    echo "+ %$1/.thumbs/$pic.png%\"$pic\" exec exec \`ln -sf $1/$pic.jpg $1/.current && Esetroot -scale $1/$pic.jpg\`"
done
