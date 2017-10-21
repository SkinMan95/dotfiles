#!/bin/bash

while true; do
xinput disable "$(xinput | python -c 'import io
import sys

def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

input_stream = io.TextIOWrapper(sys.stdin.buffer, encoding="utf-8", errors="ignore")

lines = input_stream.readlines()

eprint("\n".join(lines))

res = None

for line in lines:
    line = line.strip()
    if "USBest Technology SiS HID Touch Controller" in line:
        for word in line.split():
            if "id=" in word:
                res = word.split("=")[1]

if res != None:
    print(res)
')" && break || (notify-send -u critical "ERROR" "Fallo desactivar la pantalla tactil"; sleep 5); done
