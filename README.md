# Features

- Lightweight script to remind user to commit code daily.
- Fully customizable, path, time and required commit limit can be set as per user preference.
- Built using AppleScript and BashScript

## Supported platform

- MacOS

## How to use

- clone this repo. `https://github.com/sarbajit125/daily-commit-notify.git`
- open commitNotifyScript file and set your entry path above `callCommitChecker(arrayOfPaths)`. **Currently array of paths are not supported**
- update absolute path to your **check_commit_count.sh** on `set bashCommand` line. Save and exit the file.
- Open `com.sarbajit.commitNotify.plist` . *You can also change the name of file, make sure to keep a note of it*
- Expand *ProgramArguments* and update value of *Item 1* with absolute path to your **commitNotifyScript**.
- Make sure you have added .scpt at path end.
- Expand *StartCalendatInterval* set values in hours(24hr system) and minutes as per your preference. It will run the script on this particular time daily. Save and exit the plist
- Copy the plist and go to Folder **/Library/LaunchAgents/** and paste it inside the folder. give system password on dialog prompt.
- run command on Terminal to load it to launchctl `launchctl load -w com.sarbajit.commitNotify.plist`. This set it to system cron job.
- To test the script run the following command on Terminal `launchctl start com.sarbajit.commitNotify`

## Caveats

1. Currently multiple paths are not supported, as appleScript is not passing the arguments properly to bash script.
2. Whole system label checking not supported as it may affect system performance adversely.
3. Sub directories in the path should not contains space in folders name.