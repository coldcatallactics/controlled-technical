#!/usr/bin/env bash
set -e

# Resolve the repository root from this script's location, so it works from anywhere.
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

# Chromium is resolved from PATH. Render each HTML source to its committed PNG.
SRC="$ROOT/examples/source"
OUT="$ROOT/spec/figures"
mkdir -p "$OUT"

chromium --headless --no-sandbox --disable-gpu --hide-scrollbars \
  --force-device-scale-factor=1 --window-size=1280,800 \
  --no-first-run --disable-dev-shm-usage \
  --screenshot="$OUT/materials.png" "file://$SRC/materials.html"
echo "Rendered $OUT/materials.png"

chromium --headless --no-sandbox --disable-gpu --hide-scrollbars \
  --force-device-scale-factor=1 --window-size=1280,800 \
  --no-first-run --disable-dev-shm-usage \
  --screenshot="$OUT/two-layer-focus.png" "file://$SRC/two-layer-focus.html"
echo "Rendered $OUT/two-layer-focus.png"

chromium --headless --no-sandbox --disable-gpu --hide-scrollbars \
  --force-device-scale-factor=1 --window-size=1280,800 \
  --no-first-run --disable-dev-shm-usage \
  --screenshot="$OUT/tab-strip.png" "file://$SRC/tab-strip.html"
echo "Rendered $OUT/tab-strip.png"

chromium --headless --no-sandbox --disable-gpu --hide-scrollbars \
  --force-device-scale-factor=1 --window-size=1280,800 \
  --no-first-run --disable-dev-shm-usage \
  --screenshot="$OUT/typography.png" "file://$SRC/typography.html"
echo "Rendered $OUT/typography.png"

chromium --headless --no-sandbox --disable-gpu --hide-scrollbars \
  --force-device-scale-factor=1 --window-size=1280,800 \
  --no-first-run --disable-dev-shm-usage \
  --screenshot="$OUT/geometry.png" "file://$SRC/geometry.html"
echo "Rendered $OUT/geometry.png"

chromium --headless --no-sandbox --disable-gpu --hide-scrollbars \
  --force-device-scale-factor=1 --window-size=1280,800 \
  --no-first-run --disable-dev-shm-usage \
  --screenshot="$OUT/surface-shape.png" "file://$SRC/surface-shape.html"
echo "Rendered $OUT/surface-shape.png"

chromium --headless --no-sandbox --disable-gpu --hide-scrollbars \
  --force-device-scale-factor=1 --window-size=1280,800 \
  --no-first-run --disable-dev-shm-usage \
  --screenshot="$OUT/do-and-dont.png" "file://$SRC/do-and-dont.html"
echo "Rendered $OUT/do-and-dont.png"
