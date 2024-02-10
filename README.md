# Features

- Lightweight widget to remind user to commit code daily.
- Fully customizable, time and notification message can be set as per user preference.
- Built using AppleScript

## Supported platform

- MacOS

## How to use

- clone this repo. `https://github.com/sarbajit125/daily-commit-notify.git`
- Open `com.sarbajit.commitNotify.plist` . *You can also change the name of file, make sure to keep a note of it*
- Expand *ProgramArguments* and update value of *Item 1* with absolute path to your **commitNotifyScript**.
- Make sure you have added .scpt at path end.
- Expand *StartCalendatInterval* set values in hours(24hr system) and minutes as per your preference. It will run the script on this particular time daily. Save and exit the plist
- Copy the plist and go to Folder **/Library/LaunchAgents/** and paste it inside the folder. give system password on dialog prompt.
- run command on Terminal to load it to launchctl `launchctl load -w com.sarbajit.commitNotify.plist`. This set it to system cron job.
- To test the script run the following command on Terminal `launchctl start com.sarbajit.commitNotify`

