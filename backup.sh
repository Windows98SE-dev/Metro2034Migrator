#!/bin/bash

# The important vars
APPID=287390
OUTDIR="$HOME/2034bkp"
STEAM_ROOT="$HOME/.steam/steam"

# Sanity check
if [ ! -d "$STEAM_ROOT" ]; then
  STEAM_ROOT="$HOME/.local/share/Steam/"
fi

# Complain
if [ ! -d "$STEAM_ROOT" ]; then
  echo "Can't find steam folder"
  exit 1
fi

echo "Looking for appmanifest"

# Looks for path to appmanifest (Feel free to edit to add your custom install dirs)
MANIFEST=$(find "$STEAM_ROOT/steamapps" /run/media/ -name "appmanifest_${APPID}.acf" 2>/dev/null | head -n 1)

if [ -f "$MANIFEST" ]; then
  PRETTYNAME=$(awk -F '"' '$2 == "installdir" {print $4}' "$MANIFEST")
  GAMEDIR="${MANIFEST%/steamapps/appmanifest_*}/steamapps/common/$PRETTYNAME"
  echo "Found gamedir"

  SAVEPATH=$(find "$GAMEDIR" -maxdepth 1 -mindepth 1 -type d -name "110000*" 2>/dev/null | head -n 1)
  if [ ! -d "$SAVEPATH" ]; then
    echo "savedir not found"

  else
    echo "Found savedir"

    mkdir -p "$OUTDIR"

    echo "Copying save data"
    cp -r "$SAVEPATH" "$OUTDIR"

    echo "Backup complete, saves have been saved to $OUTDIR"
  fi
else
  echo "gamedir not found"
fi
