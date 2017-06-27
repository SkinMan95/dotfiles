#!/bin/bash

xinput disable "$(xinput | python ~/.config/i3/touch-screen-disable.py)" || notify-send -u critical "ERROR" "Fallo desactivar la pantalla tactil"
