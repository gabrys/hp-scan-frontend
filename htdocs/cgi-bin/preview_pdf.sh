#!/bin/bash

cd "$(dirname "$0")"

if ! [ -e ../../data/FILENAME -a -e ../../data/scan.pdf ]; then
  echo -e "Content-type: text/html\r"
  echo -e "\r"
  echo "<script>parent.location.href = '../new.html'</script>"
  exit
fi

echo -e "Content-type: application/pdf\r"
echo -e "\r"

cat ../../data/scan.pdf
