#!/bin/bash

cd "$(dirname "$0")"

if ! pgrep do_scan 1>/dev/null; then
  cd ../../ && nohup ./do_scan.sh 1>data/scan.log 2>&1 &
fi

echo -e "Content-type: text/html\r"
echo -e "\r"
echo -e "<script>document.location = 'show_progress.sh'</script>"
