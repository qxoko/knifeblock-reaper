# Knifeblock for Reaper

The humble beginnings of a library of scripts for scoring and producing in Reaper.

## Contents

<!-- MarkdownTOC autolink=true -->

- [Installing](#installing)
- [Scripts](#scripts)
	- [Markers](#markers)

<!-- /MarkdownTOC -->

## Installing

Copy the *contents* of the script directory (or individual files) to `/REAPER/Scripts/` on your system; you can open the location with the 'Show REAPER resource path in explorer/finder' button under the Options menu.

Within the Action > Action List popup, hit the New Action button and press 'Load ReaScript'.

This registers any individual script as a new Action, which can then be bound to a keybinding or a button.

## Scripts

### Markers

	markers.lua

Exports a TSV (tabs rather than commas) file of the SMPTE timestamps of all markers and regions in the project — *not* including time signature changes because Reaper feels these should somehow be separate — and saves them as `markers.csv` in the project directory.

With markers set to follow time instead of beats, the markers can be used to spot cues and events, while exported durations can be used in calculations for tempo and time signature.