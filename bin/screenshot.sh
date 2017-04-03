#!/bin/bash

set -e
DT_STR=`date +"%Y%m%d"`
IMG_DIR=/Users/deichhol/screenshots
DAY_DIR=$IMG_DIR/$DT_STR
SCREEN_COUNT=`/usr/sbin/system_profiler SPDisplaysDataType | grep 'Online: Yes' | wc -l`

# create directories
[ -d "$DAY_DIR/raw" ] || mkdir -p $DAY_DIR/raw

# capture screens
/usr/sbin/screencapture -x \
    $DAY_DIR/raw/$(date +"%Y%m%d_%H%M%S")_1.png \
    $DAY_DIR/raw/$(date +"%Y%m%d_%H%M%S")_2.png \
    $DAY_DIR/raw/$(date +"%Y%m%d_%H%M%S")_3.png \

# stitch screens into single img
montage -geometry 100% \
    $DAY_DIR/raw/$(date +"%Y%m%d_%H%M%S")_3.png \
    $DAY_DIR/raw/$(date +"%Y%m%d_%H%M%S")_1.png \
    $DAY_DIR/raw/$(date +"%Y%m%d_%H%M%S")_2.png \
    $DAY_DIR/$(date +"%Y%m%d_%H%M%S").png 
 2>> $IMG_DIR/error.log

echo "captured to $IMG_PATH" >> $IMG_DIR/screenshots.log
