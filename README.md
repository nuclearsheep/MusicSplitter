# MusicSplitter
Bash script to identify all music of a particular genre, then move them to their own directory.

This tool was created because I wanted to split up my music folder. I previously used windows where file explorer would sort by genre, then I could shift-select all the files and move them. Linux doesn't do that so I made my own script to do it. 

Prerequisites:
This requires a tool called id3show. It had to be this tool because my mp3s use the latest (v2.4) type of tag, as the genres are custom. 

Usage:
The script takes two arguments, category and criteria. Category is what 'frame' id3show needs to look in. Currently only Genre works because there are four spaces between that and the required data. Criteria is the search term. The folder created will be named with your criteria.
