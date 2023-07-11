#!/bin/bash

cd "$(dirname "$0")"

if ! [ -e ../../data/FILENAME -a -e ../../data/scan.pdf ]; then
  echo -e "Content-type: text/plain\r"
  echo -e "\r"
  exit
fi

NAME="$(cat ../../data/FILENAME)"

echo -e "Content-type: application/pdf\r"
echo -e "Content-Disposition: attachment; filename=\"$NAME.pdf\"\r"
echo -e "\r"

cat ../../data/scan.pdf
