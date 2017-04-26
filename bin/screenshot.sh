#!/bin/bash

set -e
#set -x

DT_STR=$(date +"%Y%m%d_%H%M%S")
DAY_DIR=${HOME}'/screenshots_alpha/'$(date +"%Y%m%d")
SCREEN_COUNT=$(/usr/sbin/system_profiler SPDisplaysDataType | grep 'Online: Yes' | wc -l | tr -d '[:space:]')

# create directories
[ -d "$DAY_DIR/raw" ] || mkdir -p $DAY_DIR/raw

# capture screens
/usr/sbin/screencapture -x \
    $DAY_DIR/raw/${DT_STR}_1.png \
    $DAY_DIR/raw/${DT_STR}_2.png \
    $DAY_DIR/raw/${DT_STR}_3.png \

# Create a single file from the multiple raw screencapture files.
if [ $SCREEN_COUNT = 1 ]; then
    mv $DAY_DIR/raw/${DT_STR}_?.png $DAY_DIR/${DT_STR}.png
else
    # stitch multiple images together into 1
    for IMG in $DAY_DIR/raw/${DT_STR}_?.png; do
        IM_ARGS="${IM_ARGS} ${IMG} "
    done
    IM_CMD="/usr/local/bin/montage -geometry 100% ${IM_ARGS} $DAY_DIR/${DT_STR}.png"
    ${IM_CMD}
fi