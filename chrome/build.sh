#!/bin/sh
# Baut die ZIP fuer das Chrome Web Store Developer Dashboard:
#   chrome/dist/songtreasures-akkordtoene-<version>-chrome.zip
# Die manifest.json liegt direkt im Stamm der ZIP (nicht in einem Unterordner).
set -e
cd "$(dirname "$0")"
VERSION=$(python3 -c 'import json;print(json.load(open("../extension/manifest.json"))["version"])')
rm -rf dist/pkg && mkdir -p dist/pkg
cp ../extension/manifest.json ../extension/glyphs.js ../extension/voice2.js ../extension/content.js dist/pkg/
cp -R ../extension/icons dist/pkg/icons
ZIP="songtreasures-akkordtoene-$VERSION-chrome.zip"
rm -f "dist/$ZIP"
(cd dist/pkg && zip -q -r "../$ZIP" .)
echo "chrome/dist/$ZIP"
