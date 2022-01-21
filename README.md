# dorkfetcher
Get all the Google Dorks from https://www.exploit-db.com/ghdb 
They really should make an API so one could get the list the right way (or a "list them all" link)

Just run the script and get all the dorks line per line in the file ./dorks.list (or whatever you set it to in the script)

./find_all_google_dorks.sh

Find results in the file ./dorks.list

```terminal
user@dorker:/srv/dorker# cat ./dorks.list
intitle:"Divar Web Client"
intitle:"Live View / - AXIS" | inurl:view/view.shtml OR inurl:view/
allintitle: Axis 2.10 OR 2.12 OR 2.30 OR 2.31 OR 2.32 OR 2.33 OR 2.34 OR 2.40
intitle:"BlueNet Video Viewer"
...
```

![Script](/dork_script_running.gif)
