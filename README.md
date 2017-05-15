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
* * * * * /users/deichhol/bin/screenshot.sh 2>&1 >/Users/deichhol/screenshots/cron.log
```

### - Launchd ###
Update the com.github.deichholz.mac-auto-screenshot.plist file to reflect your local setup. The paths in these <string> tags will need to be updated:
```
<key>ProgramArguments</key>
<array>
    <string>/Users/myuser/bin/screenshot.sh</string>
</array>

<key>StandardOutPath</key>
<string>/Some/Output/Dir/screenshot.log</string>

<key>StandardErrorPath</key>
<string>/Some/Output/Dir/screenshot-err.log</string>
```

#### Loading/Enabling ####
Copy this file to /Library/LaunchDaemons so launchd can load them. You may need sudo access to copy the file.
```
$> cp com.github.deichholz.mac-auto-screenshot.plist /Library/LaunchDaemons
```

or
```
$> sudo cp com.github.deichholz.mac-auto-screenshot.plist /Library/LaunchDaemons
```

Next, you will need to activate the task so it will begin executing. Files in this directory will be loaded automatically when the computer boots, however, you can activate tasks without a reboot using the following command:
```
$> launchctl load -w /Library/LaunchDaemons/com.github.deichholz.mac-auto-screenshot.plist
```

#### Unloading/Disabling ####
Disable tasks is just as easy as enabling them. You need to unload the task then remove the file (or it will be re-enabled when you restart). Unload the task like so:
```
$> launchctl unload -w /Library/LaunchDaemons/com.github.deichholz.mac-auto-screenshot.plist
$> rm /Library/LaunchDaemons/com.github.deichholz.mac-auto-screenshot.plist
```

For more information on configuring launchd checkout the [launchd man page](https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man5/launchd.plist.5.html).

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

