# Multi-Screencap for Mac. #

Capture multiple screens in automated mac screenshot. 

Currently, it's just roughed out functionality. The individual screenshots are combined using imagemagick, so they are stretched/padded to fit. Functional, not pretty.

Up to 3 screens are supported. Order is uncertain, so when the images get stitched together, they may not quite reflect the original order of the screens.

To view the screenshots, open the Finder to screenshots_alpha/YYYYMMDD, switch to cover flow, double click on screenshot of interrest to open larger view in preview app.

Like I said, this is just functional, not pretty.

## Installation ##
After you copy the bin/screenshot.sh to your local system, add the following to cron using 'crontab -e'. Note, cron is disabled by default on modern macs.
### - Cron ###
It's easy to specify time, all 5 asterisks.
```
* * * * * ${HOME}/bin/screenshot.sh 2>&1 >${HOME}/screenshots/cron.log
```

### - Launchd ###
coming soon.

## Critical TODOs ##
* handle switch between 1 and multiple screens.
* resample images before stitching them for more consistent appearance between retina and normal displays.
* create/include a launchd job

## Ideas to explore ##
* command line options for flexibility (main directory)
* auto cleanup
* adding some sort of time line browse feature...
* better documentation
* python may do a better job of ordering/capturing screens.

