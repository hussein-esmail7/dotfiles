#!/bin/bash

# rss.sh
# Hussein Esmail
# Created: 2023 01 03
# Description: Program to update my various local RSS feeds

# Update newsboat if newsboat is not already running
# If newsboat is running, pgrep will return the PID (in 1 line or more)
# This command runs if 0 lines were returned
[[ $(pgrep newsboat | wc -l | xargs) -eq 0 ]] && newsboat -x reload

# Update feeds that are in the rss-parsers directory (if directory exists)
[ -d "${HOME}/git/rss-parsers" ] && python3 ${HOME}/git/rss-parsers/all.py

exit 0
