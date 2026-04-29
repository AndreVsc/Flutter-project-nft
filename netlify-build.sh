#!/usr/bin/env bash
set -euo pipefail

FLUTTER_VERSION="${FLUTTER_VERSION:-stable}"
FLUTTER_DIR="$HOME/flutter"

if [ ! -d "$FLUTTER_DIR" ]; then
  echo "Cloning Flutter SDK ($FLUTTER_VERSION channel)..."
  git clone --depth 1 https://github.com/flutter/flutter.git -b "$FLUTTER_VERSION" "$FLUTTER_DIR"
fi

export PATH="$FLUTTER_DIR/bin:$PATH"

flutter --version
flutter config --enable-web
flutter precache --web

flutter pub get

flutter build web --release
