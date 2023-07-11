#!/bin/bash

cd "$(dirname "$0")"

LOG_FILE=../../data/scan.log

if grep -q SCAN_END_MARKER "$LOG_FILE"; then
  echo -e "Content-type: text/html\r"
  echo -e "\r"
  echo "<script>parent.location = '..'</script>"
else
  echo -e "Content-type: text/html\r"
  if ! grep -q SCAN_ERROR "$LOG_FILE"; then
    echo -e "Refresh: 1\r"
  fi
  echo -e "\r"
  cat <(echo "Starting up..."; echo) \
    <(cat "$LOG_FILE" | grep -v SCAN_END_MARKER | grep Resolution -A 10000 | sed 's/.*Reading data: /Reading data: /' \
    | grep ^ || ( cat "$LOG_FILE" | grep SCAN_ERROR -B 10000 | grep -v SCAN_ERROR ; ) ) |
      aha
fi
