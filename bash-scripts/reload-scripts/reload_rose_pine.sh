#!/usr/bin/env bash

#kills hyprpanel, reloads,and then kills process 

hyprpanel ut /usr/share/hyprpanel/themes/rose_pine_moon_vivid.json &>/dev/null & disown
hyprpanel -q
hyprpanel &>/dev/null & disown
pywalfox update &>/dev/null & disown
#echo -n

#killall hyprpaper
#hyprpaper &>/dev/null & disown
#echo -n

## '&' runs a cmd while the first previous cmds are being executed
## 'disown' removes a job from the job list. Used to end a background process w/out killing it
