#!/bin/sh
sed -i \
         -e 's/#1c2d39/rgb(0%,0%,0%)/g' \
         -e 's/#c6cacd/rgb(100%,100%,100%)/g' \
    -e 's/#1c2d39/rgb(50%,0%,0%)/g' \
     -e 's/#4E8FB0/rgb(0%,50%,0%)/g' \
     -e 's/#1c2d39/rgb(50%,0%,50%)/g' \
     -e 's/#c6cacd/rgb(0%,0%,50%)/g' \
	"$@"
