#!/usr/bin/env bash
# Usage: ./generate.sh "My Game Name" my-game-slug
# Creates docs/<slug>/index.md from privacy-policy-template.md

set -euo pipefail

DEVELOPER_NAME="Simran Sharma"
CONTACT_EMAIL="simran.s.sharma@gmail.com"
EFFECTIVE_DATE="$(date '+%B %d, %Y')"

APP_NAME="${1:?Provide the app name, e.g. ./generate.sh \"Block Blast\" block-blast}"
SLUG="${2:?Provide a URL slug, e.g. block-blast}"

mkdir -p "docs/${SLUG}"

sed \
  -e "s|{{APP_NAME}}|${APP_NAME}|g" \
  -e "s|{{DEVELOPER_NAME}}|${DEVELOPER_NAME}|g" \
  -e "s|{{CONTACT_EMAIL}}|${CONTACT_EMAIL}|g" \
  -e "s|{{EFFECTIVE_DATE}}|${EFFECTIVE_DATE}|g" \
  privacy-policy-template.md > "docs/${SLUG}/index.md"

echo "Created docs/${SLUG}/index.md"
