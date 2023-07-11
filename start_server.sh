#!/bin/bash

cd "$(dirname "$0")"/htdocs/ &&
python3 -m http.server --bind 127.0.0.1 9871 --cgi
