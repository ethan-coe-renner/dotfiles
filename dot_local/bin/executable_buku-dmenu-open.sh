#!/usr/bin/env bash

dmenu="${DMENU_PROGRAM:-dmenu} -p buku:"

# Run your command once and save the full output
list="$(buku --nostdin -p -f 4 | cut -f 1-3)"

# Show only columns 2+ (url, title) in noctalia dmenu, keep the number hidden
choice=$(printf '%s\n' "$list" | cut -f2- | $dmenu)

# Exit if nothing was selected (user hit Esc)
[ -z "$choice" ] && exit 1

# Find the matching original line and extract its number
number=$(printf '%s\n' "$list" | awk -F'\t' -v c="$choice" '
{
    rest = $2
    for (i = 3; i <= NF; i++) rest = rest "\t" $i
    if (rest == c) { print $1; exit }
}')

# Now do whatever you want with the number
buku --nostdin -o "$number"
