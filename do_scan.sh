#!/bin/bash

set -e

date "+Scanned_Document_%Y%m%d_%H%M%S" > data/FILENAME

if ! hp-scan --mode=color --size=a4 --file=data/scan.jpg; then
  echo SCAN_ERROR
  exit 1
fi

echo
echo "Processing..."

mogrify -brightness-contrast 3x3 data/scan.jpg
convert data/scan.jpg -resize 66.66667% data/page.jpg
img2pdf --output data/page.pdf -S A4 data/page.jpg

if [ -e data/scan.pdf -a "$1" = "append" ]; then
  pdfunite data/scan.pdf data/page.pdf data/new.pdf && mv data/new.pdf data/scan.pdf
else
  cp data/page.pdf data/scan.pdf
fi

echo SCAN_END_MARKER
