#!/bin/sh
# Macht aus der Erweiterung (../extension) ein Xcode-Projekt fuer iPhone/iPad
# (und Mac), das du im App Store veroeffentlichen kannst.
# Voraussetzung: Xcode (komplett aus dem Mac App Store, nicht nur die Command Line
# Tools) und danach einmal:  sudo xcode-select -s /Applications/Xcode.app
#
# Aufruf:  sh safari/convert.sh
# Eigene Kennung:  BUNDLE_ID=com.example.meineapp sh safari/convert.sh
set -e
cd "$(dirname "$0")"
APP_NAME="${APP_NAME:-Chord Staff Harmony}"
BUNDLE_ID="${BUNDLE_ID:-io.github.kong003.akkordtoene}"

if ! xcrun --find safari-web-extension-converter >/dev/null 2>&1; then
  echo "Xcode fehlt oder ist nicht aktiv. Installiere Xcode und fuehre aus:" >&2
  echo "  sudo xcode-select -s /Applications/Xcode.app" >&2
  exit 1
fi

xcrun safari-web-extension-converter ../extension \
  --project-location xcode \
  --app-name "$APP_NAME" \
  --bundle-identifier "$BUNDLE_ID" \
  --swift --copy-resources --no-prompt --force
echo "Fertig: safari/xcode/ ($APP_NAME)"
