#!/usr/bin/env bash
# Create a new post from the templates in archetypes/.
#   scripts/new.sh articles e-value-sensitivity
#   scripts/new.sh blog reading-notes 2026-12-01
# Result: content/<section>/<YYYY-MM-DD>-<slug>/index.md  (a page bundle:
# put figures and data files for the post in the same folder).
set -euo pipefail

section="${1:-}"; slug="${2:-}"; day="${3:-$(TZ=Asia/Shanghai date +%F)}"
usage() { echo "usage: $0 <articles|blog> <slug> [YYYY-MM-DD]" >&2; exit 1; }

[[ "$section" == "articles" || "$section" == "blog" ]] || usage
[[ "$slug" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] || { echo "slug: lowercase ASCII letters, digits and single hyphens" >&2; exit 1; }
[[ "$day" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]] || { echo "date must be YYYY-MM-DD" >&2; exit 1; }
command -v hugo >/dev/null || { echo "hugo not found: https://gohugo.io/installation/" >&2; exit 1; }

cd "$(dirname "$0")/.."
path="$section/$day-$slug"
hugo new content "$path"

# Use the requested day (keeps the time zone); a future day is published
# automatically by the daily scheduled build once that day arrives.
file="content/$path/index.md"
if [[ "$day" != "$(TZ=Asia/Shanghai date +%F)" ]]; then
  sed -i.bak -E "s/^date: [0-9]{4}-[0-9]{2}-[0-9]{2}T/date: ${day}T/" "$file" && rm -f "$file.bak"
fi
echo "→ $file"
